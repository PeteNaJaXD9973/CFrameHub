pcall(function()
   --// Obfuscated by jmes - discord.gg/STaq3UDbqQ

local f=string.byte;local t=string.char;local c=string.sub;local D=table.concat;local A=math.ldexp;local C=getfenv or function()return _ENV end;local l=setmetatable;local i=select;local Q=unpack;local E=tonumber;local function I(f)local e,o,d="","",{}local n=256;local a={}for l=0,n-1 do a[l]=t(l)end;local l=1;local function r()local e=E(c(f,l,l),36)l=l+1;local o=E(c(f,l,l+e-1),36)l=l+e;return o end;e=t(r())d[1]=e;while l<#f do local l=r()if a[l]then o=a[l]else o=e..c(e,1,1)end;a[n]=e..c(o,1,1)d[#d+1],e,n=o,o,n+1 end;return table.concat(d)end;local d=I('23I26F23I27623U23A23Y23L23S23A27623V23I22M23I23S27623I23Y22M27A23S27H23I23Z23A21A27I27D23I23M22627O22627623Q27Z27B28123I24A28423S28623Z22M27H27P27E22U23227I22U27E21Y27227I21Y27627M27O27Q27S27U27C27623M21A27O27U23I23Q28Z27B29124A29423S29128C28E27Q23V21I28I23S21I28Q27N27B28T27T27V28X1U27O1U2821M27O1M27624A1E27O1E27629B27I29D21229G21227E1623I23J23S2AA23I23V26U22M2AC26U27E26E21Q2AC26E29J28S2A229N28W27X25Q27O25Q28225I27O25I29X25A27O25A2A228D2A427E25Y29G25Y27E2522662AC25227E24M25A2AC24M27E24624E2AC24628Q23Q27O23Q2AS23I23G2AU23M23A23Z27B23A23J23I23R27K27J2A222U28E28K27R23221R2AC2322C623Z22U2672AC22U2CK22M21B2BZ2AI27R2261F2BZ2262C623M2BU27B2BW23I23N28I2BZ28I29221Q2C323S2AN23I24B2C927K23N2CC28J27623N21Y26M2BZ28P2D521A25R2BZ21A2C62D62CH23S2CJ2D51U24V2BZ1U2C623Q29K28F2C722U28V2CE24A162DC162C624E2722DC2722C624226U2DC26U2C623R2B82EA23N1E22727I1E2E726M2DC26M2ET23A28E27W23R22U22623H23S2CE23O23A21Q2FD27D27223T27K23Y2762FL21Y27A23Y28P2722E827A23N27Q2FA27U2462EE29Q27B29S23I24E25Y2DC25Y2EO25Q2DC25Q2ET2EV27Q2EX2EZ23S2F123I23T2AW27B2AY2FV2F323L23N2F52C72F723I2452F92FB23H2402FF21Q1E23H23M21Q23I2FQ2FS2FU2FW2GU2FZ2EC23I2G229X2EG27B2EI2G72EL27B2EN23I2EP2ER2GG29C2DM2EY2F02C623T21I27O29I2FV25A2C323N2BL2872522C323U2522ET23229G2D923Q24U2DC24U2C624A24M2DC24M2IG2II27623R23A25A2FJ2IV2IH27I2D923R2322IY2E02J02IU2922D223N2D42FA2BY2472EE2462DC2462C624F2DH2IV2DK2FE2J02DZ2E123R23Y23Z2FD23Y2ET23I23023E27J23G2C72322242K22322K42EU2182K222M2K424A2D223S2D424B27H23G24027Q24E2DB23L2432DE2432JN2DF2JP2CE24B21Y26628O27624B21A1V2K22DW2DF1U26727I2E62DF2CG2CI2EJ2E927Q24F22E28V22E2762422G423S2G624629U23L24F29W23I24Q21Y23W23L23L21Y2K424F2GH2L31E21B2I02G72KH2D42LK2BY23S2LN2HT2KQ2DD2C62472KV24F2KX27624F21Y24U2DQ2MR21A2732L72JL1U26N23E24D2LD24F2LF2442E12422LI27624322628V2862462LQ2G624Q2NI27624U2NL23I2432M723I24F1E1V2MB2422MD2NC2812CY27624621A2M124F21A2K424R27K24A27K2432MQ2NP2LF2E02C62OD25R2K22CP2NP1U24S2K21U2K42462IL27B2IN2LY1E2M12GL2K42472J12J72AF27W2AU21C27K23G23E27K1P1V1J1R23G27W23I21E1N1P1M1A1N1G1P23G23D27K21R1J1S1N1R1G1A23G23C27K21P1H1I1H1C2252PS27K1O1C1H1J21821L21O2C627K2HB21Q21Q23G23827K21O1C2PL2PN1G1R1D1D23J25S21L24F1422Y25S22S2QO2332Q42Q62Q82191M1N1O1A1X21O1H1A1A2QF2QK2QL27623G2342RA2Q71C2RD2RF2RH2161H2GM2QL24E1H2DE2S21G2S527K2661J2QO22X27K21N1G181N2QE1G2PF2Q021M2RF1O1B1D1R2191T1V1I1R23J2R32R52R225G21T23G2CE23I2SF2SH2SJ2SL1A2191E1R1T1B1I1V2RV2SU2SW23J21C1S23221221Z25M24E2T323727K21L2Q71S2SV2RD1V1Q1H191D23H23J2RR27K21D1B1A2U32Q82PV2PX2PZ1A2RO2FP21J2S827K21H2UN23I25A21A2QO2RS2762U12U3192191H2RG2QW2QY23J152T02R32622T32302TW1R1H1P1C1V1E2RE1T21E1V2PO1A1B1Q2SX24Z24Y2VT24Y23622925A23G22Y2SE161E1H1D1B1C1R2Q51J2TD1G1D2VM1N1H1G2UK2O22T32PI21J2WC1A1V1G1T2PG23H27K2QW1923G2392QR2Q72QF21N1O1O2TE2Q12PT2762SF1V1S2SW1Q23G23B27K2WM1A2PZ1D1N1A172PA27K2191N142SX2RP25Q26B2QO2XF2762161M2W71D1M2Q61Q23J21I2SZ2R12432T322Z2RT2Q82Q51C2W71T2PO2WG2X22X42YJ23J25G21J23623G22D26X2542WK2RA2Q02VG1D2UJ2MH1Y26P25823V24M2T32QQ2UW2VM2W62WE2WG23J26C26F2ZI2ZI2532T32XY23I2162PP1A2Q52RU2WI22M1L2UQ22M1S2UQ27221E2QO2X723I1P1R1A31062SG2XO2761J1H2VQ2Q22XP1B1J2PF1C2WI2722ZW310M2ZZ310G27621R2UC310I1G310B23I192TI310W2R927621C1H22M310D2VQ22M2SR2SW2YJ1R1Q22N23G23F27K1E2QT2Q02VZ27K21A2SW1V2SR31191R311B1A22M1V3116310E2PG310421M2QX1A2QE2XN2VB27631221E1A1M21D1O21K2PY1I1Q2YM2X523G23627K21K2TI2XH2XJ2XL1723J27125A25026721N25K25P2TU312N1H2TF1D2SN2Z12WP2WR23J23824P2651E21V26S2232QO2TV2762WM21K31342SQ2182U21N2SQ23J26Z24521B25I22O257222313J27K21C1R312P2Q0312R2XM23J2401221T2231W25G24V21T23J242313X22O313V25R25D2WI24E2SB23J2VS2VU24Y24I314I2ZH2ZJ26F25J25D23G313K23I2191B1G313Q171D312J2YO2V62R12R326Y2T32Q32UW311J31452Y624D26326D25622M25Q2582T322D27K21821621222M21L2VG2VI1N1T1D22M2Q72U2311D22M23822M1T2W72VM316C1S1722M21921R21C21G21J22L227316T2212QL');local n=bit and bit.bxor or function(l,e)local o,n=1,0 while l>0 and e>0 do local c,a=l%2,e%2 if c~=a then n=n+o end l,e,o=(l-c)/2,(e-a)/2,o*2 end if l<e then l=e end while l>0 do local e=l%2 if e>0 then n=n+o end l,o=(l-e)/2,o*2 end return n end local function e(o,l,e)if e then local l=(o/2^(l-1))%2^((e-1)-(l-1)+1);return l-l%1;else local l=2^(l-1);return(o%(l+l)>=l)and 1 or 0;end;end;local l=1;local function o()local e,o,c,a=f(d,l,l+3);e=n(e,126)o=n(o,126)c=n(c,126)a=n(a,126)l=l+4;return(a*16777216)+(c*65536)+(o*256)+e;end;local function a()local e=n(f(d,l,l),126);l=l+1;return e;end;local function E()local l=o();local o=o();local c=1;local n=(e(o,1,20)*(2^32))+l;local l=e(o,21,31);local e=((-1)^e(o,32));if(l==0)then if(n==0)then return e*0;else l=1;c=0;end;elseif(l==2047)then return(n==0)and(e*(1/0))or(e*(0/0));end;return A(e,l-1023)*(c+(n/(2^52)));end;local I=o;local function r(e)local o;if(not e)then e=I();if(e==0)then return'';end;end;o=c(d,l,l+e-1);l=l+e;local e={}for l=1,#o do e[l]=t(n(f(c(o,l,l)),126))end return D(e);end;local l=o;local function D(...)return{...},i('#',...)end local function I()local t={0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0};local f={};local l={};local d={t,nil,f,nil,l};d[4]=a();for a=1,o()do local c=n(o(),245);local o=n(o(),246);local n=e(c,1,2);local l=e(o,1,11);local l={l,e(c,3,11),nil,nil,o};if(n==0)then l[3]=e(c,12,20);l[5]=e(c,21,29);elseif(n==1)then l[3]=e(o,12,33);elseif(n==2)then l[3]=e(o,12,32)-1048575;elseif(n==3)then l[3]=e(o,12,32)-1048575;l[5]=e(c,21,29);end;t[a]=l;end;local l=o()local n={0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0};for o=1,l do local e=a();local l;if(e==3)then l=(a()~=0);elseif(e==1)then l=E();elseif(e==2)then l=r();end;n[o]=l;end;d[2]=n for l=1,o()do f[l-1]=I();end;return d;end;local function A(l,e,E)local o=l[1];local e=l[2];local a=l[3];local l=l[4];return function(...)local c=o;local n=e;local e=a;local a=l;local l=D local e=1;local r=-1;local t={};local d={...};local f=i('#',...)-1;local l={};local o={};for l=0,f do if(l>=a)then t[l-a]=d[l+1];else o[l]=d[l+1];end;end;local l=f-a+1 local l;local t;while true do l=c[e];t=l[1];if t<=17 then if t<=8 then if t<=3 then if t<=1 then if t>0 then if(o[l[2]]==n[l[5]])then e=e+1;else e=e+l[3];end;else local a,a;local i;local f;local a;local t;local d;o[l[2]]=E[n[l[3]]];e=e+1;l=c[e];o[l[2]]=o[l[3]][n[l[5]]];e=e+1;l=c[e];o[l[2]]=E[n[l[3]]];e=e+1;l=c[e];o[l[2]]=o[l[3]][n[l[5]]];e=e+1;l=c[e];o[l[2]]=n[l[3]];e=e+1;l=c[e];o[l[2]]=n[l[3]];e=e+1;l=c[e];o[l[2]]=n[l[3]];e=e+1;l=c[e];d=l[2];t={};a=0;f=d+l[3]-1;for l=d+1,f do a=a+1;t[a]=o[l];end;i={o[d](Q(t,1,f-d))};f=d+l[5]-2;a=0;for l=d,f do a=a+1;o[l]=i[a];end;r=f;e=e+1;l=c[e];o[l[2]][n[l[3]]]=o[l[5]];e=e+1;l=c[e];o[l[2]][n[l[3]]]=n[l[5]];e=e+1;l=c[e];o[l[2]]=E[n[l[3]]];e=e+1;l=c[e];o[l[2]]=o[l[3]][n[l[5]]];e=e+1;l=c[e];o[l[2]]=n[l[3]];e=e+1;l=c[e];o[l[2]]=n[l[3]];e=e+1;l=c[e];o[l[2]]=n[l[3]];e=e+1;l=c[e];d=l[2];t={};a=0;f=d+l[3]-1;for l=d+1,f do a=a+1;t[a]=o[l];end;i={o[d](Q(t,1,f-d))};f=d+l[5]-2;a=0;for l=d,f do a=a+1;o[l]=i[a];end;r=f;e=e+1;l=c[e];o[l[2]][n[l[3]]]=o[l[5]];e=e+1;l=c[e];o[l[2]]=E[n[l[3]]];e=e+1;l=c[e];o[l[2]]=o[l[3]][n[l[5]]];e=e+1;l=c[e];o[l[2]]=n[l[3]];e=e+1;l=c[e];o[l[2]]=n[l[3]];e=e+1;l=c[e];o[l[2]]=n[l[3]];e=e+1;l=c[e];d=l[2];t={};a=0;f=d+l[3]-1;for l=d+1,f do a=a+1;t[a]=o[l];end;i={o[d](Q(t,1,f-d))};f=d+l[5]-2;a=0;for l=d,f do a=a+1;o[l]=i[a];end;r=f;e=e+1;l=c[e];o[l[2]][n[l[3]]]=o[l[5]];e=e+1;l=c[e];o[l[2]][n[l[3]]]=n[l[5]];e=e+1;l=c[e];o[l[2]][n[l[3]]]=n[l[5]];e=e+1;l=c[e];o[l[2]][n[l[3]]]=n[l[5]];e=e+1;l=c[e];o[l[2]]=E[n[l[3]]];e=e+1;l=c[e];o[l[2]]=o[l[3]][n[l[5]]];e=e+1;l=c[e];o[l[2]]=n[l[3]];e=e+1;l=c[e];o[l[2]]=n[l[3]];e=e+1;l=c[e];o[l[2]]=n[l[3]];e=e+1;l=c[e];d=l[2];t={};a=0;f=d+l[3]-1;for l=d+1,f do a=a+1;t[a]=o[l];end;i={o[d](Q(t,1,f-d))};f=d+l[5]-2;a=0;for l=d,f do a=a+1;o[l]=i[a];end;r=f;e=e+1;l=c[e];o[l[2]][n[l[3]]]=o[l[5]];e=e+1;l=c[e];o[l[2]][n[l[3]]]=n[l[5]];e=e+1;l=c[e];o[l[2]][n[l[3]]]=n[l[5]];e=e+1;l=c[e];o[l[2]][n[l[3]]]=n[l[5]];e=e+1;l=c[e];o[l[2]]=E[n[l[3]]];e=e+1;l=c[e];o[l[2]]=o[l[3]][n[l[5]]];e=e+1;l=c[e];o[l[2]]=n[l[3]];e=e+1;l=c[e];o[l[2]]=o[l[3]];e=e+1;l=c[e];d=l[2];t={};a=0;f=d+l[3]-1;for l=d+1,f do a=a+1;t[a]=o[l];end;i={o[d](Q(t,1,f-d))};f=d+l[5]-2;a=0;for l=d,f do a=a+1;o[l]=i[a];end;r=f;e=e+1;l=c[e];o[l[2]][n[l[3]]]=n[l[5]];e=e+1;l=c[e];o[l[2]][n[l[3]]]=n[l[5]];e=e+1;l=c[e];o[l[2]][n[l[3]]]=n[l[5]];e=e+1;l=c[e];o[l[2]][n[l[3]]]=n[l[5]];e=e+1;l=c[e];o[l[2]]=E[n[l[3]]];e=e+1;l=c[e];o[l[2]]=o[l[3]][n[l[5]]];e=e+1;l=c[e];o[l[2]]=n[l[3]];e=e+1;l=c[e];o[l[2]]=o[l[3]];e=e+1;l=c[e];d=l[2];t={};a=0;f=d+l[3]-1;for l=d+1,f do a=a+1;t[a]=o[l];end;i={o[d](Q(t,1,f-d))};f=d+l[5]-2;a=0;for l=d,f do a=a+1;o[l]=i[a];end;r=f;e=e+1;l=c[e];o[l[2]][n[l[3]]]=n[l[5]];e=e+1;l=c[e];o[l[2]][n[l[3]]]=n[l[5]];e=e+1;l=c[e];o[l[2]][n[l[3]]]=n[l[5]];e=e+1;l=c[e];o[l[2]][n[l[3]]]=n[l[5]];e=e+1;l=c[e];o[l[2]]=E[n[l[3]]];e=e+1;l=c[e];o[l[2]]=o[l[3]][n[l[5]]];e=e+1;l=c[e];o[l[2]]=n[l[3]];e=e+1;l=c[e];o[l[2]]=n[l[3]];e=e+1;l=c[e];o[l[2]]=n[l[3]];e=e+1;l=c[e];d=l[2];t={};a=0;f=d+l[3]-1;for l=d+1,f do a=a+1;t[a]=o[l];end;i={o[d](Q(t,1,f-d))};f=d+l[5]-2;a=0;for l=d,f do a=a+1;o[l]=i[a];end;r=f;e=e+1;l=c[e];o[l[2]][n[l[3]]]=o[l[5]];e=e+1;l=c[e];o[l[2]]=E[n[l[3]]];e=e+1;l=c[e];d=l[2];i,f={o[d]()};f=d+l[5]-2;a=0;for l=d,f do a=a+1;o[l]=i[a];end;r=f;e=e+1;l=c[e];o[l[2]]=o[l[3]][n[l[5]]];e=e+1;l=c[e];if(o[l[2]]~=n[l[5]])then e=e+1;else e=e+l[3];end;end;elseif t>2 then local e=l[2];local c={};local n=0;local l=e+l[3]-1;for l=e+1,l do n=n+1;c[n]=o[l];end;o[e](Q(c,1,l-e));r=e;else local i;local f;local d;local t;local a;o[l[2]]=n[l[3]];e=e+1;l=c[e];a=l[2];t={};d=0;f=a+l[3]-1;for l=a+1,f do d=d+1;t[d]=o[l];end;o[a](Q(t,1,f-a));r=a;e=e+1;l=c[e];o[l[2]]=E[n[l[3]]];e=e+1;l=c[e];o[l[2]]=n[l[3]];e=e+1;l=c[e];a=l[2];t={};d=0;f=a+l[3]-1;for l=a+1,f do d=d+1;t[d]=o[l];end;o[a](Q(t,1,f-a));r=a;e=e+1;l=c[e];a=l[2];i=o[l[3]];o[a+1]=i;o[a]=i[n[l[5]]];e=e+1;l=c[e];a=l[2];t={};d=0;f=a+l[3]-1;for l=a+1,f do d=d+1;t[d]=o[l];end;o[a](Q(t,1,f-a));r=a;e=e+1;l=c[e];a=l[2];i=o[l[3]];o[a+1]=i;o[a]=i[n[l[5]]];e=e+1;l=c[e];a=l[2];t={};d=0;f=a+l[3]-1;for l=a+1,f do d=d+1;t[d]=o[l];end;o[a](Q(t,1,f-a));r=a;end;elseif t<=5 then if t>4 then o[l[2]]=n[l[3]];else o[l[2]][n[l[3]]]=o[l[5]];end;elseif t<=6 then e=e+l[3];elseif t==7 then o[l[2]][n[l[3]]]=o[l[5]];else o[l[2]]=o[l[3]];end;elseif t<=12 then if t<=10 then if t>9 then if(o[l[2]]==n[l[5]])then e=e+1;else e=e+l[3];end;else local i;local f;local a;local t;local d;o[l[2]]=n[l[3]];e=e+1;l=c[e];d=l[2];t={};a=0;f=d+l[3]-1;for l=d+1,f do a=a+1;t[a]=o[l];end;i={o[d](Q(t,1,f-d))};f=d+l[5]-2;a=0;for l=d,f do a=a+1;o[l]=i[a];end;r=f;e=e+1;l=c[e];o[l[2]][n[l[3]]]=o[l[5]];e=e+1;l=c[e];o[l[2]]=E[n[l[3]]];e=e+1;l=c[e];o[l[2]]=o[l[3]][n[l[5]]];e=e+1;l=c[e];o[l[2]]=n[l[3]];e=e+1;l=c[e];o[l[2]]=o[l[3]];e=e+1;l=c[e];d=l[2];t={};a=0;f=d+l[3]-1;for l=d+1,f do a=a+1;t[a]=o[l];end;i={o[d](Q(t,1,f-d))};f=d+l[5]-2;a=0;for l=d,f do a=a+1;o[l]=i[a];end;r=f;e=e+1;l=c[e];o[l[2]][n[l[3]]]=n[l[5]];e=e+1;l=c[e];o[l[2]][n[l[3]]]=n[l[5]];end;elseif t==11 then o[l[2]]=E[n[l[3]]];else local c=l[2];local e=o[l[3]];o[c+1]=e;o[c]=e[n[l[5]]];end;elseif t<=14 then if t==13 then local n=l[2];local a={};local e=0;local c=n+l[3]-1;for l=n+1,c do e=e+1;a[e]=o[l];end;local c={o[n](Q(a,1,c-n))};local l=n+l[5]-2;e=0;for l=n,l do e=e+1;o[l]=c[e];end;r=l;else do return end;end;elseif t<=15 then o[l[2]][n[l[3]]]=n[l[5]];elseif t>16 then local c=l[2];local e=o[l[3]];o[c+1]=e;o[c]=e[n[l[5]]];else if(o[l[2]]~=n[l[5]])then e=e+1;else e=e+l[3];end;end;elseif t<=26 then if t<=21 then if t<=19 then if t==18 then local i;local f;local d;local t;local a;o[l[2]]=o[l[3]];e=e+1;l=c[e];a=l[2];t={};d=0;f=a+l[3]-1;for l=a+1,f do d=d+1;t[d]=o[l];end;i={o[a](Q(t,1,f-a))};f=a+l[5]-2;d=0;for l=a,f do d=d+1;o[l]=i[d];end;r=f;e=e+1;l=c[e];o[l[2]][n[l[3]]]=n[l[5]];e=e+1;l=c[e];o[l[2]][n[l[3]]]=n[l[5]];e=e+1;l=c[e];o[l[2]][n[l[3]]]=n[l[5]];e=e+1;l=c[e];o[l[2]]=E[n[l[3]]];e=e+1;l=c[e];o[l[2]]=n[l[3]];e=e+1;l=c[e];a=l[2];t={};d=0;f=a+l[3]-1;for l=a+1,f do d=d+1;t[d]=o[l];end;o[a](Q(t,1,f-a));r=a;e=e+1;l=c[e];do return end;else if(o[l[2]]~=n[l[5]])then e=e+1;else e=e+l[3];end;end;elseif t==20 then local e=l[2];local c,n={o[e]()};local n=e+l[5]-2;local l=0;for e=e,n do l=l+1;o[e]=c[l];end;r=n;else o[l[2]][n[l[3]]]=n[l[5]];end;elseif t<=23 then if t>22 then o[l[2]]=n[l[3]];else o[l[2]]=o[l[3]][n[l[5]]];end;elseif t<=24 then o[l[2]]=o[l[3]][n[l[5]]];elseif t==25 then o[l[2]]=E[n[l[3]]];else local n=l[2];local c={};local e=0;local a=n+l[3]-1;for l=n+1,a do e=e+1;c[e]=o[l];end;local c={o[n](Q(c,1,a-n))};local l=n+l[5]-2;e=0;for l=n,l do e=e+1;o[l]=c[e];end;r=l;end;elseif t<=31 then if t<=28 then if t>27 then local i;local f;local a;local t;local d;o[l[2]][n[l[3]]]=n[l[5]];e=e+1;l=c[e];o[l[2]]=E[n[l[3]]];e=e+1;l=c[e];o[l[2]]=o[l[3]][n[l[5]]];e=e+1;l=c[e];o[l[2]]=n[l[3]];e=e+1;l=c[e];o[l[2]]=n[l[3]];e=e+1;l=c[e];o[l[2]]=n[l[3]];e=e+1;l=c[e];d=l[2];t={};a=0;f=d+l[3]-1;for l=d+1,f do a=a+1;t[a]=o[l];end;i={o[d](Q(t,1,f-d))};f=d+l[5]-2;a=0;for l=d,f do a=a+1;o[l]=i[a];end;r=f;e=e+1;l=c[e];o[l[2]][n[l[3]]]=o[l[5]];e=e+1;l=c[e];o[l[2]]=E[n[l[3]]];e=e+1;l=c[e];o[l[2]]=o[l[3]][n[l[5]]];else local i;local f;local a;local t;local d;o[l[2]]=n[l[3]];e=e+1;l=c[e];o[l[2]]=o[l[3]];e=e+1;l=c[e];d=l[2];t={};a=0;f=d+l[3]-1;for l=d+1,f do a=a+1;t[a]=o[l];end;i={o[d](Q(t,1,f-d))};f=d+l[5]-2;a=0;for l=d,f do a=a+1;o[l]=i[a];end;r=f;e=e+1;l=c[e];o[l[2]][n[l[3]]]=n[l[5]];e=e+1;l=c[e];o[l[2]][n[l[3]]]=n[l[5]];e=e+1;l=c[e];o[l[2]][n[l[3]]]=n[l[5]];e=e+1;l=c[e];o[l[2]][n[l[3]]]=n[l[5]];e=e+1;l=c[e];o[l[2]]=E[n[l[3]]];e=e+1;l=c[e];o[l[2]]=o[l[3]][n[l[5]]];e=e+1;l=c[e];o[l[2]]=n[l[3]];end;elseif t<=29 then local e=l[2];local c,n={o[e]()};local n=e+l[5]-2;local l=0;for e=e,n do l=l+1;o[e]=c[l];end;r=n;elseif t==30 then local E;local f;local a;local t;local d;o[l[2]]=o[l[3]][n[l[5]]];e=e+1;l=c[e];o[l[2]]=n[l[3]];e=e+1;l=c[e];o[l[2]]=n[l[3]];e=e+1;l=c[e];o[l[2]]=n[l[3]];e=e+1;l=c[e];d=l[2];t={};a=0;f=d+l[3]-1;for l=d+1,f do a=a+1;t[a]=o[l];end;E={o[d](Q(t,1,f-d))};f=d+l[5]-2;a=0;for l=d,f do a=a+1;o[l]=E[a];end;r=f;e=e+1;l=c[e];o[l[2]][n[l[3]]]=o[l[5]];e=e+1;l=c[e];e=e+l[3];else local i;local f;local a;local t;local d;o[l[2]]=o[l[3]][n[l[5]]];e=e+1;l=c[e];o[l[2]]=n[l[3]];e=e+1;l=c[e];o[l[2]]=o[l[3]];e=e+1;l=c[e];d=l[2];t={};a=0;f=d+l[3]-1;for l=d+1,f do a=a+1;t[a]=o[l];end;i={o[d](Q(t,1,f-d))};f=d+l[5]-2;a=0;for l=d,f do a=a+1;o[l]=i[a];end;r=f;e=e+1;l=c[e];o[l[2]][n[l[3]]]=n[l[5]];e=e+1;l=c[e];o[l[2]][n[l[3]]]=n[l[5]];e=e+1;l=c[e];o[l[2]][n[l[3]]]=n[l[5]];e=e+1;l=c[e];o[l[2]][n[l[3]]]=n[l[5]];e=e+1;l=c[e];o[l[2]][n[l[3]]]=n[l[5]];e=e+1;l=c[e];o[l[2]]=E[n[l[3]]];end;elseif t<=33 then if t==32 then local E;local f;local a;local t;local d;o[l[2]]=o[l[3]][n[l[5]]];e=e+1;l=c[e];o[l[2]]=n[l[3]];e=e+1;l=c[e];o[l[2]]=n[l[3]];e=e+1;l=c[e];o[l[2]]=n[l[3]];e=e+1;l=c[e];d=l[2];t={};a=0;f=d+l[3]-1;for l=d+1,f do a=a+1;t[a]=o[l];end;E={o[d](Q(t,1,f-d))};f=d+l[5]-2;a=0;for l=d,f do a=a+1;o[l]=E[a];end;r=f;e=e+1;l=c[e];o[l[2]][n[l[3]]]=o[l[5]];e=e+1;l=c[e];e=e+l[3];else e=e+l[3];end;elseif t<=34 then do return end;elseif t==35 then o[l[2]]=o[l[3]];else local e=l[2];local c={};local n=0;local l=e+l[3]-1;for l=e+1,l do n=n+1;c[n]=o[l];end;o[e](Q(c,1,l-e));r=e;end;e=e+1;end;end;end;return A(I(),{},C())(); 
end)
