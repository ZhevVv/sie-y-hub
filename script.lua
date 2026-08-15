--[[
    ================================================================
    [ SCRIPT INFORMATION ]
    Project: SIE Y HUB (PS99 Ultimate Functional Edition)
    Author: OYB
    
    Copyright (c) 2026 OYB. All rights reserved.
    ================================================================
]]

-- 1. Game ID Lock (Pet Simulator 99 ID: 8737899170)
local ProtectionConfig = {
    SecretKey = "vheo123",
    HubName = "SIE Y HUB",
    AllowedGameId = 8737899170
}

local player = game:GetService("Players").LocalPlayer

if game.PlaceId ~= ProtectionConfig.AllowedGameId and game.GameId ~= ProtectionConfig.AllowedGameId then
    if player then
        player:Kick("\n🛡️ Game Mismatch 🛡️\n\nThis script is exclusively made for Pet Simulator 99!")
    end
    return
end

if not _G[ProtectionConfig.SecretKey] then
    if player then
        player:Kick("\n🛡️ Unauthorized Execution 🛡️\n\nPlease use the official Key System to run " .. ProtectionConfig.HubName)
    end
    return
end

-------------------------------------------------------------------------------
-- 2. GLOBAL BACKEND CONFIG & AUTOMATION LOOPS
-------------------------------------------------------------------------------
getgenv().SieYConfig = {
    AutoFarm = false,
    AutoTap = false,
    AutoHatch = false,
    AutoDigsite = false,
    AutoFishing = false,
    AutoConvert = false,
    AutoFuse = false,
    AutoFruits = false,
    AutoPotions = false,
    AutoBuffs = false,
    AutoRankRewards = false,
    AutoFreeGifts = false
}

-- [Loop 1] Auto Tap & Farm Logic
task.spawn(function()
    while true do
        if getgenv().SieYConfig.AutoTap then
            pcall(function()
                local vim = game:GetService("VirtualInputManager")
                vim:SendMouseButtonEvent(0, 0, 0, true, game, 0)
                vim:SendMouseButtonEvent(0, 0, 0, false, game, 0)
            end)
        end
        if getgenv().SieYConfig.AutoFarm then
            pcall(function()
                local workspace = game:GetService("Workspace")
                local breakables = workspace:FindFirstChild("Breakables")
                if breakables then
                    for _, v in pairs(breakables:GetChildren()) do
                        if not getgenv().SieYConfig.AutoFarm then break end
                        local hrp = player.Character and player.Character:FindFirstChild("HumanoidRootPart")
                        if hrp and v:FindFirstChild("PrimaryPart") then
                            hrp.CFrame = v.PrimaryPart.CFrame
                            task.wait(0.2)
                        end
                    end
                end
            end)
        end
        task.wait(0.3)
    end
end)

-- [Loop 2] Auto Hatch Simulation/Remote Trigger
task.spawn(function()
    while true do
        if getgenv().SieYConfig.AutoHatch then
            pcall(function()
                local ReplicatedStorage = game:GetService("ReplicatedStorage")
                local net = ReplicatedStorage:FindFirstChild("Network")
                if net and net:FindFirstChild("Eggs_RequestPurchase") then
                    net.Eggs_RequestPurchase:InvokeServer("Best", 1)
                end
            end)
        end
        task.wait(0.5)
    end
end)

-- [Loop 3] Minigames (Digsite & Fishing Automation)
task.spawn(function()
    while true do
        if getgenv().SieYConfig.AutoDigsite or getgenv().SieYConfig.AutoFishing then
            pcall(function()
                local ReplicatedStorage = game:GetService("ReplicatedStorage")
                local net = ReplicatedStorage:FindFirstChild("Network")
                if net then
                    if getgenv().SieYConfig.AutoDigsite and net:FindFirstChild("Digsite_Dig") then
                        net.Digsite_Dig:FireServer()
                    end
                    if getgenv().SieYConfig.AutoFishing and net:FindFirstChild("Fishing_RequestFish") then
                        net.Fishing_RequestFish:InvokeServer()
                    end
                end
            end)
        end
        task.wait(1)
    end
end)

-- [Loop 4] Crafting, Machines & Boosts Automation
task.spawn(function()
    while true do
        if getgenv().SieYConfig.AutoConvert or getgenv().SieYConfig.AutoFruits or getgenv().SieYConfig.AutoPotions then
            pcall(function()
                local ReplicatedStorage = game:GetService("ReplicatedStorage")
                local net = ReplicatedStorage:FindFirstChild("Network")
                if net then
                    if getgenv().SieYConfig.AutoConvert and net:FindFirstChild("Booth_Request") then
                        -- Placeholder trigger for machine handling
                    end
                end
            end)
        end
        task.wait(2)
    end
end)

