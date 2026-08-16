-- all codes organized by vheoo

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

    local MainStroke = Instance.new("UIStroke", MainFrame)
    MainStroke.Color = Color3.fromRGB(45, 28, 80)
    MainStroke.Thickness = 1.2

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

    --------------------------------------------------
    -- IMAGE LOGO
    --------------------------------------------------

    local TopLogoIcon = Instance.new("ImageLabel")
    TopLogoIcon.Size = UDim2.new(0, 24, 0, 24)
    TopLogoIcon.Position = UDim2.new(0, 4, 0, 2)
    TopLogoIcon.BackgroundColor3 = THEME.AccentPurple
    TopLogoIcon.BackgroundTransparency = 0
    TopLogoIcon.Image = "rbxassetid://92206600654614"
    TopLogoIcon.ScaleType = Enum.ScaleType.Fit
    TopLogoIcon.Parent = TopLogoContainer

    Instance.new("UICorner", TopLogoIcon).CornerRadius = UDim.new(1, 0)

    --------------------------------------------------
    -- HUB NAME
    --------------------------------------------------

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
    -- DASHBOARD TAB ONLY
    --------------------------------------------------

    local DashboardButton = Instance.new("TextButton")
    DashboardButton.Size = UDim2.new(1, -6, 0, 26)
    DashboardButton.Position = UDim2.new(0, 3, 0, 52)
    DashboardButton.BackgroundColor3 = THEME.AccentPurple
    DashboardButton.BackgroundTransparency = 0.2
    DashboardButton.Text = "   Dashboard"
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

    --------------------------------------------------
    -- AVATAR
    --------------------------------------------------

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

    --------------------------------------------------
    -- USERNAME
    --------------------------------------------------

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

    --------------------------------------------------
    -- SEARCH
    --------------------------------------------------

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

    --------------------------------------------------
    -- CTRL TAG
    --------------------------------------------------

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
    -- STATUS / PFS CARD
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
    -- MINIMIZE FLOATING BUTTON
    --------------------------------------------------

    local ToggleContainer = Instance.new("Frame")
    ToggleContainer.Size = UDim2.new(0, 195, 0, 42)
    ToggleContainer.Position = UDim2.new(0, 20, 0, 120)
    ToggleContainer.BackgroundColor3 = THEME.SidebarBg
    ToggleContainer.BorderSizePixel = 0
    ToggleContainer.Visible = false
    ToggleContainer.Parent = ScreenGui

    Instance.new("UICorner", ToggleContainer).CornerRadius = UDim.new(1, 0)

    local ToggleStroke = Instance.new("UIStroke", ToggleContainer)
    ToggleStroke.Color = THEME.AccentPurple
    ToggleStroke.Thickness = 1

    local ToggleTextContainer = Instance.new("TextLabel")
    ToggleTextContainer.Size = UDim2.new(1, -40, 1, 0)
    ToggleTextContainer.Position = UDim2.new(0, 12, 0, 0)
    ToggleTextContainer.BackgroundTransparency = 1
    ToggleTextContainer.Text = "Sie Y Hub\nPet Simulator 99"
    ToggleTextContainer.TextColor3 = THEME.TextWhite
    ToggleTextContainer.Font = Enum.Font.GothamBold
    ToggleTextContainer.TextSize = 8.5
    ToggleTextContainer.TextXAlignment = Enum.TextXAlignment.Left
    ToggleTextContainer.Parent = ToggleContainer

    --------------------------------------------------
    -- FLOATING IMAGE
    --------------------------------------------------

    local FloatingLogo = Instance.new("ImageLabel")
    FloatingLogo.Size = UDim2.new(0, 30, 0, 30)
    FloatingLogo.Position = UDim2.new(1, -38, 0.5, -15)
    FloatingLogo.BackgroundTransparency = 1
    FloatingLogo.Image = "rbxassetid://92206600654614"
    FloatingLogo.ScaleType = Enum.ScaleType.Fit
    FloatingLogo.Parent = ToggleContainer

    --------------------------------------------------
    -- MINIMIZE BUTTON
    --------------------------------------------------

    MinBtn.MouseButton1Click:Connect(function()
        MainFrame.Visible = false
        ToggleContainer.Visible = true
    end)

    --------------------------------------------------
    -- FLOATING CLICK
    --------------------------------------------------

    ToggleContainer.InputBegan:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.Touch
        or input.UserInputType == Enum.UserInputType.MouseButton1 then

            MainFrame.Visible = true
            ToggleContainer.Visible = false
        end
    end)

    --------------------------------------------------
    -- CLOSE
    --------------------------------------------------

    CloseBtn.MouseButton1Click:Connect(function()
        ScreenGui:Destroy()
    end)

    --------------------------------------------------
    -- DRAG MAIN WINDOW
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

end

OpenMainHub()
