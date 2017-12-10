#include "stdafx.h"
#include "DuEngine.h"
#include "DuUtils.h"
using namespace std;
using namespace cv;

void DuEngine::initScene() {
	clock_t begin_time = clock();

	shadertoy = new ShaderToy(DuEngine::GetInstance());

	for (int buffer = 0; buffer < 1 + shadertoy->m_frameBuffers.size(); ++buffer) {
		auto suffix = buffer == 0 ? "" : string(1, char('A' + buffer - 1));
		auto prefix = buffer == 0 ? "" : suffix + "_";
		auto uniforms = buffer == 0 ? shadertoy->uniforms : shadertoy->m_frameBuffers[buffer - 1].uniforms; 
		auto vertexShaderName = config->GetStringWithDefault("shader_vert", m_relativePath + "shadertoy.vert.glsl");
		auto fragmentShaderName = config->GetStringWithDefault("shader_frag", m_relativePath + "shadertoy.default.glsl");
		auto uniformShaderName = config->GetStringWithDefault("shader_uniform", m_relativePath + "shadertoy.uniforms.glsl");
		auto mainShaderName = config->GetStringWithDefault("shader_main", m_relativePath + "shadertoy.main.glsl");

		// replace the fragment shader name with $Name and buffer prefix / suffix
		if (fragmentShaderName.find("$Name") != string::npos) {
			fragmentShaderName.replace(fragmentShaderName.find("$Name"), 5, m_sceneName); 
		}
		if (fragmentShaderName.find(".glsl") != string::npos) {
			fragmentShaderName.replace(fragmentShaderName.find(".glsl"), 5, suffix + ".glsl");
		} else {
			fragmentShaderName += suffix + ".glsl";
		}

		if (buffer == 0) {
			shadertoy->loadShaders(vertexShaderName, fragmentShaderName, uniformShaderName, mainShaderName);
		} else {
			shadertoy->m_frameBuffers[buffer - 1].loadShaders(vertexShaderName, fragmentShaderName, uniformShaderName, mainShaderName);
		}

		auto channels_count = config->GetIntWithDefault(prefix + "channels_count", 0);
		for (int i = 0; i < channels_count; ++i) {
			string iPrefix = prefix + "iChannel" + to_string(i);
			auto type = config->GetStringWithDefault(iPrefix + "_type", "rgb");
			auto fileName = m_relativePath + config->GetStringWithDefault(iPrefix + "_tex", "");

			// replace the common textures into the true file names
			for (const auto& key : m_common_tex) {
				if (!type.compare(key.first)) {
					type = "rgb";
					fileName = m_relativePath + "presets/" + key.second;
					break;
				}
			}

			// texture filters
			auto filter = config->GetStringWithDefault(iPrefix + "_filter", "mipmap");
			auto textureFilter = filter == "linear" ? TextureFilter::LINEAR : ((filter == "nearest") ? TextureFilter::NEAREST : TextureFilter::MIPMAP);

			// texture wrappers
			auto wrap = config->GetStringWithDefault(iPrefix + "_wrap", "repeat");
			auto textureWrap = !wrap.compare("repeat") ? TextureWrap::REPEAT : TextureWrap::CLAMP;

			auto vFlip = config->GetBoolWithDefault(iPrefix + "_vflip", true);
			if (!type.compare("rgb")) {
				info("Reading texture " + fileName);
				auto t = filter == "linear" ? new Texture(fileName) : new Texture(fileName, vFlip, textureFilter, textureWrap);
				uniforms->bindTexture2D(t, i);
			} else
			if (!type.compare("video")) {
				auto t = new VideoTexture(fileName, vFlip, textureFilter, textureWrap);
				videoTextures.push_back(t);
				uniforms->bindTexture2D(t, i);
			} else
			if (!type.compare("key")) {
				if (!keyboardTexture) {
					keyboardTexture = new KeyboardTexture();
				}
				uniforms->bindTexture2D(keyboardTexture, i);
			} else
			if (!type.compare("font")) {
				if (!fontTexture) {
					fontTexture = new Texture(m_relativePath + "presets/tex21.png", true, textureFilter, textureWrap);
				}
				uniforms->bindTexture2D(fontTexture, i);
			} else
			if (type.size() == 1) {
				int bufferID = (int)(type[0] - 'A');
				uniforms->bindTexture2D(shadertoy->m_frameBuffers[i].tex, i);
				debug("Buffer " + to_string(buffer) + " bind with " + to_string(bufferID) + ", whose texture ID is " + to_string(shadertoy->m_frameBuffers[i].tex->GetTextureID()));
			}
		}
	}

	auto vec2_buffers_count = config->GetIntWithDefault("vec2_buffers_count", 0);
	shadertoy->uniforms->intVec2Buffers(vec2_buffers_count);

	for (int i = 0; i < vec2_buffers_count; ++i) {
		string s = "vec2_buffers" + to_string(i) + "_file";
		auto fileName = config->GetString(s);
		shadertoy->uniforms->bindVec2Buffer(i, fileName);
	}

	info("Initialization scene costs: " + to_string(float(clock() - begin_time) / CLOCKS_PER_SEC) + " s");
}

int DuEngine::getFrameNumber() {
	return this->shadertoy->uniforms->iFrame;
}

void DuEngine::render() {
	for (const auto& v : videoTextures) v->update();
	shadertoy->render();
	glutSwapBuffers();
	glutPostRedisplay();

	if (m_recording && m_recordStart + 1 <= getFrameNumber() && getFrameNumber() <= m_recordEnd + 1) {
		this->takeScreenshot(m_recordPath);
	}
}

void DuEngine::updateFPS(float timeDelta, float averageTimeDelta) {
	shadertoy->uniforms->updateFPS(timeDelta, averageTimeDelta);
}

void DuEngine::takeScreenshot(string folderName) {
	if (m_is_created.find(folderName) == m_is_created.end()) {
		CreateDirectory(folderName.c_str(), NULL);
		m_is_created.insert(folderName); 
	}
	cv::Mat img(window->height, window->width, CV_8UC3);
	glPixelStorei(GL_PACK_ALIGNMENT, (img.step & 3) ? 1 : 4);
	glPixelStorei(GL_PACK_ROW_LENGTH, (GLint)img.step / (GLint)img.elemSize());
	glReadPixels(0, 0, img.cols, img.rows, GL_BGR_EXT, GL_UNSIGNED_BYTE, img.data);
	flip(img, img, 0);
	//auto t = std::time(nullptr);
	//auto tm = *std::localtime(&t);
	//std::ostringstream oss;
	//oss << std::put_time(&tm, "%d-%m-%Y_%H-%M-%S");
	//auto str = oss.str();
	cv::imwrite(folderName + "/" + this->configName.substr(0, configName.size() - 4) + "_" + to_string(getFrameNumber()) + ".png", img);
}

