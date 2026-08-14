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
local ubgyIGcyzK_ = {
    -- [1] PlatoBoost Settings
    ServiceId       = 29627, -- Your PlatoBoost Service ID
    PlatoSecret     = string.char(57,99,99,55,55,56,99,55,45,98,49,101,49,45,52,53,48,54,45,98,98,54,100,45,101,102,57,49,99,51,52,52,51,55,100,50), -- Your PlatoBoost Secret Key

    -- [2] Anti-Bypass / Global Secret Variable
    Secret          = string.char(118,104,101,111,49,50,51), -- This makes the script ONLY run from the key script. Even if they copy the original obfuscated script to bypass the key, they won't be able to!

    -- [3] Scripts & Links
    MainScriptURL   = string.char(104,116,116,112,115,58,47,47,114,97,119,46,103,105,116,104,117,98,117,115,101,114,99,111,110,116,101,110,116,46,99,111,109,47,90,104,101,118,86,118,47,115,105,101,45,121,45,104,117,98,47,114,101,102,115,47,104,101,97,100,115,47,109,97,105,110,47,115,99,114,105,112,116,46,108,117,97), -- The raw URL of your main script

    -- [4] Social Media Settings (Set to true to show, false to hide)
    ShowDiscord     = true,
    DiscordURL      = string.char(104,116,116,112,115,58,47,47,100,105,115,99,111,114,100,46,103,103,47,114,122,113,87,50,72,52,51,69,99),

    ShowInstagram   = false,
    InstagramURL    = string.char(104,116,116,112,115,58,47,47,119,119,119,46,105,110,115,116,97,103,114,97,109,46,99,111,109,47,111,121,98,48,105,47),

    ShowYoutube     = false,
    YoutubeURL      = string.char(104,116,116,112,115,58,47,47,119,119,119,46,121,111,117,116,117,98,101,46,99,111,109,47,99,104,97,110,110,101,108,47,85,67,65,108,88,88,86,49,72,98,118,102,55,87,98,102,88,65,82,117,86,116,105,81),

    -- [5] File System
    KeyFileName     = string.char(77,121,107,101,121,46,116,120,116), -- The name of the file where the valid key will be saved for auto-login

    -- [6] GUI Management
    OldGuiName      = string.char(83,73,69,32,89,32,72,85,66), -- Name of the old GUI to destroy if it's already open
    MainGuiName     = string.char(83,73,69,32,89,32,72,85,66), -- Name of the main script's GUI to check if it's already executing

    -- [7] Hub Information & UI Text
    HubName         = string.char(83,73,69,32,89), -- The main title shown at the top of the GUI
    HubDescription  = string.char(72,101,108,108,111,32,84,104,101,114,101,33,32,84,104,97,110,107,121,111,117,32,102,111,114,32,117,115,105,110,103,32,83,105,101,32,89,32,72,117,98,44,32,102,111,114,32,109,111,114,101,32,115,99,114,105,112,116,32,106,111,105,110,32,116,111,32,111,117,114,32,100,105,115,99,111,114,100) -- The text shown below the title
}

