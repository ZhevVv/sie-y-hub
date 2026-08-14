--[[
    ================================================================
    [ SCRIPT INFORMATION ]
    Project: Custom Script
    Author: OYB
    YouTube: https://www.youtube.com/channel/UCAlXXV1Hbvf7WbfXARuVtiQ

    [ TERMS AND CONDITIONS ]
    - You ARE allowed to use and modify this script for your own games.
    - You ARE NOT allowed to re-upload, redistribute, or claim
      ownership of this script.
    - Removing or altering these credits is strictly prohibited.

    Copyright (c) 2026 OYB. All rights reserved.
    ================================================================
]]
local _xyqYTAJB = {
    -- [1] PlatoBoost Settings
    ServiceId       = 29627, -- Your PlatoBoost Service ID
    PlatoSecret     = string.char(57, 99, 99, 55, 55, 56, 99, 55, 45, 98, 49, 101, 49, 45, 52, 53, 48, 54, 45, 98, 98, 54, 100, 45, 101, 102, 57, 49, 99, 51, 52, 52, 51, 55, 100, 50), -- Your PlatoBoost Secret Key

    -- [2] Anti-Bypass / Global Secret Variable
    Secret          = string.char(118, 104, 101, 111, 49, 50, 51), -- This makes the script ONLY run from the key script. Even if they copy the original obfuscated script to bypass the key, they won't be able to!

    -- [3] Scripts & Links
    MainScriptURL   = string.char(104, 116, 116, 112, 115, 58, 47, 47, 114, 97, 119, 46, 103, 105, 116, 104, 117, 98, 117, 115, 101, 114, 99, 111, 110, 116, 101, 110, 116, 46, 99, 111, 109, 47, 90, 104, 101, 118, 86, 118, 47, 115, 105, 101, 45, 121, 45, 104, 117, 98, 47, 114, 101, 102, 115, 47, 104, 101, 97, 100, 115, 47, 109, 97, 105, 110, 47, 115, 99, 114, 105, 112, 116, 46, 108, 117, 97), -- The raw URL of your main script

    -- [4] Social Media Settings (Set to true to show, false to hide)
    ShowDiscord     = true,
    DiscordURL      = string.char(104, 116, 116, 112, 115, 58, 47, 47, 100, 105, 115, 99, 111, 114, 100, 46, 103, 103, 47, 114, 122, 113, 87, 50, 72, 52, 51, 69, 99),

    ShowInstagram   = false,
    InstagramURL    = string.char(104, 116, 116, 112, 115, 58, 47, 47, 119, 119, 119, 46, 105, 110, 115, 116, 97, 103, 114, 97, 109, 46, 99, 111, 109, 47, 111, 121, 98, 48, 105, 47),

    ShowYoutube     = false,
    YoutubeURL      = string.char(104, 116, 116, 112, 115, 58, 47, 47, 119, 119, 119, 46, 121, 111, 117, 116, 117, 98, 101, 46, 99, 111, 109, 47, 99, 104, 97, 110, 110, 101, 108, 47, 85, 67, 65, 108, 88, 88, 86, 49, 72, 98, 118, 102, 55, 87, 98, 102, 88, 65, 82, 117, 86, 116, 105, 81),

    -- [5] File System
    KeyFileName     = string.char(77, 121, 107, 101, 121, 46, 116, 120, 116), -- The name of the file where the valid key will be saved for auto-login

    -- [6] GUI Management
    OldGuiName      = string.char(83, 73, 69, 32, 89, 32, 72, 85, 66), -- Name of the old GUI to destroy if it's already open
    MainGuiName     = string.char(83, 73, 69, 32, 89, 32, 72, 85, 66), -- Name of the main script's GUI to check if it's already executing

    -- [7] Hub Information & UI Text
    HubName         = string.char(83, 73, 69, 32, 89), -- The main title shown at the top of the GUI
    HubDescription  = string.char(72, 101, 108, 108, 111, 32, 84, 104, 101, 114, 101, 33, 32, 84, 104, 97, 110, 107, 121, 111, 117, 32, 102, 111, 114, 32, 117, 115, 105, 110, 103, 32, 83, 105, 101, 32, 89, 32, 72, 117, 98, 44, 32, 102, 111, 114, 32, 109, 111, 114, 101, 32, 115, 99, 114, 105, 112, 116, 32, 106, 111, 105, 110, 32, 116, 111, 32, 111, 117, 114, 32, 100, 105, 115, 99, 111, 114, 100) -- The text shown below the title
}