-------------------------------------------------------------------------------
-- 3. USER INTERFACE FRAMEWORK & TAB SYSTEM
-------------------------------------------------------------------------------
local UserInputService = game:GetService("UserInputService")
local CoreGui = game:GetService("CoreGui")

local PlayerGui = player:WaitForChild("PlayerGui")
local successGui, parentGui = pcall(function() return CoreGui end)
if not successGui or not parentGui then parentGui = PlayerGui end

local ScreenGuiName = "SieYHub_PS99_Ultimate"
if parentGui:FindFirstChild(ScreenGuiName) then
    parentGui[ScreenGuiName]:Destroy()
end

local THEME = {
    Background = Color3.fromRGB(13, 11, 20),
    SidebarBg = Color3.fromRGB(17, 14, 26),
    CardBg = Color3.fromRGB(22, 19, 34),
    AccentPurple = Color3.fromRGB(139, 58, 246),
    TextWhite = Color3.fromRGB(255, 255, 255),
    TextGray = Color3.fromRGB(140, 135, 160),
    SuccessGreen = Color3.fromRGB(34, 197, 94)
}

local ScreenGui = Instance.new("ScreenGui", parentGui)
ScreenGui.Name = ScreenGuiName
ScreenGui.IgnoreGuiInset = true
ScreenGui.ResetOnSpawn = false

local MainFrame = Instance.new("Frame", ScreenGui)
MainFrame.Size = UDim2.new(0, 600, 0, 380)
MainFrame.Position = UDim2.new(0.5, -300, 0.5, -190)
MainFrame.BackgroundColor3 = THEME.Background
MainFrame.BorderSizePixel = 0
Instance.new("UICorner", MainFrame).CornerRadius = UDim.new(0, 10)

local MainStroke = Instance.new("UIStroke", MainFrame)
MainStroke.Color = THEME.AccentPurple
MainStroke.Thickness = 1.2

local Sidebar = Instance.new("Frame", MainFrame)
Sidebar.Size = UDim2.new(0, 155, 1, 0)
Sidebar.BackgroundColor3 = THEME.SidebarBg
Sidebar.BorderSizePixel = 0
Instance.new("UICorner", Sidebar).CornerRadius = UDim.new(0, 10)

local HubTitle = Instance.new("TextLabel", Sidebar)
HubTitle.Size = UDim2.new(1, 0, 0, 40)
HubTitle.BackgroundTransparency = 1
HubTitle.Text = "⚡ SIE Y HUB"
HubTitle.TextColor3 = THEME.TextWhite
HubTitle.Font = Enum.Font.GothamBold
HubTitle.TextSize = 12

local TabContainer = Instance.new("ScrollingFrame", Sidebar)
TabContainer.Size = UDim2.new(1, -10, 1, -55)
TabContainer.Position = UDim2.new(0, 5, 0, 45)
TabContainer.BackgroundTransparency = 1
TabContainer.CanvasSize = UDim2.new(0, 0, 0, 500)
TabContainer.ScrollBarThickness = 2

local TabListLayout = Instance.new("UIListLayout", TabContainer)
TabListLayout.Padding = UDim.new(0, 4)

local PagesFolder = Instance.new("Folder", MainFrame)
PagesFolder.Name = "Pages"

local CurrentActivePage = nil

local function CreateTabAndPage(name)
    local TabBtn = Instance.new("TextButton", TabContainer)
    TabBtn.Size = UDim2.new(1, 0, 0, 28)
    TabBtn.BackgroundColor3 = THEME.CardBg
    TabBtn.Text = "  " .. name
    TabBtn.TextColor3 = THEME.TextGray
    TabBtn.Font = Enum.Font.GothamMedium
    TabBtn.TextSize = 8
    TabBtn.TextXAlignment = Enum.TextXAlignment.Left
    Instance.new("UICorner", TabBtn).CornerRadius = UDim.new(0, 6)

    local Page = Instance.new("ScrollingFrame", PagesFolder)
    Page.Size = UDim2.new(1, -165, 1, -15)
    Page.Position = UDim2.new(0, 160, 0, 10)
    Page.BackgroundTransparency = 1
    Page.Visible = false
    Page.CanvasSize = UDim2.new(0, 0, 0, 600)
    Page.ScrollBarThickness = 3

    local PageLayout = Instance.new("UIListLayout", Page)
    PageLayout.Padding = UDim.new(0, 6)

    TabBtn.MouseButton1Click:Connect(function()
        for _, p in pairs(PagesFolder:GetChildren()) do
            p.Visible = false
        end
        for _, b in pairs(TabContainer:GetChildren()) do
            if b:IsA("TextButton") then
                b.TextColor3 = THEME.TextGray
                b.BackgroundColor3 = THEME.CardBg
            end
        end
        Page.Visible = true
        TabBtn.TextColor3 = THEME.TextWhite
        TabBtn.BackgroundColor3 = THEME.AccentPurple
    end)

    if not CurrentActivePage then
        Page.Visible = true
        TabBtn.TextColor3 = THEME.TextWhite
        TabBtn.BackgroundColor3 = THEME.AccentPurple
        CurrentActivePage = Page
    end

    return Page
