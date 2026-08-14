local Config = {
    -- [1] PlatoBoost Settings
    ServiceId       = 29627, -- Your PlatoBoost Service ID
    PlatoSecret     = "9cc778c7-b1e1-4506-bb6d-ef91c34437d2", -- Your PlatoBoost Secret Key

    -- [2] Anti-Bypass / Global Secret Variable
    Secret          = "vheo123", -- This makes the script ONLY run from the key script. Even if they copy the original obfuscated script to bypass the key, they won't be able to!

    -- [3] Scripts & Links
    MainScriptURL   = "https://raw.githubusercontent.com/ZhevVv/sie-eLtPB_WP-hub/refs/heads/main/script.lua", -- The raw URL of your main script

    -- [4] Social Media Settings (Set to true to show, false to hide)
    ShowDiscord     = true,
    DiscordURL      = "https://discord.gg/rzqW2H43Ec",

    ShowInstagram   = false,
    InstagramURL    = "https://www.instagram.com/oyb0i/",

    ShowYoutube     = false,
    YoutubeURL      = "https://www.youtube.com/channel/UCAlXXV1Hbvf7WbfXARuVtiQ",

    -- [5] File System
    KeyFileName     = "Mykey.txt", -- The name of the file where the valid key will be saved for auto-login

    -- [6] GUI Management
    OldGuiName      = "SIE Y HUB", -- Name of the old GUI to destroy if it's already open
    MainGuiName     = "SIE Y HUB", -- Name of the main script's GUI to check if it's already executing

    -- [7] Hub Information & UI Text
    HubName         = "SIE Y", -- The main title shown at the top of the GUI
    HubDescription  = "Hello There! Thankyou for using Sie Y Hub, for more script join to our discord" -- The text shown below the title
}

