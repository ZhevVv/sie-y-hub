--[[
    ================================================================
    [ SCRIPT INFORMATION ]
    Project: Custom Script with Modern UI
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

local Config = {
    -- [1] PlatoBoost Settings
    ServiceId       = 29627, -- Your PlatoBoost Service ID
    PlatoSecret     = "9cc778c7-b1e1-4506-bb6d-ef91c34437d2", -- Your PlatoBoost Secret Key

    -- [2] Anti-Bypass / Global Secret Variable
    Secret          = "vheo123", -- This makes the script ONLY run from the key script
    
    -- [3] Scripts & Links
    MainScriptURL   = "https://raw.githubusercontent.com/ZhevVv/sie-y-hub/refs/heads/main/script.lua",
    
    -- [4] File System
    KeyFileName     = "Mykey.txt",

    -- [5] GUI Management
    OldGuiName      = "SIE Y HUB",
    MainGuiName     = "SIE Y HUB",
}

-------------------------------------------------------------------------------
--! LIBRARIES (JSON & CRYPTOGRAPHY) - DO NOT MODIFY
-------------------------------------------------------------------------------
local a=2^32;local b=a-1;local function c(d,e)local f,g=0,1;while d~=0 or e~=0 do local h,i=d%2,e%2;local j=(h+i)%2;f=f+j*g;d=math.floor(d/2)e=math.floor(e/2)g=g*2 end;return f%a end;local function k(d,e,l,...)local m;if e then d=d%a;e=e%a;m=c(d,e)if l then m=k(m,l,...)end;return m elseif d then return d%a else return 0 end end;local function n(d,e,l,...)local m;if e then d=d%a;e=e%a;m=(d+e-c(d,e))/2;if l then m=n(m,l,...)end;return m elseif d then return d%a else return b end end;local function o(p)return b-p end;local function q(d,r)if r<0 then return lshift(d,-r)end;return math.floor(d%2^32/2^r)end;local function s(p,r)if r>31 or r<-31 then return 0 end;return q(p%a,r)end;local function lshift(d,r)if r<0 then return s(d,-r)end;return d*2^r%2^32 end;local function t(p,r)p=p%a;r=r%32;local u=n(p,2^r-1)return s(p,r)+lshift(u,32-r)end;local v={0x428a2f98,0x71374491,0xb5c0fbcf,0xe9b5dba5,0x3956c25b,0x59f111f1,0x923f82a4,0xab1c5ed5,0xd807aa98,0x12835b01,0x243185be,0x550c7dc3,0x72be5d74,0x80deb1fe,0x9bdc06a7,0xc19bf174,0xe49b69c1,0xefbe4786,0x0fc19dc6,0x240ca1cc,0x2de92c6f,0x4a7484aa,0x5cb0a9dc,0x76f988da,0x983e5152,0xa831c66d,0xb00327c8,0xbf597fc7,0xc6e00bf3,0xd5a79147,0x06ca6351,0x14292967,0x27b70a85,0x2e1b2138,0x4d2c6dfc,0x53380d13,0x650a7354,0x766a0abb,0x81c2c92e,0x92722c85,0xa2bfe8a1,0xa81a664b,0xc24b8b70,0xc76c51a3,0xd192e819,0xd6990624,0xf40e3585,0x106aa070,0x19a4c116,0x1e376c08,0x2748774c,0x34b0bcb5,0x391c0cb3,0x4ed8aa4a,0x5b9cca4f,0x682e6ff3,0x748f82ee,0x78a5636f,0x84c87814,0x8cc70208,0x90befffa,0xa4506ceb,0xbef9a3f7,0xc67178f2}local function w(x)return string.gsub(x,".",function(l)return string.format("%02x",string.byte(l))end)end;local function y(z,A)local x=""for B=1,A do local C=z%256;x=string.char(C)..x;z=(z-C)/256 end;return x end;local function D(x,B)local A=0;for B=B,B+3 do A=A*256+string.byte(x,B)end;return A end;local function E(F,G)local H=64-(G+9)%64;G=y(8*G,8)F=F.."\128"..string.rep("\0",H)..G;assert(#F%64==0)return F end;local function I(J)J[1]=0x6a09e667;J[2]=0xbb67ae85;J[3]=0x3c6ef372;J[4]=0xa54ff53a;J[5]=0x510e527f;J[6]=0x9b05688c;J[7]=0x1f83d9ab;J[8]=0x5be0cd19;return J end;local function K(F,B,J)local L={}for M=1,16 do L[M]=D(F,B+(M-1)*4)end;for M=17,64 do local N=L[M-15]local O=k(t(N,7),t(N,18),s(N,3))N=L[M-2]L[M]=(L[M-16]+O+L[M-7]+k(t(N,17),t(N,19),s(N,10)))%a end;local d,e,l,P,Q,R,S,T=J[1],J[2],J[3],J[4],J[5],J[6],J[7],J[8]for B=1,64 do local O=k(t(d,2),t(d,13),t(d,22))local U=k(n(d,e),n(d,l),n(e,l))local V=(O+U)%a;local W=k(t(Q,6),t(Q,11),t(Q,25))local X=k(n(Q,R),n(o(Q),S))local Y=(T+W+X+v[B]+L[B])%a;T=S;S=R;R=Q;Q=(P+Y)%a;P=l;l=e;e=d;d=(Y+V)%a end;J[1]=(J[1]+d)%a;J[2]=(J[2]+e)%a;J[3]=(J[3]+l)%a;J[4]=(J[4]+P)%a;J[5]=(J[5]+Q)%a;J[6]=(J[6]+R)%a;J[7]=(J[7]+S)%a;J[8]=(J[8]+T)%a end;local function Z(F)F=E(F,#F)local J=I({})for B=1,#F,64 do K(F,B,J)end;return w(y(J[1],4)..y(J[2],4)..y(J[3],4)..y(J[4],4)..y(J[5],4)..y(J[6],4)..y(J[7],4)..y(J[8],4))end;local e;local l={["\\"]="\\",["\""]="\"",["\b"]="b",["\f"]="f",["\n"]="n",["\r"]="r",["\t"]="t"}local P={["/"]="/"}for Q,R in pairs(l)do P[R]=Q end;local S=function(T)return"\\"..(l[T]or string.format("u%04x",T:byte()))end;local B=function(M)return"null"end;local v=function(M,z)local _={}z=z or{}if z[M]then error("circular reference")end;z[M]=true;if rawget(M,1)~=nil or next(M)==nil then local A=0;for Q in pairs(M)do if type(Q)~="number"then error("invalid table: mixed or invalid key types")end;A=A+1 end;if A~=#M then error("invalid table: sparse array")end;for a0,R in ipairs(M)do table.insert(_,e(R,z))end;z[M]=nil;return"["..table.concat(_,",").."]"else for Q,R in pairs(M)do if type(Q)~="string"then error("invalid table: mixed or invalid key types")end;table.insert(_,e(Q,z)..":"..e(R,z))end;z[M]=nil;return"{"..table.concat(_,",").."}"end end;local g=function(M)return'"'..M:gsub('[%z\1-\31\\\"]',S)..'"'end;local a1=function(M)if M~=M or M<=-math.huge or M>=math.huge then error("unexpected number value '"..tostring(M).."'")end;return string.format("%.14g",M)end;local j={["nil"]=B,["table"]=v,["string"]=g,["number"]=a1,["boolean"]=tostring}e=function(M,z)local x=type(M)local a2=j[x]if a2 then return a2(M,z)end;error("unexpected type '"..x.."'")end;local a3=function(M)return e(M)end;local a4;local N=function(...)local _={}for a0=1,select("#",...)do _[select(a0,...)]=true end;return _ end;local L=N(" ","\t","\r","\n")local p=N(" ","\t","\r","\n","]","}",",")local a5=N("\\","/",'"',"b","f","n","r","t","u")local m=N("true","false","null")local a6={["true"]=true,["false"]=false,["null"]=nil}local a7=function(a8,a9,aa,ab)for a0=a9,#a8 do if aa[a8:sub(a0,a0)]~=ab then return a0 end end;return#a8+1 end;local ac=function(a8,a9,J)local ad=1;local ae=1;for a0=1,a9-1 do ae=ae+1;if a8:sub(a0,a0)=="\n"then ad=ad+1;ae=1 end end;error(string.format("%s at line %d col %d",J,ad,ae))end;local af=function(A)local a2=math.floor;if A<=0x7f then return string.char(A)elseif A<=0x7ff then return string.char(a2(A/64)+192,A%64+128)elseif A<=0xffff then return string.char(a2(A/4096)+224,a2(A%4096/64)+128,A%64+128)elseif A<=0x10ffff then return string.char(a2(A/262144)+240,a2(A%262144/4096)+128,a2(A%4096/64)+128,A%64+128)end;error(string.format("invalid unicode codepoint '%x'",A))end;local ag=function(ah)local ai=tonumber(ah:sub(1,4),16)local aj=tonumber(ah:sub(7,10),16)if aj then return af((ai-0xd800)*0x400+aj-0xdc00+0x10000)else return af(ai)end end;local ak=function(a8,a0)local _=""local al=a0+1;local Q=al;while al<=#a8 do local am=a8:byte(al)if am<32 then ac(a8,al,"control character in string")elseif am==92 then _=_..a8:sub(Q,al-1)al=al+1;local T=a8:sub(al,al)if T=="u"then local an=a8:match("^[dD][89aAbB]%x%x\\u%x%x%x%x",al+1)or a8:match("^%x%x%x%x",al+1)or ac(a8,al-1,"invalid unicode escape in string")_=_..ag(an)al=al+#an else if not a5[T]then ac(a8,al-1,"invalid escape char '"..T.."' in string")end;_=_..P[T]end;Q=al+1 elseif am==34 then _=_..a8:sub(Q,al-1)return _,al+1 end;al=al+1 end;ac(a8,a0,"expected closing quote for string")end;local ao=function(a8,a0)local am=a7(a8,a0,p)local ah=a8:sub(a0,am-1)local A=tonumber(ah)if not A then ac(a8,a0,"invalid number '"..ah.."'")end;return A,am end;local ap=function(a8,a0)local am=a7(a8,a0,p)local aq=a8:sub(a0,am-1)if not m[aq]then ac(a8,a0,"invalid literal '"..aq.."'")end;return a6[aq],am end;local ar=function(a8,a0)local _={}local A=1;a0=a0+1;while 1 do local am;a0=a7(a8,a0,L,true)if a8:sub(a0,a0)=="]"then a0=a0+1;break end;am,a0=a4(a8,a0)_[A]=am;A=A+1;a0=a7(a8,a0,L,true)local as=a8:sub(a0,a0)a0=a0+1;if as=="]"then break end;if as~=","then ac(a8,a0,"expected ']' or ','")end end;return _,a0 end;local at=function(a8,a0)local _={}a0=a0+1;while 1 do local au,M;a0=a7(a8,a0,L,true)if a8:sub(a0,a0)=="}"then a0=a0+1;break end;if a8:sub(a0,a0)~='"'then ac(a8,a0,"expected string for key")end;au,a0=a4(a8,a0)a0=a7(a8,a0,L,true)if a8:sub(a0,a0)~=":"then ac(a8,a0,"expected ':' after key")end;a0=a7(a8,a0+1,L,true)M,a0=a4(a8,a0)_[au]=M;a0=a7(a8,a0,L,true)local as=a8:sub(a0,a0)a0=a0+1;if as=="}"then break end;if as~=","then ac(a8,a0,"expected '}' or ','")end end;return _,a0 end;local av={['"']=ak,["0"]=ao,["1"]=ao,["2"]=ao,["3"]=ao,["4"]=ao,["5"]=ao,["6"]=ao,["7"]=ao,["8"]=ao,["9"]=ao,["-"]=ao,["t"]=ap,["f"]=ap,["n"]=ap,["["]=ar,["{"]=at}a4=function(a8,a9)local as=a8:sub(a9,a9)local a2=av[as]if a2 then return a2(a8,a9)end;ac(a8,a9,"unexpected character '"..as.."'")end;local aw=function(a8)if type(a8)~="string"then error("expected argument of type string, got "..type(a8))end;local _,a9=a4(a8,a7(a8,1,L,true))a9=a7(a8,a9,L,true)if a9<=#a8 then ac(a8,a9,"trailing garbage")end;return _ end;
local lEncode, lDecode, lDigest = a3, aw, Z;

-------------------------------------------------------------------------------
--! CORE FUNCTIONS (REQUESTS & VERIFICATION)
-------------------------------------------------------------------------------

local useNonce = true
local function safeRequest(options)
    local req = request or http_request or syn_request or (http and http.request)
    if not req then return nil, "HTTP requests not supported" end
    local success, response = pcall(function() return req(options) end)
    if success and response then return response else return nil, "Connection Error" end
end

local fSetClipboard = setclipboard or toclipboard or function() end
local fStringChar, fToString, fOsTime, fMathRandom, fMathFloor = string.char, tostring, os.time, math.random, math.floor
local fGetHwid = gethwid or function() return game:GetService("RbxAnalyticsService"):GetClientId() end

local cachedLink, cachedTime = "", 0
local host = "https://api.platoboost.com"

local function checkConnectivity()
    local response = safeRequest({Url = host .. "/public/connectivity", Method = "GET"})
    if not response or (response.StatusCode ~= 200 and response.StatusCode ~= 429) then
        host = "https://api.platoboost.net"
    end
end
checkConnectivity()

local function generateNonce()
    local str = ""
    for _ = 1, 16 do str = str .. fStringChar(fMathFloor(fMathRandom() * (122 - 97 + 1)) + 97) end
    return str
end

local function cacheLink()
    if cachedTime + (10*60) < fOsTime() then
        local response, err = safeRequest({
            Url = host .. "/public/start",
            Method = "POST",
            Body = lEncode({service = Config.ServiceId, identifier = lDigest(fGetHwid())}),
            Headers = {["Content-Type"] = "application/json"}
        })
        if response and response.StatusCode == 200 then
            local decoded = lDecode(response.Body)
            if decoded.success then
                cachedLink = decoded.data.url
                cachedTime = fOsTime()
                return true, cachedLink
            end
        end
        return false, err or "Server Unreachable"
    end
    return true, cachedLink
end

local function redeemKey(key)
    local nonce = generateNonce()
    local body = {identifier = lDigest(fGetHwid()), key = key}
    if useNonce then body.nonce = nonce end
    
    local response, err = safeRequest({
        Url = host .. "/public/redeem/" .. fToString(Config.ServiceId),
        Method = "POST",
        Body = lEncode(body),
        Headers = {["Content-Type"] = "application/json"}
    })
    
    if response and response.StatusCode == 200 then
        local decoded = lDecode(response.Body)
        if decoded.success and decoded.data.valid then
            if useNonce then
                if decoded.data.hash == lDigest("true" .. "-" .. nonce .. "-" .. Config.PlatoSecret) then 
                    if writefile then writefile(Config.KeyFileName, key) end
                    return true, "Success" 
                end
                return false, "Integrity Check Failed"
            end
            if writefile then writefile(Config.KeyFileName, key) end
            return true, "Success"
        end
        return false, decoded.message or "Invalid Key"
    end
    return false, err or "Server Error"
end

local function StartMainScript()
    local player = game:GetService("Players").LocalPlayer
    local pGui = player:WaitForChild("PlayerGui")
    
    if pGui:FindFirstChild(Config.OldGuiName) then 
        pGui[Config.OldGuiName]:Destroy() 
        task.wait(0.1)
    end
    
    _G[Config.Secret] = true 
    loadstring(game:HttpGet(Config.MainScriptURL))()
end

-------------------------------------------------------------------------------
--! MODERN UI WITH FULL FUNCTIONALITY
-------------------------------------------------------------------------------

local Players = game:GetService("Players")
local TweenService = game:GetService("TweenService")
local UserInputService = game:GetService("UserInputService")

local Player = Players.LocalPlayer
local PlayerGui = Player:WaitForChild("PlayerGui")

local LOGO_ASSET = "rbxassetid://92206600654614"
local BASE_WIDTH = 900
local BASE_HEIGHT = 620

local C = {
	Background = Color3.fromRGB(7, 6, 12),
	Panel = Color3.fromRGB(13, 12, 19),
	Panel2 = Color3.fromRGB(17, 15, 25),
	Purple = Color3.fromRGB(120, 38, 225),
	PurpleBright = Color3.fromRGB(160, 65, 255),
	PurpleDark = Color3.fromRGB(65, 25, 105),
	White = Color3.fromRGB(247, 245, 250),
	Text = Color3.fromRGB(220, 216, 230),
	Muted = Color3.fromRGB(145, 140, 155),
	Border = Color3.fromRGB(92, 48, 145),
	Input = Color3.fromRGB(16, 14, 25),
	InputBorder = Color3.fromRGB(105, 47, 170),
	Black = Color3.fromRGB(5, 4, 9)
}

local function New(class, props, parent)
	local object = Instance.new(class)
	for property, value in pairs(props or {}) do
		object[property] = value
	end
	object.Parent = parent
	return object
end

local function Round(object, radius)
	local corner = Instance.new("UICorner")
	corner.CornerRadius = UDim.new(0, radius)
	corner.Parent = object
	return corner
end

local function Stroke(object, color, thickness, transparency)
	local stroke = Instance.new("UIStroke")
	stroke.Color = color or C.Border
	stroke.Thickness = thickness or 1
	stroke.Transparency = transparency or 0
	stroke.Parent = object
	return stroke
end

local function Tween(object, properties, duration)
	local tween = TweenService:Create(
		object,
		TweenInfo.new(
			duration or 0.2,
			Enum.EasingStyle.Quart,
			Enum.EasingDirection.Out
		),
		properties
	)
	tween:Play()
	return tween
end

local function Text(parent, text, size, color, font)
	local label = New("TextLabel", {
		BackgroundTransparency = 1,
		Text = text,
		TextSize = size or 14,
		TextColor3 = color or C.Text,
		Font = font or Enum.Font.Gotham,
		TextXAlignment = Enum.TextXAlignment.Left,
		TextYAlignment = Enum.TextYAlignment.Center,
		TextWrapped = false
	}, parent)
	return label
end

-- Check if main GUI already exists
local player = game:GetService("Players").LocalPlayer
local pGui = player:WaitForChild("PlayerGui")

if pGui:FindFirstChild(Config.MainGuiName) then
    StartMainScript()
    return
end

-- Create Main GUI
local ScreenGui = New("ScreenGui", {
	Name = "SieYKeySystem",
	ResetOnSpawn = false,
	IgnoreGuiInset = true,
	ZIndexBehavior = Enum.ZIndexBehavior.Sibling
}, PlayerGui)

local Scale = New("UIScale", {Scale = 1}, ScreenGui)

local function UpdateScale()
	local camera = workspace.CurrentCamera
	if not camera then return end
	local viewport = camera.ViewportSize
	local width = viewport.X
	local height = viewport.Y
	local scaleX = (width * 0.90) / BASE_WIDTH
	local scaleY = (height * 0.90) / BASE_HEIGHT
	local finalScale = math.min(scaleX, scaleY)
	finalScale = math.clamp(finalScale, 0.35, 1)
	Scale.Scale = finalScale
end

UpdateScale()
workspace.CurrentCamera:GetPropertyChangedSignal("ViewportSize"):Connect(UpdateScale)

local Main = New("Frame", {
	Name = "KeyWindow",
	AnchorPoint = Vector2.new(0.5, 0.5),
	Position = UDim2.fromScale(0.5, 0.5),
	Size = UDim2.fromOffset(BASE_WIDTH, BASE_HEIGHT),
	BackgroundColor3 = C.Panel,
	BorderSizePixel = 0,
	ClipsDescendants = true
}, ScreenGui)

Round(Main, 24)
Stroke(Main, C.Border, 1.5)

-- Top Controls
local Minimize = New("TextButton", {
	Position = UDim2.new(1, -115, 0, 25),
	Size = UDim2.fromOffset(40, 40),
	BackgroundTransparency = 1,
	Text = "−",
	TextColor3 = C.Muted,
	TextSize = 27,
	Font = Enum.Font.Gotham,
	AutoButtonColor = false
}, Main)

local Close = New("TextButton", {
	Position = UDim2.new(1, -65, 0, 25),
	Size = UDim2.fromOffset(40, 40),
	BackgroundTransparency = 1,
	Text = "×",
	TextColor3 = C.Muted,
	TextSize = 29,
	Font = Enum.Font.Gotham,
	AutoButtonColor = false
}, Main)

-- Logo
local Logo = New("ImageLabel", {
	AnchorPoint = Vector2.new(0.5, 0),
	Position = UDim2.new(0.5, 0, 0, 43),
	Size = UDim2.fromOffset(65, 65),
	BackgroundTransparency = 1,
	Image = LOGO_ASSET,
	ScaleType = Enum.ScaleType.Fit
}, Main)

-- Title
local Title = Text(Main, "KEY SYSTEM", 30, C.White, Enum.Font.GothamBold)
Title.AnchorPoint = Vector2.new(0.5, 0)
Title.Position = UDim2.new(0.5, 0, 0, 123)
Title.Size = UDim2.fromOffset(500, 45)
Title.TextXAlignment = Enum.TextXAlignment.Center

local Subtitle = Text(Main, "Please enter your key to continue", 17, C.Muted, Enum.Font.Gotham)
Subtitle.AnchorPoint = Vector2.new(0.5, 0)
Subtitle.Position = UDim2.new(0.5, 0, 0, 169)
Subtitle.Size = UDim2.fromOffset(500, 30)
Subtitle.TextXAlignment = Enum.TextXAlignment.Center

-- Key Input
local KeyBox = New("TextBox", {
	Position = UDim2.new(0.5, -340, 0, 235),
	Size = UDim2.fromOffset(680, 70),
	BackgroundColor3 = C.Input,
	BorderSizePixel = 0,
	Text = "",
	PlaceholderText = "Enter your key...",
	PlaceholderColor3 = C.Muted,
	TextColor3 = C.Text,
	TextSize = 17,
	Font = Enum.Font.Gotham,
	ClearTextOnFocus = false,
	TextXAlignment = Enum.TextXAlignment.Left
}, Main)

Round(KeyBox, 13)
Stroke(KeyBox, C.InputBorder, 1.5)

local KeyPadding = Instance.new("UIPadding")
KeyPadding.PaddingLeft = UDim.new(0, 65)
KeyPadding.PaddingRight = UDim.new(0, 20)
KeyPadding.Parent = KeyBox

-- Key Icon
local KeyIcon = Text(Main, "⚿", 30, C.Muted, Enum.Font.Gotham)
KeyIcon.Position = UDim2.new(0.5, -325, 0, 235)
KeyIcon.Size = UDim2.fromOffset(45, 70)
KeyIcon.TextXAlignment = Enum.TextXAlignment.Center

-- Verify Button
local Verify = New("TextButton", {
	Position = UDim2.new(0.5, -340, 0, 325),
	Size = UDim2.fromOffset(680, 68),
	BackgroundColor3 = C.Purple,
	BorderSizePixel = 0,
	Text = "",
	AutoButtonColor = false
}, Main)

Round(Verify, 13)
Stroke(Verify, C.PurpleBright, 1)

local VerifyIcon = Text(Verify, "▣", 24, C.White, Enum.Font.GothamBold)
VerifyIcon.Position = UDim2.fromOffset(290, 0)
VerifyIcon.Size = UDim2.fromOffset(40, 68)
VerifyIcon.TextXAlignment = Enum.TextXAlignment.Center

local VerifyText = Text(Verify, "VERIFY", 17, C.White, Enum.Font.GothamBold)
VerifyText.Position = UDim2.fromOffset(340, 0)
VerifyText.Size = UDim2.fromOffset(120, 68)

-- Status Label
local StatusLabel = Text(Main, "Checking for saved key...", 14, C.Muted, Enum.Font.Gotham)
StatusLabel.AnchorPoint = Vector2.new(0.5, 0)
StatusLabel.Position = UDim2.new(0.5, 0, 0, 410)
StatusLabel.Size = UDim2.fromOffset(600, 30)
StatusLabel.TextXAlignment = Enum.TextXAlignment.Center

-- OR Divider
local LeftLine = New("Frame", {
	Position = UDim2.new(0.5, -340, 0, 468),
	Size = UDim2.fromOffset(285, 1),
	BackgroundColor3 = Color3.fromRGB(48, 44, 57),
	BorderSizePixel = 0
}, Main)

local RightLine = New("Frame", {
	Position = UDim2.new(0.5, 55, 0, 468),
	Size = UDim2.fromOffset(285, 1),
	BackgroundColor3 = Color3.fromRGB(48, 44, 57),
	BorderSizePixel = 0
}, Main)

local OrText = Text(Main, "OR", 14, C.Muted, Enum.Font.Gotham)
OrText.AnchorPoint = Vector2.new(0.5, 0)
OrText.Position = UDim2.new(0.5, 0, 0, 453)
OrText.Size = UDim2.fromOffset(50, 30)
OrText.TextXAlignment = Enum.TextXAlignment.Center

-- Get Key Button
local GetKey = New("TextButton", {
	Position = UDim2.new(0.5, -340, 0, 500),
	Size = UDim2.fromOffset(680, 68),
	BackgroundColor3 = C.Panel2,
	BorderSizePixel = 0,
	Text = "",
	AutoButtonColor = false
}, Main)

Round(GetKey, 13)
Stroke(GetKey, Color3.fromRGB(70, 66, 80), 1)

local Globe = Text(GetKey, "◎", 25, C.Muted, Enum.Font.Gotham)
Globe.Position = UDim2.fromOffset(285, 0)
Globe.Size = UDim2.fromOffset(45, 68)
Globe.TextXAlignment = Enum.TextXAlignment.Center

local GetKeyText = Text(GetKey, "GET KEY", 17, C.White, Enum.Font.GothamBold)
GetKeyText.Position = UDim2.fromOffset(340, 0)
GetKeyText.Size = UDim2.fromOffset(120, 68)

-- Footer
local Footer = Text(Main, "Don't have a key? Get one to access all features.", 15, C.Muted, Enum.Font.Gotham)
Footer.AnchorPoint = Vector2.new(0.5, 0)
Footer.Position = UDim2.new(0.5, 0, 0, 585)
Footer.Size = UDim2.fromOffset(600, 30)
Footer.TextXAlignment = Enum.TextXAlignment.Center

-- Required Badge
local Required = New("Frame", {
	AnchorPoint = Vector2.new(0.5, 0),
	Position = UDim2.new(0.5, 0, 0, -55),
	Size = UDim2.fromOffset(190, 45),
	BackgroundColor3 = Color3.fromRGB(19, 13, 30),
	BorderSizePixel = 0,
	ZIndex = 5
}, Main)

Round(Required, 23)
Stroke(Required, C.PurpleDark, 1.5)

local LockIcon = Text(Required, "▣", 20, C.PurpleBright, Enum.Font.GothamBold)
LockIcon.Position = UDim2.fromOffset(28, 0)
LockIcon.Size = UDim2.fromOffset(30, 45)
LockIcon.TextXAlignment = Enum.TextXAlignment.Center

local RequiredText = Text(Required, "REQUIRED", 15, C.PurpleBright, Enum.Font.GothamBold)
RequiredText.Position = UDim2.fromOffset(67, 0)
RequiredText.Size = UDim2.fromOffset(100, 45)

-- Hover Effects
Verify.MouseEnter:Connect(function()
	Tween(Verify, {BackgroundColor3 = C.PurpleBright}, 0.15)
end)

Verify.MouseLeave:Connect(function()
	Tween(Verify, {BackgroundColor3 = C.Purple}, 0.15)
end)

GetKey.MouseEnter:Connect(function()
	Tween(GetKey, {BackgroundColor3 = Color3.fromRGB(23, 20, 32)}, 0.15)
end)

GetKey.MouseLeave:Connect(function()
	Tween(GetKey, {BackgroundColor3 = C.Panel2}, 0.15)
end)

-- Button Callbacks
Verify.Activated:Connect(function()
	local key = KeyBox.Text
	if key == "" then
		StatusLabel.Text = "Please enter a key!"
		StatusLabel.TextColor3 = Color3.fromRGB(255, 100, 100)
		return
	end
	
	StatusLabel.Text = "Verifying..."
	StatusLabel.TextColor3 = C.Muted
	
	task.spawn(function()
		local success, msg = redeemKey(key)
		if success then
			StatusLabel.Text = "Success! Loading..."
			StatusLabel.TextColor3 = Color3.fromRGB(0, 255, 100)
			task.wait(0.5)
			ScreenGui:Destroy()
			StartMainScript()
		else
			StatusLabel.Text = msg
			StatusLabel.TextColor3 = Color3.fromRGB(255, 100, 100)
		end
	end)
end)

GetKey.Activated:Connect(function()
	StatusLabel.Text = "Getting link..."
	StatusLabel.TextColor3 = C.Muted
	
	task.spawn(function()
		local success, link = cacheLink()
		if success then
			fSetClipboard(link)
			StatusLabel.Text = "Link copied to clipboard!"
			StatusLabel.TextColor3 = Color3.fromRGB(100, 200, 255)
		else
			StatusLabel.Text = "Error getting link"
			StatusLabel.TextColor3 = Color3.fromRGB(255, 100, 100)
		end
	end)
end)

-- Close Button
Close.Activated:Connect(function()
	Tween(Main, {Size = UDim2.fromOffset(BASE_WIDTH, 0)}, 0.2)
	task.delay(0.22, function()
		if ScreenGui then
			ScreenGui:Destroy()
		end
	end)
end)

-- Minimize Button
local Minimized = false
Minimize.Activated:Connect(function()
	Minimized = not Minimized
	if Minimized then
		Tween(Main, {Size = UDim2.fromOffset(500, 70)}, 0.2)
	else
		Tween(Main, {Size = UDim2.fromOffset(BASE_WIDTH, BASE_HEIGHT)}, 0.2)
	end
end)

-- Drag System
local Dragging = false
local DragStart
local StartPosition

Main.InputBegan:Connect(function(input)
	if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
		Dragging = true
		DragStart = input.Position
		StartPosition = Main.Position
	end
end)

UserInputService.InputChanged:Connect(function(input)
	if not Dragging then return end
	if input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch then
		local Delta = input.Position - DragStart
		Main.Position = UDim2.new(
			StartPosition.X.Scale,
			StartPosition.X.Offset + Delta.X,
			StartPosition.Y.Scale,
			StartPosition.Y.Offset + Delta.Y
		)
	end
end)

UserInputService.InputEnded:Connect(function(input)
	if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
		Dragging = false
	end
end)

-- Auto-login with saved key
if isfile and isfile(Config.KeyFileName) then
	local savedKey = readfile(Config.KeyFileName)
	if savedKey ~= "" then
		StatusLabel.Text = "Found saved key, verifying..."
		task.spawn(function()
			task.wait(0.5)
			local success, msg = redeemKey(savedKey)
			if success then
				StatusLabel.Text = "Auto-login successful!"
				StatusLabel.TextColor3 = Color3.fromRGB(0, 255, 100)
				task.wait(0.5)
				ScreenGui:Destroy()
				StartMainScript()
			else
				StatusLabel.Text = "Saved key expired or invalid"
				StatusLabel.TextColor3 = Color3.fromRGB(255, 150, 0)
			end
		end)
	end
end