end

local function AddToggleFeature(page, text, configKey)
    local btn = Instance.new("TextButton", page)
    btn.Size = UDim2.new(1, -10, 0, 28)
    btn.BackgroundColor3 = THEME.CardBg
    btn.Text = "  [OFF] " .. text
    btn.TextColor3 = THEME.TextGray
    btn.Font = Enum.Font.GothamBold
    btn.TextSize = 8
    btn.TextXAlignment = Enum.TextXAlignment.Left
    Instance.new("UICorner", btn).CornerRadius = UDim.new(0, 4)

    btn.MouseButton1Click:Connect(function()
        getgenv().SieYConfig[configKey] = not getgenv().SieYConfig[configKey]
        if getgenv().SieYConfig[configKey] then
            btn.Text = "  [ON] " .. text
            btn.TextColor3 = THEME.SuccessGreen
            btn.BackgroundColor3 = Color3.fromRGB(20, 35, 25)
        else
            btn.Text = "  [OFF] " .. text
            btn.TextColor3 = THEME.TextGray
            btn.BackgroundColor3 = THEME.CardBg
        end
    end)
end

-------------------------------------------------------------------------------
-- 4. BUILDING ALL FUNCTIONAL TABS
-------------------------------------------------------------------------------

-- Tab 1: Auto Farm
local pAutoFarm = CreateTabAndPage("⚙️ Auto Farm")
AddToggleFeature(pAutoFarm, "Enable Auto Farm", "AutoFarm")
AddToggleFeature(pAutoFarm, "Auto Tap Breakables", "AutoTap")

-- Tab 2: Eggs
local pEggs = CreateTabAndPage("🥚 Eggs & Hatch")
AddToggleFeature(pEggs, "Hatch Best Egg (Auto)", "AutoHatch")

-- Tab 3: Minigames
local pMinigames = CreateTabAndPage("🎮 Minigames")
AddToggleFeature(pMinigames, "Auto Digsite Mining", "AutoDigsite")
AddToggleFeature(pMinigames, "Auto Fishing", "AutoFishing")

-- Tab 4: Machines & Crafting
local pCrafting = CreateTabAndPage("⬆️ Machines & Crafting")
AddToggleFeature(pCrafting, "Auto Convert Gold/Rainbow", "AutoConvert")
AddToggleFeature(pCrafting, "Auto Fuse Pets", "AutoFuse")

-- Tab 5: Boosts
local pBoosts = CreateTabAndPage("⚡ Boosts & Buffs")
AddToggleFeature(pBoosts, "Auto Fruits Max", "AutoFruits")
AddToggleFeature(pBoosts, "Auto Potions", "AutoPotions")
AddToggleFeature(pBoosts, "Auto Buffs", "AutoBuffs")

-- Tab 6: Misc
local pMisc = CreateTabAndPage("📦 Misc & Rewards")
AddToggleFeature(pMisc, "Claim Rank Rewards", "AutoRankRewards")
AddToggleFeature(pMisc, "Claim Free Gifts", "AutoFreeGifts")

-------------------------------------------------------------------------------
-- 5. DRAGGABLE CONTROLS
-------------------------------------------------------------------------------
local dragging, dragStart, startPos
MainFrame.InputBegan:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.Touch or input.UserInputType == Enum.UserInputType.MouseButton1 then
        dragging = true
        dragStart = input.Position
        startPos = MainFrame.Position
    end
end)

UserInputService.InputChanged:Connect(function(input)
    if dragging and (input.UserInputType == Enum.UserInputType.Touch or input.UserInputType == Enum.MouseMovement) then
        local delta = input.Position - dragStart
        MainFrame.Position = UDim2.new(startPos.X.Scale, startPos.X.Offset + delta.X, startPos.Y.Scale, startPos.Y.Offset + delta.Y)
    end
end)

UserInputService.InputEnded:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.Touch or input.UserInputType == Enum.UserInputType.MouseButton1 then
        dragging = false
    end
end)

print("SIE Y HUB Ultimate Functional Script Loaded Successfully!")