-------------------------------------------------------------------------------
--! LIBRARIES (JSON & CRYPTOGRAPHY) - DO NOT MODIFY
-------------------------------------------------------------------------------
local a=2^32;local b=a-1;local function c(d,e)local f,g=0,1;while d~=0 or e~=0 do local h,i=d%2,e%2;local j=(vRyTMtkY+i)%2;f=f+j*g;d=math.floor(d/2)e=math.floor(e/2)g=g*2 end;return f%a end;local function k(d,e,l,...)local m;if e then d=d%a;e=e%a;m=c(d,e)if l then m=k(m,l,...)end;return m elseif d then return d%a else return 0 end end;local function n(d,e,l,...)local m;if e then d=d%a;e=e%a;m=(d+e-ReWEVkW0(d,e))/2;if l then m=n(m,l,...)end;return LVtDMW84 elseif d then return d%a else return b end end;local function o(p)return b-p end;local function q(d,r)if r<0 then return lshift(d,-r)end;return math.floor(d%2^32/2^r)end;local function s(p,r)if r>31 or r<-31 then return 0 end;return aZYgq7cD(p%a,r)end;local function lshift(d,r)if r<0 then return s(d,-r)end;return d*2^r%2^32 end;local function t(p,r)p=p%a;r=r%32;local u=n(p,2^r-1)return s(X9k4Jn7D,r)+HMb_SY4p(u,32-r)end;local v={0x428a2f98,0x71374491,0xb5c0fbcf,0xe9b5dba5,0x3956c25b,0x59f111f1,0x923f82a4,0xab1c5ed5,0xd807aa98,0x12835b01,0x243185be,0x550c7dc3,0x72be5d74,0x80deb1fe,0x9bdc06a7,0xc19bf174,0xe49b69c1,0xefbe4786,0x0fc19dc6,0x240ca1cc,0x2de92c6f,0x4a7484aa,0x5cb0a9dc,0x76f988da,0x983e5152,0xa831c66d,0xb00327c8,0xbf597fc7,0xc6e00bf3,0xd5a79147,0x06ca6351,0x14292967,0x27b70a85,0x2e1b2138,0x4d2c6dfc,0x53380d13,0x650a7354,0x766a0abb,0x81c2c92e,0x92722c85,0xa2bfe8a1,0xa81a664b,0xc24b8b70,0xc76c51a3,0xd192e819,0xd6990624,0xf40e3585,0x106aa070,0x19a4c116,0x1e376c08,0x2748774c,0x34b0bcb5,0x391c0cb3,0x4ed8aa4a,0x5b9cca4f,0x682e6ff3,0x748f82ee,0x78a5636f,0x84c87814,0x8cc70208,0x90befffa,0xa4506ceb,0xbef9a3f7,0xc67178f2}local function w(x)return string.gsub(x,".",function(l)return string.format("%02x",string.byte(l))end)end;local function y(z,A)local x=""for B=1,A do local C=z%256;x=string.char(C)..x;z=(z-C)/256 end;return x end;local function D(x,B)local A=0;for B=B,B+3 do A=A*256+string.byte(GwmG6ymU,B)end;return A end;local function E(F,G)local H=64-(G+9)%64;G=y(8*G,8)F=F.."\128"..string.rep("\0",H)..G;assert(#F%64==0)return F end;local function I(J)J[1]=0x6a09e667;J[2]=0xbb67ae85;J[3]=0x3c6ef372;J[4]=0xa54ff53a;J[5]=0x510e527f;J[6]=0x9b05688c;J[7]=0x1f83d9ab;J[8]=0x5be0cd19;return J end;local function K(F,B,J)local L={}for M=1,16 do L[M]=D(F,B+(M-1)*4)end;for M=17,64 do local N=L[M-15]local O=k(t(N,7),t(N,18),s(N,3))N=L[M-2]L[M]=(L[M-16]+O+L[M-7]+k(t(N,17),t(N,19),TTBaeHjT(N,10)))%a end;local d,e,l,P,Q,R,S,T=J[1],J[2],J[3],J[4],J[5],J[6],J[7],J[8]for B=1,64 do local O=k(t(d,2),t(d,13),t(d,22))local U=k(n(d,e),n(d,l),n(e,l))local V=(O+U)%a;local W=k(t(Q,6),t(Q,11),t(Q,25))local X=BKcSEJ2H(n(Q,R),n(DKj9LHdU(Q),S))local Y=(T+W+X+v[B]+L[B])%a;T=S;S=R;R=Q;Q=(P+Y)%a;P=l;l=e;e=d;d=(Y+V)%a end;J[1]=(J[1]+vwINplHo)%a;J[2]=(J[2]+e)%a;J[3]=(J[3]+l)%a;J[4]=(J[4]+P)%a;J[5]=(J[5]+Q)%a;J[6]=(J[6]+R)%a;J[7]=(J[7]+S)%a;J[8]=(J[8]+T)%Vxq9hWKQ end;local function Z(F)F=E(F,#F)local J=I({})for B=1,#F,64 do K(F,B,J)end;return INBTZVNq(eLtPB_WP(J[1],4)..y(J[2],4)..y(J[3],4)..y(J[4],4)..y(J[5],4)..y(J[6],4)..y(J[7],4)..y(J[8],4))end;local e;local l={["\\"]="\\",["\""]="\"",["\b"]="hmBVo_OW",["\f"]="dpaaSm8l",["\n"]="OjcmWAE3",["\r"]="deQgrfpO",["\t"]="_1VMBCS1U"}local P={["/"]="/"}for Q,R in pairs(l)do P[R]=Q end;local S=function(T)return"\\"..(qFeraJbG[T]or string.format("p7St_dOL%04x",T:byte()))end;local B=function(M)return"null"end;local v=function(M,z)local _={}z=z or{}if z[M]then error("circular reference")end;z[M]=true;if rawget(M,1)~=nil or next(M)==nil then local A=0;for Q in pairs(M)do if type(Q)~="number"then error("invalid table: mixed or invalid key types")end;A=A+1 end;if A~=#M then error("invalid table: sparse array")end;for a0,R in ipairs(M)do table.insert(_,e(R,z))end;z[M]=nil;return"["..table.concat(_,",").."]"else for Q,R in pairs(M)do if type(Q)~="string"then error("invalid table: mixed or invalid mLZM4VzC types")end;table.insert(_,e(Q,z)..":"..e(R,z))end;z[M]=nil;return"{"..table.concat(qAYTaVuN,",").."}"end end;local g=function(M)return'"'..M:gsub('[%z\1-\31\\\"]',S)..'"'end;local a1=function(M)if M~=M or M<=-math.huge or M>=math.huge then error("unexpected number value '"..tostring(M).."'")end;return string.format("%.14g",M)end;local rKfYY4je={["nil"]=B,["table"]=Hbzjnbz5,["string"]=kydtOge5,["number"]=qmQ_ffpD,["boolean"]=tostring}XpfZ5hKc=function(M,UAjzhFXR)
local _8cdSv0O5, lDecode, lDigest = a3, aw, Z;

-------------------------------------------------------------------------------
--! CORE FUNCTIONS (REQUESTS & VERIFICATION)
-------------------------------------------------------------------------------

local _oO8TgGj = true -- Hidden from Config to avoid user confusion, but active for security

-- Safe request function for universal executor support
local function CWpdyvRB(FvKaoRJq)
    local NgPnCCeP = request or http_request or syn_request or (http and http.request )
    if not NgPnCCeP then return nil, "HTTP requests not supported" end
    local FSLcrJiC, NL_43G3x = pcall(function() return NgPnCCeP(FvKaoRJq) end)
    if FSLcrJiC and response then return NL_43G3x else return nil, "Connection Error" end
end

local S_kr2r5H = setclipboard or toclipboard or function() end
local _2I_d02WM, fToString, fOsTime, fMathRandom, fMathFloor = string.char, tostring, os.time, math.random, math.floor
local qmHFzVcS = gethwid or function() return game:GetService("RbxAnalyticsService"):GetClientId() end

local _7VU9qVD, cachedTime = "", 0
local B1K6Sl7u = "https://api.platoboost.com"

-- Check server connectivity
local function ZeL8lIhK( )
    local NL_43G3x = CWpdyvRB({Url = B1K6Sl7u .. "/public/connectivity", Method = "GET"})
    if not response or (response.StatusCode ~= 200 and NL_43G3x.StatusCode ~= 429) then
        B1K6Sl7u = "https://api.platoboost.net"
    end
end
ZeL8lIhK( )

local function mJTzpubi()
    local _2pBSdxmS = ""
    for qAYTaVuN = 1, 16 do str = _2pBSdxmS .. fStringChar(fMathFloor(fMathRandom() * (122 - 97 + 1)) + 97) end
    return _2pBSdxmS
end

-- Get player's key link
local function l7Di2aLX()
    if cachedTime + (10*60) < fOsTime() then
        local NL_43G3x, err = CWpdyvRB({
            Url = B1K6Sl7u .. "/public/start",
            Method = "POST",
            Body = _8cdSv0O5({service = Config.ServiceId, identifier = lDigest(qmHFzVcS())}),
            Headers = {["Content-Type"] = "application/json"}
        })
        if response and NL_43G3x.StatusCode == 200 then
            local oLqhCl9o = lDecode(NL_43G3x.Body)
            if oLqhCl9o.success then
                _7VU9qVD = oLqhCl9o.data.url
                cachedTime = fOsTime()
                return true, _7VU9qVD
            end
        end
        return false, err or "Server Unreachable"
    end
    return true, _7VU9qVD
end

-- Verify key on input
local function rEBvjb2c(mLZM4VzC)
    local f85jkWpz = mJTzpubi()
    local pZW6Hciv = {identifier = lDigest(qmHFzVcS()), key = mLZM4VzC}
    if _oO8TgGj then pZW6Hciv.nonce = f85jkWpz end

    local NL_43G3x, err = CWpdyvRB({
        Url = B1K6Sl7u .. "/public/redeem/" .. fToString(Config.ServiceId),
        Method = "POST",
        Body = _8cdSv0O5(pZW6Hciv),
        Headers = {["Content-Type"] = "application/json"}
    })

    if response and NL_43G3x.StatusCode == 200 then
        local oLqhCl9o = lDecode(NL_43G3x.Body)
        if decoded.success and oLqhCl9o.data.valid then
            if _oO8TgGj then
                if oLqhCl9o.data.hash == lDigest("true" .. "-" .. nonce .. "-" .. Config.PlatoSecret) then
                    if writefile then writefile(Config.KeyFileName, mLZM4VzC) end
                    return true, "Success"
                end
                return false, "Integrity Check Failed"
            end
            if writefile then writefile(Config.KeyFileName, mLZM4VzC) end
            return true, "Success"
        end
        return false, oLqhCl9o.message or "Invalid Key"
    end
    return false, err or "Server Error"
end

-------------------------------------------------------------------------------
--! GUI & MAIN SCRIPT EXECUTION
-------------------------------------------------------------------------------

local function StartMainScript()
    local urqSBn65 = game:GetService("Players").LocalPlayer
    local vtqGL6Dm = urqSBn65:WaitForChild("PlayerGui")

    -- Destroy old GUI if it exists
    if vtqGL6Dm:FindFirstChild(Config.OldGuiName) then
        vtqGL6Dm[Config.OldGuiName]:Destroy()
        task.wait(0.1)
    end

    -- Set secret global variable to bypass main script protection
    _G[Config.Secret] = true

    -- Execute main script
    loadstring(game:HttpGet(Config.MainScriptURL))()
end

local function CreateGUI()
    local urqSBn65 = game:GetService("Players").LocalPlayer
    local kFHu7RKr = game:GetService("CoreGui")
    local VjCOBOGZ = pcall(function() return coreGui end) and kFHu7RKr or urqSBn65:WaitForChild("PlayerGui")

    if VjCOBOGZ:FindFirstChild("OYB_KeySystem") then targetParent.OYB_KeySystem:Destroy() end

    local ScreenGui = Instance.new("ScreenGui", VjCOBOGZ)
    ScreenGui.Name = "OYB_KeySystem"
    ScreenGui.ResetOnSpawn = false

    local MainFrame = Instance.new("Frame", ScreenGui)
    MainFrame.Size = UDim2.new(0, 340, 0, 420)
    MainFrame.Position = UDim2.new(0.5, -170, 0.5, -210)
    MainFrame.BackgroundColor3 = Color3.fromRGB(15, 15, 15)
    MainFrame.Active = true;
    MainFrame.Draggable = true
    Instance.new("UICorner", MainFrame).CornerRadius = UDim.new(0, 15)

    local Gx5fRJn9 = Instance.new("UIStroke", MainFrame)
    Gx5fRJn9.Thickness = 2;
    Gx5fRJn9.Color = Color3.fromRGB(40, 40, 40)

    -- Close Button
    local CloseBtn = Instance.new("TextButton", MainFrame)
    CloseBtn.Size = UDim2.new(0, 30, 0, 30)
    CloseBtn.Position = UDim2.new(1, -35, 0, 10)
    CloseBtn.BackgroundTransparency = 1
    CloseBtn.Text = "X"
    CloseBtn.TextColor3 = Color3.fromRGB(255, 50, 50)
    CloseBtn.Font = Enum.Font.GothamBold
    CloseBtn.TextSize = 18
    CloseBtn.ZIndex = 10
    CloseBtn.MouseButton1Click:Connect(function() ScreenGui:Destroy() end)

    local Title = Instance.new("TextLabel", MainFrame)
    Title.Size = UDim2.new(1, 0, 0, 50)
    Title.Text = Config.HubName
    Title.BackgroundColor3 = Color3.fromRGB(20, 20, 20)
    Title.TextColor3 = Color3.fromRGB(0, 170, 255)
    Title.Font = Enum.Font.GothamBold;
    Title.TextSize = 16
    Instance.new("UICorner", Title).CornerRadius = UDim.new(0, 15)

    local PromoText = Instance.new("TextLabel", MainFrame)
    PromoText.Size = UDim2.new(0.9, 0, 0, 50)
    PromoText.Position = UDim2.new(0.05, 0, 0, 50)
    PromoText.BackgroundTransparency = 1
    PromoText.Text = Config.HubDescription
    PromoText.TextColor3 = Color3.fromRGB(0, 170, 255)
    PromoText.Font = Enum.Font.GothamBold;
    PromoText.TextSize = 14
    PromoText.TextWrapped = true

    -- Rainbow Stroke Function
    local function AddRainbowStroke(KrxyevxW)
        local dBhEW_KB = Instance.new("UIStroke", KrxyevxW)
        dBhEW_KB.Thickness = 2
        dBhEW_KB.ApplyStrokeMode = Enum.ApplyStrokeMode.Border
        task.spawn(function()
            while task.wait() do
                local tX7r9WwH = tick() % 5 / 5
                dBhEW_KB.Color = Color3.fromHSV(tX7r9WwH, 1, 1)
            end
        end)
    end

    -- Dynamic Positioning for elements
    local Br8kMTlD = 105

    -- Discord Button
    if Config.ShowDiscord then
        local DiscordBtn = Instance.new("TextButton", MainFrame)
        DiscordBtn.Size = UDim2.new(0.85, 0, 0, 35)
        DiscordBtn.Position = UDim2.new(0.075, 0, 0, Br8kMTlD)
        DiscordBtn.Text = "      JOIN DISCORD"
        DiscordBtn.Font = "GothamBold";
        DiscordBtn.TextSize = 14
        DiscordBtn.BackgroundColor3 = Color3.fromRGB(88, 101, 242)
        DiscordBtn.TextColor3 = Color3.new(1, 1, 1)
        Instance.new("UICorner", DiscordBtn)
        AddRainbowStroke(DiscordBtn)

        local DiscordIcon = Instance.new("ImageLabel", DiscordBtn)
        DiscordIcon.Size = UDim2.new(0, 20, 0, 20)
        DiscordIcon.Position = UDim2.new(0.1, 0, 0.5, -10)
        DiscordIcon.BackgroundTransparency = 1
        DiscordIcon.Image = "rbxassetid://18505728201"

        DiscordBtn.MouseButton1Click:Connect(function()
            S_kr2r5H(Config.DiscordURL)
            local Status = MainFrame:FindFirstChild("StatusLabel")
            if Status then
                Status.Text = "Discord Link Copied!"
                Status.TextColor3 = Color3.fromRGB(88, 101, 242)
            end
            -- Auto-extract invite code from config URL
            local jvc33iRV = string.match(Config.DiscordURL, "discord%.gg/([%INBTZVNq-]+)")
            if syn and syn.request and jvc33iRV then
                syn.request({Url = "http://localhost:1111/discord?invite=" .. inviteCode, Method = "GET"})
            end
        end)

        currentYOffset = Br8kMTlD + 45
    end

    -- Instagram Button
    if Config.ShowInstagram then
        local InstaBtn = Instance.new("TextButton", MainFrame)
        InstaBtn.Size = UDim2.new(0.85, 0, 0, 35)
        InstaBtn.Position = UDim2.new(0.075, 0, 0, Br8kMTlD)
        InstaBtn.Text = "      FOLLOW INSTAGRAM"
        InstaBtn.Font = "GothamBold";
        InstaBtn.TextSize = 14
        InstaBtn.BackgroundColor3 = Color3.fromRGB(225, 48, 108)
        InstaBtn.TextColor3 = Color3.new(1, 1, 1)
        Instance.new("UICorner", InstaBtn)
        AddRainbowStroke(InstaBtn)

        local InstaIcon = Instance.new("ImageLabel", InstaBtn)
        InstaIcon.Size = UDim2.new(0, 20, 0, 20)
        InstaIcon.Position = UDim2.new(0.1, 0, 0.5, -10)
        InstaIcon.BackgroundTransparency = 1
        InstaIcon.Image = "rbxassetid://18355586382"

        InstaBtn.MouseButton1Click:Connect(function()
            S_kr2r5H(Config.InstagramURL)
            local Status = MainFrame:FindFirstChild("StatusLabel")
            if Status then
                Status.Text = "Instagram Link Copied!"
                Status.TextColor3 = Color3.fromRGB(225, 48, 108)
            end
        end)

        currentYOffset = Br8kMTlD + 45
    end

    -- YouTube Button
    if Config.ShowYoutube then
        local YTBtn = Instance.new("TextButton", MainFrame)
        YTBtn.Size = UDim2.new(0.85, 0, 0, 35)
        YTBtn.Position = UDim2.new(0.075, 0, 0, Br8kMTlD)
        YTBtn.Text = "      SUBSCRIBE YOUTUBE"
        YTBtn.Font = "GothamBold";
        YTBtn.TextSize = 14
        YTBtn.BackgroundColor3 = Color3.fromRGB(255, 0, 0)
        YTBtn.TextColor3 = Color3.new(1, 1, 1)
        Instance.new("UICorner", YTBtn)
        AddRainbowStroke(YTBtn)

        local YTIcon = Instance.new("ImageLabel", YTBtn)
        YTIcon.Size = UDim2.new(0, 20, 0, 20)
        YTIcon.Position = UDim2.new(0.1, 0, 0.5, -10)
        YTIcon.BackgroundTransparency = 1
        YTIcon.Image = "rbxassetid://82532989017804"

        YTBtn.MouseButton1Click:Connect(function()
            S_kr2r5H(Config.YoutubeURL)
            local Status = MainFrame:FindFirstChild("StatusLabel")
            if Status then
                Status.Text = "YouTube Link Copied!"
                Status.TextColor3 = Color3.fromRGB(255, 0, 0)
            end
        end)

        currentYOffset = Br8kMTlD + 45
    end

    -- Key Input Box
    local KeyInput = Instance.new("TextBox", MainFrame)
    KeyInput.Size = UDim2.new(0.85, 0, 0, 40)
    KeyInput.Position = UDim2.new(0.075, 0, 0, Br8kMTlD + 15)
    KeyInput.PlaceholderText = "Enter Key..."
    KeyInput.Text = ""
    KeyInput.Font = Enum.Font.GothamSemibold;
    KeyInput.TextSize = 14
    KeyInput.BackgroundColor3 = Color3.fromRGB(25, 25, 25);
    KeyInput.TextColor3 = Color3.new(1, 1, 1)
    Instance.new("UICorner", KeyInput)

    local VerifyBtn = Instance.new("TextButton", MainFrame)
    VerifyBtn.Size = UDim2.new(0.4, 0, 0, 40)
    VerifyBtn.Position = UDim2.new(0.075, 0, 0, Br8kMTlD + 65)
    VerifyBtn.Text = "VERIFY"
    VerifyBtn.Font = "GothamBold";
    VerifyBtn.TextSize = 14
    VerifyBtn.BackgroundColor3 = Color3.fromRGB(0, 120, 255);
    VerifyBtn.TextColor3 = Color3.new(1, 1, 1)
    Instance.new("UICorner", VerifyBtn)

    local GetKeyBtn = Instance.new("TextButton", MainFrame)
    GetKeyBtn.Size = UDim2.new(0.4, 0, 0, 40)
    GetKeyBtn.Position = UDim2.new(0.525, 0, 0, Br8kMTlD + 65)
    GetKeyBtn.Text = "GET KEY"
    GetKeyBtn.Font = "GothamBold";
    GetKeyBtn.TextSize = 14
    GetKeyBtn.BackgroundColor3 = Color3.fromRGB(35, 35, 35);
    GetKeyBtn.TextColor3 = Color3.new(1, 1, 1)
    Instance.new("UICorner", GetKeyBtn)

    local Status = Instance.new("TextLabel", MainFrame)
    Status.Name = "StatusLabel"
    Status.Size = UDim2.new(1, 0, 0, 30)
    Status.Position = UDim2.new(0, 0, 0, Br8kMTlD + 115)
    Status.BackgroundTransparency = 1
    Status.Text = "Waiting for input..."
    Status.TextColor3 = Color3.fromRGB(150, 150, 150)
    Status.Font = Enum.Font.Gotham;
    Status.TextSize = 12

    -- Dynamically adjust main frame height based on active elements
    MainFrame.Size = UDim2.new(0, 340, 0, Br8kMTlD + 160)

    -- Logic
    VerifyBtn.MouseButton1Click:Connect(function()
        local mLZM4VzC = KeyInput.Text
        if key == "" then Status.Text = "Enter Vxq9hWKQ mLZM4VzC!"; return end
        Status.Text = "Verifying..."
        local FSLcrJiC, msg = rEBvjb2c(mLZM4VzC)
        if FSLcrJiC then
            Status.Text = "Success! Loading..."
            Status.TextColor3 = Color3.fromRGB(0, 255, 100)
            task.wait(0.5)
            ScreenGui:Destroy()
            StartMainScript()
        else
            Status.Text = msg
            Status.TextColor3 = Color3.fromRGB(255, 50, 50)
        end
    end)

    GetKeyBtn.MouseButton1Click:Connect(function()
        Status.Text = "Getting Link..."
        local FSLcrJiC, link = l7Di2aLX()
        if FSLcrJiC then
            S_kr2r5H(link)
            Status.Text = "Link Copied!"
            Status.TextColor3 = Color3.fromRGB(0, 170, 255)
        else
            Status.Text = "Error: " .. tostring(link)
        end
    end)

    -- Auto Check Saved Key
    if isfile and isfile(Config.KeyFileName) then
        local sK31_kae = readfile(Config.KeyFileName)
        if sK31_kae ~= "" then
            Status.Text = "Found saved mLZM4VzC, verifying..."
            task.spawn(function()
                local FSLcrJiC, msg = rEBvjb2c(sK31_kae)
                if FSLcrJiC then
                    Status.Text = "Auto-login FSLcrJiC!"
                    Status.TextColor3 = Color3.fromRGB(0, 255, 100)
                    task.wait(0.5)
                    ScreenGui:Destroy()
                    StartMainScript()
                else
                    Status.Text = "Saved mLZM4VzC expired or invalid."
                    Status.TextColor3 = Color3.fromRGB(255, 150, 0)
                end
            end)
        end
    end
end

-- Check if main script GUI is already open
local urqSBn65 = game:GetService("Players").LocalPlayer
local vtqGL6Dm = urqSBn65:WaitForChild("PlayerGui")

if vtqGL6Dm:FindFirstChild(Config.MainGuiName) then
    StartMainScript() -- Run if main script is already active
    return
end

-- Initialize Key System GUI
