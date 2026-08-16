local ProtectionConfig = { SecretKey = "vheo123", HubName = "SIE Y HUB" }
if not _G[ProtectionConfig.SecretKey] then
    local player = game:GetService("Players").LocalPlayer
    if player then
        player:Kick("\n🛡️ Unauthorized Execution 🛡️\n\nPlease use the official Key System to run " .. ProtectionConfig.HubName)
    end
    return
end

print(ProtectionConfig.HubName .. " Loaded Successfully!")

local Players = game:GetService("Players")
local UserInputService = game:GetService("UserInputService")
local TweenService = game:GetService("TweenService")
local CoreGui = game:GetService("CoreGui")
local LocalPlayer = Players.LocalPlayer
local PlayerGui = LocalPlayer:WaitForChild("PlayerGui")

local successGui, parentGui = pcall(function() return CoreGui end)
if not successGui or not parentGui then
    parentGui = PlayerGui
end

local function OpenMainHub()
    local ScreenGuiName = "SIE Y CUSTOM HUB"
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
    MainFrame.Size = UDim2.new(0, 520, 0, 285)
    MainFrame.Position = UDim2.new(0.5, -260, 0.5, -142)
    MainFrame.BackgroundColor3 = THEME.Background
    MainFrame.BorderSizePixel = 0
    MainFrame.Visible = true
    Instance.new("UICorner", MainFrame).CornerRadius = UDim.new(0, 12)

    local MainStroke = Instance.new("UIStroke", MainFrame)
    MainStroke.Color = Color3.fromRGB(45, 28, 80)
    MainStroke.Thickness = 1.2

    local SettingsModal = Instance.new("Frame", ScreenGui)
    SettingsModal.Size = UDim2.new(0, 360, 0, 220)
    SettingsModal.Position = UDim2.new(0.5, -180, 0.5, -110)
    SettingsModal.BackgroundColor3 = THEME.Background
    SettingsModal.BorderSizePixel = 0
    SettingsModal.Visible = false
    SettingsModal.ZIndex = 10
    Instance.new("UICorner", SettingsModal).CornerRadius = UDim.new(0, 5)

    local ModalStroke = Instance.new("UIStroke", SettingsModal)
    ModalStroke.Color = THEME.AccentPurple
    ModalStroke.Thickness = 1.5

    local ModalHeader = Instance.new("Frame", SettingsModal)
    ModalHeader.Size = UDim2.new(1, 0, 0, 35)
    ModalHeader.BackgroundTransparency = 1
    ModalHeader.ZIndex = 11

    local ModalTitle = Instance.new("TextLabel", ModalHeader)
    ModalTitle.Size = UDim2.new(1, -40, 1, 0)
    ModalTitle.Position = UDim2.new(0, 12, 0, 0)
    ModalTitle.BackgroundTransparency = 1
    ModalTitle.Text = "Hub Preferences & Settings (Draggable)"
    ModalTitle.TextColor3 = THEME.TextWhite
    ModalTitle.Font = Enum.Font.GothamBold
    ModalTitle.TextSize = 9.5
    ModalTitle.TextXAlignment = Enum.TextXAlignment.Left
    ModalTitle.ZIndex = 11

    local ModalCloseBtn = Instance.new("TextButton", ModalHeader)
    ModalCloseBtn.Size = UDim2.new(0, 22, 0, 22)
    ModalCloseBtn.Position = UDim2.new(1, -28, 0.5, -11)
    ModalCloseBtn.BackgroundColor3 = THEME.CardBg
    ModalCloseBtn.Text = "X"
    ModalCloseBtn.TextColor3 = THEME.TextWhite
    ModalCloseBtn.Font = Enum.Font.GothamBold
    ModalCloseBtn.TextSize = 8
    ModalCloseBtn.ZIndex = 11
    Instance.new("UICorner", ModalCloseBtn).CornerRadius = UDim.new(0, 4)
    ModalCloseBtn.MouseButton1Click:Connect(function()
        SettingsModal.Visible = false
    end)

    local mDragging, mDragStart, mStartPos
    ModalHeader.InputBegan:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.Touch or input.UserInputType == Enum.UserInputType.MouseButton1 then
            mDragging = true
            mDragStart = input.Position
            mStartPos = SettingsModal.Position
        end
    end)

    UserInputService.InputChanged:Connect(function(input)
        if mDragging and (input.UserInputType == Enum.UserInputType.Touch or input.UserInputType == Enum.UserInputType.MouseMovement) then
            local delta = input.Position - mDragStart
            SettingsModal.Position = UDim2.new(mStartPos.X.Scale, mStartPos.X.Offset + delta.X, mStartPos.Y.Scale, mStartPos.Y.Offset + delta.Y)
        end
    end)

    UserInputService.InputEnded:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.Touch or input.UserInputType == Enum.UserInputType.MouseButton1 then
            mDragging = false
        end
    end)

    local ModalContent = Instance.new("ScrollingFrame", SettingsModal)
    ModalContent.Size = UDim2.new(1, -16, 1, -45)
    ModalContent.Position = UDim2.new(0, 8, 0, 38)
    ModalContent.BackgroundTransparency = 1
    ModalContent.CanvasSize = UDim2.new(0, 0, 0, 180)
    ModalContent.ScrollBarThickness = 2
    ModalContent.ZIndex = 11

    local ModalLayout = Instance.new("UIListLayout", ModalContent)
    ModalLayout.Padding = UDim.new(0, 6)

    local function AddModalToggle(parent, titleText, descText, defaultState)
        local card = Instance.new("Frame", parent)
        card.Size = UDim2.new(1, 0, 0, 42)
        card.BackgroundColor3 = THEME.CardBg
        card.ZIndex = 11
        Instance.new("UICorner", card).CornerRadius = UDim.new(0, 6)

        local tLbl = Instance.new("TextLabel", card)
        tLbl.Size = UDim2.new(1, -50, 0, 14)
        tLbl.Position = UDim2.new(0, 10, 0, 6)
        tLbl.BackgroundTransparency = 1
        tLbl.Text = titleText
        tLbl.TextColor3 = THEME.TextWhite
        tLbl.Font = Enum.Font.GothamBold
        tLbl.TextSize = 9
        tLbl.TextXAlignment = Enum.TextXAlignment.Left
        tLbl.ZIndex = 11

        local dLbl = Instance.new("TextLabel", card)
        dLbl.Size = UDim2.new(1, -50, 0, 12)
        dLbl.Position = UDim2.new(0, 10, 0, 20)
        dLbl.BackgroundTransparency = 1
        dLbl.Text = descText
        dLbl.TextColor3 = THEME.TextGray
        dLbl.Font = Enum.Font.Gotham
        dLbl.TextSize = 7.5
        dLbl.TextXAlignment = Enum.TextXAlignment.Left
        dLbl.ZIndex = 11

        local switch = Instance.new("TextButton", card)
        switch.Size = UDim2.new(0, 24, 0, 12)
        switch.Position = UDim2.new(1, -32, 0.5, -6)
        switch.BackgroundColor3 = defaultState and THEME.AccentPurple or Color3.fromRGB(40, 40, 55)
        switch.Text = ""
        switch.ZIndex = 11
        Instance.new("UICorner", switch).CornerRadius = UDim.new(1, 0)

        local dot = Instance.new("Frame", switch)
        dot.Size = UDim2.new(0, 8, 0, 8)
        dot.Position = defaultState and UDim2.new(1, -10, 0.5, -4) or UDim2.new(0, 2, 0.5, -4)
        dot.BackgroundColor3 = THEME.TextWhite
        dot.ZIndex = 11
        Instance.new("UICorner", dot).CornerRadius = UDim.new(1, 0)

        local active = defaultState
        switch.MouseButton1Click:Connect(function()
            active = not active
            if active then
                TweenService:Create(switch, TweenInfo.new(0.2), {BackgroundColor3 = THEME.AccentPurple}):Play()
                TweenService:Create(dot, TweenInfo.new(0.2), {Position = UDim2.new(1, -10, 0.5, -4)}):Play()
            else
                TweenService:Create(switch, TweenInfo.new(0.2), {BackgroundColor3 = Color3.fromRGB(40, 40, 55)}):Play()
                TweenService:Create(dot, TweenInfo.new(0.2), {Position = UDim2.new(0, 2, 0.5, -4)}):Play()
            end
        end)
    end

    AddModalToggle(ModalContent, "Show Welcome Notification", "Magpakita ng alert kapag pumasok sa laro.", true)
    AddModalToggle(ModalContent, "Hardware Acceleration", "Gamitin ang GPU para sa mas malinis na UI animations.", true)
    AddModalToggle(ModalContent, "Save Config on Exit", "I-save agad ang current toggles mo.", false)

    -- MINIMIZED / FLOATING CONTAINER WITH RAINBOW STROKE
    local ToggleContainer = Instance.new("Frame", ScreenGui)
    ToggleContainer.Size = UDim2.new(0, 195, 0, 42)
    ToggleContainer.Position = UDim2.new(0, 20, 0, 120)
    ToggleContainer.BackgroundColor3 = THEME.SidebarBg
    ToggleContainer.BorderSizePixel = 0
    ToggleContainer.Visible = false
    Instance.new("UICorner", ToggleContainer).CornerRadius = UDim.new(1, 0)

    local ToggleStroke = Instance.new("UIStroke", ToggleContainer)
    ToggleStroke.Color = THEME.AccentPurple
    ToggleStroke.Thickness = 1.5

    -- Rainbow Loop specifically for ToggleContainer stroke when minimized
    task.spawn(function()
        while true do
            if ToggleContainer.Visible then
                ToggleStroke.Color = Color3.fromHSV(tick() % 5 / 5, 1, 1)
            end
            task.wait(0.1)
        end
    end)

    local ToggleTextContainer = Instance.new("TextLabel", ToggleContainer)
    ToggleTextContainer.Size = UDim2.new(1, -85, 1, 0)
    ToggleTextContainer.Position = UDim2.new(0, 12, 0, 0)
    ToggleTextContainer.BackgroundTransparency = 1
    ToggleTextContainer.Text = "Sie Y Hub\nAuto Tycoon"
    ToggleTextContainer.TextColor3 = THEME.TextWhite
    ToggleTextContainer.Font = Enum.Font.GothamBold
    ToggleTextContainer.TextSize = 8.5
    ToggleTextContainer.TextXAlignment = Enum.TextXAlignment.Left

    local function CreateMiniBtn(text, offset)
        local btn = Instance.new("TextButton", ToggleContainer)
        btn.Size = UDim2.new(0, 26, 0, 26)
        btn.Position = UDim2.new(1, offset, 0.5, -13)
        btn.BackgroundColor3 = THEME.CardBg
        btn.Text = text
        btn.TextColor3 = THEME.TextGray
        btn.Font = Enum.Font.GothamBold
        btn.TextSize = 10
        Instance.new("UICorner", btn).CornerRadius = UDim.new(1, 0)
        return btn
    end

    local ToggleSettingBtn = CreateMiniBtn("⚙", -60)
    local ToggleCloseBtn = CreateMiniBtn("X", -30)

    local tDragging, tDragStart, tStartPos, isDragging = false, nil, nil, false
    local dragThreshold = 5
    ToggleContainer.InputBegan:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.Touch or input.UserInputType == Enum.UserInputType.MouseButton1 then
            tDragging = true
            tDragStart = input.Position
            tStartPos = ToggleContainer.Position
            isDragging = false
        end
    end)

    UserInputService.InputChanged:Connect(function(input)
        if tDragging and (input.UserInputType == Enum.UserInputType.Touch or input.UserInputType == Enum.UserInputType.MouseMovement) then
            local delta = input.Position - tDragStart
            if delta.Magnitude > dragThreshold then
                isDragging = true
                ToggleContainer.Position = UDim2.new(tStartPos.X.Scale, tStartPos.X.Offset + delta.X, tStartPos.Y.Scale, tStartPos.Y.Offset + delta.Y)
            end
        end
    end)

    UserInputService.InputEnded:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.Touch or input.UserInputType == Enum.UserInputType.MouseButton1 then
            if tDragging and not isDragging then
                MainFrame.Visible = true
                ToggleContainer.Visible = false
            end
            tDragging = false
        end
    end)

    ToggleSettingBtn.MouseButton1Click:Connect(function()
        SettingsModal.Visible = not SettingsModal.Visible
    end)
    ToggleCloseBtn.MouseButton1Click:Connect(function()
        ScreenGui:Destroy()
    end)

    local Header = Instance.new("Frame", MainFrame)
    Header.Size = UDim2.new(1, -145, 0, 38)
    Header.Position = UDim2.new(0, 140, 0, 0)
    Header.BackgroundTransparency = 1

    local SearchBar = Instance.new("TextBox", Header)
    SearchBar.Size = UDim2.new(0, 135, 0, 24)
    SearchBar.Position = UDim2.new(0, 4, 0.5, -12)
    SearchBar.BackgroundColor3 = THEME.CardBg
    SearchBar.PlaceholderText = "Search anything..."
    SearchBar.PlaceholderColor3 = THEME.TextGray
    SearchBar.Text = ""
    SearchBar.TextColor3 = THEME.TextWhite
    SearchBar.Font = Enum.Font.Gotham
    SearchBar.TextSize = 8
    Instance.new("UICorner", SearchBar).CornerRadius = UDim.new(0, 6)

    local CtrlTag = Instance.new("Frame", Header)
    CtrlTag.Size = UDim2.new(0, 32, 0, 18)
    CtrlTag.Position = UDim2.new(0, 144, 0.5, -9)
    CtrlTag.BackgroundColor3 = THEME.Background
    Instance.new("UICorner", CtrlTag).CornerRadius = UDim.new(0, 4)

    local CtrlLabel = Instance.new("TextLabel", CtrlTag)
    CtrlLabel.Size = UDim2.new(1, 0, 1, 0)
    CtrlLabel.BackgroundTransparency = 1
    CtrlLabel.Text = "Ctrl/"
    CtrlLabel.TextColor3 = THEME.TextGray
    CtrlLabel.Font = Enum.Font.GothamMedium
    CtrlLabel.TextSize = 7

    local MinBtn = Instance.new("TextButton", Header)
    MinBtn.Size = UDim2.new(0, 24, 0, 24)
    MinBtn.Position = UDim2.new(1, -54, 0.5, -12)
    MinBtn.BackgroundColor3 = THEME.CardBg
    MinBtn.Text = "-"
    MinBtn.TextColor3 = THEME.TextWhite
    MinBtn.Font = Enum.Font.GothamBold
    MinBtn.TextSize = 8
    Instance.new("UICorner", MinBtn).CornerRadius = UDim.new(0, 6)
    MinBtn.MouseButton1Click:Connect(function()
        MainFrame.Visible = false
        ToggleContainer.Visible = true
    end)

    local CloseBtn = Instance.new("TextButton", Header)
    CloseBtn.Size = UDim2.new(0, 24, 0, 24)
    CloseBtn.Position = UDim2.new(1, -26, 0.5, -12)
    CloseBtn.BackgroundColor3 = THEME.CardBg
    CloseBtn.Text = "X"
    CloseBtn.TextColor3 = THEME.TextWhite
    CloseBtn.Font = Enum.Font.GothamBold
    CloseBtn.TextSize = 8
    Instance.new("UICorner", CloseBtn).CornerRadius = UDim.new(0, 6)
    CloseBtn.MouseButton1Click:Connect(function()
        ScreenGui:Destroy()
    end)

    local Sidebar = Instance.new("Frame", MainFrame)
    Sidebar.Size = UDim2.new(0, 132, 1, 0)
    Sidebar.BackgroundColor3 = THEME.SidebarBg
    Sidebar.BorderSizePixel = 0
    Instance.new("UICorner", Sidebar).CornerRadius = UDim.new(0, 12)

    local TopLogoContainer = Instance.new("Frame", Sidebar)
    TopLogoContainer.Size = UDim2.new(1, -8, 0, 42)
    TopLogoContainer.Position = UDim2.new(0, 4, 0, 6)
    TopLogoContainer.BackgroundTransparency = 1

    local TopLogoIcon = Instance.new("Frame", TopLogoContainer)
    TopLogoIcon.Size = UDim2.new(0, 24, 0, 24)
    TopLogoIcon.Position = UDim2.new(0, 4, 0, 2)
    TopLogoIcon.BackgroundColor3 = THEME.AccentPurple
    Instance.new("UICorner", TopLogoIcon).CornerRadius = UDim.new(1, 0)

    local TopLogoText = Instance.new("TextLabel", TopLogoIcon)
    TopLogoText.Size = UDim2.new(1, 0, 1, 0)
    TopLogoText.BackgroundTransparency = 1
    TopLogoText.Text = "SY"
    TopLogoText.TextColor3 = THEME.TextWhite
    TopLogoText.Font = Enum.Font.GothamBold
    TopLogoText.TextSize = 9

    local TopHubTitle = Instance.new("TextLabel", TopLogoContainer)
    TopHubTitle.Position = UDim2.new(0, 32, 0, 0)
    TopHubTitle.Size = UDim2.new(0, 85, 0, 14)
    TopHubTitle.BackgroundTransparency = 1
    TopHubTitle.Text = "Sie Y Hub"
    TopHubTitle.TextColor3 = THEME.TextWhite
    TopHubTitle.Font = Enum.Font.GothamBold
    TopHubTitle.TextSize = 9
    TopHubTitle.TextXAlignment = Enum.TextXAlignment.Left

    local TopHubVer = Instance.new("TextLabel", TopLogoContainer)
    TopHubVer.Position = UDim2.new(0, 32, 0, 14)
    TopHubVer.Size = UDim2.new(0, 85, 0, 10)
    TopHubVer.BackgroundTransparency = 1
    TopHubVer.Text = "v1.0.0"
    TopHubVer.TextColor3 = THEME.TextGray
    TopHubVer.Font = Enum.Font.Gotham
    TopHubVer.TextSize = 8
    TopHubVer.TextXAlignment = Enum.TextXAlignment.Left

    local GameTitleLabel = Instance.new("TextLabel", TopLogoContainer)
    GameTitleLabel.Position = UDim2.new(0, 4, 0, 28)
    GameTitleLabel.Size = UDim2.new(1, -4, 0, 12)
    GameTitleLabel.BackgroundTransparency = 1
    GameTitleLabel.Text = "Tycoon Automation"
    GameTitleLabel.TextColor3 = THEME.AccentPurple
    GameTitleLabel.Font = Enum.Font.GothamBold
    GameTitleLabel.TextSize = 8
    GameTitleLabel.TextXAlignment = Enum.TextXAlignment.Left

    local NavContainer = Instance.new("ScrollingFrame", Sidebar)
    NavContainer.Size = UDim2.new(1, -6, 1, -100)
    NavContainer.Position = UDim2.new(0, 3, 0, 52)
    NavContainer.BackgroundTransparency = 1
    NavContainer.CanvasSize = UDim2.new(0, 0, 0, 260)
    NavContainer.ScrollBarThickness = 2
    local NavLayout = Instance.new("UIListLayout", NavContainer)
    NavLayout.Padding = UDim.new(0, 2)

    local UserProfile = Instance.new("Frame", Sidebar)
    UserProfile.Size = UDim2.new(1, -8, 0, 48)
    UserProfile.Position = UDim2.new(0, 4, 1, -52)
    UserProfile.BackgroundColor3 = THEME.CardBg
    Instance.new("UICorner", UserProfile).CornerRadius = UDim.new(0, 6)

    local BottomAvatar = Instance.new("ImageLabel", UserProfile)
    BottomAvatar.Size = UDim2.new(0, 32, 0, 32)
    BottomAvatar.Position = UDim2.new(0, 6, 0.5, -16)
    BottomAvatar.BackgroundColor3 = THEME.Background
    pcall(function()
        BottomAvatar.Image = Players:GetUserThumbnailAsync(LocalPlayer.UserId, Enum.ThumbnailType.HeadShot, Enum.ThumbnailSize.Size420x420)
    end)
    Instance.new("UICorner", BottomAvatar).CornerRadius = UDim.new(1, 0)

    local UName = Instance.new("TextLabel", UserProfile)
    UName.Size = UDim2.new(1, -44, 0, 14)
    UName.Position = UDim2.new(0, 42, 0, 9)
    UName.BackgroundTransparency = 1
    UName.Text = LocalPlayer.Name
    UName.TextColor3 = THEME.TextWhite
    UName.Font = Enum.Font.GothamBold
    UName.TextSize = 7.5
    UName.TextXAlignment = Enum.TextXAlignment.Left

    local URole = Instance.new("TextLabel", UserProfile)
    URole.Size = UDim2.new(1, -44, 0, 12)
    URole.Position = UDim2.new(0, 42, 0, 23)
    URole.BackgroundTransparency = 1
    URole.Text = "Premium"
    URole.TextColor3 = THEME.AccentPurple
    URole.Font = Enum.Font.GothamBold
    URole.TextSize = 6.5
    URole.TextXAlignment = Enum.TextXAlignment.Left

    local PagesContainer = Instance.new("Folder", MainFrame)
    PagesContainer.Name = "PagesContainer"
    local AllPages = {}

    local function CreatePage()
        local page = Instance.new("ScrollingFrame", PagesContainer)
        page.Size = UDim2.new(1, -136, 1, -44)
        page.Position = UDim2.new(0, 136, 0, 40)
        page.BackgroundTransparency = 1
        page.Visible = false
        page.CanvasSize = UDim2.new(0, 0, 0, 350)
        page.ScrollBarThickness = 2
        local layout = Instance.new("UIListLayout", page)
        layout.Padding = UDim.new(0, 6)
        return page
    end

    -- PAGES SETUP
    local pDashboard = CreatePage()
    pDashboard.Visible = true

    -- Dashboard Layout (No features here, just welcome card & status)
    local InfoRow = Instance.new("Frame", pDashboard)
    InfoRow.Size = UDim2.new(1, -6, 0, 50)
    InfoRow.BackgroundTransparency = 1

    local WelCard = Instance.new("Frame", InfoRow)
    WelCard.Size = UDim2.new(0.58, -3, 1, 0)
    WelCard.BackgroundColor3 = THEME.CardBg
    Instance.new("UICorner", WelCard).CornerRadius = UDim.new(0, 6)

    local WelPrefix = Instance.new("TextLabel", WelCard)
    WelPrefix.Size = UDim2.new(1, -10, 0, 12)
    WelPrefix.Position = UDim2.new(0, 8, 0, 6)
    WelPrefix.BackgroundTransparency = 1
    WelPrefix.Text = "Welcome back,"
    WelPrefix.TextColor3 = THEME.TextWhite
    WelPrefix.Font = Enum.Font.GothamMedium
    WelPrefix.TextSize = 7.5
    WelPrefix.TextXAlignment = Enum.TextXAlignment.Left

    local WelName = Instance.new("TextLabel", WelCard)
    WelName.Size = UDim2.new(1, -10, 0, 16)
    WelName.Position = UDim2.new(0, 8, 0, 17)
    WelName.BackgroundTransparency = 1
    WelName.Text = LocalPlayer.Name
    WelName.TextColor3 = THEME.TextWhite
    WelName.Font = Enum.Font.GothamBold
    WelName.TextSize = 10
    WelName.TextXAlignment = Enum.TextXAlignment.Left

    local WelDiscord = Instance.new("TextLabel", WelCard)
    WelDiscord.Size = UDim2.new(1, -10, 0, 10)
    WelDiscord.Position = UDim2.new(0, 8, 0, 34)
    WelDiscord.BackgroundTransparency = 1
    WelDiscord.Text = "discord.gg/sieyhub"
    WelDiscord.TextColor3 = Color3.fromRGB(100, 95, 120)
    WelDiscord.Font = Enum.Font.Gotham
    WelDiscord.TextSize = 6.5
    WelDiscord.TextXAlignment = Enum.TextXAlignment.Left

    local StatusCard = Instance.new("Frame", InfoRow)
    StatusCard.Size = UDim2.new(0.42, -3, 1, 0)
    StatusCard.Position = UDim2.new(0.58, 3, 0, 0)
    StatusCard.BackgroundColor3 = THEME.CardBg
    Instance.new("UICorner", StatusCard).CornerRadius = UDim.new(0, 6)

    local StatusTitle = Instance.new("TextLabel", StatusCard)
    StatusTitle.Size = UDim2.new(1, -10, 0, 10)
    StatusTitle.Position = UDim2.new(0, 8, 0, 5)
    StatusTitle.BackgroundTransparency = 1
    StatusTitle.Text = "STATUS"
    StatusTitle.TextColor3 = THEME.TextGray
    StatusTitle.Font = Enum.Font.GothamBold
    StatusTitle.TextSize = 6
    StatusTitle.TextXAlignment = Enum.TextXAlignment.Left

    local StatusDot = Instance.new("Frame", StatusCard)
    StatusDot.Size = UDim2.new(0, 5, 0, 5)
    StatusDot.Position = UDim2.new(0, 8, 0, 20)
    StatusDot.BackgroundColor3 = THEME.SuccessGreen
    Instance.new("UICorner", StatusDot).CornerRadius = UDim.new(1, 0)

    local StatusText = Instance.new("TextLabel", StatusCard)
    StatusText.Size = UDim2.new(1, -18, 0, 12)
    StatusText.Position = UDim2.new(0, 16, 0, 16)
    StatusText.BackgroundTransparency = 1
    StatusText.Text = "Connected"
    StatusText.TextColor3 = THEME.TextWhite
    StatusText.Font = Enum.Font.GothamBold
    StatusText.TextSize = 8
    StatusText.TextXAlignment = Enum.TextXAlignment.Left

    local PingText = Instance.new("TextLabel", StatusCard)
    PingText.Size = UDim2.new(1, -12, 0, 12)
    PingText.Position = UDim2.new(0, 8, 0, 32)
    PingText.BackgroundTransparency = 1
    PingText.Text = "0 ms"
    PingText.TextColor3 = THEME.TextGray
    PingText.Font = Enum.Font.Gotham
    PingText.TextSize = 7
    PingText.TextXAlignment = Enum.TextXAlignment.Left

    -- Dedicated Feature Pages
    local pFarming = CreatePage()  -- Ore & Drills
    local pCrates = CreatePage()   -- Crates & Furnace
    local pUpgrades = CreatePage() -- Upgrades (Spending Money)
    local pBoosts = CreatePage()   -- Boosts & Free Money
    local pSettings = CreatePage() -- Settings / Destroy UI

    local function AddSimpleToggle(parent, name, defaultState)
        local card = Instance.new("Frame", parent)
        card.Size = UDim2.new(1, -6, 0, 32)
        card.BackgroundColor3 = THEME.CardBg
        Instance.new("UICorner", card).CornerRadius = UDim.new(0, 6)

        local nameLbl = Instance.new("TextLabel", card)
        nameLbl.Size = UDim2.new(1, -40, 1, 0)
        nameLbl.Position = UDim2.new(0, 8, 0, 0)
        nameLbl.BackgroundTransparency = 1
        nameLbl.Text = name
        nameLbl.TextColor3 = THEME.TextWhite
        nameLbl.Font = Enum.Font.GothamBold
        nameLbl.TextSize = 9
        nameLbl.TextXAlignment = Enum.TextXAlignment.Left

        local switch = Instance.new("TextButton", card)
        switch.Size = UDim2.new(0, 24, 0, 12)
        switch.Position = UDim2.new(1, -30, 0.5, -6)
        switch.BackgroundColor3 = defaultState and THEME.AccentPurple or Color3.fromRGB(40, 40, 55)
        switch.Text = ""
        Instance.new("UICorner", switch).CornerRadius = UDim.new(1, 0)

        local dot = Instance.new("Frame", switch)
        dot.Size = UDim2.new(0, 8, 0, 8)
        dot.Position = defaultState and UDim2.new(1, -10, 0.5, -4) or UDim2.new(0, 2, 0.5, -4)
        dot.BackgroundColor3 = THEME.TextWhite
        Instance.new("UICorner", dot).CornerRadius = UDim.new(1, 0)

        local active = defaultState
        switch.MouseButton1Click:Connect(function()
            active = not active
            if active then
                TweenService:Create(switch, TweenInfo.new(0.2), {BackgroundColor3 = THEME.AccentPurple}):Play()
                TweenService:Create(dot, TweenInfo.new(0.2), {Position = UDim2.new(1, -10, 0.5, -4)}):Play()
            else
                TweenService:Create(switch, TweenInfo.new(0.2), {BackgroundColor3 = Color3.fromRGB(40, 40, 55)}):Play()
                TweenService:Create(dot, TweenInfo.new(0.2), {Position = UDim2.new(0, 2, 0.5, -4)}):Play()
            end
        end)
    end

    -- POPULATE FEATURES TO TABS
    -- 1. Ore & Drills
    AddSimpleToggle(pFarming, "Auto Roll (autoRoll)", false)
    AddSimpleToggle(pFarming, "Auto Buy Ore (autoBuyOre)", false)
    AddSimpleToggle(pFarming, "Auto Equip Best (autoEquip)", false)
    AddSimpleToggle(pFarming, "Auto Ore Level (autoOreLevel)", false)

    -- 2. Crates & Furnace
    AddSimpleToggle(pCrates, "Auto Pickup (autoPickup)", false)
    AddSimpleToggle(pCrates, "Auto Sell (autoSell)", false)
    AddSimpleToggle(pCrates, "Auto Furnace (autoFurnace)", false)

    -- 3. Upgrades (Spending Money)
    AddSimpleToggle(pUpgrades, "Auto Drill Upgrades (autoUpgrade)", false)
    AddSimpleToggle(pUpgrades, "Auto Roller Upgrades (autoRoller)", false)
    AddSimpleToggle(pUpgrades, "Auto Tunnels (autoTunnels)", false)
    AddSimpleToggle(pUpgrades, "Auto Floors (autoFloors)", false)

    -- 4. Boosts & Free Money
    AddSimpleToggle(pBoosts, "Auto Boost Pedestals (autoBoost)", false)
    AddSimpleToggle(pBoosts, "Auto Growth Gems (autoGear)", false)
    AddSimpleToggle(pBoosts, "Auto Rewards (autoRewards)", false)

    -- 5. Settings Tab
    local function AddButton(parent, name, callback)
        local card = Instance.new("Frame", parent)
        card.Size = UDim2.new(1, -6, 0, 32)
        card.BackgroundColor3 = THEME.CardBg
        Instance.new("UICorner", card).CornerRadius = UDim.new(0, 6)

        local btn = Instance.new("TextButton", card)
        btn.Size = UDim2.new(1, 0, 1, 0)
        btn.BackgroundTransparency = 1
        btn.Text = " " .. name
        btn.TextColor3 = THEME.TextWhite
        btn.Font = Enum.Font.GothamBold
        btn.TextSize = 9
        btn.TextXAlignment = Enum.TextXAlignment.Left
        btn.MouseButton1Click:Connect(function()
            if callback then callback() end
        end)
    end

    AddSimpleToggle(pSettings, "Auto Save Configuration", true)
    AddButton(pSettings, "Destroy UI", function()
        ScreenGui:Destroy()
    end)

    table.insert(AllPages, pDashboard)
    table.insert(AllPages, pFarming)
    table.insert(AllPages, pCrates)
    table.insert(AllPages, pUpgrades)
    table.insert(AllPages, pBoosts)
    table.insert(AllPages, pSettings)

    local TabButtons = {}
    local function CreateTab(name, icon, index, isSelected)
        local btn = Instance.new("TextButton", NavContainer)
        btn.Size = UDim2.new(1, 0, 0, 26)
        btn.BackgroundColor3 = isSelected and THEME.AccentPurple or THEME.CardBg
        btn.Text = " " .. icon .. " " .. name
        btn.BackgroundTransparency = isSelected and 0.2 or 1
        btn.TextColor3 = isSelected and THEME.TextWhite or THEME.TextGray
        btn.Font = isSelected and Enum.Font.GothamBold or Enum.Font.GothamMedium
        btn.TextSize = 8
        btn.TextXAlignment = Enum.TextXAlignment.Left
        Instance.new("UICorner", btn).CornerRadius = UDim.new(0, 6)

        btn.MouseButton1Click:Connect(function()
            for i, p in ipairs(AllPages) do
                p.Visible = (i == index)
            end
            for _, t in ipairs(TabButtons) do
                if t.Btn == btn then
                    t.Btn.BackgroundColor3 = THEME.AccentPurple
                    t.Btn.BackgroundTransparency = 0.2
                    t.Btn.TextColor3 = THEME.TextWhite
                    t.Btn.Font = Enum.Font.GothamBold
                else
                    t.Btn.BackgroundColor3 = THEME.CardBg
                    t.Btn.BackgroundTransparency = 1
                    t.Btn.TextColor3 = THEME.TextGray
                    t.Btn.Font = Enum.Font.GothamMedium
                end
            end
        end)
        table.insert(TabButtons, {Btn = btn, Index = index})
    end

    -- NAVIGATION TABS SETUP
    CreateTab("Dashboard", "🏠", 1, true)
    CreateTab("Ore & Drills", "⛏️", 2, false)
    CreateTab("Crates & Furnace", "📦", 3, false)
    CreateTab("Upgrades", "🔧", 4, false)
    CreateTab("Boosts & Money", "💎", 5, false)
    CreateTab("Settings", "⚙️", 6, false)

    local dragging, dragStart, startPos
    Header.InputBegan:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.Touch or input.UserInputType == Enum.UserInputType.MouseButton1 then
            dragging = true
            dragStart = input.Position
            startPos = MainFrame.Position
        end
    end)

    UserInputService.InputChanged:Connect(function(input)
        if dragging and (input.UserInputType == Enum.UserInputType.Touch or input.UserInputType == Enum.UserInputType.MouseMovement) then
            local delta = input.Position - dragStart
            MainFrame.Position = UDim2.new(startPos.X.Scale, startPos.X.Offset + delta.X, startPos.Y.Scale, startPos.Y.Offset + delta.Y)
        end
    end)

    UserInputService.InputEnded:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.Touch or input.UserInputType == Enum.UserInputType.MouseButton1 then
            dragging = false
        end
    end)
end

OpenMainHub()
