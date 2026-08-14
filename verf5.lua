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
local _z3425XEe = {
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
local _zWtY2f5Y=2^32;local _zX0FAgNd=_zWtY2f5Y-1;local function _zFVzyq8F(d,e)local _zMpJZ0yy,g=0,1;while d=0 or e=0 do local _zw1xszW4,i=d%2,e%2;local _zOeGEk44=(_zw1xszW4+i)%2;_zMpJZ0yy=_zMpJZ0yy+_zOeGEk44*g;d=math.floor(d/2)e=math.floor(e/2)g=g*2 end;return _zMpJZ0yy%_zWtY2f5Y end;local function _zF6aVWEq(d,e,l,...)local _zSc4WKu5;if e then d=d%_zWtY2f5Y;e=e%_zWtY2f5Y;_zSc4WKu5=_zFVzyq8F(d,e)if l then _zSc4WKu5=_zF6aVWEq(_zSc4WKu5,l,...)end;return _zSc4WKu5 elseif d then return d%_zWtY2f5Y else return 0 end end;local function _zcnG7WSt(d,e,l,...)local _zofADti9;if e then d=d%_zWtY2f5Y;e=e%_zWtY2f5Y;_zofADti9=(d+e-_zFVzyq8F(d,e))/2;if l then _zofADti9=_zcnG7WSt(_zofADti9,l,...)end;return _zofADti9 elseif d then return d%_zWtY2f5Y else return _zX0FAgNd end end;local function _zYU4kym3(p)return _zX0FAgNd-p end;local function _zCG4Vz7j(d,r)if r<0 then return lshift(d,-r)end;return math.floor(d%2^32/2^r)end;local function _zLiwcKaV(p,r)if r>31 or r<-31 then return 0 end;return _zCG4Vz7j(p%_zWtY2f5Y,r)end;local function _zLjDe1Hz(d,r)if r<0 then return _zLiwcKaV(d,-r)end;return d*2^r%2^32 end;local function _zJaQcGWz(p,r)p=p%_zWtY2f5Y;r=r%32;local _z6VXRE6z=_zcnG7WSt(p,2^r-1)return _zLiwcKaV(p,r)+_zLjDe1Hz(_z6VXRE6z,32-r)end;local _zE2qBf7m={0x428a2f98,0x71374491,0xb5c0fbcf,0xe9b5dba5,0x3956c25b,0x59f111f1,0x923f82a4,0xab1c5ed5,0xd807aa98,0x12835b01,0x243185be,0x550c7dc3,0x72be5d74,0x80deb1fe,0x9bdc06a7,0xc19bf174,0xe49b69c1,0xefbe4786,0x0fc19dc6,0x240ca1cc,0x2de92c6f,0x4a7484aa,0x5cb0a9dc,0x76f988da,0x983e5152,0xa831c66d,0xb00327c8,0xbf597fc7,0xc6e00bf3,0xd5a79147,0x06ca6351,0x14292967,0x27b70a85,0x2e1b2138,0x4d2c6dfc,0x53380d13,0x650a7354,0x766a0abb,0x81c2c92e,0x92722c85,0xa2bfe8a1,0xa81a664b,0xc24b8b70,0xc76c51a3,0xd192e819,0xd6990624,0xf40e3585,0x106aa070,0x19a4c116,0x1e376c08,0x2748774c,0x34b0bcb5,0x391c0cb3,0x4ed8aa4a,0x5b9cca4f,0x682e6ff3,0x748f82ee,0x78a5636f,0x84c87814,0x8cc70208,0x90befffa,0xa4506ceb,0xbef9a3f7,0xc67178f2}local function _zvlYQh8h(x)return string.gsub(x,string.char(46),function(l)return string.format(string.char(37, 48, 50, 120),string.byte(l))end)end;local function _z4IEky5G(z,A)local _zDD7uVtn=""for B=1,A do local _zvGhJQBp=z%256;_zDD7uVtn=string.char(_zvGhJQBp).._zDD7uVtn;z=(z-_zvGhJQBp)/256 end;return _zDD7uVtn end;local function _zWC1lYRe(_zDD7uVtn,B)local _zkOtnmhZ=0;for B=B,B+3 do _zkOtnmhZ=_zkOtnmhZ*256+string.byte(_zDD7uVtn,B)end;return _zkOtnmhZ end;local function _zdBJkDU6(F,G)local _zMXC2yLs=64-(G+9)%64;G=_z4IEky5G(8*G,8)F=F..string.char(92, 49, 50, 56)..string.rep(string.char(92, 48),_zMXC2yLs)..G;assert(#F%64==0)return F end;local function _zklbPLzG(J)J[1]=0x6a09e667;J[2]=0xbb67ae85;J[3]=0x3c6ef372;J[4]=0xa54ff53a;J[5]=0x510e527f;J[6]=0x9b05688c;J[7]=0x1f83d9ab;J[8]=0x5be0cd19;return J end;local function _zJjIuKY1(F,B,J)local _zDELTPo1={}for M=1,16 do _zDELTPo1[M]=_zWC1lYRe(F,B+(M-1)*4)end;for M=17,64 do local _zpVYrv7E=_zDELTPo1[M-15]local _zP33XF5p=_zF6aVWEq(_zJaQcGWz(_zpVYrv7E,7),_zJaQcGWz(_zpVYrv7E,18),_zLiwcKaV(_zpVYrv7E,3))_zpVYrv7E=_zDELTPo1[M-2]_zDELTPo1[M]=(_zDELTPo1[M-16]+_zP33XF5p+_zDELTPo1[M-7]+_zF6aVWEq(_zJaQcGWz(_zpVYrv7E,17),_zJaQcGWz(_zpVYrv7E,19),_zLiwcKaV(_zpVYrv7E,10)))%_zWtY2f5Y end;local _z33DW2iw,e,l,P,Q,R,S,T=J[1],J[2],J[3],J[4],J[5],J[6],J[7],J[8]for B=1,64 do local _zAqLf0JC=_zF6aVWEq(_zJaQcGWz(_z33DW2iw,2),_zJaQcGWz(_z33DW2iw,13),_zJaQcGWz(_z33DW2iw,22))local _zpL4G6We=_zF6aVWEq(_zcnG7WSt(_z33DW2iw,e),_zcnG7WSt(_z33DW2iw,l),_zcnG7WSt(e,l))local _z3pLvs7l=(_zAqLf0JC+_zpL4G6We)%_zWtY2f5Y;local _zL9YrnS6=_zF6aVWEq(_zJaQcGWz(Q,6),_zJaQcGWz(Q,11),_zJaQcGWz(Q,25))local _zfuKdEd5=_zF6aVWEq(_zcnG7WSt(Q,R),_zcnG7WSt(_zYU4kym3(Q),S))local _zOmigWRm=(T+_zL9YrnS6+_zfuKdEd5+_zE2qBf7m[B]+_zDELTPo1[B])%_zWtY2f5Y;T=S;S=R;R=Q;Q=(P+_zOmigWRm)%_zWtY2f5Y;P=l;l=e;e=_z33DW2iw;_z33DW2iw=(_zOmigWRm+_z3pLvs7l)%_zWtY2f5Y end;J[1]=(J[1]+_z33DW2iw)%_zWtY2f5Y;J[2]=(J[2]+e)%_zWtY2f5Y;J[3]=(J[3]+l)%_zWtY2f5Y;J[4]=(J[4]+P)%_zWtY2f5Y;J[5]=(J[5]+Q)%_zWtY2f5Y;J[6]=(J[6]+R)%_zWtY2f5Y;J[7]=(J[7]+S)%_zWtY2f5Y;J[8]=(J[8]+T)%_zWtY2f5Y end;local function _z9qhSs6l(F)F=_zdBJkDU6(F,#F)local _z0flNKVx=_zklbPLzG({})for B=1,#F,64 do _zJjIuKY1(F,B,_z0flNKVx)end;return _zvlYQh8h(_z4IEky5G(_z0flNKVx[1],4).._z4IEky5G(_z0flNKVx[2],4).._z4IEky5G(_z0flNKVx[3],4).._z4IEky5G(_z0flNKVx[4],4).._z4IEky5G(_z0flNKVx[5],4).._z4IEky5G(_z0flNKVx[6],4).._z4IEky5G(_z0flNKVx[7],4).._z4IEky5G(_z0flNKVx[8],4))end;local _zZMlU0o1;local _zA00h0sS={[string.char(92, 92)]=string.char(92, 92),[string.char(92, 34)]=string.char(92, 34),[string.char(92, 98)]=string.char(98),[string.char(92, 102)]=string.char(102),[string.char(92, 110)]=string.char(110),[string.char(92, 114)]=string.char(114),[string.char(92, 116)]=string.char(116)}local _zSMGeOAv={[string.char(47)]=string.char(47)}for Q,R in pairs(_zA00h0sS)do _zSMGeOAv[R]=Q end;local _zgPsgdRM=function(T)returnstring.char(92, 92)..(_zA00h0sS[T]or string.format(string.char(117, 37, 48, 52, 120),T:byte()))end;local _z9uFacBX=function(M)returnstring.char(110, 117, 108, 108)end;local _zfBD9TrP=function(M,z)local _zxgdRqQW={}z=z or{}if z[M]then error(string.char(99, 105, 114, 99, 117, 108, 97, 114, 32, 114, 101, 102, 101, 114, 101, 110, 99, 101))end;z[M]=true;if rawget(M,1)=nil or next(M)==nil then local _zOEESOBt=0;for Q in pairs(M)do if type(Q)=string.char(110, 117, 109, 98, 101, 114)then error(string.char(105, 110, 118, 97, 108, 105, 100, 32, 116, 97, 98, 108, 101, 58, 32, 109, 105, 120, 101, 100, 32, 111, 114, 32, 105, 110, 118, 97, 108, 105, 100, 32, 107, 101, 121, 32, 116, 121, 112, 101, 115))end;_zOEESOBt=_zOEESOBt+1 end;if _zOEESOBt=#M then error(string.char(105, 110, 118, 97, 108, 105, 100, 32, 116, 97, 98, 108, 101, 58, 32, 115, 112, 97, 114, 115, 101, 32, 97, 114, 114, 97, 121))end;for a0,R in ipairs(M)do table.insert(_zxgdRqQW,_zZMlU0o1(R,z))end;z[M]=nil;returnstring.char(91)..table.concat(_zxgdRqQW,string.char(44))..string.char(93)else for Q,R in pairs(M)do if type(Q)=string.char(115, 116, 114, 105, 110, 103)then error(string.char(105, 110, 118, 97, 108, 105, 100, 32, 116, 97, 98, 108, 101, 58, 32, 109, 105, 120, 101, 100, 32, 111, 114, 32, 105, 110, 118, 97, 108, 105, 100, 32, 107, 101, 121, 32, 116, 121, 112, 101, 115))end;table.insert(_zxgdRqQW,_zZMlU0o1(Q,z)..string.char(58).._zZMlU0o1(R,z))end;z[M]=nil;returnstring.char(123)..table.concat(_zxgdRqQW,string.char(44))..string.char(125)end end;local _ztnucNmi=function(M)returnstring.char(34)..M:gsub(string.char(91, 37, 122, 92, 49, 45, 92, 51, 49, 92, 92, 92, 34, 93),_zgPsgdRM)..string.char(34)end;local _zyrH4NfJ=function(M)if M=M or M<=-math.huge or M>=math.huge then error(string.char(117, 110, 101, 120, 112, 101, 99, 116, 101, 100, 32, 110, 117, 109, 98, 101, 114, 32, 118, 97, 108, 117, 101, 32, 39)..tostring(M)..string.char(39))end;return string.format(string.char(37, 46, 49, 52, 103),M)end;local _zH5Clc2w={[string.char(110, 105, 108)]=_z9uFacBX,[string.char(116, 97, 98, 108, 101)]=_zfBD9TrP,[string.char(115, 116, 114, 105, 110, 103)]=_ztnucNmi,[string.char(110, 117, 109, 98, 101, 114)]=_zyrH4NfJ,[string.char(98, 111, 111, 108, 101, 97, 110)]=tostring}_zZMlU0o1=function(M,z)local _ztUZ99Av=type(M)local _zIFD1myr=_zH5Clc2w[_ztUZ99Av]if _zIFD1myr then return _zIFD1myr(M,z)end;error(string.char(117, 110, 101, 120, 112, 101, 99, 116, 101, 100, 32, 116, 121, 112, 101, 32, 39).._ztUZ99Av..string.char(39))end;local _zTiGmUNQ=function(M)return _zZMlU0o1(M)end;local _z8smiH9X;local _zPBHBZ83=function(...)local _zdzZWz9b={}for a0=1,select(string.char(35),...)do _zdzZWz9b[select(a0,...)]=true end;return _zdzZWz9b end;local _zisD9X4M=_zPBHBZ83(string.char(32),string.char(92, 116),string.char(92, 114),string.char(92, 110))local _zMdzBIt8=_zPBHBZ83(string.char(32),string.char(92, 116),string.char(92, 114),string.char(92, 110),string.char(93),string.char(125),string.char(44))local _zKmw5MwV=_zPBHBZ83(string.char(92, 92),string.char(47),string.char(34),string.char(98),string.char(102),string.char(110),string.char(114),string.char(116),string.char(117))local _zNtJ5gAA=_zPBHBZ83(string.char(116, 114, 117, 101),string.char(102, 97, 108, 115, 101),string.char(110, 117, 108, 108))local _zpdfbtZK={[string.char(116, 114, 117, 101)]=true,[string.char(102, 97, 108, 115, 101)]=false,[string.char(110, 117, 108, 108)]=nil}local _zhyW7s1h=function(a8,a9,aa,ab)for a0=a9,#a8 do if aa[a8:sub(a0,a0)]=ab then return a0 end end;return#a8+1 end;local _zSL1g9CZ=function(a8,a9,_z0flNKVx)local _zrHV9yWH=1;local _zvfHxKVS=1;for a0=1,a9-1 do _zvfHxKVS=_zvfHxKVS+1;if a8:sub(a0,a0)==string.char(92, 110)then _zrHV9yWH=_zrHV9yWH+1;_zvfHxKVS=1 end end;error(string.format(string.char(37, 115, 32, 97, 116, 32, 108, 105, 110, 101, 32, 37, 100, 32, 99, 111, 108, 32, 37, 100),_z0flNKVx,_zrHV9yWH,_zvfHxKVS))end;local _zuIGqVXo=function(_zOEESOBt)local _zRjkWizx=math.floor;if _zOEESOBt<=0x7f then return string.char(_zOEESOBt)elseif _zOEESOBt<=0x7ff then return string.char(_zRjkWizx(_zOEESOBt/64)+192,_zOEESOBt%64+128)elseif _zOEESOBt<=0xffff then return string.char(_zRjkWizx(_zOEESOBt/4096)+224,_zRjkWizx(_zOEESOBt%4096/64)+128,_zOEESOBt%64+128)elseif _zOEESOBt<=0x10ffff then return string.char(_zRjkWizx(_zOEESOBt/262144)+240,_zRjkWizx(_zOEESOBt%262144/4096)+128,_zRjkWizx(_zOEESOBt%4096/64)+128,_zOEESOBt%64+128)end;error(string.format(string.char(105, 110, 118, 97, 108, 105, 100, 32, 117, 110, 105, 99, 111, 100, 101, 32, 99, 111, 100, 101, 112, 111, 105, 110, 116, 32, 39, 37, 120, 39),_zOEESOBt))end;local _zuswplCs=function(ah)local _zk9qzJ5L=tonumber(ah:sub(1,4),16)local _zpqQdVqy=tonumber(ah:sub(7,10),16)if _zpqQdVqy then return _zuIGqVXo((_zk9qzJ5L-0xd800)*0x400+_zpqQdVqy-0xdc00+0x10000)else return _zuIGqVXo(_zk9qzJ5L)end end;local _z93FXlgr=function(a8,a0)local _zv1lzw0w=""local _zeSqb47z=a0+1;local _zdSDC3Wp=_zeSqb47z;while _zeSqb47z<=#a8 do local _zOrfEACq=a8:byte(_zeSqb47z)if _zOrfEACq<32 then _zSL1g9CZ(a8,_zeSqb47z,string.char(99, 111, 110, 116, 114, 111, 108, 32, 99, 104, 97, 114, 97, 99, 116, 101, 114, 32, 105, 110, 32, 115, 116, 114, 105, 110, 103))elseif _zOrfEACq==92 then _zv1lzw0w=_zv1lzw0w..a8:sub(_zdSDC3Wp,_zeSqb47z-1)_zeSqb47z=_zeSqb47z+1;local _zqWRQMsR=a8:sub(_zeSqb47z,_zeSqb47z)if _zqWRQMsR==string.char(117)then local _z4r2A7N6=a8:match(string.char(94, 91, 100, 68, 93, 91, 56, 57, 97, 65, 98, 66, 93, 37, 120, 37, 120, 92, 92, 117, 37, 120, 37, 120, 37, 120, 37, 120),_zeSqb47z+1)or a8:match(string.char(94, 37, 120, 37, 120, 37, 120, 37, 120),_zeSqb47z+1)or _zSL1g9CZ(a8,_zeSqb47z-1,string.char(105, 110, 118, 97, 108, 105, 100, 32, 117, 110, 105, 99, 111, 100, 101, 32, 101, 115, 99, 97, 112, 101, 32, 105, 110, 32, 115, 116, 114, 105, 110, 103))_zv1lzw0w=_zv1lzw0w.._zuswplCs(_z4r2A7N6)_zeSqb47z=_zeSqb47z+#_z4r2A7N6 else if not _zKmw5MwV[_zqWRQMsR]then _zSL1g9CZ(a8,_zeSqb47z-1,string.char(105, 110, 118, 97, 108, 105, 100, 32, 101, 115, 99, 97, 112, 101, 32, 99, 104, 97, 114, 32, 39).._zqWRQMsR..string.char(39, 32, 105, 110, 32, 115, 116, 114, 105, 110, 103))end;_zv1lzw0w=_zv1lzw0w.._zSMGeOAv[_zqWRQMsR]end;_zdSDC3Wp=_zeSqb47z+1 elseif _zOrfEACq==34 then _zv1lzw0w=_zv1lzw0w..a8:sub(_zdSDC3Wp,_zeSqb47z-1)return _zv1lzw0w,_zeSqb47z+1 end;_zeSqb47z=_zeSqb47z+1 end;_zSL1g9CZ(a8,a0,string.char(101, 120, 112, 101, 99, 116, 101, 100, 32, 99, 108, 111, 115, 105, 110, 103, 32, 113, 117, 111, 116, 101, 32, 102, 111, 114, 32, 115, 116, 114, 105, 110, 103))end;local _z1W9EYmi=function(a8,a0)local _zx3ukswE=_zhyW7s1h(a8,a0,_zMdzBIt8)local _zxB1pJ3G=a8:sub(a0,_zx3ukswE-1)local _zE4aptjE=tonumber(_zxB1pJ3G)if not _zE4aptjE then _zSL1g9CZ(a8,a0,string.char(105, 110, 118, 97, 108, 105, 100, 32, 110, 117, 109, 98, 101, 114, 32, 39).._zxB1pJ3G..string.char(39))end;return _zE4aptjE,_zx3ukswE end;local _zCIsQtSr=function(a8,a0)local _zspm7ugN=_zhyW7s1h(a8,a0,_zMdzBIt8)local _z2nwLAFp=a8:sub(a0,_zspm7ugN-1)if not _zNtJ5gAA[_z2nwLAFp]then _zSL1g9CZ(a8,a0,string.char(105, 110, 118, 97, 108, 105, 100, 32, 108, 105, 116, 101, 114, 97, 108, 32, 39).._z2nwLAFp..string.char(39))end;return _zpdfbtZK[_z2nwLAFp],_zspm7ugN end;local _zMxwl9ZD=function(a8,a0)local _zZ36glLM={}local _zemqjjwb=1;a0=a0+1;while 1 do local _zPWoMUsx;a0=_zhyW7s1h(a8,a0,_zisD9X4M,true)if a8:sub(a0,a0)==string.char(93)then a0=a0+1;break end;_zPWoMUsx,a0=_z8smiH9X(a8,a0)_zZ36glLM[_zemqjjwb]=_zPWoMUsx;_zemqjjwb=_zemqjjwb+1;a0=_zhyW7s1h(a8,a0,_zisD9X4M,true)local _zavRkf2U=a8:sub(a0,a0)a0=a0+1;if _zavRkf2U==string.char(93)then break end;if _zavRkf2U=string.char(44)then _zSL1g9CZ(a8,a0,string.char(101, 120, 112, 101, 99, 116, 101, 100, 32, 39, 93, 39, 32, 111, 114, 32, 39, 44, 39))end end;return _zZ36glLM,a0 end;local _zh2IKlHq=function(a8,a0)local _z1S3klou={}a0=a0+1;while 1 do local _zP6gH8pC,M;a0=_zhyW7s1h(a8,a0,_zisD9X4M,true)if a8:sub(a0,a0)==string.char(125)then a0=a0+1;break end;if a8:sub(a0,a0)=string.char(34)then _zSL1g9CZ(a8,a0,string.char(101, 120, 112, 101, 99, 116, 101, 100, 32, 115, 116, 114, 105, 110, 103, 32, 102, 111, 114, 32, 107, 101, 121))end;_zP6gH8pC,a0=_z8smiH9X(a8,a0)a0=_zhyW7s1h(a8,a0,_zisD9X4M,true)if a8:sub(a0,a0)=string.char(58)then _zSL1g9CZ(a8,a0,string.char(101, 120, 112, 101, 99, 116, 101, 100, 32, 39, 58, 39, 32, 97, 102, 116, 101, 114, 32, 107, 101, 121))end;a0=_zhyW7s1h(a8,a0+1,_zisD9X4M,true)M,a0=_z8smiH9X(a8,a0)_z1S3klou[_zP6gH8pC]=M;a0=_zhyW7s1h(a8,a0,_zisD9X4M,true)local _zMNPSgUw=a8:sub(a0,a0)a0=a0+1;if _zMNPSgUw==string.char(125)then break end;if _zMNPSgUw=string.char(44)then _zSL1g9CZ(a8,a0,string.char(101, 120, 112, 101, 99, 116, 101, 100, 32, 39, 125, 39, 32, 111, 114, 32, 39, 44, 39))end end;return _z1S3klou,a0 end;local _zAuw90Sp={[string.char(34)]=_z93FXlgr,[string.char(48)]=_z1W9EYmi,[string.char(49)]=_z1W9EYmi,[string.char(50)]=_z1W9EYmi,[string.char(51)]=_z1W9EYmi,[string.char(52)]=_z1W9EYmi,[string.char(53)]=_z1W9EYmi,[string.char(54)]=_z1W9EYmi,[string.char(55)]=_z1W9EYmi,[string.char(56)]=_z1W9EYmi,[string.char(57)]=_z1W9EYmi,[string.char(45)]=_z1W9EYmi,[string.char(116)]=_zCIsQtSr,[string.char(102)]=_zCIsQtSr,[string.char(110)]=_zCIsQtSr,[string.char(91)]=_zMxwl9ZD,[string.char(123)]=_zh2IKlHq}_z8smiH9X=function(a8,a9)local _zk8oBPQi=a8:sub(a9,a9)local _zRBITMyA=_zAuw90Sp[_zk8oBPQi]if _zRBITMyA then return _zRBITMyA(a8,a9)end;_zSL1g9CZ(a8,a9,string.char(117, 110, 101, 120, 112, 101, 99, 116, 101, 100, 32, 99, 104, 97, 114, 97, 99, 116, 101, 114, 32, 39).._zk8oBPQi..string.char(39))end;local _z3L5Bozs=function(a8)if type(a8)=string.char(115, 116, 114, 105, 110, 103)then error(string.char(101, 120, 112, 101, 99, 116, 101, 100, 32, 97, 114, 103, 117, 109, 101, 110, 116, 32, 111, 102, 32, 116, 121, 112, 101, 32, 115, 116, 114, 105, 110, 103, 44, 32, 103, 111, 116, 32)..type(a8))end;local _zEtz0rJ8,a9=_z8smiH9X(a8,_zhyW7s1h(a8,1,_zisD9X4M,true))a9=_zhyW7s1h(a8,a9,_zisD9X4M,true)if a9<=#a8 then _zSL1g9CZ(a8,a9,string.char(116, 114, 97, 105, 108, 105, 110, 103, 32, 103, 97, 114, 98, 97, 103, 101))end;return _zEtz0rJ8 end;
local _zSxz8hxo, lDecode, lDigest = _zTiGmUNQ, _z3L5Bozs, _z9qhSs6l;

-------------------------------------------------------------------------------
--! CORE FUNCTIONS (REQUESTS & VERIFICATION)
-------------------------------------------------------------------------------

local _ziEPRtRg = true -- Hidden from Config to avoid user confusion, but active for security

-- Safe request function for universal executor support
local function _zjVvMr3Q(options)
    local _zvpHyWpX = request or http_request or syn_request or (http and http.request )
    if not _zvpHyWpX then return nil, string.char(72, 84, 84, 80, 32, 114, 101, 113, 117, 101, 115, 116, 115, 32, 110, 111, 116, 32, 115, 117, 112, 112, 111, 114, 116, 101, 100) end
    local _z8fn6Szl, response = pcall(function() return _zvpHyWpX(options) end)
    if _z8fn6Szl and response then return response else return nil, string.char(67, 111, 110, 110, 101, 99, 116, 105, 111, 110, 32, 69, 114, 114, 111, 114) end
end

local _zF944eBT = setclipboard or toclipboard or function() end
local _z4VijPcE, fToString, fOsTime, fMathRandom, fMathFloor = string.char, tostring, os.time, math.random, math.floor
local _zlx6eaVv = gethwid or function() return game:GetService(string.char(82, 98, 120, 65, 110, 97, 108, 121, 116, 105, 99, 115, 83, 101, 114, 118, 105, 99, 101)):GetClientId() end

local _zDzBsv5K, cachedTime = "", 0
local _zUyt74uH = string.char(104, 116, 116, 112, 115, 58, 47, 47, 97, 112, 105, 46, 112, 108, 97, 116, 111, 98, 111, 111, 115, 116, 46, 99, 111, 109)

-- Check server connectivity
local function _zkyaGUs5( )
    local _zGiVlOhK = _zjVvMr3Q({Url = _zUyt74uH .. string.char(47, 112, 117, 98, 108, 105, 99, 47, 99, 111, 110, 110, 101, 99, 116, 105, 118, 105, 116, 121), Method = string.char(71, 69, 84)})
    if not _zGiVlOhK or (_zGiVlOhK.StatusCode = 200 and _zGiVlOhK.StatusCode = 429) then
        _zUyt74uH = string.char(104, 116, 116, 112, 115, 58, 47, 47, 97, 112, 105, 46, 112, 108, 97, 116, 111, 98, 111, 111, 115, 116, 46, 110, 101, 116)
    end
end
_zkyaGUs5( )

local function _zTUhUU5p()
    local _zKkTK01j = ""
    for _zEtz0rJ8 = 1, 16 do _zKkTK01j = _zKkTK01j .. _z4VijPcE(fMathFloor(fMathRandom() * (122 - 97 + 1)) + 97) end
    return _zKkTK01j
end

-- Get player's key link
local function _zHExQqCS()
    if cachedTime + (10*60) < fOsTime() then
        local _zDSh243d, err = _zjVvMr3Q({
            Url = _zUyt74uH .. string.char(47, 112, 117, 98, 108, 105, 99, 47, 115, 116, 97, 114, 116),
            Method = string.char(80, 79, 83, 84),
            Body = _zSxz8hxo({service = _z3425XEe.ServiceId, identifier = lDigest(_zlx6eaVv())}),
            Headers = {[string.char(67, 111, 110, 116, 101, 110, 116, 45, 84, 121, 112, 101)] = string.char(97, 112, 112, 108, 105, 99, 97, 116, 105, 111, 110, 47, 106, 115, 111, 110)}
        })
        if _zDSh243d and _zDSh243d.StatusCode == 200 then
            local _z3waBets = lDecode(_zDSh243d.Body)
            if _z3waBets.success then
                _zDzBsv5K = _z3waBets.data.url
                cachedTime = fOsTime()
                return true, _zDzBsv5K
            end
        end
        return false, err or string.char(83, 101, 114, 118, 101, 114, 32, 85, 110, 114, 101, 97, 99, 104, 97, 98, 108, 101)
    end
    return true, _zDzBsv5K
end

-- Verify key on input
local function _zaZU9VuQ(key)
    local _zmhZOkjv = _zTUhUU5p()
    local _zmHBNWfB = {identifier = lDigest(_zlx6eaVv()), key = key}
    if _ziEPRtRg then _zmHBNWfB.nonce = _zmhZOkjv end

    local _zslMmeJc, err = _zjVvMr3Q({
        Url = _zUyt74uH .. string.char(47, 112, 117, 98, 108, 105, 99, 47, 114, 101, 100, 101, 101, 109, 47) .. fToString(_z3425XEe.ServiceId),
        Method = string.char(80, 79, 83, 84),
        Body = _zSxz8hxo(_zmHBNWfB),
        Headers = {[string.char(67, 111, 110, 116, 101, 110, 116, 45, 84, 121, 112, 101)] = string.char(97, 112, 112, 108, 105, 99, 97, 116, 105, 111, 110, 47, 106, 115, 111, 110)}
    })

    if _zslMmeJc and _zslMmeJc.StatusCode == 200 then
        local _zzxQ0F08 = lDecode(_zslMmeJc.Body)
        if _zzxQ0F08.success and _zzxQ0F08.data.valid then
            if _ziEPRtRg then
                if _zzxQ0F08.data.hash == lDigest(string.char(116, 114, 117, 101) .. string.char(45) .. _zmhZOkjv .. string.char(45) .. _z3425XEe.PlatoSecret) then
                    if writefile then writefile(_z3425XEe.KeyFileName, key) end
                    return true, string.char(83, 117, 99, 99, 101, 115, 115)
                end
                return false, string.char(73, 110, 116, 101, 103, 114, 105, 116, 121, 32, 67, 104, 101, 99, 107, 32, 70, 97, 105, 108, 101, 100)
            end
            if writefile then writefile(_z3425XEe.KeyFileName, key) end
            return true, string.char(83, 117, 99, 99, 101, 115, 115)
        end
        return false, _zzxQ0F08.message or string.char(73, 110, 118, 97, 108, 105, 100, 32, 75, 101, 121)
    end
    return false, err or string.char(83, 101, 114, 118, 101, 114, 32, 69, 114, 114, 111, 114)
end

-------------------------------------------------------------------------------
--! GUI & MAIN SCRIPT EXECUTION
-------------------------------------------------------------------------------

local function _zqjf57Ll()
    local _zP6cGHer = game:GetService(string.char(80, 108, 97, 121, 101, 114, 115)).LocalPlayer
    local _z73ysyTQ = _zP6cGHer:WaitForChild(string.char(80, 108, 97, 121, 101, 114, 71, 117, 105))

    -- Destroy old GUI if it exists
    if _z73ysyTQ:FindFirstChild(_z3425XEe.OldGuiName) then
        _z73ysyTQ[_z3425XEe.OldGuiName]:Destroy()
        task.wait(0.1)
    end

    -- Set secret global variable to bypass main script protection
    _G[_z3425XEe.Secret] = true

    -- Execute main script
    loadstring(game:HttpGet(_z3425XEe.MainScriptURL))()
end

local function _zuHl9KDG()
    local _zpZFZ99E = game:GetService(string.char(80, 108, 97, 121, 101, 114, 115)).LocalPlayer
    local _zsGVJVs5 = game:GetService(string.char(67, 111, 114, 101, 71, 117, 105))
    local _zGl1j6CR = pcall(function() return _zsGVJVs5 end) and _zsGVJVs5 or _zpZFZ99E:WaitForChild(string.char(80, 108, 97, 121, 101, 114, 71, 117, 105))

    if _zGl1j6CR:FindFirstChild(string.char(79, 89, 66, 95, 75, 101, 121, 83, 121, 115, 116, 101, 109)) then _zGl1j6CR.OYB_KeySystem:Destroy() end

    local _zoQfWjxN = Instance.new(string.char(83, 99, 114, 101, 101, 110, 71, 117, 105), _zGl1j6CR)
    _zoQfWjxN.Name = string.char(79, 89, 66, 95, 75, 101, 121, 83, 121, 115, 116, 101, 109)
    _zoQfWjxN.ResetOnSpawn = false

    local _zZyaNyhL = Instance.new(string.char(70, 114, 97, 109, 101), _zoQfWjxN)
    _zZyaNyhL.Size = UDim2.new(0, 340, 0, 420)
    _zZyaNyhL.Position = UDim2.new(0.5, -170, 0.5, -210)
    _zZyaNyhL.BackgroundColor3 = Color3.fromRGB(15, 15, 15)
    _zZyaNyhL.Active = true;
    _zZyaNyhL.Draggable = true
    Instance.new(string.char(85, 73, 67, 111, 114, 110, 101, 114), _zZyaNyhL).CornerRadius = UDim.new(0, 15)

    local _ziU8sxiK = Instance.new(string.char(85, 73, 83, 116, 114, 111, 107, 101), _zZyaNyhL)
    _ziU8sxiK.Thickness = 2;
    _ziU8sxiK.Color = Color3.fromRGB(40, 40, 40)

    -- Close Button
    local _z8XdhGdY = Instance.new(string.char(84, 101, 120, 116, 66, 117, 116, 116, 111, 110), _zZyaNyhL)
    _z8XdhGdY.Size = UDim2.new(0, 30, 0, 30)
    _z8XdhGdY.Position = UDim2.new(1, -35, 0, 10)
    _z8XdhGdY.BackgroundTransparency = 1
    _z8XdhGdY.Text = string.char(88)
    _z8XdhGdY.TextColor3 = Color3.fromRGB(255, 50, 50)
    _z8XdhGdY.Font = Enum.Font.GothamBold
    _z8XdhGdY.TextSize = 18
    _z8XdhGdY.ZIndex = 10
    _z8XdhGdY.MouseButton1Click:Connect(function() _zoQfWjxN:Destroy() end)

    local _zJfeGQIx = Instance.new(string.char(84, 101, 120, 116, 76, 97, 98, 101, 108), _zZyaNyhL)
    _zJfeGQIx.Size = UDim2.new(1, 0, 0, 50)
    _zJfeGQIx.Text = _z3425XEe.HubName
    _zJfeGQIx.BackgroundColor3 = Color3.fromRGB(20, 20, 20)
    _zJfeGQIx.TextColor3 = Color3.fromRGB(0, 170, 255)
    _zJfeGQIx.Font = Enum.Font.GothamBold;
    _zJfeGQIx.TextSize = 16
    Instance.new(string.char(85, 73, 67, 111, 114, 110, 101, 114), _zJfeGQIx).CornerRadius = UDim.new(0, 15)

    local _zSDXX8aY = Instance.new(string.char(84, 101, 120, 116, 76, 97, 98, 101, 108), _zZyaNyhL)
    _zSDXX8aY.Size = UDim2.new(0.9, 0, 0, 50)
    _zSDXX8aY.Position = UDim2.new(0.05, 0, 0, 50)
    _zSDXX8aY.BackgroundTransparency = 1
    _zSDXX8aY.Text = _z3425XEe.HubDescription
    _zSDXX8aY.TextColor3 = Color3.fromRGB(0, 170, 255)
    _zSDXX8aY.Font = Enum.Font.GothamBold;
    _zSDXX8aY.TextSize = 14
    _zSDXX8aY.TextWrapped = true

    -- Rainbow Stroke Function
    local function _z2d8PBCw(parent)
        local _zzaNJZv6 = Instance.new(string.char(85, 73, 83, 116, 114, 111, 107, 101), parent)
        _zzaNJZv6.Thickness = 2
        _zzaNJZv6.ApplyStrokeMode = Enum.ApplyStrokeMode.Border
        task.spawn(function()
            while task.wait() do
                local _zJzqTK4y = tick() % 5 / 5
                _zzaNJZv6.Color = Color3.fromHSV(_zJzqTK4y, 1, 1)
            end
        end)
    end

    -- Dynamic Positioning for elements
    local _zO6HrKjK = 105

    -- Discord Button
    if _z3425XEe.ShowDiscord then
        local _zzJhr0vJ = Instance.new(string.char(84, 101, 120, 116, 66, 117, 116, 116, 111, 110), _zZyaNyhL)
        _zzJhr0vJ.Size = UDim2.new(0.85, 0, 0, 35)
        _zzJhr0vJ.Position = UDim2.new(0.075, 0, 0, _zO6HrKjK)
        _zzJhr0vJ.Text = string.char(32, 32, 32, 32, 32, 32, 74, 79, 73, 78, 32, 68, 73, 83, 67, 79, 82, 68)
        _zzJhr0vJ.Font = string.char(71, 111, 116, 104, 97, 109, 66, 111, 108, 100);
        _zzJhr0vJ.TextSize = 14
        _zzJhr0vJ.BackgroundColor3 = Color3.fromRGB(88, 101, 242)
        _zzJhr0vJ.TextColor3 = Color3.new(1, 1, 1)
        Instance.new(string.char(85, 73, 67, 111, 114, 110, 101, 114), _zzJhr0vJ)
        _z2d8PBCw(_zzJhr0vJ)

        local _zdFgGI5U = Instance.new(string.char(73, 109, 97, 103, 101, 76, 97, 98, 101, 108), _zzJhr0vJ)
        _zdFgGI5U.Size = UDim2.new(0, 20, 0, 20)
        _zdFgGI5U.Position = UDim2.new(0.1, 0, 0.5, -10)
        _zdFgGI5U.BackgroundTransparency = 1
        _zdFgGI5U.Image = string.char(114, 98, 120, 97, 115, 115, 101, 116, 105, 100, 58, 47, 47, 49, 56, 53, 48, 53, 55, 50, 56, 50, 48, 49)

        _zzJhr0vJ.MouseButton1Click:Connect(function()
            _zF944eBT(_z3425XEe.DiscordURL)
            local _zgmX9p4K = _zZyaNyhL:FindFirstChild(string.char(83, 116, 97, 116, 117, 115, 76, 97, 98, 101, 108))
            if _zgmX9p4K then
                _zgmX9p4K.Text = string.char(68, 105, 115, 99, 111, 114, 100, 32, 76, 105, 110, 107, 32, 67, 111, 112, 105, 101, 100, 33)
                _zgmX9p4K.TextColor3 = Color3.fromRGB(88, 101, 242)
            end
            -- Auto-extract invite code from config URL
            local _z3Avy7gM = string.match(_z3425XEe.DiscordURL, string.char(100, 105, 115, 99, 111, 114, 100, 37, 46, 103, 103, 47, 40, 91, 37, 119, 45, 93, 43, 41))
            if syn and syn.request and _z3Avy7gM then
                syn.request({Url = string.char(104, 116, 116, 112, 58, 47, 47, 108, 111, 99, 97, 108, 104, 111, 115, 116, 58, 49, 49, 49, 49, 47, 100, 105, 115, 99, 111, 114, 100, 63, 105, 110, 118, 105, 116, 101, 61) .. _z3Avy7gM, Method = string.char(71, 69, 84)})
            end
        end)

        _zO6HrKjK = _zO6HrKjK + 45
    end

    -- Instagram Button
    if _z3425XEe.ShowInstagram then
        local _zNHJTC6T = Instance.new(string.char(84, 101, 120, 116, 66, 117, 116, 116, 111, 110), _zZyaNyhL)
        _zNHJTC6T.Size = UDim2.new(0.85, 0, 0, 35)
        _zNHJTC6T.Position = UDim2.new(0.075, 0, 0, _zO6HrKjK)
        _zNHJTC6T.Text = string.char(32, 32, 32, 32, 32, 32, 70, 79, 76, 76, 79, 87, 32, 73, 78, 83, 84, 65, 71, 82, 65, 77)
        _zNHJTC6T.Font = string.char(71, 111, 116, 104, 97, 109, 66, 111, 108, 100);
        _zNHJTC6T.TextSize = 14
        _zNHJTC6T.BackgroundColor3 = Color3.fromRGB(225, 48, 108)
        _zNHJTC6T.TextColor3 = Color3.new(1, 1, 1)
        Instance.new(string.char(85, 73, 67, 111, 114, 110, 101, 114), _zNHJTC6T)
        _z2d8PBCw(_zNHJTC6T)

        local _zVISd9yR = Instance.new(string.char(73, 109, 97, 103, 101, 76, 97, 98, 101, 108), _zNHJTC6T)
        _zVISd9yR.Size = UDim2.new(0, 20, 0, 20)
        _zVISd9yR.Position = UDim2.new(0.1, 0, 0.5, -10)
        _zVISd9yR.BackgroundTransparency = 1
        _zVISd9yR.Image = string.char(114, 98, 120, 97, 115, 115, 101, 116, 105, 100, 58, 47, 47, 49, 56, 51, 53, 53, 53, 56, 54, 51, 56, 50)

        _zNHJTC6T.MouseButton1Click:Connect(function()
            _zF944eBT(_z3425XEe.InstagramURL)
            local _zveM7FL4 = _zZyaNyhL:FindFirstChild(string.char(83, 116, 97, 116, 117, 115, 76, 97, 98, 101, 108))
            if _zveM7FL4 then
                _zveM7FL4.Text = string.char(73, 110, 115, 116, 97, 103, 114, 97, 109, 32, 76, 105, 110, 107, 32, 67, 111, 112, 105, 101, 100, 33)
                _zveM7FL4.TextColor3 = Color3.fromRGB(225, 48, 108)
            end
        end)

        _zO6HrKjK = _zO6HrKjK + 45
    end

    -- YouTube Button
    if _z3425XEe.ShowYoutube then
        local _zjVCxmM3 = Instance.new(string.char(84, 101, 120, 116, 66, 117, 116, 116, 111, 110), _zZyaNyhL)
        _zjVCxmM3.Size = UDim2.new(0.85, 0, 0, 35)
        _zjVCxmM3.Position = UDim2.new(0.075, 0, 0, _zO6HrKjK)
        _zjVCxmM3.Text = string.char(32, 32, 32, 32, 32, 32, 83, 85, 66, 83, 67, 82, 73, 66, 69, 32, 89, 79, 85, 84, 85, 66, 69)
        _zjVCxmM3.Font = string.char(71, 111, 116, 104, 97, 109, 66, 111, 108, 100);
        _zjVCxmM3.TextSize = 14
        _zjVCxmM3.BackgroundColor3 = Color3.fromRGB(255, 0, 0)
        _zjVCxmM3.TextColor3 = Color3.new(1, 1, 1)
        Instance.new(string.char(85, 73, 67, 111, 114, 110, 101, 114), _zjVCxmM3)
        _z2d8PBCw(_zjVCxmM3)

        local _zonnQmX0 = Instance.new(string.char(73, 109, 97, 103, 101, 76, 97, 98, 101, 108), _zjVCxmM3)
        _zonnQmX0.Size = UDim2.new(0, 20, 0, 20)
        _zonnQmX0.Position = UDim2.new(0.1, 0, 0.5, -10)
        _zonnQmX0.BackgroundTransparency = 1
        _zonnQmX0.Image = string.char(114, 98, 120, 97, 115, 115, 101, 116, 105, 100, 58, 47, 47, 56, 50, 53, 51, 50, 57, 56, 57, 48, 49, 55, 56, 48, 52)

        _zjVCxmM3.MouseButton1Click:Connect(function()
            _zF944eBT(_z3425XEe.YoutubeURL)
            local _zYw0mUNj = _zZyaNyhL:FindFirstChild(string.char(83, 116, 97, 116, 117, 115, 76, 97, 98, 101, 108))
            if _zYw0mUNj then
                _zYw0mUNj.Text = string.char(89, 111, 117, 84, 117, 98, 101, 32, 76, 105, 110, 107, 32, 67, 111, 112, 105, 101, 100, 33)
                _zYw0mUNj.TextColor3 = Color3.fromRGB(255, 0, 0)
            end
        end)

        _zO6HrKjK = _zO6HrKjK + 45
    end

    -- Key Input Box
    local _zj9sxmOx = Instance.new(string.char(84, 101, 120, 116, 66, 111, 120), _zZyaNyhL)
    _zj9sxmOx.Size = UDim2.new(0.85, 0, 0, 40)
    _zj9sxmOx.Position = UDim2.new(0.075, 0, 0, _zO6HrKjK + 15)
    _zj9sxmOx.PlaceholderText = string.char(69, 110, 116, 101, 114, 32, 75, 101, 121, 46, 46, 46)
    _zj9sxmOx.Text = ""
    _zj9sxmOx.Font = Enum.Font.GothamSemibold;
    _zj9sxmOx.TextSize = 14
    _zj9sxmOx.BackgroundColor3 = Color3.fromRGB(25, 25, 25);
    _zj9sxmOx.TextColor3 = Color3.new(1, 1, 1)
    Instance.new(string.char(85, 73, 67, 111, 114, 110, 101, 114), _zj9sxmOx)

    local _zm3GoRci = Instance.new(string.char(84, 101, 120, 116, 66, 117, 116, 116, 111, 110), _zZyaNyhL)
    _zm3GoRci.Size = UDim2.new(0.4, 0, 0, 40)
    _zm3GoRci.Position = UDim2.new(0.075, 0, 0, _zO6HrKjK + 65)
    _zm3GoRci.Text = string.char(86, 69, 82, 73, 70, 89)
    _zm3GoRci.Font = string.char(71, 111, 116, 104, 97, 109, 66, 111, 108, 100);
    _zm3GoRci.TextSize = 14
    _zm3GoRci.BackgroundColor3 = Color3.fromRGB(0, 120, 255);
    _zm3GoRci.TextColor3 = Color3.new(1, 1, 1)
    Instance.new(string.char(85, 73, 67, 111, 114, 110, 101, 114), _zm3GoRci)

    local _zRDc3996 = Instance.new(string.char(84, 101, 120, 116, 66, 117, 116, 116, 111, 110), _zZyaNyhL)
    _zRDc3996.Size = UDim2.new(0.4, 0, 0, 40)
    _zRDc3996.Position = UDim2.new(0.525, 0, 0, _zO6HrKjK + 65)
    _zRDc3996.Text = string.char(71, 69, 84, 32, 75, 69, 89)
    _zRDc3996.Font = string.char(71, 111, 116, 104, 97, 109, 66, 111, 108, 100);
    _zRDc3996.TextSize = 14
    _zRDc3996.BackgroundColor3 = Color3.fromRGB(35, 35, 35);
    _zRDc3996.TextColor3 = Color3.new(1, 1, 1)
    Instance.new(string.char(85, 73, 67, 111, 114, 110, 101, 114), _zRDc3996)

    local _zMNOCmqz = Instance.new(string.char(84, 101, 120, 116, 76, 97, 98, 101, 108), _zZyaNyhL)
    _zMNOCmqz.Name = string.char(83, 116, 97, 116, 117, 115, 76, 97, 98, 101, 108)
    _zMNOCmqz.Size = UDim2.new(1, 0, 0, 30)
    _zMNOCmqz.Position = UDim2.new(0, 0, 0, _zO6HrKjK + 115)
    _zMNOCmqz.BackgroundTransparency = 1
    _zMNOCmqz.Text = string.char(87, 97, 105, 116, 105, 110, 103, 32, 102, 111, 114, 32, 105, 110, 112, 117, 116, 46, 46, 46)
    _zMNOCmqz.TextColor3 = Color3.fromRGB(150, 150, 150)
    _zMNOCmqz.Font = Enum.Font.Gotham;
    _zMNOCmqz.TextSize = 12

    -- Dynamically adjust main frame height based on active elements
    _zZyaNyhL.Size = UDim2.new(0, 340, 0, _zO6HrKjK + 160)

    -- Logic
    _zm3GoRci.MouseButton1Click:Connect(function()
        local _zeek5qfC = _zj9sxmOx.Text
        if _zeek5qfC == "" then _zMNOCmqz.Text = string.char(69, 110, 116, 101, 114, 32, 97, 32, 107, 101, 121, 33); return end
        _zMNOCmqz.Text = string.char(86, 101, 114, 105, 102, 121, 105, 110, 103, 46, 46, 46)
        local _zKwaxK4H, msg = _zaZU9VuQ(_zeek5qfC)
        if _zKwaxK4H then
            _zMNOCmqz.Text = string.char(83, 117, 99, 99, 101, 115, 115, 33, 32, 76, 111, 97, 100, 105, 110, 103, 46, 46, 46)
            _zMNOCmqz.TextColor3 = Color3.fromRGB(0, 255, 100)
            task.wait(0.5)
            _zoQfWjxN:Destroy()
            _zqjf57Ll()
        else
            _zMNOCmqz.Text = msg
            _zMNOCmqz.TextColor3 = Color3.fromRGB(255, 50, 50)
        end
    end)

    _zRDc3996.MouseButton1Click:Connect(function()
        _zMNOCmqz.Text = string.char(71, 101, 116, 116, 105, 110, 103, 32, 76, 105, 110, 107, 46, 46, 46)
        local _zn6FG4A7, link = _zHExQqCS()
        if _zn6FG4A7 then
            _zF944eBT(link)
            _zMNOCmqz.Text = string.char(76, 105, 110, 107, 32, 67, 111, 112, 105, 101, 100, 33)
            _zMNOCmqz.TextColor3 = Color3.fromRGB(0, 170, 255)
        else
            _zMNOCmqz.Text = string.char(69, 114, 114, 111, 114, 58, 32) .. tostring(link)
        end
    end)

    -- Auto Check Saved Key
    if isfile and isfile(_z3425XEe.KeyFileName) then
        local _z2SF4zle = readfile(_z3425XEe.KeyFileName)
        if _z2SF4zle = "" then
            _zMNOCmqz.Text = string.char(70, 111, 117, 110, 100, 32, 115, 97, 118, 101, 100, 32, 107, 101, 121, 44, 32, 118, 101, 114, 105, 102, 121, 105, 110, 103, 46, 46, 46)
            task.spawn(function()
                local _zh51vtDD, msg = _zaZU9VuQ(_z2SF4zle)
                if _zh51vtDD then
                    _zMNOCmqz.Text = string.char(65, 117, 116, 111, 45, 108, 111, 103, 105, 110, 32, 115, 117, 99, 99, 101, 115, 115, 33)
                    _zMNOCmqz.TextColor3 = Color3.fromRGB(0, 255, 100)
                    task.wait(0.5)
                    _zoQfWjxN:Destroy()
                    _zqjf57Ll()
                else
                    _zMNOCmqz.Text = string.char(83, 97, 118, 101, 100, 32, 107, 101, 121, 32, 101, 120, 112, 105, 114, 101, 100, 32, 111, 114, 32, 105, 110, 118, 97, 108, 105, 100, 46)
                    _zMNOCmqz.TextColor3 = Color3.fromRGB(255, 150, 0)
                end
            end)
        end
    end
end

-- Check if main script GUI is already open
local _zehEWzcA = game:GetService(string.char(80, 108, 97, 121, 101, 114, 115)).LocalPlayer
local _z3rocBG3 = _zehEWzcA:WaitForChild(string.char(80, 108, 97, 121, 101, 114, 71, 117, 105))

if _z3rocBG3:FindFirstChild(_z3425XEe.MainGuiName) then
    _zqjf57Ll() -- Run if main script is already active
    return
end

-- Initialize Key System GUI
_zuHl9KDG()
