local ProtectionConfig = {
    SecretKey = "vheo123",
    HubName = "SIE Y HUB"
}

if not _G[ProtectionConfig.SecretKey] then
    local player = game:GetService("Players").LocalPlayer

    if player then
        player:Kick(
            "\n🛡️ Unauthorized Execution 🛡️\n\nPlease use the official Key System to run "
            .. ProtectionConfig.HubName
        )
    end

    return
end

print(ProtectionConfig.HubName .. " Loaded Successfully!")

--------------------------------------------------
-- SERVICES
--------------------------------------------------

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

--------------------------------------------------
-- MAIN HUB
--------------------------------------------------

local function OpenMainHub()

    local ScreenGuiName = "SIE Y CUSTOM HUB"

    if parentGui:FindFirstChild(ScreenGuiName) then
        parentGui[ScreenGuiName]:Destroy()
    end

    --------------------------------------------------
    -- THEME
    --------------------------------------------------

    local THEME = {
        Background = Color3.fromRGB(13, 11, 20),
        SidebarBg = Color3.fromRGB(17, 14, 26),
        CardBg = Color3.fromRGB(22, 19, 34),

        AccentPurple = Color3.fromRGB(139, 58, 246),

        TextWhite = Color3.fromRGB(255, 255, 255),
        TextGray = Color3.fromRGB(140, 135, 160),

        SuccessGreen = Color3.fromRGB(34, 197, 94)
    }

    --------------------------------------------------
    -- SCREEN GUI
    --------------------------------------------------

    local ScreenGui = Instance.new("ScreenGui")
    ScreenGui.Name = ScreenGuiName
    ScreenGui.IgnoreGuiInset = true
    ScreenGui.ResetOnSpawn = false
    ScreenGui.Parent = parentGui

    --------------------------------------------------
    -- NOTIFICATION SYSTEM
    --------------------------------------------------

    local NotificationHolder = Instance.new("Frame")
    NotificationHolder.Name = "NotificationHolder"
    NotificationHolder.Size = UDim2.new(0, 280, 1, -30)
    NotificationHolder.Position = UDim2.new(1, -295, 0, 15)
    NotificationHolder.BackgroundTransparency = 1
    NotificationHolder.Parent = ScreenGui

    local NotificationLayout = Instance.new("UIListLayout")
    NotificationLayout.Padding = UDim.new(0, 8)
    NotificationLayout.HorizontalAlignment = Enum.HorizontalAlignment.Right
    NotificationLayout.VerticalAlignment = Enum.VerticalAlignment.Top
    NotificationLayout.SortOrder = Enum.SortOrder.LayoutOrder
    NotificationLayout.Parent = NotificationHolder

    local function SendNotification(title, message, icon, duration)

        duration = duration or 4

        local Notification = Instance.new("Frame")
        Notification.Name = "Notification"
        Notification.Size = UDim2.new(0, 270, 0, 64)
        Notification.BackgroundColor3 = THEME.CardBg
        Notification.BorderSizePixel = 0
        Notification.ClipsDescendants = true
        Notification.Parent = NotificationHolder

        Instance.new("UICorner", Notification).CornerRadius = UDim.new(0, 9)

        --------------------------------------------------
        -- STROKE
        --------------------------------------------------

        local NotificationStroke = Instance.new("UIStroke")
        NotificationStroke.Color = THEME.AccentPurple
        NotificationStroke.Thickness = 1
        NotificationStroke.Transparency = 0.25
        NotificationStroke.Parent = Notification

        --------------------------------------------------
        -- PURPLE ACCENT
        --------------------------------------------------

        local Accent = Instance.new("Frame")
        Accent.Size = UDim2.new(0, 3, 1, -12)
        Accent.Position = UDim2.new(0, 6, 0, 6)
        Accent.BackgroundColor3 = THEME.AccentPurple
        Accent.BorderSizePixel = 0
        Accent.Parent = Notification

        Instance.new("UICorner", Accent).CornerRadius = UDim.new(1, 0)

        --------------------------------------------------
        -- ICON
        --------------------------------------------------

        local Icon = Instance.new("TextLabel")
        Icon.Size = UDim2.new(0, 30, 0, 30)
        Icon.Position = UDim2.new(0, 16, 0, 10)
        Icon.BackgroundColor3 = Color3.fromRGB(31, 24, 48)
        Icon.Text = icon or "!"
        Icon.TextColor3 = THEME.TextWhite
        Icon.Font = Enum.Font.GothamBold
        Icon.TextSize = 13
        Icon.Parent = Notification

        Instance.new("UICorner", Icon).CornerRadius = UDim.new(1, 0)

        --------------------------------------------------
        -- TITLE
        --------------------------------------------------

        local Title = Instance.new("TextLabel")
        Title.Size = UDim2.new(1, -62, 0, 18)
        Title.Position = UDim2.new(0, 54, 0, 8)
        Title.BackgroundTransparency = 1
        Title.Text = title
        Title.TextColor3 = THEME.TextWhite
        Title.Font = Enum.Font.GothamBold
        Title.TextSize = 10
        Title.TextXAlignment = Enum.TextXAlignment.Left
        Title.TextTruncate = Enum.TextTruncate.AtEnd
        Title.Parent = Notification

        --------------------------------------------------
        -- MESSAGE
        --------------------------------------------------

        local Message = Instance.new("TextLabel")
        Message.Size = UDim2.new(1, -62, 0, 25)
        Message.Position = UDim2.new(0, 54, 0, 27)
        Message.BackgroundTransparency = 1
        Message.Text = message
        Message.TextColor3 = THEME.TextGray
        Message.Font = Enum.Font.Gotham
        Message.TextSize = 8
        Message.TextWrapped = true
        Message.TextXAlignment = Enum.TextXAlignment.Left
        Message.TextYAlignment = Enum.TextYAlignment.Top
        Message.Parent = Notification

        --------------------------------------------------
        -- PROGRESS BAR
        --------------------------------------------------

        local ProgressBackground = Instance.new("Frame")
        ProgressBackground.Size = UDim2.new(1, -20, 0, 2)
        ProgressBackground.Position = UDim2.new(0, 10, 1, -5)
        ProgressBackground.BackgroundColor3 = Color3.fromRGB(45, 38, 60)
        ProgressBackground.BorderSizePixel = 0
        ProgressBackground.Parent = Notification

        local Progress = Instance.new("Frame")
        Progress.Size = UDim2.new(1, 0, 1, 0)
        Progress.BackgroundColor3 = THEME.AccentPurple
        Progress.BorderSizePixel = 0
        Progress.Parent = ProgressBackground

        --------------------------------------------------
        -- START POSITION
        --------------------------------------------------

        Notification.Position = UDim2.new(
            1,
            40,
            0,
            0
        )

        Notification.BackgroundTransparency = 1
        NotificationStroke.Transparency = 1
        Icon.TextTransparency = 1
        Title.TextTransparency = 1
        Message.TextTransparency = 1

        --------------------------------------------------
        -- SLIDE IN
        --------------------------------------------------

        TweenService:Create(
            Notification,
            TweenInfo.new(
                0.35,
                Enum.EasingStyle.Quint,
                Enum.EasingDirection.Out
            ),
            {
                Position = UDim2.new(0, 0, 0, 0),
                BackgroundTransparency = 0
            }
        ):Play()

        TweenService:Create(
            NotificationStroke,
            TweenInfo.new(0.3),
            {
                Transparency = 0.25
            }
        ):Play()

        TweenService:Create(
            Icon,
            TweenInfo.new(0.25),
            {
                TextTransparency = 0
            }
        ):Play()

        TweenService:Create(
            Title,
            TweenInfo.new(0.25),
            {
                TextTransparency = 0
            }
        ):Play()

        TweenService:Create(
            Message,
            TweenInfo.new(0.25),
            {
                TextTransparency = 0
            }
        ):Play()

        --------------------------------------------------
        -- PROGRESS ANIMATION
        --------------------------------------------------

        TweenService:Create(
            Progress,
            TweenInfo.new(
                duration,
                Enum.EasingStyle.Linear
            ),
            {
                Size = UDim2.new(0, 0, 1, 0)
            }
        ):Play()

        --------------------------------------------------
        -- REMOVE
        --------------------------------------------------

        task.delay(duration, function()

            if not Notification or not Notification.Parent then
                return
            end

            local slideOut = TweenService:Create(
                Notification,
                TweenInfo.new(
                    0.3,
                    Enum.EasingStyle.Quint,
                    Enum.EasingDirection.In
                ),
                {
                    Position = UDim2.new(1, 40, 0, 0),
                    BackgroundTransparency = 1
                }
            )

            TweenService:Create(
                NotificationStroke,
                TweenInfo.new(0.2),
                {
                    Transparency = 1
                }
            ):Play()

            TweenService:Create(
                Icon,
                TweenInfo.new(0.2),
                {
                    TextTransparency = 1
                }
            ):Play()

            TweenService:Create(
                Title,
                TweenInfo.new(0.2),
                {
                    TextTransparency = 1
                }
            ):Play()

            TweenService:Create(
                Message,
                TweenInfo.new(0.2),
                {
                    TextTransparency = 1
                }
            ):Play()

            slideOut:Play()

            slideOut.Completed:Connect(function()

                if Notification then
                    Notification:Destroy()
                end

            end)

        end)

    end

    --------------------------------------------------
    -- MAIN FRAME
    --------------------------------------------------

    local MainFrame = Instance.new("Frame")
    MainFrame.Name = "MainFrame"
    MainFrame.Size = UDim2.new(0, 520, 0, 285)
    MainFrame.Position = UDim2.new(0.5, -260, 0.5, -142)
    MainFrame.BackgroundColor3 = THEME.Background
    MainFrame.BorderSizePixel = 0
    MainFrame.Parent = ScreenGui

    Instance.new("UICorner", MainFrame).CornerRadius = UDim.new(0, 12)

    local MainStroke = Instance.new("UIStroke")
    MainStroke.Color = Color3.fromRGB(45, 28, 80)
    MainStroke.Thickness = 1.2
    MainStroke.Parent = MainFrame

    --------------------------------------------------
    -- SETTINGS MODAL
    --------------------------------------------------

    local SettingsModal = Instance.new("Frame")
    SettingsModal.Size = UDim2.new(0, 360, 0, 220)
    SettingsModal.Position = UDim2.new(0.5, -180, 0.5, -110)
    SettingsModal.BackgroundColor3 = THEME.Background
    SettingsModal.BorderSizePixel = 0
    SettingsModal.Visible = false
    SettingsModal.ZIndex = 20
    SettingsModal.Parent = ScreenGui

    Instance.new("UICorner", SettingsModal).CornerRadius = UDim.new(0, 5)

    local ModalStroke = Instance.new("UIStroke")
    ModalStroke.Color = THEME.AccentPurple
    ModalStroke.Thickness = 1.5
    ModalStroke.Parent = SettingsModal

    --------------------------------------------------
    -- SETTINGS HEADER
    --------------------------------------------------

    local ModalHeader = Instance.new("Frame")
    ModalHeader.Size = UDim2.new(1, 0, 0, 35)
    ModalHeader.BackgroundTransparency = 1
    ModalHeader.ZIndex = 21
    ModalHeader.Parent = SettingsModal

    local ModalTitle = Instance.new("TextLabel")
    ModalTitle.Size = UDim2.new(1, -40, 1, 0)
    ModalTitle.Position = UDim2.new(0, 12, 0, 0)
    ModalTitle.BackgroundTransparency = 1
    ModalTitle.Text = "Hub Preferences & Settings"
    ModalTitle.TextColor3 = THEME.TextWhite
    ModalTitle.Font = Enum.Font.GothamBold
    ModalTitle.TextSize = 9.5
    ModalTitle.TextXAlignment = Enum.TextXAlignment.Left
    ModalTitle.ZIndex = 21
    ModalTitle.Parent = ModalHeader

    local ModalCloseBtn = Instance.new("TextButton")
    ModalCloseBtn.Size = UDim2.new(0, 22, 0, 22)
    ModalCloseBtn.Position = UDim2.new(1, -28, 0.5, -11)
    ModalCloseBtn.BackgroundColor3 = THEME.CardBg
    ModalCloseBtn.Text = "X"
    ModalCloseBtn.TextColor3 = THEME.TextWhite
    ModalCloseBtn.Font = Enum.Font.GothamBold
    ModalCloseBtn.TextSize = 8
    ModalCloseBtn.ZIndex = 21
    ModalCloseBtn.Parent = ModalHeader

    Instance.new("UICorner", ModalCloseBtn).CornerRadius = UDim.new(0, 4)

    ModalCloseBtn.MouseButton1Click:Connect(function()
        SettingsModal.Visible = false
    end)

    --------------------------------------------------
    -- SETTINGS CONTENT
    --------------------------------------------------

    local ModalContent = Instance.new("ScrollingFrame")
    ModalContent.Size = UDim2.new(1, -16, 1, -45)
    ModalContent.Position = UDim2.new(0, 8, 0, 38)
    ModalContent.BackgroundTransparency = 1
    ModalContent.CanvasSize = UDim2.new(0, 0, 0, 180)
    ModalContent.ScrollBarThickness = 2
    ModalContent.ZIndex = 21
    ModalContent.Parent = SettingsModal

    local ModalLayout = Instance.new("UIListLayout")
    ModalLayout.Padding = UDim.new(0, 6)
    ModalLayout.Parent = ModalContent

    local function AddModalToggle(parent, titleText, descText, defaultState)

        local card = Instance.new("Frame")
        card.Size = UDim2.new(1, 0, 0, 42)
        card.BackgroundColor3 = THEME.CardBg
        card.ZIndex = 21
        card.Parent = parent

        Instance.new("UICorner", card).CornerRadius = UDim.new(0, 6)

        local tLbl = Instance.new("TextLabel")
        tLbl.Size = UDim2.new(1, -50, 0, 14)
        tLbl.Position = UDim2.new(0, 10, 0, 6)
        tLbl.BackgroundTransparency = 1
        tLbl.Text = titleText
        tLbl.TextColor3 = THEME.TextWhite
        tLbl.Font = Enum.Font.GothamBold
        tLbl.TextSize = 9
        tLbl.TextXAlignment = Enum.TextXAlignment.Left
        tLbl.ZIndex = 22
        tLbl.Parent = card

        local dLbl = Instance.new("TextLabel")
        dLbl.Size = UDim2.new(1, -50, 0, 12)
        dLbl.Position = UDim2.new(0, 10, 0, 20)
        dLbl.BackgroundTransparency = 1
        dLbl.Text = descText
        dLbl.TextColor3 = THEME.TextGray
        dLbl.Font = Enum.Font.Gotham
        dLbl.TextSize = 7.5
        dLbl.TextXAlignment = Enum.TextXAlignment.Left
        dLbl.ZIndex = 22
        dLbl.Parent = card

        local switch = Instance.new("TextButton")
        switch.Size = UDim2.new(0, 24, 0, 12)
        switch.Position = UDim2.new(1, -32, 0.5, -6)
        switch.BackgroundColor3 =
            defaultState and THEME.AccentPurple or Color3.fromRGB(40, 40, 55)
        switch.Text = ""
        switch.ZIndex = 22
        switch.Parent = card

        Instance.new("UICorner", switch).CornerRadius = UDim.new(1, 0)

        local dot = Instance.new("Frame")
        dot.Size = UDim2.new(0, 8, 0, 8)
        dot.Position =
            defaultState
            and UDim2.new(1, -10, 0.5, -4)
            or UDim2.new(0, 2, 0.5, -4)
        dot.BackgroundColor3 = THEME.TextWhite
        dot.ZIndex = 23
        dot.Parent = switch

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

    --------------------------------------------------
    -- SIDEBAR
    --------------------------------------------------

    local Sidebar = Instance.new("Frame")
    Sidebar.Name = "Sidebar"
    Sidebar.Size = UDim2.new(0, 132, 1, 0)
    Sidebar.BackgroundColor3 = THEME.SidebarBg
    Sidebar.BorderSizePixel = 0
    Sidebar.Parent = MainFrame

    Instance.new("UICorner", Sidebar).CornerRadius = UDim.new(0, 12)

    --------------------------------------------------
    -- LOGO
    --------------------------------------------------

    local TopLogoContainer = Instance.new("Frame")
    TopLogoContainer.Size = UDim2.new(1, -8, 0, 42)
    TopLogoContainer.Position = UDim2.new(0, 4, 0, 6)
    TopLogoContainer.BackgroundTransparency = 1
    TopLogoContainer.Parent = Sidebar

    local TopLogoIcon = Instance.new("ImageLabel")
    TopLogoIcon.Size = UDim2.new(0, 24, 0, 24)
    TopLogoIcon.Position = UDim2.new(0, 4, 0, 2)
    TopLogoIcon.BackgroundTransparency = 1
    TopLogoIcon.Image = "rbxassetid://92206600654614"
    TopLogoIcon.ScaleType = Enum.ScaleType.Fit
    TopLogoIcon.Parent = TopLogoContainer

    local TopHubTitle = Instance.new("TextLabel")
    TopHubTitle.Position = UDim2.new(0, 32, 0, 0)
    TopHubTitle.Size = UDim2.new(0, 85, 0, 14)
    TopHubTitle.BackgroundTransparency = 1
    TopHubTitle.Text = "Sie Y Hub"
    TopHubTitle.TextColor3 = THEME.TextWhite
    TopHubTitle.Font = Enum.Font.GothamBold
    TopHubTitle.TextSize = 9
    TopHubTitle.TextXAlignment = Enum.TextXAlignment.Left
    TopHubTitle.Parent = TopLogoContainer

    local TopHubVer = Instance.new("TextLabel")
    TopHubVer.Position = UDim2.new(0, 32, 0, 14)
    TopHubVer.Size = UDim2.new(0, 85, 0, 10)
    TopHubVer.BackgroundTransparency = 1
    TopHubVer.Text = "v1.0.0"
    TopHubVer.TextColor3 = THEME.TextGray
    TopHubVer.Font = Enum.Font.Gotham
    TopHubVer.TextSize = 8
    TopHubVer.TextXAlignment = Enum.TextXAlignment.Left
    TopHubVer.Parent = TopLogoContainer

    local GameTitleLabel = Instance.new("TextLabel")
    GameTitleLabel.Position = UDim2.new(0, 4, 0, 28)
    GameTitleLabel.Size = UDim2.new(1, -4, 0, 12)
    GameTitleLabel.BackgroundTransparency = 1
    GameTitleLabel.Text = "Pet Simulator 99"
    GameTitleLabel.TextColor3 = THEME.AccentPurple
    GameTitleLabel.Font = Enum.Font.GothamBold
    GameTitleLabel.TextSize = 8
    GameTitleLabel.TextXAlignment = Enum.TextXAlignment.Left
    GameTitleLabel.Parent = TopLogoContainer

    --------------------------------------------------
    -- DASHBOARD TAB
    --------------------------------------------------

    local DashboardButton = Instance.new("TextButton")
    DashboardButton.Size = UDim2.new(1, -6, 0, 26)
    DashboardButton.Position = UDim2.new(0, 3, 0, 52)
    DashboardButton.BackgroundColor3 = THEME.AccentPurple
    DashboardButton.BackgroundTransparency = 0.2
    DashboardButton.Text = "   🏠  Dashboard"
    DashboardButton.TextColor3 = THEME.TextWhite
    DashboardButton.Font = Enum.Font.GothamBold
    DashboardButton.TextSize = 8
    DashboardButton.TextXAlignment = Enum.TextXAlignment.Left
    DashboardButton.Parent = Sidebar

    Instance.new("UICorner", DashboardButton).CornerRadius = UDim.new(0, 6)

    --------------------------------------------------
    -- USER PROFILE
    --------------------------------------------------

    local UserProfile = Instance.new("Frame")
    UserProfile.Size = UDim2.new(1, -8, 0, 48)
    UserProfile.Position = UDim2.new(0, 4, 1, -52)
    UserProfile.BackgroundColor3 = THEME.CardBg
    UserProfile.Parent = Sidebar

    Instance.new("UICorner", UserProfile).CornerRadius = UDim.new(0, 6)

    local BottomAvatar = Instance.new("ImageLabel")
    BottomAvatar.Size = UDim2.new(0, 32, 0, 32)
    BottomAvatar.Position = UDim2.new(0, 6, 0.5, -16)
    BottomAvatar.BackgroundColor3 = THEME.Background
    BottomAvatar.Parent = UserProfile

    pcall(function()
        BottomAvatar.Image =
            Players:GetUserThumbnailAsync(
                LocalPlayer.UserId,
                Enum.ThumbnailType.HeadShot,
                Enum.ThumbnailSize.Size420x420
            )
    end)

    Instance.new("UICorner", BottomAvatar).CornerRadius = UDim.new(1, 0)

    local UName = Instance.new("TextLabel")
    UName.Size = UDim2.new(1, -44, 0, 14)
    UName.Position = UDim2.new(0, 42, 0, 9)
    UName.BackgroundTransparency = 1
    UName.Text = LocalPlayer.Name
    UName.TextColor3 = THEME.TextWhite
    UName.Font = Enum.Font.GothamBold
    UName.TextSize = 7.5
    UName.TextXAlignment = Enum.TextXAlignment.Left
    UName.Parent = UserProfile

    local URole = Instance.new("TextLabel")
    URole.Size = UDim2.new(1, -44, 0, 12)
    URole.Position = UDim2.new(0, 42, 0, 23)
    URole.BackgroundTransparency = 1
    URole.Text = "Premium"
    URole.TextColor3 = THEME.AccentPurple
    URole.Font = Enum.Font.GothamBold
    URole.TextSize = 6.5
    URole.TextXAlignment = Enum.TextXAlignment.Left
    URole.Parent = UserProfile

    --------------------------------------------------
    -- HEADER
    --------------------------------------------------

    local Header = Instance.new("Frame")
    Header.Size = UDim2.new(1, -145, 0, 38)
    Header.Position = UDim2.new(0, 140, 0, 0)
    Header.BackgroundTransparency = 1
    Header.Parent = MainFrame

    local SearchBar = Instance.new("TextBox")
    SearchBar.Size = UDim2.new(0, 135, 0, 24)
    SearchBar.Position = UDim2.new(0, 4, 0.5, -12)
    SearchBar.BackgroundColor3 = THEME.CardBg
    SearchBar.PlaceholderText = "Search anything..."
    SearchBar.PlaceholderColor3 = THEME.TextGray
    SearchBar.Text = ""
    SearchBar.TextColor3 = THEME.TextWhite
    SearchBar.Font = Enum.Font.Gotham
    SearchBar.TextSize = 8
    SearchBar.Parent = Header

    Instance.new("UICorner", SearchBar).CornerRadius = UDim.new(0, 6)

    local CtrlTag = Instance.new("Frame")
    CtrlTag.Size = UDim2.new(0, 32, 0, 18)
    CtrlTag.Position = UDim2.new(0, 144, 0.5, -9)
    CtrlTag.BackgroundColor3 = THEME.Background
    CtrlTag.Parent = Header

    Instance.new("UICorner", CtrlTag).CornerRadius = UDim.new(0, 4)

    local CtrlLabel = Instance.new("TextLabel")
    CtrlLabel.Size = UDim2.new(1, 0, 1, 0)
    CtrlLabel.BackgroundTransparency = 1
    CtrlLabel.Text = "Ctrl/"
    CtrlLabel.TextColor3 = THEME.TextGray
    CtrlLabel.Font = Enum.Font.GothamMedium
    CtrlLabel.TextSize = 7
    CtrlLabel.Parent = CtrlTag

    --------------------------------------------------
    -- MINIMIZE
    --------------------------------------------------

    local MinBtn = Instance.new("TextButton")
    MinBtn.Size = UDim2.new(0, 24, 0, 24)
    MinBtn.Position = UDim2.new(1, -54, 0.5, -12)
    MinBtn.BackgroundColor3 = THEME.CardBg
    MinBtn.Text = "-"
    MinBtn.TextColor3 = THEME.TextWhite
    MinBtn.Font = Enum.Font.GothamBold
    MinBtn.TextSize = 8
    MinBtn.Parent = Header

    Instance.new("UICorner", MinBtn).CornerRadius = UDim.new(0, 6)

    --------------------------------------------------
    -- CLOSE
    --------------------------------------------------

    local CloseBtn = Instance.new("TextButton")
    CloseBtn.Size = UDim2.new(0, 24, 0, 24)
    CloseBtn.Position = UDim2.new(1, -26, 0.5, -12)
    CloseBtn.BackgroundColor3 = THEME.CardBg
    CloseBtn.Text = "X"
    CloseBtn.TextColor3 = THEME.TextWhite
    CloseBtn.Font = Enum.Font.GothamBold
    CloseBtn.TextSize = 8
    CloseBtn.Parent = Header

    Instance.new("UICorner", CloseBtn).CornerRadius = UDim.new(0, 6)

    --------------------------------------------------
    -- DASHBOARD PAGE
    --------------------------------------------------

    local DashboardPage = Instance.new("Frame")
    DashboardPage.Name = "Dashboard"
    DashboardPage.Size = UDim2.new(1, -136, 1, -44)
    DashboardPage.Position = UDim2.new(0, 136, 0, 40)
    DashboardPage.BackgroundTransparency = 1
    DashboardPage.Parent = MainFrame

    --------------------------------------------------
    -- INFO ROW
    --------------------------------------------------

    local InfoRow = Instance.new("Frame")
    InfoRow.Size = UDim2.new(1, -6, 0, 50)
    InfoRow.BackgroundTransparency = 1
    InfoRow.Parent = DashboardPage

    --------------------------------------------------
    -- WELCOME CARD
    --------------------------------------------------

    local WelCard = Instance.new("Frame")
    WelCard.Size = UDim2.new(0.58, -3, 1, 0)
    WelCard.BackgroundColor3 = THEME.CardBg
    WelCard.Parent = InfoRow

    Instance.new("UICorner", WelCard).CornerRadius = UDim.new(0, 6)

    local WelPrefix = Instance.new("TextLabel")
    WelPrefix.Size = UDim2.new(1, -10, 0, 12)
    WelPrefix.Position = UDim2.new(0, 8, 0, 6)
    WelPrefix.BackgroundTransparency = 1
    WelPrefix.Text = "Good evening,"
    WelPrefix.TextColor3 = THEME.TextWhite
    WelPrefix.Font = Enum.Font.GothamMedium
    WelPrefix.TextSize = 7.5
    WelPrefix.TextXAlignment = Enum.TextXAlignment.Left
    WelPrefix.Parent = WelCard

    local WelName = Instance.new("TextLabel")
    WelName.Size = UDim2.new(1, -10, 0, 16)
    WelName.Position = UDim2.new(0, 8, 0, 17)
    WelName.BackgroundTransparency = 1
    WelName.Text = LocalPlayer.Name
    WelName.TextColor3 = THEME.TextWhite
    WelName.Font = Enum.Font.GothamBold
    WelName.TextSize = 10
    WelName.TextXAlignment = Enum.TextXAlignment.Left
    WelName.Parent = WelCard

    local WelDiscord = Instance.new("TextLabel")
    WelDiscord.Size = UDim2.new(1, -10, 0, 10)
    WelDiscord.Position = UDim2.new(0, 8, 0, 34)
    WelDiscord.BackgroundTransparency = 1
    WelDiscord.Text = "discord.gg/test"
    WelDiscord.TextColor3 = Color3.fromRGB(100, 95, 120)
    WelDiscord.Font = Enum.Font.Gotham
    WelDiscord.TextSize = 6.5
    WelDiscord.TextXAlignment = Enum.TextXAlignment.Left
    WelDiscord.Parent = WelCard

    --------------------------------------------------
    -- STATUS CARD
    --------------------------------------------------

    local StatusCard = Instance.new("Frame")
    StatusCard.Size = UDim2.new(0.42, -3, 1, 0)
    StatusCard.Position = UDim2.new(0.58, 3, 0, 0)
    StatusCard.BackgroundColor3 = THEME.CardBg
    StatusCard.Parent = InfoRow

    Instance.new("UICorner", StatusCard).CornerRadius = UDim.new(0, 6)

    local StatusTitle = Instance.new("TextLabel")
    StatusTitle.Size = UDim2.new(1, -10, 0, 10)
    StatusTitle.Position = UDim2.new(0, 8, 0, 5)
    StatusTitle.BackgroundTransparency = 1
    StatusTitle.Text = "STATUS"
    StatusTitle.TextColor3 = THEME.TextGray
    StatusTitle.Font = Enum.Font.GothamBold
    StatusTitle.TextSize = 6
    StatusTitle.TextXAlignment = Enum.TextXAlignment.Left
    StatusTitle.Parent = StatusCard

    local StatusDot = Instance.new("Frame")
    StatusDot.Size = UDim2.new(0, 5, 0, 5)
    StatusDot.Position = UDim2.new(0, 8, 0, 20)
    StatusDot.BackgroundColor3 = THEME.SuccessGreen
    StatusDot.Parent = StatusCard

    Instance.new("UICorner", StatusDot).CornerRadius = UDim.new(1, 0)

    local StatusText = Instance.new("TextLabel")
    StatusText.Size = UDim2.new(1, -18, 0, 12)
    StatusText.Position = UDim2.new(0, 16, 0, 16)
    StatusText.BackgroundTransparency = 1
    StatusText.Text = "Connected"
    StatusText.TextColor3 = THEME.TextWhite
    StatusText.Font = Enum.Font.GothamBold
    StatusText.TextSize = 8
    StatusText.TextXAlignment = Enum.TextXAlignment.Left
    StatusText.Parent = StatusCard

    local PingText = Instance.new("TextLabel")
    PingText.Size = UDim2.new(1, -12, 0, 12)
    PingText.Position = UDim2.new(0, 8, 0, 32)
    PingText.BackgroundTransparency = 1
    PingText.Text = "0 ms"
    PingText.TextColor3 = THEME.TextGray
    PingText.Font = Enum.Font.Gotham
    PingText.TextSize = 7
    PingText.TextXAlignment = Enum.TextXAlignment.Left
    PingText.Parent = StatusCard

    --------------------------------------------------
    -- FLOATING MINIMIZED UI
    --------------------------------------------------

    local ToggleContainer = Instance.new("Frame")
    ToggleContainer.Name = "FloatingMenu"
    ToggleContainer.Size = UDim2.new(0, 195, 0, 42)
    ToggleContainer.Position = UDim2.new(0, 20, 0, 120)
    ToggleContainer.BackgroundColor3 = THEME.SidebarBg
    ToggleContainer.BorderSizePixel = 0
    ToggleContainer.Visible = false
    ToggleContainer.Active = true
    ToggleContainer.Parent = ScreenGui

    Instance.new("UICorner", ToggleContainer).CornerRadius = UDim.new(1, 0)

    --------------------------------------------------
    -- RAINBOW STROKE
    --------------------------------------------------

    local ToggleStroke = Instance.new("UIStroke")
    ToggleStroke.Thickness = 1.5
    ToggleStroke.Parent = ToggleContainer

    task.spawn(function()

        local hue = 0

        while ScreenGui.Parent do

            hue = (hue + 0.005) % 1

            ToggleStroke.Color =
                Color3.fromHSV(hue, 0.9, 1)

            task.wait(0.03)

        end

    end)

    --------------------------------------------------
    -- FLOATING TEXT
    --------------------------------------------------

    local ToggleTextContainer = Instance.new("TextLabel")
    ToggleTextContainer.Size = UDim2.new(1, -92, 1, 0)
    ToggleTextContainer.Position = UDim2.new(0, 12, 0, 0)
    ToggleTextContainer.BackgroundTransparency = 1
    ToggleTextContainer.Text = "Sie Y Hub\nPet Simulator 99"
    ToggleTextContainer.TextColor3 = THEME.TextWhite
    ToggleTextContainer.Font = Enum.Font.GothamBold
    ToggleTextContainer.TextSize = 8.5
    ToggleTextContainer.TextXAlignment = Enum.TextXAlignment.Left
    ToggleTextContainer.Parent = ToggleContainer

    --------------------------------------------------
    -- FLOATING SETTINGS
    --------------------------------------------------

    local ToggleSettingBtn = Instance.new("TextButton")
    ToggleSettingBtn.Size = UDim2.new(0, 26, 0, 26)
    ToggleSettingBtn.Position = UDim2.new(1, -84, 0.5, -13)
    ToggleSettingBtn.BackgroundColor3 = THEME.CardBg
    ToggleSettingBtn.Text = "⚙"
    ToggleSettingBtn.TextColor3 = THEME.TextGray
    ToggleSettingBtn.Font = Enum.Font.GothamBold
    ToggleSettingBtn.TextSize = 10
    ToggleSettingBtn.Parent = ToggleContainer

    Instance.new("UICorner", ToggleSettingBtn).CornerRadius = UDim.new(1, 0)

    --------------------------------------------------
    -- FLOATING CLOSE
    --------------------------------------------------

    local ToggleCloseBtn = Instance.new("TextButton")
    ToggleCloseBtn.Size = UDim2.new(0, 26, 0, 26)
    ToggleCloseBtn.Position = UDim2.new(1, -52, 0.5, -13)
    ToggleCloseBtn.BackgroundColor3 = THEME.CardBg
    ToggleCloseBtn.Text = "X"
    ToggleCloseBtn.TextColor3 = THEME.TextGray
    ToggleCloseBtn.Font = Enum.Font.GothamBold
    ToggleCloseBtn.TextSize = 9
    ToggleCloseBtn.Parent = ToggleContainer

    Instance.new("UICorner", ToggleCloseBtn).CornerRadius = UDim.new(1, 0)

    --------------------------------------------------
    -- FLOATING DRAG
    --------------------------------------------------

    local tDragging = false
    local tDragStart
    local tStartPos
    local tDragMoved = false

    local dragThreshold = 8

    ToggleContainer.InputBegan:Connect(function(input)

        if input.UserInputType == Enum.UserInputType.Touch
        or input.UserInputType == Enum.UserInputType.MouseButton1 then

            tDragging = true
            tDragMoved = false
            tDragStart = input.Position
            tStartPos = ToggleContainer.Position

        end

    end)

    UserInputService.InputChanged:Connect(function(input)

        if not tDragging then
            return
        end

        if input.UserInputType == Enum.UserInputType.Touch
        or input.UserInputType == Enum.UserInputType.MouseMovement then

            local delta = input.Position - tDragStart

            if delta.Magnitude > dragThreshold then
                tDragMoved = true
            end

            if tDragMoved then

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

            tDragging = false

        end

    end)

    --------------------------------------------------
    -- FLOATING OPEN
    --------------------------------------------------

    ToggleContainer.InputEnded:Connect(function(input)

        if input.UserInputType == Enum.UserInputType.Touch
        or input.UserInputType == Enum.UserInputType.MouseButton1 then

            if not tDragMoved then

                MainFrame.Visible = true
                ToggleContainer.Visible = false

            end

        end

    end)

    --------------------------------------------------
    -- FLOATING SETTINGS
    --------------------------------------------------

    ToggleSettingBtn.MouseButton1Click:Connect(function()

        SettingsModal.Visible = not SettingsModal.Visible

    end)

    --------------------------------------------------
    -- FLOATING CLOSE
    --------------------------------------------------

    ToggleCloseBtn.MouseButton1Click:Connect(function()

        ScreenGui:Destroy()

    end)

    --------------------------------------------------
    -- MINIMIZE
    --------------------------------------------------

    MinBtn.MouseButton1Click:Connect(function()

        MainFrame.Visible = false
        SettingsModal.Visible = false
        ToggleContainer.Visible = true

    end)

    --------------------------------------------------
    -- MAIN CLOSE
    --------------------------------------------------

    CloseBtn.MouseButton1Click:Connect(function()

        ScreenGui:Destroy()

    end)

    --------------------------------------------------
    -- MAIN WINDOW DRAG
    --------------------------------------------------

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

        if dragging
        and (
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

    --------------------------------------------------
    -- SETTINGS DRAG
    --------------------------------------------------

    local settingsDragging = false
    local settingsDragStart
    local settingsStartPos

    ModalHeader.InputBegan:Connect(function(input)

        if input.UserInputType == Enum.UserInputType.Touch
        or input.UserInputType == Enum.UserInputType.MouseButton1 then

            settingsDragging = true
            settingsDragStart = input.Position
            settingsStartPos = SettingsModal.Position

        end

    end)

    UserInputService.InputChanged:Connect(function(input)

        if settingsDragging
        and (
            input.UserInputType == Enum.UserInputType.Touch
            or input.UserInputType == Enum.UserInputType.MouseMovement
        ) then

            local delta = input.Position - settingsDragStart

            SettingsModal.Position = UDim2.new(
                settingsStartPos.X.Scale,
                settingsStartPos.X.Offset + delta.X,
                settingsStartPos.Y.Scale,
                settingsStartPos.Y.Offset + delta.Y
            )

        end

    end)

    UserInputService.InputEnded:Connect(function(input)

        if input.UserInputType == Enum.UserInputType.Touch
        or input.UserInputType == Enum.UserInputType.MouseButton1 then

            settingsDragging = false

        end

    end)

    --------------------------------------------------
    -- START NOTIFICATIONS
    --------------------------------------------------

    task.spawn(function()

        task.wait(0.5)

        SendNotification(
            "Welcome to Sie Y Hub",
            "Thanks for using the hub!",
            "✨",
            4
        )

        task.wait(0.8)

        SendNotification(
            "Join our Discord",
            "Stay updated with announcements and updates.",
            "💬",
            4.5
        )

        task.wait(0.8)

        SendNotification(
            "Hub Loaded Successfully",
            "Everything is ready to use.",
            "✓",
            3.5
        )

    end)

end

--------------------------------------------------
-- START
--------------------------------------------------

OpenMainHub()
