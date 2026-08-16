local ProtectionConfig = {
    SecretKey = "vheo123",
    HubName = "SIE Y HUB"
}

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

local successGui, parentGui = pcall(function()
    return CoreGui
end)

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

    ---------------------------------------------------------------------------
    -- SCREEN GUI
    ---------------------------------------------------------------------------

    local ScreenGui = Instance.new("ScreenGui")
    ScreenGui.Parent = parentGui
    ScreenGui.Name = ScreenGuiName
    ScreenGui.IgnoreGuiInset = true
    ScreenGui.ResetOnSpawn = false

    ---------------------------------------------------------------------------
    -- MAIN FRAME
    ---------------------------------------------------------------------------

    local MainFrame = Instance.new("Frame")
    MainFrame.Parent = ScreenGui
    MainFrame.Size = UDim2.new(0, 520, 0, 285)
    MainFrame.Position = UDim2.new(0.5, -260, 0.5, -142)
    MainFrame.BackgroundColor3 = THEME.Background
    MainFrame.BorderSizePixel = 0
    MainFrame.Visible = true

    Instance.new("UICorner", MainFrame).CornerRadius = UDim.new(0, 12)

    local MainStroke = Instance.new("UIStroke", MainFrame)
    MainStroke.Color = Color3.fromRGB(45, 28, 80)
    MainStroke.Thickness = 1.2

    ---------------------------------------------------------------------------
    -- SETTINGS MODAL (Gear icon)
    ---------------------------------------------------------------------------

    local SettingsModal = Instance.new("Frame")
    SettingsModal.Parent = ScreenGui
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

    local ModalHeader = Instance.new("Frame")
    ModalHeader.Parent = SettingsModal
    ModalHeader.Size = UDim2.new(1, 0, 0, 35)
    ModalHeader.BackgroundTransparency = 1
    ModalHeader.ZIndex = 11

    local ModalTitle = Instance.new("TextLabel")
    ModalTitle.Parent = ModalHeader
    ModalTitle.Size = UDim2.new(1, -40, 1, 0)
    ModalTitle.Position = UDim2.new(0, 12, 0, 0)
    ModalTitle.BackgroundTransparency = 1
    ModalTitle.Text = "Hub Preferences & Settings (Draggable)"
    ModalTitle.TextColor3 = THEME.TextWhite
    ModalTitle.Font = Enum.Font.GothamBold
    ModalTitle.TextSize = 9.5
    ModalTitle.TextXAlignment = Enum.TextXAlignment.Left
    ModalTitle.ZIndex = 11

    local ModalCloseBtn = Instance.new("TextButton")
    ModalCloseBtn.Parent = ModalHeader
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

    ---------------------------------------------------------------------------
    -- MODAL DRAG
    ---------------------------------------------------------------------------

    local mDragging = false
    local mDragStart
    local mStartPos

    ModalHeader.InputBegan:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.Touch
            or input.UserInputType == Enum.UserInputType.MouseButton1 then

            mDragging = true
            mDragStart = input.Position
            mStartPos = SettingsModal.Position
        end
    end)

    UserInputService.InputChanged:Connect(function(input)
        if mDragging and (
            input.UserInputType == Enum.UserInputType.Touch
            or input.UserInputType == Enum.UserInputType.MouseMovement
        ) then

            local delta = input.Position - mDragStart

            SettingsModal.Position = UDim2.new(
                mStartPos.X.Scale,
                mStartPos.X.Offset + delta.X,
                mStartPos.Y.Scale,
                mStartPos.Y.Offset + delta.Y
            )
        end
    end)

    UserInputService.InputEnded:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.Touch
            or input.UserInputType == Enum.UserInputType.MouseButton1 then

            mDragging = false
        end
    end)

    ---------------------------------------------------------------------------
    -- MODAL CONTENT
    ---------------------------------------------------------------------------

    local ModalContent = Instance.new("ScrollingFrame")
    ModalContent.Parent = SettingsModal
    ModalContent.Size = UDim2.new(1, -16, 1, -45)
    ModalContent.Position = UDim2.new(0, 8, 0, 38)
    ModalContent.BackgroundTransparency = 1
    ModalContent.CanvasSize = UDim2.new(0, 0, 0, 180)
    ModalContent.ScrollBarThickness = 2
    ModalContent.ZIndex = 11

    local ModalLayout = Instance.new("UIListLayout")
    ModalLayout.Parent = ModalContent
    ModalLayout.Padding = UDim.new(0, 6)

    local function AddModalToggle(parent, titleText, descText, defaultState)

        local card = Instance.new("Frame")
        card.Parent = parent
        card.Size = UDim2.new(1, 0, 0, 42)
        card.BackgroundColor3 = THEME.CardBg
        card.ZIndex = 11

        Instance.new("UICorner", card).CornerRadius = UDim.new(0, 6)

        local tLbl = Instance.new("TextLabel")
        tLbl.Parent = card
        tLbl.Size = UDim2.new(1, -50, 0, 14)
        tLbl.Position = UDim2.new(0, 10, 0, 6)
        tLbl.BackgroundTransparency = 1
        tLbl.Text = titleText
        tLbl.TextColor3 = THEME.TextWhite
        tLbl.Font = Enum.Font.GothamBold
        tLbl.TextSize = 9
        tLbl.TextXAlignment = Enum.TextXAlignment.Left
        tLbl.ZIndex = 11

        local dLbl = Instance.new("TextLabel")
        dLbl.Parent = card
        dLbl.Size = UDim2.new(1, -50, 0, 12)
        dLbl.Position = UDim2.new(0, 10, 0, 20)
        dLbl.BackgroundTransparency = 1
        dLbl.Text = descText
        dLbl.TextColor3 = THEME.TextGray
        dLbl.Font = Enum.Font.Gotham
        dLbl.TextSize = 7.5
        dLbl.TextXAlignment = Enum.TextXAlignment.Left
        dLbl.ZIndex = 11

        local switch = Instance.new("TextButton")
        switch.Parent = card
        switch.Size = UDim2.new(0, 24, 0, 12)
        switch.Position = UDim2.new(1, -32, 0.5, -6)
        switch.BackgroundColor3 = defaultState
            and THEME.AccentPurple
            or Color3.fromRGB(40, 40, 55)
        switch.Text = ""
        switch.ZIndex = 11

        Instance.new("UICorner", switch).CornerRadius = UDim.new(1, 0)

        local dot = Instance.new("Frame")
        dot.Parent = switch
        dot.Size = UDim2.new(0, 8, 0, 8)
        dot.Position = defaultState
            and UDim2.new(1, -10, 0.5, -4)
            or UDim2.new(0, 2, 0.5, -4)
        dot.BackgroundColor3 = THEME.TextWhite
        dot.ZIndex = 11

        Instance.new("UICorner", dot).CornerRadius = UDim.new(1, 0)

        local active = defaultState

        switch.MouseButton1Click:Connect(function()

            active = not active

            if active then

                TweenService:Create(
                    switch,
                    TweenInfo.new(0.2),
                    {
                        BackgroundColor3 = THEME.AccentPurple
                    }
                ):Play()

                TweenService:Create(
                    dot,
                    TweenInfo.new(0.2),
                    {
                        Position = UDim2.new(1, -10, 0.5, -4)
                    }
                ):Play()

            else

                TweenService:Create(
                    switch,
                    TweenInfo.new(0.2),
                    {
                        BackgroundColor3 = Color3.fromRGB(40, 40, 55)
                    }
                ):Play()

                TweenService:Create(
                    dot,
                    TweenInfo.new(0.2),
                    {
                        Position = UDim2.new(0, 2, 0.5, -4)
                    }
                ):Play()

            end
        end)
    end

    AddModalToggle(
        ModalContent,
        "Show Welcome Notification",
        "Magpakita ng alert kapag pumasok sa laro.",
        true
    )

    AddModalToggle(
        ModalContent,
        "Hardware Acceleration",
        "Gamitin ang GPU para sa mas malinis na UI animations.",
        true
    )

    AddModalToggle(
        ModalContent,
        "Save Config on Exit",
        "I-save agad ang current toggles mo.",
        false
    )

    ---------------------------------------------------------------------------
    -- MINIMIZED FLOATING UI
    ---------------------------------------------------------------------------

    local ToggleContainer = Instance.new("Frame")
    ToggleContainer.Parent = ScreenGui
    ToggleContainer.Size = UDim2.new(0, 195, 0, 42)
    ToggleContainer.Position = UDim2.new(0, 20, 0, 120)
    ToggleContainer.BackgroundColor3 = THEME.SidebarBg
    ToggleContainer.BorderSizePixel = 0
    ToggleContainer.Visible = false

    Instance.new("UICorner", ToggleContainer).CornerRadius = UDim.new(1, 0)

    local ToggleStroke = Instance.new("UIStroke")
    ToggleStroke.Parent = ToggleContainer
    ToggleStroke.Color = THEME.AccentPurple
    ToggleStroke.Thickness = 1

    local ToggleTextContainer = Instance.new("TextLabel")
    ToggleTextContainer.Parent = ToggleContainer
    ToggleTextContainer.Size = UDim2.new(1, -85, 1, 0)
    ToggleTextContainer.Position = UDim2.new(0, 12, 0, 0)
    ToggleTextContainer.BackgroundTransparency = 1
    ToggleTextContainer.Text = "Sie Y Hub\nPet Simulator 99"
    ToggleTextContainer.TextColor3 = THEME.TextWhite
    ToggleTextContainer.Font = Enum.Font.GothamBold
    ToggleTextContainer.TextSize = 8.5
    ToggleTextContainer.TextXAlignment = Enum.TextXAlignment.Left

    local function CreateMiniBtn(text, offset)

        local btn = Instance.new("TextButton")
        btn.Parent = ToggleContainer
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

    ---------------------------------------------------------------------------
    -- FLOATING UI DRAG
    ---------------------------------------------------------------------------

    local tDragging = false
    local tDragStart
    local tStartPos
    local isDragging = false

    local dragThreshold = 5

    ToggleContainer.InputBegan:Connect(function(input)

        if input.UserInputType == Enum.UserInputType.Touch
            or input.UserInputType == Enum.UserInputType.MouseButton1 then

            tDragging = true
            tDragStart = input.Position
            tStartPos = ToggleContainer.Position
            isDragging = false

        end
    end)

    UserInputService.InputChanged:Connect(function(input)

        if tDragging and (
            input.UserInputType == Enum.UserInputType.Touch
            or input.UserInputType == Enum.UserInputType.MouseMovement
        ) then

            local delta = input.Position - tDragStart

            if delta.Magnitude > dragThreshold then

                isDragging = true

                ToggleContainer.Position = UDim2.new(
                    tStartPos.X.Scale,
                    tStartPos.X.Offset + delta.X,
                    tStartPos.Y.Scale,
                    tStartPos.Y.Offset + delta.Y
                )
            end
        end
    end)

    UserInputService.InputEnded:Connect(function(input)

        if input.UserInputType == Enum.UserInputType.Touch
            or input.UserInputType == Enum.UserInputType.MouseButton1 then

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

    ---------------------------------------------------------------------------
    -- HEADER
    ---------------------------------------------------------------------------

    local Header = Instance.new("Frame")
    Header.Parent = MainFrame
    Header.Size = UDim2.new(1, -145, 0, 38)
    Header.Position = UDim2.new(0, 140, 0, 0)
    Header.BackgroundTransparency = 1

    local SearchBar = Instance.new("TextBox")
    SearchBar.Parent = Header
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

    local CtrlTag = Instance.new("Frame")
    CtrlTag.Parent = Header
    CtrlTag.Size = UDim2.new(0, 32, 0, 18)
    CtrlTag.Position = UDim2.new(0, 144, 0.5, -9)
    CtrlTag.BackgroundColor3 = THEME.Background

    Instance.new("UICorner", CtrlTag).CornerRadius = UDim.new(0, 4)

    local CtrlLabel = Instance.new("TextLabel")
    CtrlLabel.Parent = CtrlTag
    CtrlLabel.Size = UDim2.new(1, 0, 1, 0)
    CtrlLabel.BackgroundTransparency = 1
    CtrlLabel.Text = "Ctrl/"
    CtrlLabel.TextColor3 = THEME.TextGray
    CtrlLabel.Font = Enum.Font.GothamMedium
    CtrlLabel.TextSize = 7

    local MinBtn = Instance.new("TextButton")
    MinBtn.Parent = Header
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

    local CloseBtn = Instance.new("TextButton")
    CloseBtn.Parent = Header
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

    ---------------------------------------------------------------------------
    -- SIDEBAR (with User Profile only, no navigation tabs)
    ---------------------------------------------------------------------------

    local Sidebar = Instance.new("Frame")
    Sidebar.Parent = MainFrame
    Sidebar.Size = UDim2.new(0, 132, 1, 0)
    Sidebar.BackgroundColor3 = THEME.SidebarBg
    Sidebar.BorderSizePixel = 0

    Instance.new("UICorner", Sidebar).CornerRadius = UDim.new(0, 12)

    ---------------------------------------------------------------------------
    -- TOP LOGO
    ---------------------------------------------------------------------------

    local TopLogoContainer = Instance.new("Frame")
    TopLogoContainer.Parent = Sidebar
    TopLogoContainer.Size = UDim2.new(1, -8, 0, 42)
    TopLogoContainer.Position = UDim2.new(0, 4, 0, 6)
    TopLogoContainer.BackgroundTransparency = 1

    local TopLogoIcon = Instance.new("ImageLabel")
    TopLogoIcon.Parent = TopLogoContainer
    TopLogoIcon.Size = UDim2.new(0, 24, 0, 24)
    TopLogoIcon.Position = UDim2.new(0, 4, 0, 2)
    TopLogoIcon.BackgroundTransparency = 1
    TopLogoIcon.Image = "rbxassetid://92206600654614"
    TopLogoIcon.ScaleType = Enum.ScaleType.Crop

    Instance.new("UICorner", TopLogoIcon).CornerRadius = UDim.new(1, 0)

    local TopHubTitle = Instance.new("TextLabel")
    TopHubTitle.Parent = TopLogoContainer
    TopHubTitle.Position = UDim2.new(0, 32, 0, 0)
    TopHubTitle.Size = UDim2.new(0, 85, 0, 14)
    TopHubTitle.BackgroundTransparency = 1
    TopHubTitle.Text = "Sie Y Hub"
    TopHubTitle.TextColor3 = THEME.TextWhite
    TopHubTitle.Font = Enum.Font.GothamBold
    TopHubTitle.TextSize = 9
    TopHubTitle.TextXAlignment = Enum.TextXAlignment.Left

    local TopHubVer = Instance.new("TextLabel")
    TopHubVer.Parent = TopLogoContainer
    TopHubVer.Position = UDim2.new(0, 32, 0, 14)
    TopHubVer.Size = UDim2.new(0, 85, 0, 10)
    TopHubVer.BackgroundTransparency = 1
    TopHubVer.Text = "v1.0.0"
    TopHubVer.TextColor3 = THEME.TextGray
    TopHubVer.Font = Enum.Font.Gotham
    TopHubVer.TextSize = 8
    TopHubVer.TextXAlignment = Enum.TextXAlignment.Left

    local GameTitleLabel = Instance.new("TextLabel")
    GameTitleLabel.Parent = TopLogoContainer
    GameTitleLabel.Position = UDim2.new(0, 4, 0, 28)
    GameTitleLabel.Size = UDim2.new(1, -4, 0, 12)
    GameTitleLabel.BackgroundTransparency = 1
    GameTitleLabel.Text = "MM2 MONO"
    GameTitleLabel.TextColor3 = THEME.AccentPurple
    GameTitleLabel.Font = Enum.Font.GothamBold
    GameTitleLabel.TextSize = 8
    GameTitleLabel.TextXAlignment = Enum.TextXAlignment.Left

    ---------------------------------------------------------------------------
    -- USER PROFILE (bottom of sidebar)
    ---------------------------------------------------------------------------

    local UserProfile = Instance.new("Frame")
    UserProfile.Parent = Sidebar
    UserProfile.Size = UDim2.new(1, -8, 0, 48)
    UserProfile.Position = UDim2.new(0, 4, 1, -52)
    UserProfile.BackgroundColor3 = THEME.CardBg

    Instance.new("UICorner", UserProfile).CornerRadius = UDim.new(0, 6)

    local BottomAvatar = Instance.new("ImageLabel")
    BottomAvatar.Parent = UserProfile
    BottomAvatar.Size = UDim2.new(0, 32, 0, 32)
    BottomAvatar.Position = UDim2.new(0, 6, 0.5, -16)
    BottomAvatar.BackgroundColor3 = THEME.Background

    pcall(function()
        BottomAvatar.Image = Players:GetUserThumbnailAsync(
            LocalPlayer.UserId,
            Enum.ThumbnailType.HeadShot,
            Enum.ThumbnailSize.Size420x420
        )
    end)

    Instance.new("UICorner", BottomAvatar).CornerRadius = UDim.new(1, 0)

    local UName = Instance.new("TextLabel")
    UName.Parent = UserProfile
    UName.Size = UDim2.new(1, -44, 0, 14)
    UName.Position = UDim2.new(0, 42, 0, 9)
    UName.BackgroundTransparency = 1
    UName.Text = LocalPlayer.Name
    UName.TextColor3 = THEME.TextWhite
    UName.Font = Enum.Font.GothamBold
    UName.TextSize = 7.5
    UName.TextXAlignment = Enum.TextXAlignment.Left

    local URole = Instance.new("TextLabel")
    URole.Parent = UserProfile
    URole.Size = UDim2.new(1, -44, 0, 12)
    URole.Position = UDim2.new(0, 42, 0, 23)
    URole.BackgroundTransparency = 1
    URole.Text = "Premium"
    URole.TextColor3 = THEME.AccentPurple
    URole.Font = Enum.Font.GothamBold
    URole.TextSize = 6.5
    URole.TextXAlignment = Enum.TextXAlignment.Left

    ---------------------------------------------------------------------------
    -- DASHBOARD PAGE (only page)
    ---------------------------------------------------------------------------

    local pDashboard = Instance.new("ScrollingFrame")
    pDashboard.Parent = MainFrame
    pDashboard.Size = UDim2.new(1, -136, 1, -44)
    pDashboard.Position = UDim2.new(0, 136, 0, 40)
    pDashboard.BackgroundTransparency = 1
    pDashboard.Visible = true
    pDashboard.CanvasSize = UDim2.new(0, 0, 0, 600) -- enough for all info
    pDashboard.ScrollBarThickness = 2

    local DashboardLayout = Instance.new("UIListLayout")
    DashboardLayout.Parent = pDashboard
    DashboardLayout.Padding = UDim.new(0, 6)

    ---------------------------------------------------------------------------
    -- WELCOME + STATUS (unchanged)
    ---------------------------------------------------------------------------

    local InfoRow = Instance.new("Frame")
    InfoRow.Parent = pDashboard
    InfoRow.Size = UDim2.new(1, -6, 0, 50)
    InfoRow.BackgroundTransparency = 1

    local WelCard = Instance.new("Frame")
    WelCard.Parent = InfoRow
    WelCard.Size = UDim2.new(0.58, -3, 1, 0)
    WelCard.BackgroundColor3 = THEME.CardBg

    Instance.new("UICorner", WelCard).CornerRadius = UDim.new(0, 6)

    local WelPrefix = Instance.new("TextLabel")
    WelPrefix.Parent = WelCard
    WelPrefix.Size = UDim2.new(1, -10, 0, 12)
    WelPrefix.Position = UDim2.new(0, 8, 0, 6)
    WelPrefix.BackgroundTransparency = 1
    WelPrefix.Text = "Good evening,"
    WelPrefix.TextColor3 = THEME.TextWhite
    WelPrefix.Font = Enum.Font.GothamMedium
    WelPrefix.TextSize = 7.5
    WelPrefix.TextXAlignment = Enum.TextXAlignment.Left

    local WelName = Instance.new("TextLabel")
    WelName.Parent = WelCard
    WelName.Size = UDim2.new(1, -10, 0, 16)
    WelName.Position = UDim2.new(0, 8, 0, 17)
    WelName.BackgroundTransparency = 1
    WelName.Text = LocalPlayer.Name
    WelName.TextColor3 = THEME.TextWhite
    WelName.Font = Enum.Font.GothamBold
    WelName.TextSize = 10
    WelName.TextXAlignment = Enum.TextXAlignment.Left

    local WelDiscord = Instance.new("TextLabel")
    WelDiscord.Parent = WelCard
    WelDiscord.Size = UDim2.new(1, -10, 0, 10)
    WelDiscord.Position = UDim2.new(0, 8, 0, 34)
    WelDiscord.BackgroundTransparency = 1
    WelDiscord.Text = "discord.gg/test"
    WelDiscord.TextColor3 = Color3.fromRGB(100, 95, 120)
    WelDiscord.Font = Enum.Font.Gotham
    WelDiscord.TextSize = 6.5
    WelDiscord.TextXAlignment = Enum.TextXAlignment.Left

    local StatusCard = Instance.new("Frame")
    StatusCard.Parent = InfoRow
    StatusCard.Size = UDim2.new(0.42, -3, 1, 0)
    StatusCard.Position = UDim2.new(0.58, 3, 0, 0)
    StatusCard.BackgroundColor3 = THEME.CardBg

    Instance.new("UICorner", StatusCard).CornerRadius = UDim.new(0, 6)

    local StatusTitle = Instance.new("TextLabel")
    StatusTitle.Parent = StatusCard
    StatusTitle.Size = UDim2.new(1, -10, 0, 10)
    StatusTitle.Position = UDim2.new(0, 8, 0, 5)
    StatusTitle.BackgroundTransparency = 1
    StatusTitle.Text = "STATUS"
    StatusTitle.TextColor3 = THEME.TextGray
    StatusTitle.Font = Enum.Font.GothamBold
    StatusTitle.TextSize = 6
    StatusTitle.TextXAlignment = Enum.TextXAlignment.Left

    local StatusDot = Instance.new("Frame")
    StatusDot.Parent = StatusCard
    StatusDot.Size = UDim2.new(0, 5, 0, 5)
    StatusDot.Position = UDim2.new(0, 8, 0, 20)
    StatusDot.BackgroundColor3 = THEME.SuccessGreen

    Instance.new("UICorner", StatusDot).CornerRadius = UDim.new(1, 0)

    local StatusText = Instance.new("TextLabel")
    StatusText.Parent = StatusCard
    StatusText.Size = UDim2.new(1, -18, 0, 12)
    StatusText.Position = UDim2.new(0, 16, 0, 16)
    StatusText.BackgroundTransparency = 1
    StatusText.Text = "Connected"
    StatusText.TextColor3 = THEME.TextWhite
    StatusText.Font = Enum.Font.GothamBold
    StatusText.TextSize = 8
    StatusText.TextXAlignment = Enum.TextXAlignment.Left

    local PingText = Instance.new("TextLabel")
    PingText.Parent = StatusCard
    PingText.Size = UDim2.new(1, -12, 0, 12)
    PingText.Position = UDim2.new(0, 8, 0, 32)
    PingText.BackgroundTransparency = 1
    PingText.Text = "0 ms"
    PingText.TextColor3 = THEME.TextGray
    PingText.Font = Enum.Font.Gotham
    PingText.TextSize = 7
    PingText.TextXAlignment = Enum.TextXAlignment.Left

    ---------------------------------------------------------------------------
    -- INFO DISPLAY SECTIONS (non-interactive labels)
    ---------------------------------------------------------------------------

    local function AddInfoSection(parent, title, lines)
        -- title is string, lines is table of strings
        local section = Instance.new("Frame")
        section.Parent = parent
        section.Size = UDim2.new(1, -6, 0, 0) -- height dynamic
        section.BackgroundColor3 = THEME.CardBg

        Instance.new("UICorner", section).CornerRadius = UDim.new(0, 6)

        local titleLbl = Instance.new("TextLabel")
        titleLbl.Parent = section
        titleLbl.Size = UDim2.new(1, -10, 0, 16)
        titleLbl.Position = UDim2.new(0, 8, 0, 4)
        titleLbl.BackgroundTransparency = 1
        titleLbl.Text = title
        titleLbl.TextColor3 = THEME.AccentPurple
        titleLbl.Font = Enum.Font.GothamBold
        titleLbl.TextSize = 10
        titleLbl.TextXAlignment = Enum.TextXAlignment.Left

        local yOffset = 22
        for _, line in ipairs(lines) do
            local lbl = Instance.new("TextLabel")
            lbl.Parent = section
            lbl.Size = UDim2.new(1, -16, 0, 14)
            lbl.Position = UDim2.new(0, 10, 0, yOffset)
            lbl.BackgroundTransparency = 1
            lbl.Text = line
            lbl.TextColor3 = THEME.TextWhite
            lbl.Font = Enum.Font.Gotham
            lbl.TextSize = 8.5
            lbl.TextXAlignment = Enum.TextXAlignment.Left
            yOffset = yOffset + 16
        end

        -- set section height
        section.Size = UDim2.new(1, -6, 0, yOffset + 6)
    end

    -- Account Info
    AddInfoSection(pDashboard, "📋 ACCOUNT INFO", {
        "Name: " .. LocalPlayer.Name,
        "Display: " .. (LocalPlayer.DisplayName or LocalPlayer.Name),
        "User ID: " .. LocalPlayer.UserId,
        "Joined: 01/01/1970",
        "Age: 0d (0.0y)",
        "Status: -",
        "Friends: ?",
        "Followers: ?"
    })

    -- MM2 Profile
    AddInfoSection(pDashboard, "🔫 MM2 PROFILE", {
        "Level: ?",
        "Prestige: ?",
        "XP: ?",
        "Role: Innocent",
        "Perk: ?",
        "Knife: ?",
        "Gun: ?"
    })

    -- Inventory
    AddInfoSection(pDashboard, "🎒 INVENTORY", {
        "Weapons: ?",
        "Ancient: ?",
        "Godly: ?",
        "Legendary: ?",
        "Unique: ?",
        "Other: ?",
        "Pets: ?",
        "Effects: ?",
        "Trades: ?",
        "Bans: ?"
    })

    -- Server Info
    AddInfoSection(pDashboard, "🌐 SERVER INFO", {
        "Players: 0/0",
        "Region: Unknown",
        "Server Type: Public",
        "Uptime: 0m 0s",
        "Your Ping: 0ms",
        "Server FPS: 0",
        "Place Version: 0",
        "Job ID: (Studio)"
    })

    ---------------------------------------------------------------------------
    -- MAIN FRAME DRAG
    ---------------------------------------------------------------------------

    local dragging = false
    local dragStart
    local startPos

    Header.InputBegan:Connect(function(input)

        if input.UserInputType == Enum.UserInputType.Touch
            or input.UserInputType == Enum.UserInputType.MouseButton1 then

            dragging = true
            dragStart = input.Position
            startPos = MainFrame.Position

        end
    end)

    UserInputService.InputChanged:Connect(function(input)

        if dragging and (
            input.UserInputType == Enum.UserInputType.Touch
            or input.UserInputType == Enum.UserInputType.MouseMovement
        ) then

            local delta = input.Position - dragStart

            MainFrame.Position = UDim2.new(
                startPos.X.Scale,
                startPos.X.Offset + delta.X,
                startPos.Y.Scale,
                startPos.Y.Offset + delta.Y
            )

        end
    end)

    UserInputService.InputEnded:Connect(function(input)

        if input.UserInputType == Enum.UserInputType.Touch
            or input.UserInputType == Enum.UserInputType.MouseButton1 then

            dragging = false

        end
    end)

end

OpenMainHub()
