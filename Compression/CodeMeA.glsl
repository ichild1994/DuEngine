// MtBfRR
highp ivec2 SV_DispatchThreadID = ivec2(0,0);
highp int Double_pixelID = 0;
highp vec4 col = vec4(0.,0.,0.,0.);
int i = 0;

//pass !
void A(uvec4 data){
    
    if(Double_pixelID == i++){
        if((SV_DispatchThreadID.x & 0x1) == 0){
        	col.xy = unpackUnorm2x16(data.s);
    		col.zw = unpackUnorm2x16(data.t);
        }
        else{
        	col.xy = unpackUnorm2x16(data.p);
    		col.zw = unpackUnorm2x16(data.q);
        }
    }
}

void mainImage( out vec4 C, in vec2 U)
{
    SV_DispatchThreadID = ivec2(floor(U-0.5));
    if(SV_DispatchThreadID.x >= 32 || SV_DispatchThreadID.y >= 32){
    	C = vec4(1./3.);
        //return;
    }
    if(iFrame > 2){
    	C = texture(iChannel0,U/iResolution.xy);
        //discard;
    }
    //1个像素存一个数据块
    //16 x 32, 16为其中2个像素存2个块数据
    //像素ID编号
    Double_pixelID = (SV_DispatchThreadID.x>>1) + (SV_DispatchThreadID.y<<4); 
    //-------------------------------------------------------------------------
	A(uvec4(0x39C749E8u,0xABADADFDu,0x41C74A08u,0xBEABBFFFu));
	A(uvec4(0x41C749E8u,0x6AEAFF5Fu,0x292541C7u,0xD678E000u));
	A(uvec4(0x314541E8u,0x20925BEu,0x39A749E8u,0xA0E8EAFFu));
	A(uvec4(0x396641E8u,0x16DEEFFFu,0x39875229u,0x8002092Du));
	A(uvec4(0x49E85209u,0x5557565Cu,0x41C749E8u,0xAAu));
	A(uvec4(0x49E85209u,0xAFF55555u,0x41A75209u,0x2AAAAA7Bu));
	A(uvec4(0x41A749E8u,0xAA55u,0x41A75209u,0xAAAAAFF5u));
	A(uvec4(0x49E85209u,0xBFB5DD55u,0x41A85229u,0xAAAEA5Fu));
	A(uvec4(0x41A85209u,0xE0EA5755u,0x396641C8u,0x2B8DE5Fu));
	A(uvec4(0x396741C7u,0xEEF796D7u,0x394641C8u,0x6B6BE0F8u));
	A(uvec4(0x29053126u,0x626868E8u,0x20C42906u,0x5E5F5F5Fu));
	A(uvec4(0x20A320C5u,0xAAAAAABEu,0x20C43126u,0x379DD555u));
	A(uvec4(0x29053967u,0xD7DEFAADu,0x20C43146u,0xD7FEFEA0u));
	A(uvec4(0x28E53146u,0x9517AE5Au,0x29053966u,0xA8AEBDF5u));
	A(uvec4(0x28E53966u,0xEAFA7E7Fu,0x20C43126u,0xAAAFAFEDu));
	A(uvec4(0x20C43105u,0x2AAFAFEFu,0x18633125u,0x5C5070C2u));
	A(uvec4(0x41C749E8u,0x5FFAFEFEu,0x39A649E8u,0x7AEAAA8Au));
	A(uvec4(0x314541E8u,0x35D658E0u,0x29254A08u,0x22BB5u));
	A(uvec4(0x49E74A09u,0xAEAEAAAFu,0x316549E8u,0x7060C080u));
	A(uvec4(0x31455229u,0xB092D35u,0x51E85229u,0xFEFCF0E0u));
	A(uvec4(0x49E85209u,0xA2FAFE57u,0x4A085209u,0xAABFBFFDu));
	A(uvec4(0x49E85209u,0xA8A0E2A2u,0x49E85209u,0x2AAAAu));
	A(uvec4(0x49E85209u,0x20Bu,0x4A085209u,0xA8EAu));
	A(uvec4(0x4A085209u,0xAABu,0x52095229u,0xBBAAAAEEu));
	A(uvec4(0x49E85A2Au,0xAAAAAA7Eu,0x49C85209u,0xA87Bu));
	A(uvec4(0x39875209u,0x200F87Eu,0x396649E9u,0xE0F8575Du));
	A(uvec4(0x29053966u,0xF8787A7Au,0x20A42905u,0xE8F8F8FAu));
	A(uvec4(0x20C428E5u,0xAFAFFFDFu,0x20C43126u,0xBFBFBF3Fu));
	A(uvec4(0x20A42905u,0x78FCA800u,0x20A42905u,0x55B52F26u));
	A(uvec4(0x310520E4u,0x585A5A6Au,0x31054187u,0x8BABA3FAu));
	A(uvec4(0x394641A7u,0xEFEFEF7Du,0x31253946u,0x90F0FC56u));
	A(uvec4(0x18833105u,0x40C80A0Au,0x186328E4u,0x55555754u));
	A(uvec4(0x396641C7u,0x3E78C000u,0x316549E8u,0xA2BD75Eu));
	A(uvec4(0x39864A08u,0x22Du,0x49E74A09u,0xFFFFFAAAu));
	A(uvec4(0x4A085209u,0x7F7DF5D5u,0x39665229u,0x2797DE5Au));
	A(uvec4(0x49E85229u,0xA0A08209u,0x52085229u,0x2828EAFEu));
	A(uvec4(0x52095229u,0xAAAAADF5u,0x4A095229u,0xA02000AAu));
	A(uvec4(0x49E85A29u,0x2AAAAAFFu,0x52095A4Au,0xAFFFF5F5u));
	A(uvec4(0x4A095A29u,0xFEEAEAAAu,0x51E85229u,0x2FABA820u));
	A(uvec4(0x52095A29u,0xA2DAFFFu,0x52085A4Au,0x2AAABABBu));
	A(uvec4(0x5A2A5A4Au,0xAAFD755u,0x5A295A4Au,0x806A7Bu));
	A(uvec4(0x51E85A4Au,0xA8FE7FFFu,0x41C85209u,0xC0E27F5Eu));
	A(uvec4(0x312641A7u,0x785C5E57u,0x28E53126u,0x7A7E7E57u));
	A(uvec4(0x20C428E5u,0x8082EAFu,0x28E53126u,0xD5D59595u));
	A(uvec4(0x20A42905u,0x58585878u,0x18A420A4u,0x2020A2Au));
	A(uvec4(0x28C43946u,0xB0B2DADu,0x394649A7u,0xFFBFA5A5u));
	A(uvec4(0x394649A7u,0xFCFEFFFFu,0x394541A7u,0x8B6A7A5Au));
	A(uvec4(0x18833105u,0x5C587060u,0x10431863u,0x88A8A8u));
	A(uvec4(0x41C74A08u,0x22AB5u,0x49E74A09u,0xEAAAAAABu));
	A(uvec4(0x49E84A08u,0x35FF7A70u,0x49E85249u,0x20BBDF5u));
	A(uvec4(0x39865229u,0xD878E0A8u,0x41875229u,0x30D05u));
	A(uvec4(0x52295A28u,0xFDFDFDFDu,0x52095A49u,0xAAABFAFFu));
	A(uvec4(0x52295A29u,0xAAFAFFFAu,0x52285A2Au,0x2FAFBFB7u));
	A(uvec4(0x52085A4Au,0xB8BABABFu,0x52085A4Au,0xFAAAAAAAu));
	A(uvec4(0x51E95229u,0xAEBEE8F8u,0x5A4A51E8u,0x565A6AA8u));
	A(uvec4(0x5A2A626Au,0xAAABBFD5u,0x5A4A626Au,0xBFFE5FD5u));
	A(uvec4(0x5A4A628Au,0xBFAFFF77u,0x5A4A628Bu,0x88ABFBFFu));
	A(uvec4(0x5209628Bu,0xA0AAEAFAu,0x5A4A49E8u,0x25252A2Au));
	A(uvec4(0x394749E8u,0xFA7E7E5Eu,0x29053947u,0xA8FAFE5Fu));
	A(uvec4(0x28E53126u,0xB8FEDF57u,0x28E53146u,0x2BBFFFD5u));
	A(uvec4(0x20C43946u,0x607A5E5Fu,0x20A43105u,0x3FB795D5u));
	A(uvec4(0x31254166u,0xB0B2D2Du,0x39464166u,0x80A0A8u));
	A(uvec4(0x39254187u,0xEF6BF2A0u,0x392541A7u,0x8D8D0B8Bu));
	A(uvec4(0x18833105u,0x57565E54u,0x10421863u,0x8080u));
	A(uvec4(0x4A0749E9u,0xAAAAAAAAu,0x41E84A08u,0x2AA88080u));
	A(uvec4(0x49E85249u,0xA0D2595u,0x49E85249u,0x5870C000u));
	A(uvec4(0x41A75249u,0x22F3796u,0x524A5A29u,0x82AAABEBu));
	A(uvec4(0x52285A4Au,0xFAFEFEFEu,0x52295A49u,0xAABAFFFFu));
	A(uvec4(0x522A5A29u,0x2A0A0E0Eu,0x5A495A2Au,0x25252525u));
	A(uvec4(0x52085A4Au,0xDEF8A8A8u,0x52095A29u,0x30DBF7Au));
	A(uvec4(0x5209626Au,0xABABAFFDu,0x5A4A626Au,0x2A8203ADu));
	A(uvec4(0x5A6B626Au,0xAAAAEAAAu,0x5A4A6A8Bu,0xABFFFFFFu));
	A(uvec4(0x624A628Bu,0x2AAABBFu,0x626B628Bu,0x2E3F2A8Au));
	A(uvec4(0x5A4A628Bu,0xE0F0F8E8u,0x52095A4Au,0x80E06078u));
	A(uvec4(0x41885209u,0x80E07A5Eu,0x394749C8u,0x80EA7F57u));
	A(uvec4(0x312641A8u,0xA0AAFF57u,0x312641A7u,0xA2F3F95u));
	A(uvec4(0x310541A7u,0xC080C062u,0x20C43926u,0x2F2FAFB7u));
	A(uvec4(0x39264187u,0x352525ADu,0x41665166u,0x2AEAFF7Du));
	A(uvec4(0x416651A7u,0x607B5555u,0x30E441A7u,0x42CACA8Bu));
	A(uvec4(0x186320A3u,0x7AFEFA7Au,0x10421863u,0x80800000u));
	A(uvec4(0x420749E8u,0x2A2A0AAAu,0x4A085229u,0xAD2D3D95u));
	A(uvec4(0x52085249u,0xFFFAE000u,0x52294A08u,0x56586082u));
	A(uvec4(0x4A095A49u,0xAAAAA8AAu,0x52295A29u,0x55575EA2u));
	A(uvec4(0x52295A29u,0xD5D555ABu,0x52495A29u,0xAAAEAA2Au));
	A(uvec4(0x52095A49u,0xFFEA8002u,0x52095A29u,0xF8FFF8A0u));
	A(uvec4(0x52085A29u,0x2A2AB556u,0x5208628Bu,0xAFABFFFDu));
	A(uvec4(0x5A08624Bu,0xAAAA7F7Fu,0x49C85A29u,0xE0FE02u));
	A(uvec4(0x49C8628Bu,0xFF55BD2Au,0x5A4A6AABu,0xADA9AFEBu));
	A(uvec4(0x628B6AABu,0xAFEBEBFFu,0x628C6AAAu,0xFFAFAFFFu));
	A(uvec4(0x628B626Au,0xA595A525u,0x5A4A628Bu,0xE0F86A7Fu));
	A(uvec4(0x51E95A4Au,0x80C06078u,0x49C851E9u,0xA0EA5Fu));
	A(uvec4(0x418749A8u,0xA8E8E87Cu,0x418749C8u,0x42238BB5u));
	A(uvec4(0x30C441A7u,0xABBED870u,0x31054166u,0x202AAFF5u));
	A(uvec4(0x41466A29u,0x2FFDD555u,0x51878B0Cu,0x20BADF5u));
	A(uvec4(0x39257249u,0x7878787Au,0x20A451E8u,0x56587262u));
	A(uvec4(0x18632084u,0x7EFE7E5Au,0x10831863u,0x820AAA00u));
	A(uvec4(0x39A64A08u,0xFDAD2B0Au,0x41E74A08u,0x2D0B0A00u));
	A(uvec4(0x4A085209u,0xF5F5BDBFu,0x52085229u,0xD5BFAA8Au));
	A(uvec4(0x51E85229u,0xFAE8A080u,0x52095208u,0xAAAAAAAAu));
	A(uvec4(0x52085A29u,0xAFFFB7BFu,0x5A29626Au,0xA9B5D555u));
	A(uvec4(0x5A29624Au,0x7E5E7B55u,0x5A088B0Cu,0x35555555u));
	A(uvec4(0x59E8C471u,0x2FD5555u,0x6229C470u,0xFF5555u));
	A(uvec4(0x6249ABCEu,0xFF5555u,0x6229ABCEu,0x575555u));
	A(uvec4(0x9B8D5A09u,0x9000000u,0x5A29628Bu,0x3F3F3F2Du));
	A(uvec4(0x628B6AABu,0x2BABBFBFu,0x62CC6A8Bu,0xBAAAAAAAu));
	A(uvec4(0x628B6AACu,0xB7D75757u,0x628B6AACu,0xBABAFF5Fu));
	A(uvec4(0x5A2A6A8Bu,0xF8F8FA7Eu,0x51E95A2Au,0x7878785Eu));
	A(uvec4(0x49A851E8u,0x2BBFF755u,0x414651C8u,0xBCDC5860u));
	A(uvec4(0x414659E8u,0x2AAFFF55u,0x41666A29u,0x22AFFD5u));
	A(uvec4(0x59C87A8Au,0xB2F2D25u,0x82AA8B0Cu,0x7BE242C2u));
	A(uvec4(0x29057249u,0x78F8F8F8u,0x20A43926u,0x55575E54u));
	A(uvec4(0x186320A4u,0x7FFFFF7Fu,0x18441882u,0xAAAAAAAAu));
	A(uvec4(0x41C63986u,0xA020AAAu,0x396641E7u,0x5FFF2F0Au));
	A(uvec4(0x39864A08u,0xF52F0A02u,0x41C75208u,0xBFAA0A0Au));
	A(uvec4(0x4A2951E8u,0x2AAAAAAAu,0x51E85A29u,0xADBDBDFDu));
	A(uvec4(0x51E85A49u,0x8020A0Bu,0x5A49726Au,0x2FBDFFFDu));
	A(uvec4(0x6A49ABEEu,0xB2DD555u,0x728AC490u,0x200022Du));
	A(uvec4(0xA3AECCB1u,0x7AA00000u,0xA38DCC91u,0xD5FFA880u));
	A(uvec4(0xABAEBC50u,0x97373E9Eu,0xA3ADC470u,0x7A800000u));
	A(uvec4(0x6249B40Fu,0x7EF8E070u,0x52096A6Au,0x5CFCAFADu));
	A(uvec4(0x52096A8Bu,0xAD0B0200u,0x628B6AACu,0x5F7BEAAAu));
	A(uvec4(0x626B6ACCu,0xA9ADADADu,0x6AAB6A8Cu,0x2A2AAAAAu));
	A(uvec4(0x624A6AACu,0xFAFE7E7Eu,0x51E9624Au,0xA8EAEA7Au));
	A(uvec4(0x51C85A09u,0x20E88EFFu,0x49A76209u,0xAABFFF7u));
	A(uvec4(0x59C87A8Au,0x2BAFB5D5u,0x6A2982ABu,0x800A2BBDu));
	A(uvec4(0x724982CBu,0x7F787877u,0x72297A8Au,0xF5BDA982u));
	A(uvec4(0x28C4726Au,0x57565C58u,0x20832904u,0x2EAFF7Eu));
	A(uvec4(0x186328A4u,0xBEFE7F57u,0x18633083u,0x2AFF5555u));
	A(uvec4(0x39A641C7u,0x5E5E5F7Fu,0x398639A5u,0x7F7F7F55u));
	A(uvec4(0x316541A7u,0xFFFFFFABu,0x398641C7u,0xD5B52902u));
	A(uvec4(0x41C75208u,0x2D2F2A2Au,0x52085A29u,0x25B5BDABu));
	A(uvec4(0x5A29934Cu,0x2DB5D555u,0x6A6AA3ADu,0x2020BB5u));
	A(uvec4(0x9B8DABEEu,0xD5B72F2Fu,0xA3ADBC50u,0x7FEBAA02u));
	A(uvec4(0x932CB42Fu,0x55575EF8u,0x9B6CB3EFu,0xE9AD2D2Du));
	A(uvec4(0x7A8AA3AEu,0x575EE808u,0x62089B6Cu,0x7FEAAA80u));
	A(uvec4(0x39467AAAu,0x5F7EE880u,0x39875A09u,0x555DFEA8u));
	A(uvec4(0x41875A2Au,0xD5B52F0Au,0x5209626Bu,0xB5ADAA00u));
	A(uvec4(0x6A8B6ACCu,0xFDFDE9A9u,0x6AAC728Bu,0xFFFFBFBFu));
	A(uvec4(0x6A6A6AACu,0xEAEAFA7Au,0x624A7AABu,0x2AFFDF55u));
	A(uvec4(0x6A2ABC0Fu,0x2ADF555u,0x6A09BC10u,0x80AAFF55u));
	A(uvec4(0x724A8B0Cu,0xE0E08AADu,0x722982ABu,0xF77FFAE0u));
	A(uvec4(0x6A097A8Au,0x5EEAAAAAu,0x38E56A29u,0x58706080u));
	A(uvec4(0x20A430E4u,0x5EFEFEFAu,0x20A328C4u,0xFE5757BEu));
	A(uvec4(0x208338C4u,0x20BADF7u,0x30A438A4u,0x60E0E07Du));
	A(uvec4(0x39A649E7u,0xEAFE7F5Fu,0x398641C7u,0x7F7F5F55u));
	A(uvec4(0x31653986u,0xFAEAA2E0u,0x31663985u,0xF5FFFFBFu));
	A(uvec4(0x39864A08u,0xD5952D09u,0x520882EBu,0x2D35B5D5u));
	A(uvec4(0x72AA934Cu,0xAA000009u,0x8B0C9B6Cu,0xFDFEA200u));
	A(uvec4(0x8B0B9B8Du,0x57BFAA2Au,0x7AAA9B8Du,0x5E7AE080u));
	A(uvec4(0x82AA9B4Cu,0x252D2D3Fu,0x6A69A3ADu,0x7AE08080u));
	A(uvec4(0x59E782CBu,0x5F7EFEE8u,0x49876A69u,0x55555778u));
	A(uvec4(0x39464987u,0x5E5E5858u,0x39463987u,0xFFF7F7DEu));
	A(uvec4(0x394641A8u,0xDFFDBF2Fu,0x41875A4Au,0x2D2D2F2Fu));
	A(uvec4(0x626B6AACu,0xF5AFABABu,0x6AAC72ABu,0x7FFFFFFFu));
	A(uvec4(0x72ACBBF0u,0x35D55555u,0x82CCDD14u,0x20BADD5u));
	A(uvec4(0xCC91EDF7u,0x80ABFD55u,0xCC71DD95u,0xEEE0EA7Fu));
	A(uvec4(0x828ACC72u,0xF8785E56u,0x7A4A8AECu,0x60EAFD55u));
	A(uvec4(0x6A087A6Au,0x5F565C5Cu,0x31056209u,0xFC5C5C58u));
	A(uvec4(0x28C43105u,0x80E05E57u,0x28A44105u,0xAA2FB5D5u));
	A(uvec4(0x30C440E5u,0xEAFE7EFFu,0x20A330C4u,0x5E58F8A0u));
	A(uvec4(0x41C74A07u,0xAAFE7F5Fu,0x39A641C7u,0x60787E7Au));
	A(uvec4(0x316539A6u,0x585E5E5Eu,0x29653166u,0xB0A0202u));
	A(uvec4(0x318641C7u,0xADBDBDBDu,0x41C77289u,0xF5F5B52Du));
	A(uvec4(0x5A2882EBu,0xADAB0200u,0x7AAA8B0Bu,0xFDBB8B02u));
	A(uvec4(0x6A698B0Bu,0x57FEAA00u,0x620882EBu,0xD5D7DEF8u));
	A(uvec4(0x6A288B0Bu,0x7FFFAB0Bu,0x498682CAu,0x5F7AEAA0u));
	A(uvec4(0x41666208u,0x55555EF8u,0x41664986u,0xBFAAAA00u));
	A(uvec4(0x39464986u,0xFAF8FA5Cu,0x39463987u,0xBEBDFDBFu));
	A(uvec4(0x39664188u,0xBFF5F5D7u,0x39675209u,0xBFBD2D2Du));
	A(uvec4(0x5209626Bu,0x9090B0Au,0x6A8B72CCu,0x7DADAD2Bu));
	A(uvec4(0x726BBC51u,0x55FD0B0Du,0x7A8BDD55u,0xF555EA00u));
	A(uvec4(0x930DE575u,0x2BBDD5F8u,0xC472E5D6u,0x2ABADF5u));
	A(uvec4(0xAB8EE5B6u,0x80EA7Eu,0x7A8ACC71u,0x78787A7Fu));
	A(uvec4(0x6A086A4Au,0xE2F8FED7u,0x412659C8u,0xFE565454u));
	A(uvec4(0x39054966u,0xA0FA5F55u,0x39054926u,0xBEFDFDF5u));
	A(uvec4(0x38C44105u,0x60787870u,0x28A330E4u,0xE0BA5Eu));
	A(uvec4(0x4A074A08u,0xABBFFF5Fu,0x41C64A08u,0xE8F8FA7Eu));
	A(uvec4(0x316641C6u,0x5C5C5E5Eu,0x316639C7u,0x2B2DB5D5u));
	A(uvec4(0x39A64A28u,0xB2FBDF5u,0x4A085A89u,0xB2FFDD5u));
	A(uvec4(0x5A496A8Au,0x7B5FB52Du,0x5A087A8Au,0x7FEA8A00u));
	A(uvec4(0x59E76A69u,0x575FFAE8u,0x51C76A28u,0x7FAB0B2Au));
	A(uvec4(0x49866A49u,0x555F7880u,0x416651A7u,0x2EAFFF5Cu));
	A(uvec4(0x416659C7u,0xAABFF55u,0x49876A28u,0xAFF5555u));
	A(uvec4(0x49877A8Au,0xFF5555u,0x41876A49u,0xA0FEFF55u));
	A(uvec4(0x41A8520Au,0x22AAABF5u,0x49E8524Bu,0x2A2AAFD5u));
	A(uvec4(0x524B628Bu,0xB5F52D09u,0x522A9B6Eu,0x3FB5FFFFu));
	A(uvec4(0x728BDD55u,0x22BB555u,0x932DEDF7u,0xAABDu));
	A(uvec4(0x9B6EEDD6u,0x7800000Au,0x8AACEDF7u,0xD5FE8000u));
	A(uvec4(0xB3CFE5D6u,0xD5557AC0u,0x92CCC450u,0xAAFE5Eu));
	A(uvec4(0x7249BBCEu,0x785E5755u,0x498761E8u,0xE8F8FA5Eu));
	A(uvec4(0x498651A7u,0xAE8AE8FFu,0x414649A7u,0xF8FEFE57u));
	A(uvec4(0x412549A7u,0xAAEAEA5Fu,0x31454166u,0x8080A8BFu));
	A(uvec4(0x4A085227u,0xFDFDF7FDu,0x41E75227u,0xFEFEFEDEu));
	A(uvec4(0x318641E7u,0xFEDE5E56u,0x31864208u,0x2BAFAFBDu));
	A(uvec4(0x42085289u,0x2B2DADB5u,0x528962EBu,0xB2FADB5u));
	A(uvec4(0x5269630Cu,0x808ACA6Au,0x49C75A29u,0x56FFEB82u));
	A(uvec4(0x49A659E8u,0x57FEFEAAu,0x498651C7u,0x55575840u));
	A(uvec4(0x416651A7u,0xABBFBFFDu,0x51A76208u,0xB5B5B5D5u));
	A(uvec4(0x59C7726Au,0x2B2B2FB5u,0x7A8AABEEu,0xB2DBDD5u));
	A(uvec4(0x9B4DBC50u,0xAAB55u,0x7A8AC450u,0x8080EA5Fu));
	A(uvec4(0x5A0AA38Du,0xE0785F55u,0x522B5AADu,0xAA7D55u));
	A(uvec4(0x526B630Eu,0x2ABBDF5u,0x6ACC8BAFu,0x5FFFBD3Du));
	A(uvec4(0x5167E5D7u,0x7F8B0202u,0x6A09E596u,0x55577880u));
	A(uvec4(0x6A29ABAFu,0x2BB5D55Cu,0x7A6BD4D2u,0x2ABBFFDu));
	A(uvec4(0xBBCFDD95u,0x22BBDF5u,0xCC92E5B6u,0x8080ABF5u));
	A(uvec4(0x724ACC91u,0x78787878u,0x51A76208u,0xF8787878u));
	A(uvec4(0x498751A7u,0xA0A0AAFFu,0x416649A7u,0xE0F8FCF8u));
	A(uvec4(0x41664987u,0xAFABA2A2u,0x39664986u,0xAAEAEAEAu));
	A(uvec4(0x4A085227u,0xFFFFFFFFu,0x41E74A08u,0x7E7E7A7Cu));
	A(uvec4(0x318639C7u,0x2A2E3EBEu,0x39C74229u,0x2DADB5B5u));
	A(uvec4(0x42495AEBu,0x2FADB5B5u,0x5AEB632Cu,0x2D2D2D2Du));
	A(uvec4(0x5B0D632Cu,0x56DEFAFAu,0x41C74A8Au,0x54545C5Cu));
	A(uvec4(0x418649A7u,0xF6FEFE78u,0x418651A7u,0xBAFB5D5u));
	A(uvec4(0x498659E8u,0xAAFFFFDu,0x51C77269u,0xAADF5F5u));
	A(uvec4(0x61E882CBu,0xABFF5B5u,0x82ABC471u,0x252DA9ADu));
	A(uvec4(0xB3EFC450u,0x5C7860C2u,0x930DB3EFu,0xE05EA800u));
	A(uvec4(0x6A8BABCEu,0x5F5F6060u,0x62ED73B0u,0x929ADD5u));
	A(uvec4(0x632F8411u,0xAABFD5u,0x72EDCD75u,0xB2FD755u));
	A(uvec4(0x828BE5B6u,0xAAFF55u,0x8ACCE595u,0xAAFF55u));
	A(uvec4(0xA38EE596u,0x22BB5u,0xABCFEDF7u,0x60000AAAu));
	A(uvec4(0x826BE5B6u,0xA5AA0000u,0xAB8EEDB6u,0x55FFA080u));
	A(uvec4(0x7249CC72u,0x7A7A7878u,0x51C86208u,0xD6FEFCF8u));
	A(uvec4(0x49A759E8u,0xFEFAFEFEu,0x51C849A7u,0xA2A0200u));
	A(uvec4(0x41664987u,0xAEAFAFAFu,0x416649A7u,0xBFBFEFEFu));
	A(uvec4(0x49E74A28u,0xEAAAAAAAu,0x522839C7u,0x2A2A2A2Au));
	A(uvec4(0x31A73A08u,0xBDB5BDB5u,0x3A085289u,0x2DADB5B5u));
	A(uvec4(0x4A695AEBu,0x20A0B2Du,0x5B0C632Bu,0x575555FFu));
	A(uvec4(0x3A6A5B2Du,0x78E8A8A0u,0x4187428Bu,0x57565C5Cu));
	A(uvec4(0x418651C7u,0x2FB5F5F5u,0x51C77A6Au,0x2DBDD555u));
	A(uvec4(0x6208932Cu,0x22BBDD5u,0x728A9B6Du,0x80AABFF5u));
	A(uvec4(0x932CABAEu,0xD092DD5u,0x7269ABCFu,0x7058DE37u));
	A(uvec4(0x7209B40Fu,0xAB55FA00u,0x7A6AB40Fu,0xA8555780u));
	A(uvec4(0x6A2A934Du,0x7055FF60u,0x624A7BB0u,0x35250D09u));
	A(uvec4(0x83F18C52u,0x55A9092Fu,0x8C32DDD6u,0x55D5B52Du));
	A(uvec4(0x6A8BE617u,0x5FAA0000u,0x7AABEDD7u,0x55000000u));
	A(uvec4(0x59C8EDD7u,0x55788000u,0x59C8E555u,0x55555758u));
	A(uvec4(0x61E89B2Du,0xA9ADAD0Fu,0x8AECA36Du,0xF5D5DFAAu));
	A(uvec4(0x61E8A3AEu,0x57565870u,0x51C86208u,0xFFFFDFD6u));
	A(uvec4(0x49875A08u,0xFEFEFEFEu,0x498751C7u,0xEFFFFEFEu));
	A(uvec4(0x416649A7u,0xF0B0B8B8u,0x41864987u,0xAAA8E8FEu));
	A(uvec4(0x49E74A28u,0x7FFE7E7Eu,0x39C749E7u,0x5A7A7A72u));
	A(uvec4(0x39C74228u,0x2DBDF5D5u,0x42285ACAu,0x2F2D2DB5u));
	A(uvec4(0x5AEA632Cu,0xAD2F2DADu,0x52CC632Cu,0x6080A8A8u));
	A(uvec4(0x316652ECu,0x575C78E0u,0x31864186u,0x2F252Du));
	A(uvec4(0x49A76A29u,0x2BADB5F5u,0x6A29932Cu,0xB2DADB5u));
	A(uvec4(0x8B2CABCEu,0xA0A2BADu,0x9B6DBC0Fu,0xA0AAA7Fu));
	A(uvec4(0x932CBC50u,0xAABFB5u,0x930CBC30u,0x8262u));
	A(uvec4(0x9B4DD4D2u,0xB03032Du,0x82ABCCB2u,0x5CE08000u));
	A(uvec4(0x6A4ABC0Fu,0x55577EE8u,0x624A730Du,0x27B59735u));
	A(uvec4(0x6B0E73B0u,0xFD2F0200u,0x737083D1u,0xF5FFAF0Au));
	A(uvec4(0x5A0A83D0u,0x5C585858u,0x59E859EAu,0x5F5A70D8u));
	A(uvec4(0x51C86A09u,0xA55575Fu,0x59A882ABu,0x2B55555u));
	A(uvec4(0x722AA36Eu,0x2AFFDFDu,0x7A8A9B2Du,0x6040C28Au));
	A(uvec4(0x59E86A29u,0x5858785Cu,0x51A759E8u,0x80A0B8A8u));
	A(uvec4(0x51A751E8u,0xFABAEEEEu,0x498651C8u,0xAAAABEAAu));
	A(uvec4(0x498751E8u,0x7F7F7F5Fu,0x41664987u,0xAAAAAAAAu));
    //-------------------------------------------------------------------------
	C = col;
    
}