-------------------------------------------------------------------------------
--! LIBRARIES (JSON & CRYPTOGRAPHY) - DO NOT MODIFY
-------------------------------------------------------------------------------
local _xVhsVDRi=2^32;local _x2om1GTY=_xVhsVDRi-1;local function _xrnHe7Mb(d,e)local _xdpxIXJu,g=0,1;while d=0 or e=0 do local _xlgKpMbc,i=d%2,e%2;local _xqVA5cAo=(_xlgKpMbc+i)%2;_xdpxIXJu=_xdpxIXJu+_xqVA5cAo*g;d=math.floor(d/2)e=math.floor(e/2)g=g*2 end;return _xdpxIXJu%_xVhsVDRi end;local function _xpY8C0wU(d,e,l,...)local _x7bIjHnX;if e then d=d%_xVhsVDRi;e=e%_xVhsVDRi;_x7bIjHnX=_xrnHe7Mb(d,e)if l then _x7bIjHnX=_xpY8C0wU(_x7bIjHnX,l,...)end;return _x7bIjHnX elseif d then return d%_xVhsVDRi else return 0 end end;local function _xRbMFvE4(d,e,l,...)local _xdswki9x;if e then d=d%_xVhsVDRi;e=e%_xVhsVDRi;_xdswki9x=(d+e-_xrnHe7Mb(d,e))/2;if l then _xdswki9x=_xRbMFvE4(_xdswki9x,l,...)end;return _xdswki9x elseif d then return d%_xVhsVDRi else return _x2om1GTY end end;local function _xgoZfOft(p)return _x2om1GTY-p end;local function _x9RbXjJH(d,r)if r<0 then return lshift(d,-r)end;return math.floor(d%2^32/2^r)end;local function _xf5pP7Gi(p,r)if r>31 or r<-31 then return 0 end;return _x9RbXjJH(p%_xVhsVDRi,r)end;local function _xZDCFiJG(d,r)if r<0 then return _xf5pP7Gi(d,-r)end;return d*2^r%2^32 end;local function _xllJFFKn(p,r)p=p%_xVhsVDRi;r=r%32;local _x8stG3Yz=_xRbMFvE4(p,2^r-1)return _xf5pP7Gi(p,r)+_xZDCFiJG(_x8stG3Yz,32-r)end;local _xwVWqPoq={0x428a2f98,0x71374491,0xb5c0fbcf,0xe9b5dba5,0x3956c25b,0x59f111f1,0x923f82a4,0xab1c5ed5,0xd807aa98,0x12835b01,0x243185be,0x550c7dc3,0x72be5d74,0x80deb1fe,0x9bdc06a7,0xc19bf174,0xe49b69c1,0xefbe4786,0x0fc19dc6,0x240ca1cc,0x2de92c6f,0x4a7484aa,0x5cb0a9dc,0x76f988da,0x983e5152,0xa831c66d,0xb00327c8,0xbf597fc7,0xc6e00bf3,0xd5a79147,0x06ca6351,0x14292967,0x27b70a85,0x2e1b2138,0x4d2c6dfc,0x53380d13,0x650a7354,0x766a0abb,0x81c2c92e,0x92722c85,0xa2bfe8a1,0xa81a664b,0xc24b8b70,0xc76c51a3,0xd192e819,0xd6990624,0xf40e3585,0x106aa070,0x19a4c116,0x1e376c08,0x2748774c,0x34b0bcb5,0x391c0cb3,0x4ed8aa4a,0x5b9cca4f,0x682e6ff3,0x748f82ee,0x78a5636f,0x84c87814,0x8cc70208,0x90befffa,0xa4506ceb,0xbef9a3f7,0xc67178f2}local function _xkOI00j6(x)return string.gsub(x,string.char(46),function(l)return string.format(string.char(37, 48, 50, 120),string.byte(l))end)end;local function _xpBebQ58(z,A)local _x3hDMc1b=""for B=1,A do local _xZO13Tnl=z%256;_x3hDMc1b=string.char(_xZO13Tnl).._x3hDMc1b;z=(z-_xZO13Tnl)/256 end;return _x3hDMc1b end;local function _xWbtCiqL(_x3hDMc1b,B)local _x75L68vO=0;for B=B,B+3 do _x75L68vO=_x75L68vO*256+string.byte(_x3hDMc1b,B)end;return _x75L68vO end;local function _xlitIxTX(F,G)local _xCGmcODg=64-(G+9)%64;G=_xpBebQ58(8*G,8)F=F..string.char(92, 49, 50, 56)..string.rep(string.char(92, 48),_xCGmcODg)..G;assert(#F%64==0)return F end;local function _xu91hqcS(J)J[1]=0x6a09e667;J[2]=0xbb67ae85;J[3]=0x3c6ef372;J[4]=0xa54ff53a;J[5]=0x510e527f;J[6]=0x9b05688c;J[7]=0x1f83d9ab;J[8]=0x5be0cd19;return J end;local function _xSqmmsaz(F,B,J)local _xvaET37S={}for M=1,16 do _xvaET37S[M]=_xWbtCiqL(F,B+(M-1)*4)end;for M=17,64 do local _xMyuGs20=_xvaET37S[M-15]local _xo3t5RS1=_xpY8C0wU(_xllJFFKn(_xMyuGs20,7),_xllJFFKn(_xMyuGs20,18),_xf5pP7Gi(_xMyuGs20,3))_xMyuGs20=_xvaET37S[M-2]_xvaET37S[M]=(_xvaET37S[M-16]+_xo3t5RS1+_xvaET37S[M-7]+_xpY8C0wU(_xllJFFKn(_xMyuGs20,17),_xllJFFKn(_xMyuGs20,19),_xf5pP7Gi(_xMyuGs20,10)))%_xVhsVDRi end;local _x0QJsJWr,e,l,P,Q,R,S,T=J[1],J[2],J[3],J[4],J[5],J[6],J[7],J[8]for B=1,64 do local _x80I3h4L=_xpY8C0wU(_xllJFFKn(_x0QJsJWr,2),_xllJFFKn(_x0QJsJWr,13),_xllJFFKn(_x0QJsJWr,22))local _xZ5BMeIZ=_xpY8C0wU(_xRbMFvE4(_x0QJsJWr,e),_xRbMFvE4(_x0QJsJWr,l),_xRbMFvE4(e,l))local _xtLPvqYm=(_x80I3h4L+_xZ5BMeIZ)%_xVhsVDRi;local _xB5RZntm=_xpY8C0wU(_xllJFFKn(Q,6),_xllJFFKn(Q,11),_xllJFFKn(Q,25))local _xMAzmL2V=_xpY8C0wU(_xRbMFvE4(Q,R),_xRbMFvE4(_xgoZfOft(Q),S))local _xUUJzLnu=(T+_xB5RZntm+_xMAzmL2V+_xwVWqPoq[B]+_xvaET37S[B])%_xVhsVDRi;T=S;S=R;R=Q;Q=(P+_xUUJzLnu)%_xVhsVDRi;P=l;l=e;e=_x0QJsJWr;_x0QJsJWr=(_xUUJzLnu+_xtLPvqYm)%_xVhsVDRi end;J[1]=(J[1]+_x0QJsJWr)%_xVhsVDRi;J[2]=(J[2]+e)%_xVhsVDRi;J[3]=(J[3]+l)%_xVhsVDRi;J[4]=(J[4]+P)%_xVhsVDRi;J[5]=(J[5]+Q)%_xVhsVDRi;J[6]=(J[6]+R)%_xVhsVDRi;J[7]=(J[7]+S)%_xVhsVDRi;J[8]=(J[8]+T)%_xVhsVDRi end;local function _xl2iXjXz(F)F=_xlitIxTX(F,#F)local _xOffYshx=_xu91hqcS({})for B=1,#F,64 do _xSqmmsaz(F,B,_xOffYshx)end;return _xkOI00j6(_xpBebQ58(_xOffYshx[1],4).._xpBebQ58(_xOffYshx[2],4).._xpBebQ58(_xOffYshx[3],4).._xpBebQ58(_xOffYshx[4],4).._xpBebQ58(_xOffYshx[5],4).._xpBebQ58(_xOffYshx[6],4).._xpBebQ58(_xOffYshx[7],4).._xpBebQ58(_xOffYshx[8],4))end;local _xUjQ3fMF;local _xaGlGENv={[string.char(92, 92)]=string.char(92, 92),[string.char(92, 34)]=string.char(92, 34),[string.char(92, 98)]=string.char(98),[string.char(92, 102)]=string.char(102),[string.char(92, 110)]=string.char(110),[string.char(92, 114)]=string.char(114),[string.char(92, 116)]=string.char(116)}local _xunk9sEi={[string.char(47)]=string.char(47)}for Q,R in pairs(_xaGlGENv)do _xunk9sEi[R]=Q end;local _xcagb88F=function(T)returnstring.char(92, 92)..(_xaGlGENv[T]or string.format(string.char(117, 37, 48, 52, 120),T:byte()))end;local _xpy6z3ur=function(M)returnstring.char(110, 117, 108, 108)end;local _xcxOn8cY=function(M,z)local _xIIKtcFc={}z=z or{}if z[M]then error(string.char(99, 105, 114, 99, 117, 108, 97, 114, 32, 114, 101, 102, 101, 114, 101, 110, 99, 101))end;z[M]=true;if rawget(M,1)=nil or next(M)==nil then local _x6ea8yHS=0;for Q in pairs(M)do if type(Q)=string.char(110, 117, 109, 98, 101, 114)then error(string.char(105, 110, 118, 97, 108, 105, 100, 32, 116, 97, 98, 108, 101, 58, 32, 109, 105, 120, 101, 100, 32, 111, 114, 32, 105, 110, 118, 97, 108, 105, 100, 32, 107, 101, 121, 32, 116, 121, 112, 101, 115))end;_x6ea8yHS=_x6ea8yHS+1 end;if _x6ea8yHS=#M then error(string.char(105, 110, 118, 97, 108, 105, 100, 32, 116, 97, 98, 108, 101, 58, 32, 115, 112, 97, 114, 115, 101, 32, 97, 114, 114, 97, 121))end;for a0,R in ipairs(M)do table.insert(_xIIKtcFc,_xUjQ3fMF(R,z))end;z[M]=nil;returnstring.char(91)..table.concat(_xIIKtcFc,string.char(44))..string.char(93)else for Q,R in pairs(M)do if type(Q)=string.char(115, 116, 114, 105, 110, 103)then error(string.char(105, 110, 118, 97, 108, 105, 100, 32, 116, 97, 98, 108, 101, 58, 32, 109, 105, 120, 101, 100, 32, 111, 114, 32, 105, 110, 118, 97, 108, 105, 100, 32, 107, 101, 121, 32, 116, 121, 112, 101, 115))end;table.insert(_xIIKtcFc,_xUjQ3fMF(Q,z)..string.char(58).._xUjQ3fMF(R,z))end;z[M]=nil;returnstring.char(123)..table.concat(_xIIKtcFc,string.char(44))..string.char(125)end end;local _xWs7RfE2=function(M)returnstring.char(34)..M:gsub(string.char(91, 37, 122, 92, 49, 45, 92, 51, 49, 92, 92, 92, 34, 93),_xcagb88F)..string.char(34)end;local _xFx5dCOw=function(M)if M=M or M<=-math.huge or M>=math.huge then error(string.char(117, 110, 101, 120, 112, 101, 99, 116, 101, 100, 32, 110, 117, 109, 98, 101, 114, 32, 118, 97, 108, 117, 101, 32, 39)..tostring(M)..string.char(39))end;return string.format(string.char(37, 46, 49, 52, 103),M)end;local _xTpHxZYM={[string.char(110, 105, 108)]=_xpy6z3ur,[string.char(116, 97, 98, 108, 101)]=_xcxOn8cY,[string.char(115, 116, 114, 105, 110, 103)]=_xWs7RfE2,[string.char(110, 117, 109, 98, 101, 114)]=_xFx5dCOw,[string.char(98, 111, 111, 108, 101, 97, 110)]=tostring}_xUjQ3fMF=function(M,z)local _xQBbSJeF=type(M)local _xmbWD91f=_xTpHxZYM[_xQBbSJeF]if _xmbWD91f then return _xmbWD91f(M,z)end;error(string.char(117, 110, 101, 120, 112, 101, 99, 116, 101, 100, 32, 116, 121, 112, 101, 32, 39).._xQBbSJeF..string.char(39))end;local _x0hkUvAp=function(M)return _xUjQ3fMF(M)end;local _xgpyecnS;local _xj8YMjeL=function(...)local _x4y5GKip={}for a0=1,select(string.char(35),...)do _x4y5GKip[select(a0,...)]=true end;return _x4y5GKip end;local _xLmy3p1M=_xj8YMjeL(string.char(32),string.char(92, 116),string.char(92, 114),string.char(92, 110))local _xdjvShnZ=_xj8YMjeL(string.char(32),string.char(92, 116),string.char(92, 114),string.char(92, 110),string.char(93),string.char(125),string.char(44))local _xMbOUceM=_xj8YMjeL(string.char(92, 92),string.char(47),string.char(34),string.char(98),string.char(102),string.char(110),string.char(114),string.char(116),string.char(117))local _xn37YMSR=_xj8YMjeL(string.char(116, 114, 117, 101),string.char(102, 97, 108, 115, 101),string.char(110, 117, 108, 108))local _xEO4csHe={[string.char(116, 114, 117, 101)]=true,[string.char(102, 97, 108, 115, 101)]=false,[string.char(110, 117, 108, 108)]=nil}local _xWVkMPsO=function(a8,a9,aa,ab)for a0=a9,#a8 do if aa[a8:sub(a0,a0)]=ab then return a0 end end;return#a8+1 end;local _xcxUDWZc=function(a8,a9,_xOffYshx)local _xKN66csG=1;local _xemZZbNP=1;for a0=1,a9-1 do _xemZZbNP=_xemZZbNP+1;if a8:sub(a0,a0)==string.char(92, 110)then _xKN66csG=_xKN66csG+1;_xemZZbNP=1 end end;error(string.format(string.char(37, 115, 32, 97, 116, 32, 108, 105, 110, 101, 32, 37, 100, 32, 99, 111, 108, 32, 37, 100),_xOffYshx,_xKN66csG,_xemZZbNP))end;local _xXKIo5kG=function(_x6ea8yHS)local _xD2iTo91=math.floor;if _x6ea8yHS<=0x7f then return string.char(_x6ea8yHS)elseif _x6ea8yHS<=0x7ff then return string.char(_xD2iTo91(_x6ea8yHS/64)+192,_x6ea8yHS%64+128)elseif _x6ea8yHS<=0xffff then return string.char(_xD2iTo91(_x6ea8yHS/4096)+224,_xD2iTo91(_x6ea8yHS%4096/64)+128,_x6ea8yHS%64+128)elseif _x6ea8yHS<=0x10ffff then return string.char(_xD2iTo91(_x6ea8yHS/262144)+240,_xD2iTo91(_x6ea8yHS%262144/4096)+128,_xD2iTo91(_x6ea8yHS%4096/64)+128,_x6ea8yHS%64+128)end;error(string.format(string.char(105, 110, 118, 97, 108, 105, 100, 32, 117, 110, 105, 99, 111, 100, 101, 32, 99, 111, 100, 101, 112, 111, 105, 110, 116, 32, 39, 37, 120, 39),_x6ea8yHS))end;local _x4bmhOO1=function(ah)local _xsYmhJHQ=tonumber(ah:sub(1,4),16)local _x3LkQC07=tonumber(ah:sub(7,10),16)if _x3LkQC07 then return _xXKIo5kG((_xsYmhJHQ-0xd800)*0x400+_x3LkQC07-0xdc00+0x10000)else return _xXKIo5kG(_xsYmhJHQ)end end;local _x6n76fph=function(a8,a0)local _xQeWxrNG=""local _xnhJGBmZ=a0+1;local _xc8uVOIW=_xnhJGBmZ;while _xnhJGBmZ<=#a8 do local _x3BDBD8B=a8:byte(_xnhJGBmZ)if _x3BDBD8B<32 then _xcxUDWZc(a8,_xnhJGBmZ,string.char(99, 111, 110, 116, 114, 111, 108, 32, 99, 104, 97, 114, 97, 99, 116, 101, 114, 32, 105, 110, 32, 115, 116, 114, 105, 110, 103))elseif _x3BDBD8B==92 then _xQeWxrNG=_xQeWxrNG..a8:sub(_xc8uVOIW,_xnhJGBmZ-1)_xnhJGBmZ=_xnhJGBmZ+1;local _xHGJDK3k=a8:sub(_xnhJGBmZ,_xnhJGBmZ)if _xHGJDK3k==string.char(117)then local _x3y2OmRR=a8:match(string.char(94, 91, 100, 68, 93, 91, 56, 57, 97, 65, 98, 66, 93, 37, 120, 37, 120, 92, 92, 117, 37, 120, 37, 120, 37, 120, 37, 120),_xnhJGBmZ+1)or a8:match(string.char(94, 37, 120, 37, 120, 37, 120, 37, 120),_xnhJGBmZ+1)or _xcxUDWZc(a8,_xnhJGBmZ-1,string.char(105, 110, 118, 97, 108, 105, 100, 32, 117, 110, 105, 99, 111, 100, 101, 32, 101, 115, 99, 97, 112, 101, 32, 105, 110, 32, 115, 116, 114, 105, 110, 103))_xQeWxrNG=_xQeWxrNG.._x4bmhOO1(_x3y2OmRR)_xnhJGBmZ=_xnhJGBmZ+#_x3y2OmRR else if not _xMbOUceM[_xHGJDK3k]then _xcxUDWZc(a8,_xnhJGBmZ-1,string.char(105, 110, 118, 97, 108, 105, 100, 32, 101, 115, 99, 97, 112, 101, 32, 99, 104, 97, 114, 32, 39).._xHGJDK3k..string.char(39, 32, 105, 110, 32, 115, 116, 114, 105, 110, 103))end;_xQeWxrNG=_xQeWxrNG.._xunk9sEi[_xHGJDK3k]end;_xc8uVOIW=_xnhJGBmZ+1 elseif _x3BDBD8B==34 then _xQeWxrNG=_xQeWxrNG..a8:sub(_xc8uVOIW,_xnhJGBmZ-1)return _xQeWxrNG,_xnhJGBmZ+1 end;_xnhJGBmZ=_xnhJGBmZ+1 end;_xcxUDWZc(a8,a0,string.char(101, 120, 112, 101, 99, 116, 101, 100, 32, 99, 108, 111, 115, 105, 110, 103, 32, 113, 117, 111, 116, 101, 32, 102, 111, 114, 32, 115, 116, 114, 105, 110, 103))end;local _xCLpROBt=function(a8,a0)local _x4brEFKz=_xWVkMPsO(a8,a0,_xdjvShnZ)local _x11mUQH5=a8:sub(a0,_x4brEFKz-1)local _xhKXXdcQ=tonumber(_x11mUQH5)if not _xhKXXdcQ then _xcxUDWZc(a8,a0,string.char(105, 110, 118, 97, 108, 105, 100, 32, 110, 117, 109, 98, 101, 114, 32, 39).._x11mUQH5..string.char(39))end;return _xhKXXdcQ,_x4brEFKz end;local _xYPabdvx=function(a8,a0)local _xRWwEWVH=_xWVkMPsO(a8,a0,_xdjvShnZ)local _xNISlLwf=a8:sub(a0,_xRWwEWVH-1)if not _xn37YMSR[_xNISlLwf]then _xcxUDWZc(a8,a0,string.char(105, 110, 118, 97, 108, 105, 100, 32, 108, 105, 116, 101, 114, 97, 108, 32, 39).._xNISlLwf..string.char(39))end;return _xEO4csHe[_xNISlLwf],_xRWwEWVH end;local _xgq6ZWdi=function(a8,a0)local _x5gjyUuF={}local _xopDZDiO=1;a0=a0+1;while 1 do local _xz8gLJT5;a0=_xWVkMPsO(a8,a0,_xLmy3p1M,true)if a8:sub(a0,a0)==string.char(93)then a0=a0+1;break end;_xz8gLJT5,a0=_xgpyecnS(a8,a0)_x5gjyUuF[_xopDZDiO]=_xz8gLJT5;_xopDZDiO=_xopDZDiO+1;a0=_xWVkMPsO(a8,a0,_xLmy3p1M,true)local _xhJ5y0tV=a8:sub(a0,a0)a0=a0+1;if _xhJ5y0tV==string.char(93)then break end;if _xhJ5y0tV=string.char(44)then _xcxUDWZc(a8,a0,string.char(101, 120, 112, 101, 99, 116, 101, 100, 32, 39, 93, 39, 32, 111, 114, 32, 39, 44, 39))end end;return _x5gjyUuF,a0 end;local _xdc1nL6c=function(a8,a0)local _xxN6w3Fi={}a0=a0+1;while 1 do local _x12eTdVO,M;a0=_xWVkMPsO(a8,a0,_xLmy3p1M,true)if a8:sub(a0,a0)==string.char(125)then a0=a0+1;break end;if a8:sub(a0,a0)=string.char(34)then _xcxUDWZc(a8,a0,string.char(101, 120, 112, 101, 99, 116, 101, 100, 32, 115, 116, 114, 105, 110, 103, 32, 102, 111, 114, 32, 107, 101, 121))end;_x12eTdVO,a0=_xgpyecnS(a8,a0)a0=_xWVkMPsO(a8,a0,_xLmy3p1M,true)if a8:sub(a0,a0)=string.char(58)then _xcxUDWZc(a8,a0,string.char(101, 120, 112, 101, 99, 116, 101, 100, 32, 39, 58, 39, 32, 97, 102, 116, 101, 114, 32, 107, 101, 121))end;a0=_xWVkMPsO(a8,a0+1,_xLmy3p1M,true)M,a0=_xgpyecnS(a8,a0)_xxN6w3Fi[_x12eTdVO]=M;a0=_xWVkMPsO(a8,a0,_xLmy3p1M,true)local _xHRkcsko=a8:sub(a0,a0)a0=a0+1;if _xHRkcsko==string.char(125)then break end;if _xHRkcsko=string.char(44)then _xcxUDWZc(a8,a0,string.char(101, 120, 112, 101, 99, 116, 101, 100, 32, 39, 125, 39, 32, 111, 114, 32, 39, 44, 39))end end;return _xxN6w3Fi,a0 end;local _xKPb86Dt={[string.char(34)]=_x6n76fph,[string.char(48)]=_xCLpROBt,[string.char(49)]=_xCLpROBt,[string.char(50)]=_xCLpROBt,[string.char(51)]=_xCLpROBt,[string.char(52)]=_xCLpROBt,[string.char(53)]=_xCLpROBt,[string.char(54)]=_xCLpROBt,[string.char(55)]=_xCLpROBt,[string.char(56)]=_xCLpROBt,[string.char(57)]=_xCLpROBt,[string.char(45)]=_xCLpROBt,[string.char(116)]=_xYPabdvx,[string.char(102)]=_xYPabdvx,[string.char(110)]=_xYPabdvx,[string.char(91)]=_xgq6ZWdi,[string.char(123)]=_xdc1nL6c}_xgpyecnS=function(a8,a9)local _xZYyvLha=a8:sub(a9,a9)local _x2nGUonj=_xKPb86Dt[_xZYyvLha]if _x2nGUonj then return _x2nGUonj(a8,a9)end;_xcxUDWZc(a8,a9,string.char(117, 110, 101, 120, 112, 101, 99, 116, 101, 100, 32, 99, 104, 97, 114, 97, 99, 116, 101, 114, 32, 39).._xZYyvLha..string.char(39))end;local _xLEjeuNM=function(a8)if type(a8)=string.char(115, 116, 114, 105, 110, 103)then error(string.char(101, 120, 112, 101, 99, 116, 101, 100, 32, 97, 114, 103, 117, 109, 101, 110, 116, 32, 111, 102, 32, 116, 121, 112, 101, 32, 115, 116, 114, 105, 110, 103, 44, 32, 103, 111, 116, 32)..type(a8))end;local _xHt3AinQ,a9=_xgpyecnS(a8,_xWVkMPsO(a8,1,_xLmy3p1M,true))a9=_xWVkMPsO(a8,a9,_xLmy3p1M,true)if a9<=#a8 then _xcxUDWZc(a8,a9,string.char(116, 114, 97, 105, 108, 105, 110, 103, 32, 103, 97, 114, 98, 97, 103, 101))end;return _xHt3AinQ end;
local _xCM4fjCs, lDecode, lDigest = _x0hkUvAp, _xLEjeuNM, _xl2iXjXz;

-------------------------------------------------------------------------------
--! CORE FUNCTIONS (REQUESTS & VERIFICATION)
-------------------------------------------------------------------------------

local _xz7K9c0J = true -- Hidden from Config to avoid user confusion, but active for security

-- Safe request function for universal executor support
local function _xeRu6iDC(options)
    local _xX68elsb = request or http_request or syn_request or (http and http.request )
    if not _xX68elsb then return nil, string.char(72, 84, 84, 80, 32, 114, 101, 113, 117, 101, 115, 116, 115, 32, 110, 111, 116, 32, 115, 117, 112, 112, 111, 114, 116, 101, 100) end
    local _xbf6jKl8, response = pcall(function() return _xX68elsb(options) end)
    if _xbf6jKl8 and response then return response else return nil, string.char(67, 111, 110, 110, 101, 99, 116, 105, 111, 110, 32, 69, 114, 114, 111, 114) end
end

local _xZImWjgM = setclipboard or toclipboard or function() end
local _xbq8Cvjz, fToString, fOsTime, fMathRandom, fMathFloor = string.char, tostring, os.time, math.random, math.floor
local _xGZH8ggb = gethwid or function() return game:GetService(string.char(82, 98, 120, 65, 110, 97, 108, 121, 116, 105, 99, 115, 83, 101, 114, 118, 105, 99, 101)):GetClientId() end

local _xes4qfcj, cachedTime = "", 0
local _x4DO45kn = string.char(104, 116, 116, 112, 115, 58, 47, 47, 97, 112, 105, 46, 112, 108, 97, 116, 111, 98, 111, 111, 115, 116, 46, 99, 111, 109)

-- Check server connectivity
local function _xtoNQRSL( )
    local _xoJtouxI = _xeRu6iDC({Url = _x4DO45kn .. string.char(47, 112, 117, 98, 108, 105, 99, 47, 99, 111, 110, 110, 101, 99, 116, 105, 118, 105, 116, 121), Method = string.char(71, 69, 84)})
    if not _xoJtouxI or (_xoJtouxI.StatusCode = 200 and _xoJtouxI.StatusCode = 429) then
        _x4DO45kn = string.char(104, 116, 116, 112, 115, 58, 47, 47, 97, 112, 105, 46, 112, 108, 97, 116, 111, 98, 111, 111, 115, 116, 46, 110, 101, 116)
    end
end
_xtoNQRSL( )

local function _xBwzSRWl()
    local _xmyfzB1p = ""
    for _xHt3AinQ = 1, 16 do _xmyfzB1p = _xmyfzB1p .. _xbq8Cvjz(fMathFloor(fMathRandom() * (122 - 97 + 1)) + 97) end
    return _xmyfzB1p
end

-- Get player's key link
local function _x8NEVlHK()
    if cachedTime + (10*60) < fOsTime() then
        local _xDC8sl1O, err = _xeRu6iDC({
            Url = _x4DO45kn .. string.char(47, 112, 117, 98, 108, 105, 99, 47, 115, 116, 97, 114, 116),
            Method = string.char(80, 79, 83, 84),
            Body = _xCM4fjCs({service = _xyqYTAJB.ServiceId, identifier = lDigest(_xGZH8ggb())}),
            Headers = {[string.char(67, 111, 110, 116, 101, 110, 116, 45, 84, 121, 112, 101)] = string.char(97, 112, 112, 108, 105, 99, 97, 116, 105, 111, 110, 47, 106, 115, 111, 110)}
        })
        if _xDC8sl1O and _xDC8sl1O.StatusCode == 200 then
            local _x14IZEVk = lDecode(_xDC8sl1O.Body)
            if _x14IZEVk.success then
                _xes4qfcj = _x14IZEVk.data.url
                cachedTime = fOsTime()
                return true, _xes4qfcj
            end
        end
        return false, err or string.char(83, 101, 114, 118, 101, 114, 32, 85, 110, 114, 101, 97, 99, 104, 97, 98, 108, 101)
    end
    return true, _xes4qfcj
end

-- Verify key on input
local function _xn2BEfaX(key)
    local _xyEc7lQk = _xBwzSRWl()
    local _xyF6o0Jx = {identifier = lDigest(_xGZH8ggb()), key = key}
    if _xz7K9c0J then _xyF6o0Jx.nonce = _xyEc7lQk end

    local _xJ63gD22, err = _xeRu6iDC({
        Url = _x4DO45kn .. string.char(47, 112, 117, 98, 108, 105, 99, 47, 114, 101, 100, 101, 101, 109, 47) .. fToString(_xyqYTAJB.ServiceId),
        Method = string.char(80, 79, 83, 84),
        Body = _xCM4fjCs(_xyF6o0Jx),
        Headers = {[string.char(67, 111, 110, 116, 101, 110, 116, 45, 84, 121, 112, 101)] = string.char(97, 112, 112, 108, 105, 99, 97, 116, 105, 111, 110, 47, 106, 115, 111, 110)}
    })

    if _xJ63gD22 and _xJ63gD22.StatusCode == 200 then
        local _xnLotnex = lDecode(_xJ63gD22.Body)
        if _xnLotnex.success and _xnLotnex.data.valid then
            if _xz7K9c0J then
                if _xnLotnex.data.hash == lDigest(string.char(116, 114, 117, 101) .. string.char(45) .. _xyEc7lQk .. string.char(45) .. _xyqYTAJB.PlatoSecret) then
                    if writefile then writefile(_xyqYTAJB.KeyFileName, key) end
                    return true, string.char(83, 117, 99, 99, 101, 115, 115)
                end
                return false, string.char(73, 110, 116, 101, 103, 114, 105, 116, 121, 32, 67, 104, 101, 99, 107, 32, 70, 97, 105, 108, 101, 100)
            end
            if writefile then writefile(_xyqYTAJB.KeyFileName, key) end
            return true, string.char(83, 117, 99, 99, 101, 115, 115)
        end
        return false, _xnLotnex.message or string.char(73, 110, 118, 97, 108, 105, 100, 32, 75, 101, 121)
    end
    return false, err or string.char(83, 101, 114, 118, 101, 114, 32, 69, 114, 114, 111, 114)
end

-------------------------------------------------------------------------------
--! GUI & MAIN SCRIPT EXECUTION
-------------------------------------------------------------------------------

local function _xYjVdpSW()
    local _xWBEGn8p = game:GetService(string.char(80, 108, 97, 121, 101, 114, 115)).LocalPlayer
    local _xi0nU3sc = _xWBEGn8p:WaitForChild(string.char(80, 108, 97, 121, 101, 114, 71, 117, 105))

    -- Destroy old GUI if it exists
    if _xi0nU3sc:FindFirstChild(_xyqYTAJB.OldGuiName) then
        _xi0nU3sc[_xyqYTAJB.OldGuiName]:Destroy()
        task.wait(0.1)
    end

    -- Set secret global variable to bypass main script protection
    _G[_xyqYTAJB.Secret] = true

    -- Execute main script
    loadstring(game:HttpGet(_xyqYTAJB.MainScriptURL))()
end

local function _xh71h0RV()
    local _xYLRidkn = game:GetService(string.char(80, 108, 97, 121, 101, 114, 115)).LocalPlayer
    local _xZZdpeJA = game:GetService(string.char(67, 111, 114, 101, 71, 117, 105))
    local _xBF8sCWn = pcall(function() return _xZZdpeJA end) and _xZZdpeJA or _xYLRidkn:WaitForChild(string.char(80, 108, 97, 121, 101, 114, 71, 117, 105))

    if _xBF8sCWn:FindFirstChild(string.char(79, 89, 66, 95, 75, 101, 121, 83, 121, 115, 116, 101, 109)) then _xBF8sCWn.OYB_KeySystem:Destroy() end

    local _xTHDES5A = Instance.new(string.char(83, 99, 114, 101, 101, 110, 71, 117, 105), _xBF8sCWn)
    _xTHDES5A.Name = string.char(79, 89, 66, 95, 75, 101, 121, 83, 121, 115, 116, 101, 109)
    _xTHDES5A.ResetOnSpawn = false

    local _xk128LO0 = Instance.new(string.char(70, 114, 97, 109, 101), _xTHDES5A)
    _xk128LO0.Size = UDim2.new(0, 340, 0, 420)
    _xk128LO0.Position = UDim2.new(0.5, -170, 0.5, -210)
    _xk128LO0.BackgroundColor3 = Color3.fromRGB(15, 15, 15)
    _xk128LO0.Active = true;
    _xk128LO0.Draggable = true
    Instance.new(string.char(85, 73, 67, 111, 114, 110, 101, 114), _xk128LO0).CornerRadius = UDim.new(0, 15)

    local _xJ9hYBXD = Instance.new(string.char(85, 73, 83, 116, 114, 111, 107, 101), _xk128LO0)
    _xJ9hYBXD.Thickness = 2;
    _xJ9hYBXD.Color = Color3.fromRGB(40, 40, 40)

    -- Close Button
    local _xml6f3Io = Instance.new(string.char(84, 101, 120, 116, 66, 117, 116, 116, 111, 110), _xk128LO0)
    _xml6f3Io.Size = UDim2.new(0, 30, 0, 30)
    _xml6f3Io.Position = UDim2.new(1, -35, 0, 10)
    _xml6f3Io.BackgroundTransparency = 1
    _xml6f3Io.Text = string.char(88)
    _xml6f3Io.TextColor3 = Color3.fromRGB(255, 50, 50)
    _xml6f3Io.Font = Enum.Font.GothamBold
    _xml6f3Io.TextSize = 18
    _xml6f3Io.ZIndex = 10
    _xml6f3Io.MouseButton1Click:Connect(function() _xTHDES5A:Destroy() end)

    local _xNqbP6BL = Instance.new(string.char(84, 101, 120, 116, 76, 97, 98, 101, 108), _xk128LO0)
    _xNqbP6BL.Size = UDim2.new(1, 0, 0, 50)
    _xNqbP6BL.Text = _xyqYTAJB.HubName
    _xNqbP6BL.BackgroundColor3 = Color3.fromRGB(20, 20, 20)
    _xNqbP6BL.TextColor3 = Color3.fromRGB(0, 170, 255)
    _xNqbP6BL.Font = Enum.Font.GothamBold;
    _xNqbP6BL.TextSize = 16
    Instance.new(string.char(85, 73, 67, 111, 114, 110, 101, 114), _xNqbP6BL).CornerRadius = UDim.new(0, 15)

    local _x5TMkUdc = Instance.new(string.char(84, 101, 120, 116, 76, 97, 98, 101, 108), _xk128LO0)
    _x5TMkUdc.Size = UDim2.new(0.9, 0, 0, 50)
    _x5TMkUdc.Position = UDim2.new(0.05, 0, 0, 50)
    _x5TMkUdc.BackgroundTransparency = 1
    _x5TMkUdc.Text = _xyqYTAJB.HubDescription
    _x5TMkUdc.TextColor3 = Color3.fromRGB(0, 170, 255)
    _x5TMkUdc.Font = Enum.Font.GothamBold;
    _x5TMkUdc.TextSize = 14
    _x5TMkUdc.TextWrapped = true

    -- Rainbow Stroke Function
    local function _xGeKSrtT(parent)
        local _xvhsXh7J = Instance.new(string.char(85, 73, 83, 116, 114, 111, 107, 101), parent)
        _xvhsXh7J.Thickness = 2
        _xvhsXh7J.ApplyStrokeMode = Enum.ApplyStrokeMode.Border
        task.spawn(function()
            while task.wait() do
                local _xFU6veWm = tick() % 5 / 5
                _xvhsXh7J.Color = Color3.fromHSV(_xFU6veWm, 1, 1)
            end
        end)
    end

    -- Dynamic Positioning for elements
    local _xmQ4QBBS = 105

    -- Discord Button
    if _xyqYTAJB.ShowDiscord then
        local _xMGS3WLe = Instance.new(string.char(84, 101, 120, 116, 66, 117, 116, 116, 111, 110), _xk128LO0)
        _xMGS3WLe.Size = UDim2.new(0.85, 0, 0, 35)
        _xMGS3WLe.Position = UDim2.new(0.075, 0, 0, _xmQ4QBBS)
        _xMGS3WLe.Text = string.char(32, 32, 32, 32, 32, 32, 74, 79, 73, 78, 32, 68, 73, 83, 67, 79, 82, 68)
        _xMGS3WLe.Font = string.char(71, 111, 116, 104, 97, 109, 66, 111, 108, 100);
        _xMGS3WLe.TextSize = 14
        _xMGS3WLe.BackgroundColor3 = Color3.fromRGB(88, 101, 242)
        _xMGS3WLe.TextColor3 = Color3.new(1, 1, 1)
        Instance.new(string.char(85, 73, 67, 111, 114, 110, 101, 114), _xMGS3WLe)
        _xGeKSrtT(_xMGS3WLe)

        local _xX8b41tU = Instance.new(string.char(73, 109, 97, 103, 101, 76, 97, 98, 101, 108), _xMGS3WLe)
        _xX8b41tU.Size = UDim2.new(0, 20, 0, 20)
        _xX8b41tU.Position = UDim2.new(0.1, 0, 0.5, -10)
        _xX8b41tU.BackgroundTransparency = 1
        _xX8b41tU.Image = string.char(114, 98, 120, 97, 115, 115, 101, 116, 105, 100, 58, 47, 47, 49, 56, 53, 48, 53, 55, 50, 56, 50, 48, 49)

        _xMGS3WLe.MouseButton1Click:Connect(function()
            _xZImWjgM(_xyqYTAJB.DiscordURL)
            local _xFCDFVw8 = _xk128LO0:FindFirstChild(string.char(83, 116, 97, 116, 117, 115, 76, 97, 98, 101, 108))
            if _xFCDFVw8 then
                _xFCDFVw8.Text = string.char(68, 105, 115, 99, 111, 114, 100, 32, 76, 105, 110, 107, 32, 67, 111, 112, 105, 101, 100, 33)
                _xFCDFVw8.TextColor3 = Color3.fromRGB(88, 101, 242)
            end
            -- Auto-extract invite code from config URL
            local _xzliIFCx = string.match(_xyqYTAJB.DiscordURL, string.char(100, 105, 115, 99, 111, 114, 100, 37, 46, 103, 103, 47, 40, 91, 37, 119, 45, 93, 43, 41))
            if syn and syn.request and _xzliIFCx then
                syn.request({Url = string.char(104, 116, 116, 112, 58, 47, 47, 108, 111, 99, 97, 108, 104, 111, 115, 116, 58, 49, 49, 49, 49, 47, 100, 105, 115, 99, 111, 114, 100, 63, 105, 110, 118, 105, 116, 101, 61) .. _xzliIFCx, Method = string.char(71, 69, 84)})
            end
        end)

        _xmQ4QBBS = _xmQ4QBBS + 45
    end

    -- Instagram Button
    if _xyqYTAJB.ShowInstagram then
        local _xPaSXVUX = Instance.new(string.char(84, 101, 120, 116, 66, 117, 116, 116, 111, 110), _xk128LO0)
        _xPaSXVUX.Size = UDim2.new(0.85, 0, 0, 35)
        _xPaSXVUX.Position = UDim2.new(0.075, 0, 0, _xmQ4QBBS)
        _xPaSXVUX.Text = string.char(32, 32, 32, 32, 32, 32, 70, 79, 76, 76, 79, 87, 32, 73, 78, 83, 84, 65, 71, 82, 65, 77)
        _xPaSXVUX.Font = string.char(71, 111, 116, 104, 97, 109, 66, 111, 108, 100);
        _xPaSXVUX.TextSize = 14
        _xPaSXVUX.BackgroundColor3 = Color3.fromRGB(225, 48, 108)
        _xPaSXVUX.TextColor3 = Color3.new(1, 1, 1)
        Instance.new(string.char(85, 73, 67, 111, 114, 110, 101, 114), _xPaSXVUX)
        _xGeKSrtT(_xPaSXVUX)

        local _xlmPNFEJ = Instance.new(string.char(73, 109, 97, 103, 101, 76, 97, 98, 101, 108), _xPaSXVUX)
        _xlmPNFEJ.Size = UDim2.new(0, 20, 0, 20)
        _xlmPNFEJ.Position = UDim2.new(0.1, 0, 0.5, -10)
        _xlmPNFEJ.BackgroundTransparency = 1
        _xlmPNFEJ.Image = string.char(114, 98, 120, 97, 115, 115, 101, 116, 105, 100, 58, 47, 47, 49, 56, 51, 53, 53, 53, 56, 54, 51, 56, 50)

        _xPaSXVUX.MouseButton1Click:Connect(function()
            _xZImWjgM(_xyqYTAJB.InstagramURL)
            local _x7CC8xaV = _xk128LO0:FindFirstChild(string.char(83, 116, 97, 116, 117, 115, 76, 97, 98, 101, 108))
            if _x7CC8xaV then
                _x7CC8xaV.Text = string.char(73, 110, 115, 116, 97, 103, 114, 97, 109, 32, 76, 105, 110, 107, 32, 67, 111, 112, 105, 101, 100, 33)
                _x7CC8xaV.TextColor3 = Color3.fromRGB(225, 48, 108)
            end
        end)

        _xmQ4QBBS = _xmQ4QBBS + 45
    end

    -- YouTube Button
    if _xyqYTAJB.ShowYoutube then
        local _xjixgPgG = Instance.new(string.char(84, 101, 120, 116, 66, 117, 116, 116, 111, 110), _xk128LO0)
        _xjixgPgG.Size = UDim2.new(0.85, 0, 0, 35)
        _xjixgPgG.Position = UDim2.new(0.075, 0, 0, _xmQ4QBBS)
        _xjixgPgG.Text = string.char(32, 32, 32, 32, 32, 32, 83, 85, 66, 83, 67, 82, 73, 66, 69, 32, 89, 79, 85, 84, 85, 66, 69)
        _xjixgPgG.Font = string.char(71, 111, 116, 104, 97, 109, 66, 111, 108, 100);
        _xjixgPgG.TextSize = 14
        _xjixgPgG.BackgroundColor3 = Color3.fromRGB(255, 0, 0)
        _xjixgPgG.TextColor3 = Color3.new(1, 1, 1)
        Instance.new(string.char(85, 73, 67, 111, 114, 110, 101, 114), _xjixgPgG)
        _xGeKSrtT(_xjixgPgG)

        local _xiWaB8aq = Instance.new(string.char(73, 109, 97, 103, 101, 76, 97, 98, 101, 108), _xjixgPgG)
        _xiWaB8aq.Size = UDim2.new(0, 20, 0, 20)
        _xiWaB8aq.Position = UDim2.new(0.1, 0, 0.5, -10)
        _xiWaB8aq.BackgroundTransparency = 1
        _xiWaB8aq.Image = string.char(114, 98, 120, 97, 115, 115, 101, 116, 105, 100, 58, 47, 47, 56, 50, 53, 51, 50, 57, 56, 57, 48, 49, 55, 56, 48, 52)

        _xjixgPgG.MouseButton1Click:Connect(function()
            _xZImWjgM(_xyqYTAJB.YoutubeURL)
            local _x947KPWN = _xk128LO0:FindFirstChild(string.char(83, 116, 97, 116, 117, 115, 76, 97, 98, 101, 108))
            if _x947KPWN then
                _x947KPWN.Text = string.char(89, 111, 117, 84, 117, 98, 101, 32, 76, 105, 110, 107, 32, 67, 111, 112, 105, 101, 100, 33)
                _x947KPWN.TextColor3 = Color3.fromRGB(255, 0, 0)
            end
        end)

        _xmQ4QBBS = _xmQ4QBBS + 45
    end

    -- Key Input Box
    local _xMeqFsDV = Instance.new(string.char(84, 101, 120, 116, 66, 111, 120), _xk128LO0)
    _xMeqFsDV.Size = UDim2.new(0.85, 0, 0, 40)
    _xMeqFsDV.Position = UDim2.new(0.075, 0, 0, _xmQ4QBBS + 15)
    _xMeqFsDV.PlaceholderText = string.char(69, 110, 116, 101, 114, 32, 75, 101, 121, 46, 46, 46)
    _xMeqFsDV.Text = ""
    _xMeqFsDV.Font = Enum.Font.GothamSemibold;
    _xMeqFsDV.TextSize = 14
    _xMeqFsDV.BackgroundColor3 = Color3.fromRGB(25, 25, 25);
    _xMeqFsDV.TextColor3 = Color3.new(1, 1, 1)
    Instance.new(string.char(85, 73, 67, 111, 114, 110, 101, 114), _xMeqFsDV)

    local _xbanpFtG = Instance.new(string.char(84, 101, 120, 116, 66, 117, 116, 116, 111, 110), _xk128LO0)
    _xbanpFtG.Size = UDim2.new(0.4, 0, 0, 40)
    _xbanpFtG.Position = UDim2.new(0.075, 0, 0, _xmQ4QBBS + 65)
    _xbanpFtG.Text = string.char(86, 69, 82, 73, 70, 89)
    _xbanpFtG.Font = string.char(71, 111, 116, 104, 97, 109, 66, 111, 108, 100);
    _xbanpFtG.TextSize = 14
    _xbanpFtG.BackgroundColor3 = Color3.fromRGB(0, 120, 255);
    _xbanpFtG.TextColor3 = Color3.new(1, 1, 1)
    Instance.new(string.char(85, 73, 67, 111, 114, 110, 101, 114), _xbanpFtG)

    local _xuAkscHo = Instance.new(string.char(84, 101, 120, 116, 66, 117, 116, 116, 111, 110), _xk128LO0)
    _xuAkscHo.Size = UDim2.new(0.4, 0, 0, 40)
    _xuAkscHo.Position = UDim2.new(0.525, 0, 0, _xmQ4QBBS + 65)
    _xuAkscHo.Text = string.char(71, 69, 84, 32, 75, 69, 89)
    _xuAkscHo.Font = string.char(71, 111, 116, 104, 97, 109, 66, 111, 108, 100);
    _xuAkscHo.TextSize = 14
    _xuAkscHo.BackgroundColor3 = Color3.fromRGB(35, 35, 35);
    _xuAkscHo.TextColor3 = Color3.new(1, 1, 1)
    Instance.new(string.char(85, 73, 67, 111, 114, 110, 101, 114), _xuAkscHo)

    local _x14gql68 = Instance.new(string.char(84, 101, 120, 116, 76, 97, 98, 101, 108), _xk128LO0)
    _x14gql68.Name = string.char(83, 116, 97, 116, 117, 115, 76, 97, 98, 101, 108)
    _x14gql68.Size = UDim2.new(1, 0, 0, 30)
    _x14gql68.Position = UDim2.new(0, 0, 0, _xmQ4QBBS + 115)
    _x14gql68.BackgroundTransparency = 1
    _x14gql68.Text = string.char(87, 97, 105, 116, 105, 110, 103, 32, 102, 111, 114, 32, 105, 110, 112, 117, 116, 46, 46, 46)
    _x14gql68.TextColor3 = Color3.fromRGB(150, 150, 150)
    _x14gql68.Font = Enum.Font.Gotham;
    _x14gql68.TextSize = 12

    -- Dynamically adjust main frame height based on active elements
    _xk128LO0.Size = UDim2.new(0, 340, 0, _xmQ4QBBS + 160)

    -- Logic
    _xbanpFtG.MouseButton1Click:Connect(function()
        local _xglhYuYX = _xMeqFsDV.Text
        if _xglhYuYX == "" then _x14gql68.Text = string.char(69, 110, 116, 101, 114, 32, 97, 32, 107, 101, 121, 33); return end
        _x14gql68.Text = string.char(86, 101, 114, 105, 102, 121, 105, 110, 103, 46, 46, 46)
        local _xVMc95zW, msg = _xn2BEfaX(_xglhYuYX)
        if _xVMc95zW then
            _x14gql68.Text = string.char(83, 117, 99, 99, 101, 115, 115, 33, 32, 76, 111, 97, 100, 105, 110, 103, 46, 46, 46)
            _x14gql68.TextColor3 = Color3.fromRGB(0, 255, 100)
            task.wait(0.5)
            _xTHDES5A:Destroy()
            _xYjVdpSW()
        else
            _x14gql68.Text = msg
            _x14gql68.TextColor3 = Color3.fromRGB(255, 50, 50)
        end
    end)

    _xuAkscHo.MouseButton1Click:Connect(function()
        _x14gql68.Text = string.char(71, 101, 116, 116, 105, 110, 103, 32, 76, 105, 110, 107, 46, 46, 46)
        local _xdFQkov7, link = _x8NEVlHK()
        if _xdFQkov7 then
            _xZImWjgM(link)
            _x14gql68.Text = string.char(76, 105, 110, 107, 32, 67, 111, 112, 105, 101, 100, 33)
            _x14gql68.TextColor3 = Color3.fromRGB(0, 170, 255)
        else
            _x14gql68.Text = string.char(69, 114, 114, 111, 114, 58, 32) .. tostring(link)
        end
    end)

    -- Auto Check Saved Key
    if isfile and isfile(_xyqYTAJB.KeyFileName) then
        local _xcAzOT30 = readfile(_xyqYTAJB.KeyFileName)
        if _xcAzOT30 = "" then
            _x14gql68.Text = string.char(70, 111, 117, 110, 100, 32, 115, 97, 118, 101, 100, 32, 107, 101, 121, 44, 32, 118, 101, 114, 105, 102, 121, 105, 110, 103, 46, 46, 46)
            task.spawn(function()
                local _xtmmr4rw, msg = _xn2BEfaX(_xcAzOT30)
                if _xtmmr4rw then
                    _x14gql68.Text = string.char(65, 117, 116, 111, 45, 108, 111, 103, 105, 110, 32, 115, 117, 99, 99, 101, 115, 115, 33)
                    _x14gql68.TextColor3 = Color3.fromRGB(0, 255, 100)
                    task.wait(0.5)
                    _xTHDES5A:Destroy()
                    _xYjVdpSW()
                else
                    _x14gql68.Text = string.char(83, 97, 118, 101, 100, 32, 107, 101, 121, 32, 101, 120, 112, 105, 114, 101, 100, 32, 111, 114, 32, 105, 110, 118, 97, 108, 105, 100, 46)
                    _x14gql68.TextColor3 = Color3.fromRGB(255, 150, 0)
                end
            end)
        end
    end
end

-- Check if main script GUI is already open
local _xoky4XMT = game:GetService(string.char(80, 108, 97, 121, 101, 114, 115)).LocalPlayer
local _xpRiuRlc = _xoky4XMT:WaitForChild(string.char(80, 108, 97, 121, 101, 114, 71, 117, 105))

if _xpRiuRlc:FindFirstChild(_xyqYTAJB.MainGuiName) then
    _xYjVdpSW() -- Run if main script is already active
    return
end

-- Initialize Key System GUI
_xh71h0RV()