-------------------------------------------------------------------------------
--! LIBRARIES (JSON & CRYPTOGRAPHY) - DO NOT MODIFY
-------------------------------------------------------------------------------
local JkKd42AVl=2^32;local X_XxDeF2wKY=JkKd42AVl-1;local function Y_P6OsRYm9X(QBHMMm2p,mV5KQ4xUoqR)local GDWaBhqHY,CfSzbTIwAmd=0,1;while QBHMMm2p~=0 or mV5KQ4xUoqR~=0 do local b6uZQcklQ3,_UjjvlO=QBHMMm2p%2,mV5KQ4xUoqR%2;local Au9WIBnS1=(b6uZQcklQ3+_UjjvlO)%2;GDWaBhqHY=GDWaBhqHY+Au9WIBnS1*CfSzbTIwAmd;QBHMMm2p=math.floor(QBHMMm2p/2)mV5KQ4xUoqR=math.floor(mV5KQ4xUoqR/2)CfSzbTIwAmd=CfSzbTIwAmd*2 end;return GDWaBhqHY%JkKd42AVl end;local function _kCYVHOtsG(U_HXvdn_O,rPxf4AZ6,h11YZv1f,...)local YI1nxIHy;if rPxf4AZ6 then U_HXvdn_O=U_HXvdn_O%JkKd42AVl;rPxf4AZ6=rPxf4AZ6%JkKd42AVl;YI1nxIHy=Y_P6OsRYm9X(U_HXvdn_O,rPxf4AZ6)if h11YZv1f then YI1nxIHy=_kCYVHOtsG(YI1nxIHy,h11YZv1f,...)end;return YI1nxIHy elseif U_HXvdn_O then return U_HXvdn_O%JkKd42AVl else return 0 end end;local function g6qhbD1IW(UX03Y7JUw,u8wVr26uG,UbFCgQafQNN,...)local WdsJAlBjb;if u8wVr26uG then UX03Y7JUw=UX03Y7JUw%JkKd42AVl;u8wVr26uG=u8wVr26uG%JkKd42AVl;WdsJAlBjb=(UX03Y7JUw+u8wVr26uG-Y_P6OsRYm9X(UX03Y7JUw,u8wVr26uG))/2;if UbFCgQafQNN then WdsJAlBjb=g6qhbD1IW(WdsJAlBjb,UbFCgQafQNN,...)end;return WdsJAlBjb elseif UX03Y7JUw then return UX03Y7JUw%JkKd42AVl else return X_XxDeF2wKY end end;local function U_E0xwRh(lRUueJIE)return X_XxDeF2wKY-lRUueJIE end;local function YnjqUD3(dTAaHvMj3v,a9ZXQz4tJLWg)if a9ZXQz4tJLWg<0 then return lshift(dTAaHvMj3v,-a9ZXQz4tJLWg)end;return math.floor(dTAaHvMj3v%2^32/2^a9ZXQz4tJLWg)end;local function bQOr_DVu89XF(mAIYXgG,Cka6VNF)if Cka6VNF>31 or Cka6VNF<-31 then return 0 end;return YnjqUD3(mAIYXgG%JkKd42AVl,Cka6VNF)end;local function HHil6MfbgTFS(_At_xdFS,A4FIc6qL)if A4FIc6qL<0 then return bQOr_DVu89XF(_At_xdFS,-A4FIc6qL)end;return _At_xdFS*2^A4FIc6qL%2^32 end;local function fR3tcwbGgYe(Av8Zv0Eq7U,qI8CEZT6fp)Av8Zv0Eq7U=Av8Zv0Eq7U%JkKd42AVl;qI8CEZT6fp=qI8CEZT6fp%32;local z1HEEekw5U87=g6qhbD1IW(Av8Zv0Eq7U,2^qI8CEZT6fp-1)return bQOr_DVu89XF(Av8Zv0Eq7U,qI8CEZT6fp)+HHil6MfbgTFS(z1HEEekw5U87,32-qI8CEZT6fp)end;local ayozbkT_nr={0x428a2f98,0x71374491,0xb5c0fbcf,0xe9b5dba5,0x3956c25b,0x59f111f1,0x923f82a4,0xab1c5ed5,0xd807aa98,0x12835b01,0x243185be,0x550c7dc3,0x72be5d74,0x80deb1fe,0x9bdc06a7,0xc19bf174,0xe49b69c1,0xefbe4786,0x0fc19dc6,0x240ca1cc,0x2de92c6f,0x4a7484aa,0x5cb0a9dc,0x76f988da,0x983e5152,0xa831c66d,0xb00327c8,0xbf597fc7,0xc6e00bf3,0xd5a79147,0x06ca6351,0x14292967,0x27b70a85,0x2e1b2138,0x4d2c6dfc,0x53380d13,0x650a7354,0x766a0abb,0x81c2c92e,0x92722c85,0xa2bfe8a1,0xa81a664b,0xc24b8b70,0xc76c51a3,0xd192e819,0xd6990624,0xf40e3585,0x106aa070,0x19a4c116,0x1e376c08,0x2748774c,0x34b0bcb5,0x391c0cb3,0x4ed8aa4a,0x5b9cca4f,0x682e6ff3,0x748f82ee,0x78a5636f,0x84c87814,0x8cc70208,0x90befffa,0xa4506ceb,0xbef9a3f7,0xc67178f2}local function jZ27SR1VDpD4(jgO2Bsfdd5ME)return string.gsub(jgO2Bsfdd5ME,string.char(46),function(jhBfyeGa)return string.format(string.char(37,48,50,120),string.byte(jhBfyeGa))end)end;local function kCN8LMs(zpzJOPmw6N4G,Ya9FPIl5i)local qf_0QysEai=""for IIUXP7k8=1,A do local _lMnAM3UL=zpzJOPmw6N4G%256;qf_0QysEai=string.char(_lMnAM3UL)..qf_0QysEai;zpzJOPmw6N4G=(zpzJOPmw6N4G-_lMnAM3UL)/256 end;return qf_0QysEai end;local function tAf9BSe9(ubvdqELEyg,JH5O9v6a)local RxycCEl=0;for XZQsN2sTDc7x=B,B+3 do RxycCEl=RxycCEl*256+string.byte(ubvdqELEyg,XZQsN2sTDc7x)end;return RxycCEl end;local function JcoWw_Khj(G4XNEBUXlQ7G,emGeuWAYB)local bOnjx2IniGv=64-(emGeuWAYB+9)%64;emGeuWAYB=kCN8LMs(8*emGeuWAYB,8)G4XNEBUXlQ7G=G4XNEBUXlQ7G..string.char(128)..string.rep(string.char(0),bOnjx2IniGv)..emGeuWAYB;assert(#G4XNEBUXlQ7G%64==0)return G4XNEBUXlQ7G end;local function w5ort4nPX(PwCwvcujsW)PwCwvcujsW[1]=0x6a09e667;PwCwvcujsW[2]=0xbb67ae85;PwCwvcujsW[3]=0x3c6ef372;PwCwvcujsW[4]=0xa54ff53a;PwCwvcujsW[5]=0x510e527f;PwCwvcujsW[6]=0x9b05688c;PwCwvcujsW[7]=0x1f83d9ab;PwCwvcujsW[8]=0x5be0cd19;return PwCwvcujsW end;local function dK27x7LACJhf(TTffGYrEa,KRkeChnqLqDq,DLm_ttHC8b)local FlrU4ls3={}for UstT68358VwO=1,16 do FlrU4ls3[UstT68358VwO]=tAf9BSe9(TTffGYrEa,KRkeChnqLqDq+(UstT68358VwO-1)*4)end;for UW5mOZTEf=17,64 do local iAHPE4Aq=FlrU4ls3[UW5mOZTEf-15]local OE0ZWyf2=_kCYVHOtsG(fR3tcwbGgYe(iAHPE4Aq,7),fR3tcwbGgYe(iAHPE4Aq,18),bQOr_DVu89XF(iAHPE4Aq,3))iAHPE4Aq=FlrU4ls3[UW5mOZTEf-2]FlrU4ls3[UW5mOZTEf]=(FlrU4ls3[UW5mOZTEf-16]+OE0ZWyf2+FlrU4ls3[UW5mOZTEf-7]+_kCYVHOtsG(fR3tcwbGgYe(iAHPE4Aq,17),fR3tcwbGgYe(iAHPE4Aq,19),bQOr_DVu89XF(iAHPE4Aq,10)))%JkKd42AVl end;local HUWQpLps,AUh9DD2LZz,ySavX99Bh6,IY0hQXai,v2ijWIbFS3d,XemBnvQ,BwVji9TEf6,K3T7QZzeh=DLm_ttHC8b[1],DLm_ttHC8b[2],DLm_ttHC8b[3],DLm_ttHC8b[4],DLm_ttHC8b[5],DLm_ttHC8b[6],DLm_ttHC8b[7],DLm_ttHC8b[8]for ENrugTZoAW=1,64 do local js8UqSyvExWX=_kCYVHOtsG(fR3tcwbGgYe(HUWQpLps,2),fR3tcwbGgYe(HUWQpLps,13),fR3tcwbGgYe(HUWQpLps,22))local DFkUFQ7OIitr=_kCYVHOtsG(g6qhbD1IW(HUWQpLps,AUh9DD2LZz),g6qhbD1IW(HUWQpLps,ySavX99Bh6),g6qhbD1IW(AUh9DD2LZz,ySavX99Bh6))local pJNIIga0m=(js8UqSyvExWX+DFkUFQ7OIitr)%JkKd42AVl;local g6GavNvzcdjM=_kCYVHOtsG(fR3tcwbGgYe(v2ijWIbFS3d,6),fR3tcwbGgYe(v2ijWIbFS3d,11),fR3tcwbGgYe(v2ijWIbFS3d,25))local LCuhEito4=_kCYVHOtsG(g6qhbD1IW(v2ijWIbFS3d,XemBnvQ),g6qhbD1IW(U_E0xwRh(v2ijWIbFS3d),BwVji9TEf6))local o_11BK8CZh=(K3T7QZzeh+g6GavNvzcdjM+LCuhEito4+ayozbkT_nr[ENrugTZoAW]+FlrU4ls3[ENrugTZoAW])%JkKd42AVl;K3T7QZzeh=BwVji9TEf6;BwVji9TEf6=XemBnvQ;XemBnvQ=v2ijWIbFS3d;v2ijWIbFS3d=(IY0hQXai+o_11BK8CZh)%JkKd42AVl;IY0hQXai=ySavX99Bh6;ySavX99Bh6=AUh9DD2LZz;AUh9DD2LZz=HUWQpLps;HUWQpLps=(o_11BK8CZh+pJNIIga0m)%JkKd42AVl end;DLm_ttHC8b[1]=(DLm_ttHC8b[1]+HUWQpLps)%JkKd42AVl;DLm_ttHC8b[2]=(DLm_ttHC8b[2]+AUh9DD2LZz)%JkKd42AVl;DLm_ttHC8b[3]=(DLm_ttHC8b[3]+ySavX99Bh6)%JkKd42AVl;DLm_ttHC8b[4]=(DLm_ttHC8b[4]+IY0hQXai)%JkKd42AVl;DLm_ttHC8b[5]=(DLm_ttHC8b[5]+v2ijWIbFS3d)%JkKd42AVl;DLm_ttHC8b[6]=(DLm_ttHC8b[6]+XemBnvQ)%JkKd42AVl;DLm_ttHC8b[7]=(DLm_ttHC8b[7]+BwVji9TEf6)%JkKd42AVl;DLm_ttHC8b[8]=(DLm_ttHC8b[8]+K3T7QZzeh)%JkKd42AVl end;local function PHcSnRcOU(EMLjm5u)EMLjm5u=JcoWw_Khj(EMLjm5u,#EMLjm5u)local wgCpYol=w5ort4nPX({})for QU2k431R7=1,#F,64 do dK27x7LACJhf(EMLjm5u,QU2k431R7,wgCpYol)end;return jZ27SR1VDpD4(kCN8LMs(wgCpYol[1],4)..kCN8LMs(wgCpYol[2],4)..kCN8LMs(wgCpYol[3],4)..kCN8LMs(wgCpYol[4],4)..kCN8LMs(wgCpYol[5],4)..kCN8LMs(wgCpYol[6],4)..kCN8LMs(wgCpYol[7],4)..kCN8LMs(wgCpYol[8],4))end;local i5T3I1WWcy;local R2OLwhnc5X={[string.char(92)]=string.char(92),[string.char(34)]=string.char(34),[string.char(8)]=string.char(98),[string.char(12)]=string.char(102),[string.char(10)]=string.char(110),[string.char(13)]=string.char(114),[string.char(9)]=string.char(116)}local wwbeHKOFikt={[string.char(47)]=string.char(47)}for wY3L83RMa5Qm,R in pairs(l)do wwbeHKOFikt[XemBnvQ]=wY3L83RMa5Qm end;local jIWFS_JX_2qf=function(tEiQGFloAA)returnstring.char(92)..(R2OLwhnc5X[tEiQGFloAA]or string.format(string.char(117,37,48,52,120),tEiQGFloAA:byte()))end;local xke69lmOv=function(XsSjXCI66Fo)returnstring.char(110,117,108,108)end;local n0DTFfwo=function(HC6uXWK3,RpMdmVMa)local VA_68taiO={}RpMdmVMa=RpMdmVMa or{}if RpMdmVMa[HC6uXWK3]then error(string.char(99,105,114,99,117,108,97,114,32,114,101,102,101,114,101,110,99,101))end;RpMdmVMa[HC6uXWK3]=true;if rawget(HC6uXWK3,1)~=nil or next(HC6uXWK3)==nil then local XiFPA4G=0;for l8NBpvDym in pairs(M)do if type(l8NBpvDym)~=string.char(110,117,109,98,101,114)then error(string.char(105,110,118,97,108,105,100,32,116,97,98,108,101,58,32,109,105,120,101,100,32,111,114,32,105,110,118,97,108,105,100,32,107,101,121,32,116,121,112,101,115))end;XiFPA4G=XiFPA4G+1 end;if XiFPA4G~=#HC6uXWK3 then error(string.char(105,110,118,97,108,105,100,32,116,97,98,108,101,58,32,115,112,97,114,115,101,32,97,114,114,97,121))end;for Uet7CAa6PJ,R in ipairs(M)do table.insert(VA_68taiO,i5T3I1WWcy(XemBnvQ,RpMdmVMa))end;RpMdmVMa[HC6uXWK3]=nil;returnstring.char(91)..table.concat(VA_68taiO,string.char(44))..string.char(93)else for rD4yCEMr,R in pairs(M)do if type(rD4yCEMr)~=string.char(115,116,114,105,110,103)then error(string.char(105,110,118,97,108,105,100,32,116,97,98,108,101,58,32,109,105,120,101,100,32,111,114,32,105,110,118,97,108,105,100,32,107,101,121,32,116,121,112,101,115))end;table.insert(VA_68taiO,i5T3I1WWcy(rD4yCEMr,RpMdmVMa)..string.char(58)..i5T3I1WWcy(XemBnvQ,RpMdmVMa))end;RpMdmVMa[HC6uXWK3]=nil;returnstring.char(123)..table.concat(VA_68taiO,string.char(44))..string.char(125)end end;local xgzxugTv5=function(NQdrvwgwVUW)returnstring.char(34)..NQdrvwgwVUW:gsub(string.char(91,37,122,1,45,31,92,34,93),jIWFS_JX_2qf)..string.char(34)end;local IEfaWMjg8Hu7=function(ED5zCnby06)if ED5zCnby06~=ED5zCnby06 or ED5zCnby06<=-math.huge or ED5zCnby06>=math.huge then error(string.char(117,110,101,120,112,101,99,116,101,100,32,110,117,109,98,101,114,32,118,97,108,117,101,32,39)..tostring(ED5zCnby06)..string.char(39))end;return string.format(string.char(37,46,49,52,103),ED5zCnby06)end;local iAurH28={[string.char(110,105,108)]=B,[string.char(116,97,98,108,101)]=v,[string.char(115,116,114,105,110,103)]=g,[string.char(110,117,109,98,101,114)]=a1,[string.char(98,111,111,108,101,97,110)]=tostring}i5T3I1WWcy=function(SSqbSTE3n,xcCbjSKYkT)local K30d_Ds39=type(SSqbSTE3n)local enuwj0XT=iAurH28[K30d_Ds39]if enuwj0XT then return enuwj0XT(SSqbSTE3n,xcCbjSKYkT)end;error(string.char(117,110,101,120,112,101,99,116,101,100,32,116,121,112,101,32,39)..K30d_Ds39..string.char(39))end;local Af9iDzbaYR4a=function(DMnVaOB4aqa)return i5T3I1WWcy(DMnVaOB4aqa)end;local e0mzdMBxg;local hViq9R4zg=function(...)local BxKuf0OFTy9={}for Q8QgH1Lep=1,select(string.char(35),...)do BxKuf0OFTy9[select(Q8QgH1Lep,...)]=true end;return BxKuf0OFTy9 end;local qgCULx9PjW=hViq9R4zg(string.char(32),string.char(9),string.char(13),string.char(10))local WGyNMeOH=hViq9R4zg(string.char(32),string.char(9),string.char(13),string.char(10),string.char(93),string.char(125),string.char(44))local SOmNeRM9v=hViq9R4zg(string.char(92),string.char(47),string.char(34),string.char(98),string.char(102),string.char(110),string.char(114),string.char(116),string.char(117))local sHkhwGPnjcXe=hViq9R4zg(string.char(116,114,117,101),string.char(102,97,108,115,101),string.char(110,117,108,108))local QkFGP01a4enB={[string.char(116,114,117,101)]=true,[string.char(102,97,108,115,101)]=false,[string.char(110,117,108,108)]=nil}local uZrKSHvGp=function(EgGae9PH,TEyTGtxP,zt8FN_xlS,TWH3TV2h)for rLRPh4ELdA=a9,#a8 do if zt8FN_xlS[EgGae9PH:sub(rLRPh4ELdA,rLRPh4ELdA)]~=TWH3TV2h then return rLRPh4ELdA end end;return#EgGae9PH+1 end;local l7xb2dbTE2T6=function(ZnJAmDqay,zhpN0YsLZ,oGErmP2dq)local fy6paNboOygU=1;local CB5PzwZnhn=1;for DMZxE10=1,a9-1 do CB5PzwZnhn=CB5PzwZnhn+1;if ZnJAmDqay:sub(DMZxE10,DMZxE10)==string.char(10)then fy6paNboOygU=fy6paNboOygU+1;CB5PzwZnhn=1 end end;error(string.format(string.char(37,115,32,97,116,32,108,105,110,101,32,37,100,32,99,111,108,32,37,100),oGErmP2dq,fy6paNboOygU,CB5PzwZnhn))end;local nZFD5HvyB=function(trx7PA30VTJK)local DWhDfphnxmNx=math.floor;if trx7PA30VTJK<=0x7f then return string.char(trx7PA30VTJK)elseif trx7PA30VTJK<=0x7ff then return string.char(DWhDfphnxmNx(trx7PA30VTJK/64)+192,trx7PA30VTJK%64+128)elseif trx7PA30VTJK<=0xffff then return string.char(DWhDfphnxmNx(trx7PA30VTJK/4096)+224,DWhDfphnxmNx(trx7PA30VTJK%4096/64)+128,trx7PA30VTJK%64+128)elseif trx7PA30VTJK<=0x10ffff then return string.char(DWhDfphnxmNx(trx7PA30VTJK/262144)+240,DWhDfphnxmNx(trx7PA30VTJK%262144/4096)+128,DWhDfphnxmNx(trx7PA30VTJK%4096/64)+128,trx7PA30VTJK%64+128)end;error(string.format(string.char(105,110,118,97,108,105,100,32,117,110,105,99,111,100,101,32,99,111,100,101,112,111,105,110,116,32,39,37,120,39),trx7PA30VTJK))end;local WHNujxoVh=function(Uef_0LA)local qn6dbezwiC=tonumber(Uef_0LA:sub(1,4),16)local QXwq3abFaoq=tonumber(Uef_0LA:sub(7,10),16)if QXwq3abFaoq then return nZFD5HvyB((qn6dbezwiC-0xd800)*0x400+QXwq3abFaoq-0xdc00+0x10000)else return nZFD5HvyB(qn6dbezwiC)end end;local OZb_IxqkDUS=function(awGlMUyT6,zcUS96iU)local QSpLjTl=""local MytcWeCc=zcUS96iU+1;local ioiSWi7QeE=MytcWeCc;while MytcWeCc<=#awGlMUyT6 do local ZPhMQzXM3MY8=awGlMUyT6:byte(MytcWeCc)if ZPhMQzXM3MY8<32 then l7xb2dbTE2T6(awGlMUyT6,MytcWeCc,string.char(99,111,110,116,114,111,108,32,99,104,97,114,97,99,116,101,114,32,105,110,32,115,116,114,105,110,103))elseif ZPhMQzXM3MY8==92 then QSpLjTl=QSpLjTl..awGlMUyT6:sub(ioiSWi7QeE,MytcWeCc-1)MytcWeCc=MytcWeCc+1;local KQi_YfdjcfU=awGlMUyT6:sub(MytcWeCc,MytcWeCc)if KQi_YfdjcfU==string.char(117)then local LkSSg4rf5e=awGlMUyT6:match(string.char(94,91,100,68,93,91,56,57,97,65,98,66,93,37,120,37,120,92,117,37,120,37,120,37,120,37,120),MytcWeCc+1)or awGlMUyT6:match(string.char(94,37,120,37,120,37,120,37,120),MytcWeCc+1)or l7xb2dbTE2T6(awGlMUyT6,MytcWeCc-1,string.char(105,110,118,97,108,105,100,32,117,110,105,99,111,100,101,32,101,115,99,97,112,101,32,105,110,32,115,116,114,105,110,103))QSpLjTl=QSpLjTl..WHNujxoVh(LkSSg4rf5e)MytcWeCc=MytcWeCc+#LkSSg4rf5e else if not SOmNeRM9v[KQi_YfdjcfU]then l7xb2dbTE2T6(awGlMUyT6,MytcWeCc-1,string.char(105,110,118,97,108,105,100,32,101,115,99,97,112,101,32,99,104,97,114,32,39)..KQi_YfdjcfU..string.char(39,32,105,110,32,115,116,114,105,110,103))end;QSpLjTl=QSpLjTl..wwbeHKOFikt[KQi_YfdjcfU]end;ioiSWi7QeE=MytcWeCc+1 elseif ZPhMQzXM3MY8==34 then QSpLjTl=QSpLjTl..awGlMUyT6:sub(ioiSWi7QeE,MytcWeCc-1)return QSpLjTl,MytcWeCc+1 end;MytcWeCc=MytcWeCc+1 end;l7xb2dbTE2T6(awGlMUyT6,zcUS96iU,string.char(101,120,112,101,99,116,101,100,32,99,108,111,115,105,110,103,32,113,117,111,116,101,32,102,111,114,32,115,116,114,105,110,103))end;local sDbyeIgq4u=function(Drug2JJwoS3,_w6HsP41B)local TAaUcc0rg=uZrKSHvGp(Drug2JJwoS3,_w6HsP41B,WGyNMeOH)local Nvv1XQ9XNwT=Drug2JJwoS3:sub(_w6HsP41B,TAaUcc0rg-1)local _Mhqp8M=tonumber(Nvv1XQ9XNwT)if not _Mhqp8M then l7xb2dbTE2T6(Drug2JJwoS3,_w6HsP41B,string.char(105,110,118,97,108,105,100,32,110,117,109,98,101,114,32,39)..Nvv1XQ9XNwT..string.char(39))end;return _Mhqp8M,TAaUcc0rg end;local r8BRvVlF=function(RdbAWRC5aBY,AgiwlTbw)local d_ymXzl1=uZrKSHvGp(RdbAWRC5aBY,AgiwlTbw,WGyNMeOH)local Mbhs7VZnQf7=RdbAWRC5aBY:sub(AgiwlTbw,d_ymXzl1-1)if not sHkhwGPnjcXe[Mbhs7VZnQf7]then l7xb2dbTE2T6(RdbAWRC5aBY,AgiwlTbw,string.char(105,110,118,97,108,105,100,32,108,105,116,101,114,97,108,32,39)..Mbhs7VZnQf7..string.char(39))end;return QkFGP01a4enB[Mbhs7VZnQf7],d_ymXzl1 end;local Fr3lRRM=function(ufIs6fgez,RowquS214sp)local fcRGeTQ={}local k9GCwNZ_=1;RowquS214sp=RowquS214sp+1;while 1 do local k4GhAeV;RowquS214sp=uZrKSHvGp(ufIs6fgez,RowquS214sp,qgCULx9PjW,true)if ufIs6fgez:sub(RowquS214sp,RowquS214sp)==string.char(93)then RowquS214sp=RowquS214sp+1;break end;k4GhAeV,RowquS214sp=e0mzdMBxg(ufIs6fgez,RowquS214sp)fcRGeTQ[k9GCwNZ_]=k4GhAeV;k9GCwNZ_=k9GCwNZ_+1;RowquS214sp=uZrKSHvGp(ufIs6fgez,RowquS214sp,qgCULx9PjW,true)local cclaH_lGI=ufIs6fgez:sub(RowquS214sp,RowquS214sp)RowquS214sp=RowquS214sp+1;if cclaH_lGI==string.char(93)then break end;if cclaH_lGI~=string.char(44)then l7xb2dbTE2T6(ufIs6fgez,RowquS214sp,string.char(101,120,112,101,99,116,101,100,32,39,93,39,32,111,114,32,39,44,39))end end;return fcRGeTQ,RowquS214sp end;local Y_r29nPe8L=function(wEBWeat,jkz24s2cF5)local mHedMssXUt0={}jkz24s2cF5=jkz24s2cF5+1;while 1 do local nm7TdOyk,q4IAT50b;jkz24s2cF5=uZrKSHvGp(wEBWeat,jkz24s2cF5,qgCULx9PjW,true)if wEBWeat:sub(jkz24s2cF5,jkz24s2cF5)==string.char(125)then jkz24s2cF5=jkz24s2cF5+1;break end;if wEBWeat:sub(jkz24s2cF5,jkz24s2cF5)~=string.char(34)then l7xb2dbTE2T6(wEBWeat,jkz24s2cF5,string.char(101,120,112,101,99,116,101,100,32,115,116,114,105,110,103,32,102,111,114,32,107,101,121))end;nm7TdOyk,jkz24s2cF5=e0mzdMBxg(wEBWeat,jkz24s2cF5)jkz24s2cF5=uZrKSHvGp(wEBWeat,jkz24s2cF5,qgCULx9PjW,true)if wEBWeat:sub(jkz24s2cF5,jkz24s2cF5)~=string.char(58)then l7xb2dbTE2T6(wEBWeat,jkz24s2cF5,string.char(101,120,112,101,99,116,101,100,32,39,58,39,32,97,102,116,101,114,32,107,101,121))end;jkz24s2cF5=uZrKSHvGp(wEBWeat,jkz24s2cF5+1,qgCULx9PjW,true)q4IAT50b,jkz24s2cF5=e0mzdMBxg(wEBWeat,jkz24s2cF5)mHedMssXUt0[nm7TdOyk]=q4IAT50b;jkz24s2cF5=uZrKSHvGp(wEBWeat,jkz24s2cF5,qgCULx9PjW,true)local KaOUSDfXWm3_=wEBWeat:sub(jkz24s2cF5,jkz24s2cF5)jkz24s2cF5=jkz24s2cF5+1;if KaOUSDfXWm3_==string.char(125)then break end;if KaOUSDfXWm3_~=string.char(44)then l7xb2dbTE2T6(wEBWeat,jkz24s2cF5,string.char(101,120,112,101,99,116,101,100,32,39,125,39,32,111,114,32,39,44,39))end end;return mHedMssXUt0,jkz24s2cF5 end;local e75aOuu={[string.char(34)]=ak,[string.char(48)]=ao,[string.char(49)]=ao,[string.char(50)]=ao,[string.char(51)]=ao,[string.char(52)]=ao,[string.char(53)]=ao,[string.char(54)]=ao,[string.char(55)]=ao,[string.char(56)]=ao,[string.char(57)]=ao,[string.char(45)]=ao,[string.char(116)]=ap,[string.char(102)]=ap,[string.char(110)]=ap,[string.char(91)]=ar,[string.char(123)]=at}e0mzdMBxg=function(MnmMNCGi,dlNB4Ym69g)local Uf67EldSz=MnmMNCGi:sub(dlNB4Ym69g,dlNB4Ym69g)local LzXmpSlJl5U=e75aOuu[Uf67EldSz]if LzXmpSlJl5U then return LzXmpSlJl5U(MnmMNCGi,dlNB4Ym69g)end;l7xb2dbTE2T6(MnmMNCGi,dlNB4Ym69g,string.char(117,110,101,120,112,101,99,116,101,100,32,99,104,97,114,97,99,116,101,114,32,39)..Uf67EldSz..string.char(39))end;local b2ckLpWqEFL=function(H2Np7i5WT6f)if type(H2Np7i5WT6f)~=string.char(115,116,114,105,110,103)then error(string.char(101,120,112,101,99,116,101,100,32,97,114,103,117,109,101,110,116,32,111,102,32,116,121,112,101,32,115,116,114,105,110,103,44,32,103,111,116,32)..type(H2Np7i5WT6f))end;local hzvkFZ3eszE,g4fVIMtB=e0mzdMBxg(H2Np7i5WT6f,uZrKSHvGp(H2Np7i5WT6f,1,qgCULx9PjW,true))g4fVIMtB=uZrKSHvGp(H2Np7i5WT6f,g4fVIMtB,qgCULx9PjW,true)if g4fVIMtB<=#H2Np7i5WT6f then l7xb2dbTE2T6(H2Np7i5WT6f,g4fVIMtB,string.char(116,114,97,105,108,105,110,103,32,103,97,114,98,97,103,101))end;return hzvkFZ3eszE end;
local d4qlICp4, DtsIHiXG, kIN4Re55DGdG = Af9iDzbaYR4a, b2ckLpWqEFL, PHcSnRcOU;

-------------------------------------------------------------------------------
--! CORE FUNCTIONS (REQUESTS & VERIFICATION)
-------------------------------------------------------------------------------

local srWqJHPr = true -- Hidden from Config to avoid user confusion, but active for security

-- Safe request function for universal executor support
local function HyYOOEQI(NYvhRdkD)
    local V2lbZQr_ = request or http_request or syn_request or (http and http.request )
    if not V2lbZQr_ then return nil, string.char(72,84,84,80,32,114,101,113,117,101,115,116,115,32,110,111,116,32,115,117,112,112,111,114,116,101,100) end
    local CO6riism, qaLG01R = pcall(function() return V2lbZQr_(NYvhRdkD) end)
    if CO6riism and qaLG01R then return qaLG01R else return nil, string.char(67,111,110,110,101,99,116,105,111,110,32,69,114,114,111,114) end
end

local YmBFSmN3 = setclipboard or toclipboard or function() end
local hcL3qJdhneW, Jn_6nfs5S, XZZ0KxsI8, VE9_kIsH, blphd2CoQzxq = string.char, tostring, os.time, math.random, math.floor
local Q3pV0Mf = gethwid or function() return game:GetService(string.char(82,98,120,65,110,97,108,121,116,105,99,115,83,101,114,118,105,99,101)):GetClientId() end

local j8pQ727ze, JF57fI92NYId = "", 0
local tSPygH7XtSN = string.char(104,116,116,112,115,58,47,47,97,112,105,46,112,108,97,116,111,98,111,111,115,116,46,99,111,109)

-- Check server connectivity
local function E4bl3VQK73( )
    local ZoGJcDfrom = HyYOOEQI({Url = host .. string.char(47,112,117,98,108,105,99,47,99,111,110,110,101,99,116,105,118,105,116,121), Method = string.char(71,69,84)})
    if not ZoGJcDfrom or (ZoGJcDfrom.StatusCode ~= 200 and ZoGJcDfrom.StatusCode ~= 429) then
        tSPygH7XtSN = string.char(104,116,116,112,115,58,47,47,97,112,105,46,112,108,97,116,111,98,111,111,115,116,46,110,101,116)
    end
end
E4bl3VQK73( )

local function Ouzbdpk4()
    local zlPWUXK = ""
    for OkZac_5f0hf = 1, 16 do zlPWUXK = zlPWUXK .. hcL3qJdhneW(blphd2CoQzxq(VE9_kIsH() * (122 - 97 + 1)) + 97) end                                                                                             return zlPWUXK
end

-- Get player's key link
local function ZBOxiMJ8Qtsk()
    if JF57fI92NYId + (10*60) < XZZ0KxsI8() then
        local aaVacJpJ0, wfO04wI_OnN = HyYOOEQI({
            Url = host .. string.char(47,112,117,98,108,105,99,47,115,116,97,114,116),
            Method = string.char(80,79,83,84),
            Body = lEncode({service = Config.ServiceId, identifier = lDigest(fGetHwid())}),
            Headers = {[string.char(67,111,110,116,101,110,116,45,84,121,112,101)] = string.char(97,112,112,108,105,99,97,116,105,111,110,47,106,115,111,110)}
        })
        if aaVacJpJ0 and aaVacJpJ0.StatusCode == 200 then
            local efyYUzE6 = DtsIHiXG(aaVacJpJ0.Body)
            if efyYUzE6.success then
                j8pQ727ze = efyYUzE6.data.url
                JF57fI92NYId = XZZ0KxsI8()
                return true, j8pQ727ze
            end
        end
        return false, wfO04wI_OnN or string.char(83,101,114,118,101,114,32,85,110,114,101,97,99,104,97,98,108,101)
    end
    return true, j8pQ727ze
end

-- Verify key on input
local function XBG75YuWp(iexHHfHtrQLJ)
    local _WEBz_Kti = Ouzbdpk4()
    local fYx5Fhs4J7 = {identifier = lDigest(fGetHwid()), key = key}
    if srWqJHPr then fYx5Fhs4J7.nonce = _WEBz_Kti end

    local BjrRXwzl, qWyau6JH = HyYOOEQI({
        Url = host .. string.char(47,112,117,98,108,105,99,47,114,101,100,101,101,109,47) .. fToString(Config.ServiceId),
        Method = string.char(80,79,83,84),
        Body = lEncode(body),
        Headers = {[string.char(67,111,110,116,101,110,116,45,84,121,112,101)] = string.char(97,112,112,108,105,99,97,116,105,111,110,47,106,115,111,110)}
    })

    if BjrRXwzl and BjrRXwzl.StatusCode == 200 then
        local rGoGRLyD = DtsIHiXG(BjrRXwzl.Body)
        if rGoGRLyD.success and rGoGRLyD.data.valid then
            if srWqJHPr then
                if rGoGRLyD.data.hash == kIN4Re55DGdG(string.char(116,114,117,101) .. string.char(45) .. _WEBz_Kti .. string.char(45) .. ubgyIGcyzK_.PlatoSecret) then
                    if writefile then writefile(ubgyIGcyzK_.KeyFileName, iexHHfHtrQLJ) end
                    return true, string.char(83,117,99,99,101,115,115)
                end
                return false, string.char(73,110,116,101,103,114,105,116,121,32,67,104,101,99,107,32,70,97,105,108,101,100)
            end
            if writefile then writefile(ubgyIGcyzK_.KeyFileName, iexHHfHtrQLJ) end
            return true, string.char(83,117,99,99,101,115,115)
        end
        return false, rGoGRLyD.message or string.char(73,110,118,97,108,105,100,32,75,101,121)
    end
    return false, qWyau6JH or string.char(83,101,114,118,101,114,32,69,114,114,111,114)
end

-------------------------------------------------------------------------------
--! GUI & MAIN SCRIPT EXECUTION
-------------------------------------------------------------------------------

local function Du_fu1G7yNX()
    local yJ2cP2vHRdU = game:GetService(string.char(80,108,97,121,101,114,115)).LocalPlayer
    local IhHyZjwqPc6S = yJ2cP2vHRdU:WaitForChild(string.char(80,108,97,121,101,114,71,117,105))

    -- Destroy old GUI if it exists
    if IhHyZjwqPc6S:FindFirstChild(ubgyIGcyzK_.OldGuiName) then
        IhHyZjwqPc6S[ubgyIGcyzK_.OldGuiName]:Destroy()
        task.wait(0.1)
    end

    -- Set secret global variable to bypass main script protection
    _G[ubgyIGcyzK_.Secret] = true

    -- Execute main script
    loadstring(game:HttpGet(ubgyIGcyzK_.MainScriptURL))()
end

local function O3SiIRYjlJk7()
    local dCx_6dJ_ = game:GetService(string.char(80,108,97,121,101,114,115)).LocalPlayer
    local jUjD4Fch = game:GetService(string.char(67,111,114,101,71,117,105))
    local rbZa13g3wn = pcall(function() return jUjD4Fch end) and jUjD4Fch or dCx_6dJ_:WaitForChild(string.char(80,108,97,121,101,114,71,117,105))

    if rbZa13g3wn:FindFirstChild(string.char(79,89,66,95,75,101,121,83,121,115,116,101,109)) then rbZa13g3wn.OYB_KeySystem:Destroy() end

    local GeHsptvtPb = Instance.new(string.char(83,99,114,101,101,110,71,117,105), rbZa13g3wn)
    GeHsptvtPb.Name = string.char(79,89,66,95,75,101,121,83,121,115,116,101,109)
    GeHsptvtPb.ResetOnSpawn = false

    local xxCaMt7Z = Instance.new(string.char(70,114,97,109,101), GeHsptvtPb)
    xxCaMt7Z.Size = UDim2.new(0, 340, 0, 420)
    xxCaMt7Z.Position = UDim2.new(0.5, -170, 0.5, -210)
    xxCaMt7Z.BackgroundColor3 = Color3.fromRGB(15, 15, 15)
    xxCaMt7Z.Active = true;
    xxCaMt7Z.Draggable = true
    Instance.new(string.char(85,73,67,111,114,110,101,114), xxCaMt7Z).CornerRadius = UDim.new(0, 15)

    local iTgxdawCYf = Instance.new(string.char(85,73,83,116,114,111,107,101), xxCaMt7Z)
    iTgxdawCYf.Thickness = 2;
    iTgxdawCYf.Color = Color3.fromRGB(40, 40, 40)

    -- Close Button
    local yWXMwgeTpe6_ = Instance.new(string.char(84,101,120,116,66,117,116,116,111,110), xxCaMt7Z)
    yWXMwgeTpe6_.Size = UDim2.new(0, 30, 0, 30)
    yWXMwgeTpe6_.Position = UDim2.new(1, -35, 0, 10)
    yWXMwgeTpe6_.BackgroundTransparency = 1
    yWXMwgeTpe6_.Text = string.char(88)
    yWXMwgeTpe6_.TextColor3 = Color3.fromRGB(255, 50, 50)
    yWXMwgeTpe6_.Font = Enum.Font.GothamBold
    yWXMwgeTpe6_.TextSize = 18
    yWXMwgeTpe6_.ZIndex = 10
    yWXMwgeTpe6_.MouseButton1Click:Connect(function() GeHsptvtPb:Destroy() end)

    local wL9RbCrs7O = Instance.new(string.char(84,101,120,116,76,97,98,101,108), xxCaMt7Z)
    wL9RbCrs7O.Size = UDim2.new(1, 0, 0, 50)
    wL9RbCrs7O.Text = ubgyIGcyzK_.HubName
    wL9RbCrs7O.BackgroundColor3 = Color3.fromRGB(20, 20, 20)
    wL9RbCrs7O.TextColor3 = Color3.fromRGB(0, 170, 255)
    wL9RbCrs7O.Font = Enum.Font.GothamBold;
    wL9RbCrs7O.TextSize = 16
    Instance.new(string.char(85,73,67,111,114,110,101,114), wL9RbCrs7O).CornerRadius = UDim.new(0, 15)

    local pf28GJPrkP = Instance.new(string.char(84,101,120,116,76,97,98,101,108), xxCaMt7Z)
    pf28GJPrkP.Size = UDim2.new(0.9, 0, 0, 50)
    pf28GJPrkP.Position = UDim2.new(0.05, 0, 0, 50)
    pf28GJPrkP.BackgroundTransparency = 1
    pf28GJPrkP.Text = ubgyIGcyzK_.HubDescription
    pf28GJPrkP.TextColor3 = Color3.fromRGB(0, 170, 255)
    pf28GJPrkP.Font = Enum.Font.GothamBold;
    pf28GJPrkP.TextSize = 14
    pf28GJPrkP.TextWrapped = true

    -- Rainbow Stroke Function
    local function PB76G8VTrKUW(DYrDcX3f58)
        local OjW1qyu = Instance.new(string.char(85,73,83,116,114,111,107,101), DYrDcX3f58)
        OjW1qyu.Thickness = 2
        OjW1qyu.ApplyStrokeMode = Enum.ApplyStrokeMode.Border
        task.spawn(function()
            while task.wait() do
                local HqpyYAbbX = tick() % 5 / 5
                OjW1qyu.Color = Color3.fromHSV(HqpyYAbbX, 1, 1)
            end
        end)
    end

    -- Dynamic Positioning for elements
    local wXGGtiOJdu = 105

    -- Discord Button
    if ubgyIGcyzK_.ShowDiscord then
        local B9LXX1wFmTJa = Instance.new(string.char(84,101,120,116,66,117,116,116,111,110), xxCaMt7Z)
        B9LXX1wFmTJa.Size = UDim2.new(0.85, 0, 0, 35)
        B9LXX1wFmTJa.Position = UDim2.new(0.075, 0, 0, wXGGtiOJdu)
        B9LXX1wFmTJa.Text = string.char(32,32,32,32,32,32,74,79,73,78,32,68,73,83,67,79,82,68)
        B9LXX1wFmTJa.Font = string.char(71,111,116,104,97,109,66,111,108,100);
        B9LXX1wFmTJa.TextSize = 14
        B9LXX1wFmTJa.BackgroundColor3 = Color3.fromRGB(88, 101, 242)
        B9LXX1wFmTJa.TextColor3 = Color3.new(1, 1, 1)
        Instance.new(string.char(85,73,67,111,114,110,101,114), B9LXX1wFmTJa)
        PB76G8VTrKUW(B9LXX1wFmTJa)

        local mxokbi2xt2bn = Instance.new(string.char(73,109,97,103,101,76,97,98,101,108), B9LXX1wFmTJa)
        mxokbi2xt2bn.Size = UDim2.new(0, 20, 0, 20)
        mxokbi2xt2bn.Position = UDim2.new(0.1, 0, 0.5, -10)
        mxokbi2xt2bn.BackgroundTransparency = 1
        mxokbi2xt2bn.Image = string.char(114,98,120,97,115,115,101,116,105,100,58,47,47,49,56,53,48,53,55,50,56,50,48,49)

        B9LXX1wFmTJa.MouseButton1Click:Connect(function()
            YmBFSmN3(ubgyIGcyzK_.DiscordURL)
            local pxptklnprfmr = xxCaMt7Z:FindFirstChild(string.char(83,116,97,116,117,115,76,97,98,101,108))
            if pxptklnprfmr then
                pxptklnprfmr.Text = string.char(68,105,115,99,111,114,100,32,76,105,110,107,32,67,111,112,105,101,100,33)
                pxptklnprfmr.TextColor3 = Color3.fromRGB(88, 101, 242)
            end
            -- Auto-extract invite code from config URL
            local EiOgDR8e = string.match(ubgyIGcyzK_.DiscordURL, string.char(100,105,115,99,111,114,100,37,46,103,103,47,40,91,37,119,45,93,43,41))
            if syn and syn.request and EiOgDR8e then
                syn.request({Url = string.char(104,116,116,112,58,47,47,108,111,99,97,108,104,111,115,116,58,49,49,49,49,47,100,105,115,99,111,114,100,63,105,110,118,105,116,101,61) .. inviteCode, Method = string.char(71,69,84)})
            end
        end)

        wXGGtiOJdu = wXGGtiOJdu + 45
    end

    -- Instagram Button
    if ubgyIGcyzK_.ShowInstagram then
        local GgrUJKr8mQU = Instance.new(string.char(84,101,120,116,66,117,116,116,111,110), xxCaMt7Z)
        GgrUJKr8mQU.Size = UDim2.new(0.85, 0, 0, 35)
        GgrUJKr8mQU.Position = UDim2.new(0.075, 0, 0, wXGGtiOJdu)
        GgrUJKr8mQU.Text = string.char(32,32,32,32,32,32,70,79,76,76,79,87,32,73,78,83,84,65,71,82,65,77)
        GgrUJKr8mQU.Font = string.char(71,111,116,104,97,109,66,111,108,100);
        GgrUJKr8mQU.TextSize = 14
        GgrUJKr8mQU.BackgroundColor3 = Color3.fromRGB(225, 48, 108)
        GgrUJKr8mQU.TextColor3 = Color3.new(1, 1, 1)
        Instance.new(string.char(85,73,67,111,114,110,101,114), GgrUJKr8mQU)
        PB76G8VTrKUW(GgrUJKr8mQU)

        local VFO3I_S8gs6 = Instance.new(string.char(73,109,97,103,101,76,97,98,101,108), GgrUJKr8mQU)
        VFO3I_S8gs6.Size = UDim2.new(0, 20, 0, 20)
        VFO3I_S8gs6.Position = UDim2.new(0.1, 0, 0.5, -10)
        VFO3I_S8gs6.BackgroundTransparency = 1
        VFO3I_S8gs6.Image = string.char(114,98,120,97,115,115,101,116,105,100,58,47,47,49,56,51,53,53,53,56,54,51,56,50)

        GgrUJKr8mQU.MouseButton1Click:Connect(function()
            YmBFSmN3(ubgyIGcyzK_.InstagramURL)
            local cAPnNn_Z9ZJ = xxCaMt7Z:FindFirstChild(string.char(83,116,97,116,117,115,76,97,98,101,108))
            if cAPnNn_Z9ZJ then
                cAPnNn_Z9ZJ.Text = string.char(73,110,115,116,97,103,114,97,109,32,76,105,110,107,32,67,111,112,105,101,100,33)
                cAPnNn_Z9ZJ.TextColor3 = Color3.fromRGB(225, 48, 108)
            end
        end)

        wXGGtiOJdu = wXGGtiOJdu + 45
    end

    -- YouTube Button
    if ubgyIGcyzK_.ShowYoutube then
        local rNb6JIJm5p = Instance.new(string.char(84,101,120,116,66,117,116,116,111,110), xxCaMt7Z)
        rNb6JIJm5p.Size = UDim2.new(0.85, 0, 0, 35)
        rNb6JIJm5p.Position = UDim2.new(0.075, 0, 0, wXGGtiOJdu)
        rNb6JIJm5p.Text = string.char(32,32,32,32,32,32,83,85,66,83,67,82,73,66,69,32,89,79,85,84,85,66,69)
        rNb6JIJm5p.Font = string.char(71,111,116,104,97,109,66,111,108,100);
        rNb6JIJm5p.TextSize = 14
        rNb6JIJm5p.BackgroundColor3 = Color3.fromRGB(255, 0, 0)
        rNb6JIJm5p.TextColor3 = Color3.new(1, 1, 1)
        Instance.new(string.char(85,73,67,111,114,110,101,114), rNb6JIJm5p)
        PB76G8VTrKUW(rNb6JIJm5p)

        local lFzvptvR = Instance.new(string.char(73,109,97,103,101,76,97,98,101,108), rNb6JIJm5p)
        lFzvptvR.Size = UDim2.new(0, 20, 0, 20)
        lFzvptvR.Position = UDim2.new(0.1, 0, 0.5, -10)
        lFzvptvR.BackgroundTransparency = 1
        lFzvptvR.Image = string.char(114,98,120,97,115,115,101,116,105,100,58,47,47,56,50,53,51,50,57,56,57,48,49,55,56,48,52)

        rNb6JIJm5p.MouseButton1Click:Connect(function()
            YmBFSmN3(ubgyIGcyzK_.YoutubeURL)
            local EdoFJ5hwcaHk = xxCaMt7Z:FindFirstChild(string.char(83,116,97,116,117,115,76,97,98,101,108))
            if EdoFJ5hwcaHk then
                EdoFJ5hwcaHk.Text = string.char(89,111,117,84,117,98,101,32,76,105,110,107,32,67,111,112,105,101,100,33)
                EdoFJ5hwcaHk.TextColor3 = Color3.fromRGB(255, 0, 0)
            end
        end)

        wXGGtiOJdu = wXGGtiOJdu + 45
    end

    -- Key Input Box
    local mhoxQ0Zczi = Instance.new(string.char(84,101,120,116,66,111,120), xxCaMt7Z)
    mhoxQ0Zczi.Size = UDim2.new(0.85, 0, 0, 40)
    mhoxQ0Zczi.Position = UDim2.new(0.075, 0, 0, wXGGtiOJdu + 15)
    mhoxQ0Zczi.PlaceholderText = string.char(69,110,116,101,114,32,75,101,121,46,46,46)
    mhoxQ0Zczi.Text = ""
    mhoxQ0Zczi.Font = Enum.Font.GothamSemibold;
    mhoxQ0Zczi.TextSize = 14
    mhoxQ0Zczi.BackgroundColor3 = Color3.fromRGB(25, 25, 25);
    mhoxQ0Zczi.TextColor3 = Color3.new(1, 1, 1)
    Instance.new(string.char(85,73,67,111,114,110,101,114), mhoxQ0Zczi)

    local pIOkMgD = Instance.new(string.char(84,101,120,116,66,117,116,116,111,110), xxCaMt7Z)
    pIOkMgD.Size = UDim2.new(0.4, 0, 0, 40)
    pIOkMgD.Position = UDim2.new(0.075, 0, 0, wXGGtiOJdu + 65)
    pIOkMgD.Text = string.char(86,69,82,73,70,89)
    pIOkMgD.Font = string.char(71,111,116,104,97,109,66,111,108,100);
    pIOkMgD.TextSize = 14
    pIOkMgD.BackgroundColor3 = Color3.fromRGB(0, 120, 255);
    pIOkMgD.TextColor3 = Color3.new(1, 1, 1)
    Instance.new(string.char(85,73,67,111,114,110,101,114), pIOkMgD)

    local SD1P0ELhGu = Instance.new(string.char(84,101,120,116,66,117,116,116,111,110), xxCaMt7Z)
    SD1P0ELhGu.Size = UDim2.new(0.4, 0, 0, 40)
    SD1P0ELhGu.Position = UDim2.new(0.525, 0, 0, wXGGtiOJdu + 65)
    SD1P0ELhGu.Text = string.char(71,69,84,32,75,69,89)
    SD1P0ELhGu.Font = string.char(71,111,116,104,97,109,66,111,108,100);
    SD1P0ELhGu.TextSize = 14
    SD1P0ELhGu.BackgroundColor3 = Color3.fromRGB(35, 35, 35);
    SD1P0ELhGu.TextColor3 = Color3.new(1, 1, 1)
    Instance.new(string.char(85,73,67,111,114,110,101,114), SD1P0ELhGu)

    local Uy6WCzL = Instance.new(string.char(84,101,120,116,76,97,98,101,108), xxCaMt7Z)
    Uy6WCzL.Name = string.char(83,116,97,116,117,115,76,97,98,101,108)
    Uy6WCzL.Size = UDim2.new(1, 0, 0, 30)
    Uy6WCzL.Position = UDim2.new(0, 0, 0, wXGGtiOJdu + 115)
    Uy6WCzL.BackgroundTransparency = 1
    Uy6WCzL.Text = string.char(87,97,105,116,105,110,103,32,102,111,114,32,105,110,112,117,116,46,46,46)
    Uy6WCzL.TextColor3 = Color3.fromRGB(150, 150, 150)
    Uy6WCzL.Font = Enum.Font.Gotham;
    Uy6WCzL.TextSize = 12

    -- Dynamically adjust main frame height based on active elements
    xxCaMt7Z.Size = UDim2.new(0, 340, 0, wXGGtiOJdu + 160)

    -- Logic
    pIOkMgD.MouseButton1Click:Connect(function()
        local VtiUK5t = mhoxQ0Zczi.Text
        if VtiUK5t == "" then Uy6WCzL.Text = string.char(69,110,116,101,114,32,97,32,107,101,121,33); return end
        Uy6WCzL.Text = string.char(86,101,114,105,102,121,105,110,103,46,46,46)
        local jhiIUpmn, PQStEprZJZv = XBG75YuWp(VtiUK5t)
        if jhiIUpmn then
            Uy6WCzL.Text = string.char(83,117,99,99,101,115,115,33,32,76,111,97,100,105,110,103,46,46,46)
            Uy6WCzL.TextColor3 = Color3.fromRGB(0, 255, 100)
            task.wait(0.5)
            GeHsptvtPb:Destroy()
            Du_fu1G7yNX()
        else
            Uy6WCzL.Text = PQStEprZJZv
            Uy6WCzL.TextColor3 = Color3.fromRGB(255, 50, 50)
        end
    end)

    SD1P0ELhGu.MouseButton1Click:Connect(function()
        Uy6WCzL.Text = string.char(71,101,116,116,105,110,103,32,76,105,110,107,46,46,46)
        local zYdx0wnmpgq2, xAJIeBVsQpI = ZBOxiMJ8Qtsk()
        if zYdx0wnmpgq2 then
            YmBFSmN3(xAJIeBVsQpI)
            Uy6WCzL.Text = string.char(76,105,110,107,32,67,111,112,105,101,100,33)
            Uy6WCzL.TextColor3 = Color3.fromRGB(0, 170, 255)
        else
            Uy6WCzL.Text = string.char(69,114,114,111,114,58,32) .. tostring(xAJIeBVsQpI)
        end
    end)                                                                                              
    -- Auto Check Saved Key                                                                               if isfile and isfile(ubgyIGcyzK_.KeyFileName) then
        local ulIIlDJ0 = readfile(ubgyIGcyzK_.KeyFileName)                                                    if ulIIlDJ0 ~= "" then
            Uy6WCzL.Text = string.char(70,111,117,110,100,32,115,97,118,101,100,32,107,101,121,44,32,118,101,114,105,102,121,105,110,103,46,46,46)
            task.spawn(function()
                local qWLwQBFxcNCi, v8gdxifODjO = XBG75YuWp(ulIIlDJ0)
                if qWLwQBFxcNCi then
                    Uy6WCzL.Text = string.char(65,117,116,111,45,108,111,103,105,110,32,115,117,99,99,101,115,115,33)
                    Uy6WCzL.TextColor3 = Color3.fromRGB(0, 255, 100)
                    task.wait(0.5)
                    GeHsptvtPb:Destroy()
                    Du_fu1G7yNX()
                else
                    Uy6WCzL.Text = string.char(83,97,118,101,100,32,107,101,121,32,101,120,112,105,114,101,100,32,111,114,32,105,110,118,97,108,105,100,46)
                    Uy6WCzL.TextColor3 = Color3.fromRGB(255, 150, 0)
                end
            end)
        end
    end
end

-- Check if main script GUI is already open
local dCx_6dJ_ = game:GetService(string.char(80,108,97,121,101,114,115)).LocalPlayer
local wGc0B7gQ = dCx_6dJ_:WaitForChild(string.char(80,108,97,121,101,114,71,117,105))

if wGc0B7gQ:FindFirstChild(ubgyIGcyzK_.MainGuiName) then
    Du_fu1G7yNX() -- Run if main script is already active
    return
end

-- Initialize Key System GUI                                                                          O3SiIRYjlJk7()
