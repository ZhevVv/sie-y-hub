--========================================================--
--                    SIE Y HUB UI                        --
--              ANDROID RESPONSIVE EDITION                --
--                     UI ONLY                            --
--========================================================--

local ProtectionConfig = {
    -- 🔴 CRITICAL: This MUST exactly match the 'Secret' value in your Key System's Config!
    -- If your Key System has: Secret = "Test"
    -- Then this must also be: SecretKey = "Test"
    SecretKey = "Test",
    
    -- The name of your Hub (shown in the kick message if they try to bypass)
    HubName = "OYB HUB"
}

-- Anti-Bypass Logic: Checks if the Key System successfully set the global variable
if not _G[ProtectionConfig.SecretKey] then
    local player = game:GetService("Players").LocalPlayer
    if player then
        player:Kick("\n🛡️ Unauthorized Execution 🛡️\n\nPlease use the official Key System to run " .. ProtectionConfig.HubName)
    end
    return -- Stops the rest of the script from loading!
end

------------------------- MAIN GUI

local Players = game:GetService("Players")
local UserInputService = game:GetService("UserInputService")
local TweenService = game:GetService("TweenService")
local RunService = game:GetService("RunService")

local Player = Players.LocalPlayer
local PlayerGui = Player:WaitForChild("PlayerGui")

--========================================================--
-- CONFIG
--========================================================--

local BASE_WIDTH = 1360
local BASE_HEIGHT = 720

local LOGO_ASSET = "rbxassetid://92206600654614"

--========================================================--
-- THEME
--========================================================--

local C = {
	Background = Color3.fromRGB(9, 8, 14),
	Sidebar = Color3.fromRGB(13, 11, 19),

	Card = Color3.fromRGB(21, 19, 30),
	Card2 = Color3.fromRGB(25, 22, 35),
	CardHover = Color3.fromRGB(32, 27, 44),

	Purple = Color3.fromRGB(120, 38, 225),
	PurpleBright = Color3.fromRGB(145, 52, 255),
	PurpleDark = Color3.fromRGB(78, 24, 145),

	White = Color3.fromRGB(247, 245, 250),
	Text = Color3.fromRGB(222, 218, 230),
	Muted = Color3.fromRGB(145, 140, 155),

	SliderBackground = Color3.fromRGB(48, 43, 59),

	Green = Color3.fromRGB(91, 225, 107),

	Border = Color3.fromRGB(76, 39, 121),

	Black = Color3.fromRGB(5, 5, 8)
}

--========================================================--
-- HELPERS
--========================================================--

local function New(class, props, parent)

	local obj = Instance.new(class)

	for property, value in pairs(props or {}) do
		obj[property] = value
	end

	obj.Parent = parent

	return obj
end


local function Round(obj, radius)

	local corner = Instance.new("UICorner")

	corner.CornerRadius = UDim.new(0, radius)

	corner.Parent = obj

	return corner
end


local function Stroke(obj, color, thickness, transparency)

	local s = Instance.new("UIStroke")

	s.Color = color or C.Border
	s.Thickness = thickness or 1
	s.Transparency = transparency or 0

	s.Parent = obj

	return s
end


local function Tween(obj, properties, duration)

	local tween = TweenService:Create(
		obj,
		TweenInfo.new(
			duration or 0.18,
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

--========================================================--
-- SCREEN GUI
--========================================================--

local ScreenGui = New("ScreenGui", {

	Name = "SieYHub",

	ResetOnSpawn = false,

	IgnoreGuiInset = true,

	ZIndexBehavior = Enum.ZIndexBehavior.Sibling

}, PlayerGui)

--========================================================--
-- NOTIFICATION SYSTEM (KUMPLETO AT GUMAGANA)
--========================================================--

local NotificationContainer = nil

local function CreateNotificationContainer()
	if NotificationContainer then return end
	NotificationContainer = Instance.new("Frame")
	NotificationContainer.Name = "NotificationContainer"
	NotificationContainer.AnchorPoint = Vector2.new(0.5, 0)
	NotificationContainer.Position = UDim2.new(0.5, 0, 0, 30)
	NotificationContainer.Size = UDim2.new(0, 400, 0, 0)
	NotificationContainer.BackgroundTransparency = 1
	NotificationContainer.ZIndex = 9999
	NotificationContainer.Parent = ScreenGui

	-- UIListLayout para mag-stack nang maayos
	local layout = Instance.new("UIListLayout")
	layout.FillDirection = Enum.FillDirection.Vertical
	layout.HorizontalAlignment = Enum.HorizontalAlignment.Center
	layout.VerticalAlignment = Enum.VerticalAlignment.Top
	layout.Padding = UDim.new(0, 8)
	layout.SortOrder = Enum.SortOrder.LayoutOrder
	layout.Parent = NotificationContainer
end

local function Notify(text, duration, style, callback)
	duration = duration or 3
	style = style or "info"
	CreateNotificationContainer()

	local colors = {
		info = { bg = Color3.fromRGB(30,30,50), accent = Color3.fromRGB(100,150,255) },
		success = { bg = Color3.fromRGB(20,40,30), accent = Color3.fromRGB(91,225,107) },
		warning = { bg = Color3.fromRGB(50,40,20), accent = Color3.fromRGB(255,200,50) },
		error = { bg = Color3.fromRGB(50,20,20), accent = Color3.fromRGB(255,80,80) }
	}
	local color = colors[style] or colors.info

	local notif = Instance.new("Frame")
	notif.Size = UDim2.new(1, 0, 0, 0)
	notif.BackgroundColor3 = color.bg
	notif.BorderSizePixel = 0
	notif.BackgroundTransparency = 1
	notif.ClipsDescendants = true
	notif.Parent = NotificationContainer
	notif.LayoutOrder = #NotificationContainer:GetChildren()

	local corner = Instance.new("UICorner")
	corner.CornerRadius = UDim.new(0, 12)
	corner.Parent = notif

	local stroke = Instance.new("UIStroke")
	stroke.Color = color.accent
	stroke.Thickness = 2
	stroke.Parent = notif

	-- Accent bar - manipis at may margin
	local accent = Instance.new("Frame")
	accent.Size = UDim2.new(0, 3, 1, -6)
	accent.Position = UDim2.new(0, 4, 0, 3)
	accent.BackgroundColor3 = color.accent
	accent.BorderSizePixel = 0
	accent.Parent = notif
	local accentCorner = Instance.new("UICorner")
	accentCorner.CornerRadius = UDim.new(0, 2)
	accentCorner.Parent = accent

	local label = Instance.new("TextLabel")
	label.BackgroundTransparency = 1
	label.Text = text
	label.TextSize = 15
	label.TextColor3 = Color3.fromRGB(247, 245, 250)
	label.Font = Enum.Font.GothamMedium
	label.TextXAlignment = Enum.TextXAlignment.Left
	label.TextYAlignment = Enum.TextYAlignment.Center
	label.TextWrapped = true
	label.Position = UDim2.new(0, 22, 0, 0)
	label.Size = UDim2.new(1, -40, 1, 0)
	label.Parent = notif

	-- Animate in
	notif.Size = UDim2.new(1, 0, 0, 0)
	notif.BackgroundTransparency = 1
	task.wait(0.05)
	Tween(notif, {
		Size = UDim2.new(1, 0, 0, 60),
		BackgroundTransparency = 0
	}, 0.25)

	task.delay(duration, function()
		Tween(notif, {
			Size = UDim2.new(1, 0, 0, 0),
			BackgroundTransparency = 1
		}, 0.2)
		task.delay(0.25, function()
			notif:Destroy()
			if callback and type(callback) == "function" then
				callback()
			end
		end)
	end)
end

-- Shortcut functions
local function NotifyInfo(text, duration, callback)
	Notify(text, duration, "info", callback)
end
local function NotifySuccess(text, duration, callback)
	Notify(text, duration, "success", callback)
end
local function NotifyWarning(text, duration, callback)
	Notify(text, duration, "warning", callback)
end
local function NotifyError(text, duration, callback)
	Notify(text, duration, "error", callback)
end

--========================================================--
-- RESPONSIVE SCALE
--========================================================--

local UIScale = New("UIScale", {
	Scale = 1
}, ScreenGui)


local function UpdateScale()

	local camera = workspace.CurrentCamera

	if not camera then
		return
	end

	local viewport = camera.ViewportSize

	local width = viewport.X
	local height = viewport.Y

	local allowedWidth = width * 0.94
	local allowedHeight = height * 0.88

	local scaleX = allowedWidth / BASE_WIDTH
	local scaleY = allowedHeight / BASE_HEIGHT

	local finalScale = math.min(scaleX, scaleY)

	finalScale = math.min(finalScale, 1)
	finalScale = math.max(finalScale, 0.25)

	UIScale.Scale = finalScale
end


UpdateScale()


workspace.CurrentCamera:GetPropertyChangedSignal(
	"ViewportSize"
):Connect(UpdateScale)

--========================================================--
-- MAIN WINDOW
--========================================================--

local Main = New("Frame", {

	Name = "MainWindow",

	AnchorPoint = Vector2.new(0.5, 0.5),

	Position = UDim2.fromScale(0.5, 0.5),

	Size = UDim2.fromOffset(
		BASE_WIDTH,
		BASE_HEIGHT
	),

	BackgroundColor3 = C.Background,

	BorderSizePixel = 0,

	ClipsDescendants = true

}, ScreenGui)

Round(Main, 27)

local MainStroke = Stroke(
	Main,
	C.Border,
	2
)

--========================================================--
-- INNER BORDER
--========================================================--

local Inner = New("Frame", {

	Position = UDim2.fromOffset(2, 2),

	Size = UDim2.new(1, -4, 1, -4),

	BackgroundTransparency = 1,

	BorderSizePixel = 0,

	ClipsDescendants = true

}, Main)

Round(Inner, 25)

Stroke(
	Inner,
	Color3.fromRGB(34, 27, 47),
	1
)

--========================================================--
-- HEADER
--========================================================--

local Header = New("Frame", {

	Position = UDim2.fromOffset(0, 0),

	Size = UDim2.new(1, 0, 0, 105),

	BackgroundTransparency = 1

}, Main)

--========================================================--
-- LOGO
--========================================================--

local LogoImage = New("ImageLabel", {

	Position = UDim2.fromOffset(28, 18),

	Size = UDim2.fromOffset(64, 64),

	BackgroundTransparency = 1,

	Image = LOGO_ASSET,

	ScaleType = Enum.ScaleType.Fit,

	ImageTransparency = 0

}, Header)

--========================================================--
-- TITLE
--========================================================--

local HubTitle = Text(
	Header,
	"Sie Y Hub",
	22,
	C.White,
	Enum.Font.GothamBold
)

HubTitle.Position = UDim2.fromOffset(105, 16)
HubTitle.Size = UDim2.fromOffset(250, 32)


local Version = Text(
	Header,
	"v1.0.0",
	14,
	C.Muted,
	Enum.Font.Gotham
)

Version.Position = UDim2.fromOffset(105, 47)
Version.Size = UDim2.fromOffset(150, 23)


local GameTitle = Text(
	Header,
	"Pet Simulator 99",
	16,
	C.PurpleBright,
	Enum.Font.GothamBold
)

GameTitle.Position = UDim2.fromOffset(27, 79)
GameTitle.Size = UDim2.fromOffset(270, 24)

--========================================================--
-- SEARCH
--========================================================--

local Search = New("TextBox", {

	Position = UDim2.fromOffset(395, 20),

	Size = UDim2.fromOffset(390, 57),

	BackgroundColor3 = C.Card,

	BorderSizePixel = 0,

	Text = "",

	PlaceholderText = "Search anything...",

	PlaceholderColor3 = C.Muted,

	TextColor3 = C.Text,

	TextSize = 16,

	Font = Enum.Font.Gotham,

	ClearTextOnFocus = false

}, Header)

Round(Search, 13)

Stroke(
	Search,
	Color3.fromRGB(34, 30, 45),
	1
)


local SearchPadding = Instance.new("UIPadding")

SearchPadding.PaddingLeft = UDim.new(0, 55)

SearchPadding.PaddingRight = UDim.new(0, 15)

SearchPadding.Parent = Search


local SearchIcon = Text(
	Header,
	"⌕",
	28,
	C.Text,
	Enum.Font.Gotham
)

SearchIcon.Position = UDim2.fromOffset(413, 20)

SearchIcon.Size = UDim2.fromOffset(40, 57)

SearchIcon.TextXAlignment = Enum.TextXAlignment.Center

--========================================================--
-- SHORTCUT
--========================================================--

local Shortcut = New("Frame", {

	Position = UDim2.fromOffset(803, 29),

	Size = UDim2.fromOffset(70, 38),

	BackgroundColor3 = C.Card,

	BorderSizePixel = 0

}, Header)

Round(Shortcut, 9)


local ShortcutText = Text(
	Shortcut,
	"Ctrl /",
	12,
	C.Muted,
	Enum.Font.Gotham
)

ShortcutText.Size = UDim2.fromScale(1, 1)

ShortcutText.TextXAlignment = Enum.TextXAlignment.Center

--========================================================--
-- HEADER BUTTON
--========================================================--

local function HeaderButton(text)

	local button = New("TextButton", {

		Size = UDim2.fromOffset(62, 55),

		BackgroundColor3 = C.Card,

		Text = text,

		TextColor3 = C.White,

		TextSize = 25,

		Font = Enum.Font.GothamMedium,

		AutoButtonColor = false

	}, Header)

	Round(button, 13)

	Stroke(
		button,
		Color3.fromRGB(34, 30, 45),
		1
	)

	return button
end

--========================================================--
-- MINIMIZE / CLOSE
--========================================================--

local Minimize = HeaderButton("−")

Minimize.Position =
	UDim2.new(1, -160, 0, 21)


local Close = HeaderButton("×")

Close.Position =
	UDim2.new(1, -89, 0, 21)

--========================================================--
-- SIDEBAR
--========================================================--

local Sidebar = New("Frame", {

	Position = UDim2.fromOffset(20, 105),

	Size = UDim2.fromOffset(315, 595),

	BackgroundColor3 = C.Sidebar,

	BorderSizePixel = 0

}, Main)

Round(Sidebar, 18)

--========================================================--
-- TAB SCROLL - FIXED FOR PROPER SCROLLING
--========================================================--

local TabScroll = New("ScrollingFrame", {

	Position = UDim2.fromOffset(9, 12),

	Size = UDim2.new(1, -18, 1, -112),

	BackgroundTransparency = 1,

	BorderSizePixel = 0,

	ScrollBarThickness = 4,

	ScrollBarImageColor3 = C.PurpleBright,

	ScrollBarImageTransparency = 0.15,

	ScrollingDirection = Enum.ScrollingDirection.Y,

	CanvasSize = UDim2.new(0, 0, 0, 0),

	AutomaticCanvasSize = Enum.AutomaticSize.Y,

	ClipsDescendants = true,

	ScrollingEnabled = true

}, Sidebar)


local TabLayout = New("UIListLayout", {

	Padding = UDim.new(0, 4),

	SortOrder = Enum.SortOrder.LayoutOrder

}, TabScroll)


local TabPadding = Instance.new("UIPadding")

TabPadding.PaddingTop = UDim.new(0, 3)

TabPadding.PaddingBottom = UDim.new(0, 10)

TabPadding.Parent = TabScroll

--========================================================--
-- TABS
--========================================================--

local Tabs = {

	{"🏠", "Dashboard"},
	{"⚡", "Player"},
	{"👁", "Visuals"},
	{"🌍", "World"},
	{"⚔", "Combat"},
	{"📍", "Teleport"},
	{"▦", "Utility"},
	{"📋", "Miscellaneous"},
	{"⚙", "Settings"}

}

local TabButtons = {}

--========================================================--
-- TAB CREATOR
--========================================================--

local function CreateTab(icon, name, order)

	local Button = New("TextButton", {

		Size = UDim2.new(1, 0, 0, 54),

		BackgroundColor3 = C.Sidebar,

		Text = "",

		AutoButtonColor = false,

		LayoutOrder = order

	}, TabScroll)

	Round(Button, 9)


	local Icon = Text(
		Button,
		icon,
		21,
		C.Muted,
		Enum.Font.Gotham
	)

	Icon.Position = UDim2.fromOffset(10, 0)

	Icon.Size = UDim2.fromOffset(40, 54)

	Icon.TextXAlignment =
		Enum.TextXAlignment.Center


	local Name = Text(
		Button,
		name,
		16,
		C.Muted,
		Enum.Font.GothamMedium
	)

	Name.Position =
		UDim2.fromOffset(61, 0)

	Name.Size =
		UDim2.new(1, -70, 1, 0)


	TabButtons[name] = {

		Button = Button,

		Icon = Icon,

		Name = Name

	}


	Button.MouseEnter:Connect(function()

		if Button:GetAttribute("Selected") ~= true then

			Tween(
				Button,
				{
					BackgroundColor3 = C.CardHover
				}
			)

		end

	end)


	Button.MouseLeave:Connect(function()

		if Button:GetAttribute("Selected") ~= true then

			Tween(
				Button,
				{
					BackgroundColor3 = C.Sidebar
				}
			)

		end

	end)


	return Button
end


for i, tab in ipairs(Tabs) do

	CreateTab(
		tab[1],
		tab[2],
		i
	)

end

--========================================================--
-- PROFILE
--========================================================--

local Profile = New("Frame", {

	Position =
		UDim2.new(
			0,
			10,
			1,
			-91
		),

	Size =
		UDim2.new(
			1,
			-20,
			0,
			78
		),

	BackgroundColor3 = C.Card,

	BorderSizePixel = 0

}, Sidebar)

Round(Profile, 13)


local Avatar = New("Frame", {

	Position =
		UDim2.fromOffset(
			11,
			9
		),

	Size =
		UDim2.fromOffset(
			60,
			60
		),

	BackgroundColor3 =
		Color3.fromRGB(
			17,
			15,
			23
		),

		BorderSizePixel = 0

}, Profile)

Round(Avatar, 30)

Stroke(
	Avatar,
	Color3.fromRGB(53, 42, 69),
	1
)


local AvatarText = Text(
	Avatar,
	string.sub(Player.DisplayName, 1, 1),
	20,
	C.White,
	Enum.Font.GothamBold
)

AvatarText.Size =
	UDim2.fromScale(1, 1)

AvatarText.TextXAlignment =
	Enum.TextXAlignment.Center


local ProfileName = Text(
	Profile,
	Player.DisplayName,
	15,
	C.White,
	Enum.Font.GothamBold
)

ProfileName.Position =
	UDim2.fromOffset(84, 13)

ProfileName.Size =
	UDim2.new(1, -145, 0, 23)


local Premium = Text(
	Profile,
	"Premium",
	13,
	C.PurpleBright,
	Enum.Font.Gotham
)

Premium.Position =
	UDim2.fromOffset(84, 39)

Premium.Size =
	UDim2.new(1, -145, 0, 21)


local Crown = New("Frame", {

	Position =
		UDim2.new(
			1,
			-57,
			0.5,
			-20
		),

	Size =
		UDim2.fromOffset(
			40,
			40
		),

	BackgroundColor3 =
		Color3.fromRGB(
			37,
			18,
			67
		),

		BorderSizePixel = 0

}, Profile)

Round(Crown, 20)


local CrownText = Text(
	Crown,
	"♛",
	18,
	C.PurpleBright,
	Enum.Font.GothamBold
)

CrownText.Size =
	UDim2.fromScale(1, 1)

CrownText.TextXAlignment =
	Enum.TextXAlignment.Center

--========================================================--
-- CONTENT
--========================================================--

local Content = New("Frame", {

	Position =
		UDim2.fromOffset(
			350,
			105
		),

	Size =
		UDim2.new(
			1,
			-370,
			1,
			-120
		),

	BackgroundTransparency = 1,

	ClipsDescendants = true

}, Main)

--========================================================--
-- PAGE CREATOR - FIXED FOR PROPER SCROLLING
--========================================================--

local Pages = {}

local PageLayouts = {}


local function CreatePage(name)

	local Page = New("ScrollingFrame", {

		Name = name,

		Size = UDim2.fromScale(1, 1),

		BackgroundTransparency = 1,

		BorderSizePixel = 0,

		ScrollBarThickness = 5,

		ScrollBarImageColor3 = C.PurpleBright,

		ScrollBarImageTransparency = 0.1,

		ScrollingDirection = Enum.ScrollingDirection.Y,

		CanvasSize = UDim2.new(0, 0, 0, 0),

		AutomaticCanvasSize = Enum.AutomaticSize.Y,

		Visible = false,

		ClipsDescendants = true,

		ScrollingEnabled = true

	}, Content)


	local Padding = Instance.new("UIPadding")

	Padding.PaddingLeft = UDim.new(0, 4)

	Padding.PaddingRight = UDim.new(0, 10)

	Padding.PaddingTop = UDim.new(0, 2)

	Padding.PaddingBottom = UDim.new(0, 30)

	Padding.Parent = Page


	local Layout = New("UIListLayout", {

		Padding = UDim.new(0, 10),

		SortOrder = Enum.SortOrder.LayoutOrder

	}, Page)


	Pages[name] = Page

	PageLayouts[name] = Layout


	task.defer(function()

		Page.CanvasSize =
			UDim2.new(
				0,
				0,
				0,
				Layout.AbsoluteContentSize.Y + 40
			)

	end)


	return Page
end

--========================================================--
-- CARD
--========================================================--

local function Card(parent, height)

	local frame = New("Frame", {

		Size =
			UDim2.new(
				1,
				0,
				0,
				height
			),

		BackgroundColor3 =
			C.Card,

		BorderSizePixel = 0

	}, parent)

	Round(frame, 13)

	return frame
end

--========================================================--
-- WELCOME CARD
--========================================================--

local function WelcomeCard(parent)

	local Frame = Card(
		parent,
		100
	)


	local Accent = New("Frame", {

		Position =
			UDim2.fromOffset(
				0,
				0
			),

		Size =
			UDim2.fromOffset(
				5,
				100
			),

		BackgroundColor3 =
			C.PurpleBright,

		BorderSizePixel = 0

	}, Frame)

	Round(Accent, 5)


	local Welcome = Text(
		Frame,
		"Welcome back,",
		22,
		C.White,
		Enum.Font.GothamBold
	)

	Welcome.Position =
		UDim2.fromOffset(
			22,
			10
		)

	Welcome.Size =
		UDim2.fromOffset(
			180,
			34
		)


	local UserName = Text(
		Frame,
		Player.DisplayName .. "!",
		22,
		C.PurpleBright,
		Enum.Font.GothamBold
	)

	UserName.Position =
		UDim2.fromOffset(
			195,
			10
		)

	UserName.Size =
		UDim2.fromOffset(
			230,
			34
		)


	local Enjoy = Text(
		Frame,
		"Enjoy using Sie Y Hub.",
		15,
		C.Text,
		Enum.Font.Gotham
	)

	Enjoy.Position =
		UDim2.fromOffset(
			22,
			48
		)

	Enjoy.Size =
		UDim2.fromOffset(
			350,
			28
		)


	local Stats = {

		{"Status", "Ready", C.Green},
		{"Ping", "42ms", C.Green},
		{"FPS", "60", C.White},
		{"Time", "12:34:56", C.White}

	}


	for i, stat in ipairs(Stats) do

		local box = New("Frame", {

			Position =
				UDim2.new(
					1,
					-430 + ((i - 1) * 108),
					0,
					14
				),

			Size =
				UDim2.fromOffset(
					100,
					72
				),

			BackgroundColor3 =
				C.Card2,

			BorderSizePixel = 0

		}, Frame)

		Round(box, 10)


		local statTitle = Text(
			box,
			stat[1],
			13,
			C.Muted,
			Enum.Font.Gotham
		)

		statTitle.Position =
			UDim2.fromOffset(
				12,
				6
			)

		statTitle.Size =
			UDim2.new(
				1,
				-20,
				0,
				22
			)


		local value = Text(
			box,
			stat[2],
			16,
			stat[3],
			Enum.Font.GothamMedium
		)

		value.Position =
			UDim2.fromOffset(
				12,
				34
			)

		value.Size =
			UDim2.new(
				1,
				-20,
				0,
				25
			)

	end


	return Frame
end

--========================================================--
-- SECTION
--========================================================--

local function SectionTitle(parent, title)

	local frame = New("Frame", {

		Size =
			UDim2.new(
				1,
				0,
				0,
				32
			),

		BackgroundTransparency = 1

	}, parent)


	local label = Text(
		frame,
		title,
		18,
		C.PurpleBright,
		Enum.Font.GothamBold
	)

	label.Size =
		UDim2.fromScale(
			1,
			1
		)

	return frame
end

--========================================================--
-- QUICK ACTION
--========================================================--

local function QuickAction(parent, icon, title, callback)

	local button = New("TextButton", {

		Size =
			UDim2.new(
				0.25,
				-7,
				1,
				0
			),

		BackgroundColor3 =
			C.Card,

		Text = "",

		AutoButtonColor = false

	}, parent)

	Round(button, 11)


	local iconLabel = Text(
		button,
		icon,
		25,
		C.PurpleBright,
		Enum.Font.Gotham
	)

	iconLabel.Position =
		UDim2.fromOffset(
			17,
			0
		)

	iconLabel.Size =
		UDim2.fromOffset(
			50,
			68
		)

	iconLabel.TextXAlignment =
		Enum.TextXAlignment.Center


	local label = Text(
		button,
		title,
		15,
		C.Text,
		Enum.Font.GothamMedium
	)

	label.Position =
		UDim2.fromOffset(
			72,
			0
		)

	label.Size =
		UDim2.new(
			1,
			-82,
			1,
			0
		)


	button.MouseEnter:Connect(function()
		Tween(
			button,
			{
				BackgroundColor3 =
					C.CardHover
			}
		)
	end)


	button.MouseLeave:Connect(function()
		Tween(
			button,
			{
				BackgroundColor3 =
					C.Card
			}
		)
	end)

	-- Attach callback
	if callback and type(callback) == "function" then
		button.Activated:Connect(callback)
	end

	return button
end

--========================================================--
-- ELEMENT CREATORS (Table-based configuration)
--========================================================--

-- Toggle
local function CreateToggle(parent, config)
	config = config or {}
	local title = config.Name or ""
	local description = config.Description
	local default = config.CurrentValue or false
	local flag = config.Flag or ""
	local callback = config.Callback

	local titleX = config.TitleX or 20
	local titleY = config.TitleY or 13
	local descX = config.DescX or 20
	local descY = config.DescY or 40
	local titleSize = config.TitleSize or 21
	local descSize = config.DescSize or 15

	local Frame = Card(
		parent,
		description and 82 or 68
	)

	local Title = Text(
		Frame,
		title,
		titleSize,
		C.White,
		Enum.Font.GothamBold
	)

	Title.Position =
		UDim2.fromOffset(
			titleX,
			titleY
		)

	Title.Size =
		UDim2.new(
			1,
			-120,
			0,
			28
		)

	if description then
		local Desc = Text(
			Frame,
			description,
			descSize,
			C.Muted,
			Enum.Font.Gotham
		)

		Desc.Position =
			UDim2.fromOffset(
				descX,
				descY
			)

		Desc.Size =
			UDim2.new(
				1,
				-120,
				0,
				26
			)
	end

	local Switch = New("TextButton", {

		AnchorPoint =
			Vector2.new(
				0,
				0.5
			),

		Position =
			UDim2.new(
				1,
				-75,
				0.5,
				0
			),

		Size =
			UDim2.fromOffset(
				55,
				32
			),

		BackgroundColor3 =
			default
			and C.Purple
			or C.SliderBackground,

		Text = "",

		AutoButtonColor = false

	}, Frame)

	Round(Switch, 18)

	local Knob = New("Frame", {

		AnchorPoint =
			Vector2.new(
				0,
				0.5
			),

		Position =
			default
			and UDim2.new(
				1,
				-28,
				0.5,
				0
			)
			or
			UDim2.new(
				0,
				6,
				0.5,
				0
			),

		Size =
			UDim2.fromOffset(
				22,
				22
			),

		BackgroundColor3 =
			C.White,

		BorderSizePixel = 0

	}, Switch)

	Round(Knob, 20)

	local state = default

	Switch.Activated:Connect(function()
		state = not state

		Tween(
			Switch,
			{
				BackgroundColor3 =
					state
					and C.Purple
					or C.SliderBackground
			}
		)

		Tween(
			Knob,
			{
				Position =
					state
					and UDim2.new(
						1,
						-28,
						0.5,
						0
					)
					or
					UDim2.new(
						0,
						6,
						0.5,
						0
					)
			}
		)

		if callback and type(callback) == "function" then
			callback(state)
		end
	end)

	return Frame
end

-- Slider
local function CreateSlider(parent, config)
	config = config or {}
	local title = config.Name or ""
	local default = config.Default or 50
	local minimum = config.Minimum or 0
	local maximum = config.Maximum or 100
	local flag = config.Flag or ""
	local callback = config.Callback

	local titleX = config.TitleX or 20
	local titleY = config.TitleY or 7
	local valueX = config.ValueX or -80
	local valueY = config.ValueY or 7
	local titleSize = config.TitleSize or 18
	local valueSize = config.ValueSize or 17

	local Frame = Card(
		parent,
		78
	)

	local Title = Text(
		Frame,
		title,
		titleSize,
		C.White,
		Enum.Font.GothamBold
	)

	Title.Position =
		UDim2.fromOffset(
			titleX,
			titleY
		)

	Title.Size =
		UDim2.new(
			1,
			-100,
			0,
			28
		)

	local Value = Text(
		Frame,
		tostring(default),
		valueSize,
		C.PurpleBright,
		Enum.Font.GothamBold
	)

	Value.Position =
		UDim2.new(
			1,
			valueX,
			0,
			valueY
		)

	Value.Size =
		UDim2.fromOffset(
			60,
			28
		)

	Value.TextXAlignment =
		Enum.TextXAlignment.Right

	local Bar = New("Frame", {

		Position =
			UDim2.fromOffset(
				20,
				50
			),

		Size =
			UDim2.new(
				1,
				-40,
				0,
				9
			),

		BackgroundColor3 =
			C.SliderBackground,

		BorderSizePixel = 0

	}, Frame)

	Round(Bar, 10)

	local percent =
		math.clamp(
			(default - minimum)
				/
			(maximum - minimum),
			0,
			1
		)

	local Fill = New("Frame", {

		Size =
			UDim2.new(
				percent,
				0,
				1,
				0
			),

		BackgroundColor3 =
			C.PurpleBright,

		BorderSizePixel = 0

	}, Bar)

	Round(Fill, 10)

	local Knob = New("Frame", {

		AnchorPoint =
			Vector2.new(
				0.5,
				0.5
			),

		Position =
			UDim2.new(
				percent,
				0,
				0.5,
				0
			),

		Size =
			UDim2.fromOffset(
				20,
				20
			),

		BackgroundColor3 =
			C.PurpleBright,

		BorderSizePixel = 0

	}, Bar)

	Round(Knob, 20)

	local dragging = false

	local function UpdateSlider(x)
		local width = Bar.AbsoluteSize.X
		if width <= 0 then
			return
		end

		local relative =
			(
				x -
				Bar.AbsolutePosition.X
			)
			/
			width

		local p =
			math.clamp(
				relative,
				0,
				1
			)

		local value =
			math.floor(
				minimum +
				(
					maximum -
					minimum
				) * p
				+ 0.5
			)

		Fill.Size =
			UDim2.new(
				p,
				0,
				1,
				0
			)

		Knob.Position =
			UDim2.new(
				p,
				0,
				0.5,
				0
			)

		Value.Text =
			tostring(value)

		if callback and type(callback) == "function" then
			callback(value)
		end
	end

	Bar.InputBegan:Connect(function(input)
		if
			input.UserInputType ==
				Enum.UserInputType.MouseButton1
			or
			input.UserInputType ==
				Enum.UserInputType.Touch
		then
			dragging = true
			UpdateSlider(
				input.Position.X
			)
		end
	end)

	UserInputService.InputChanged:Connect(function(input)
		if not dragging then
			return
		end
		if
			input.UserInputType ==
				Enum.UserInputType.MouseMovement
			or
			input.UserInputType ==
				Enum.UserInputType.Touch
		then
			UpdateSlider(
				input.Position.X
			)
		end
	end)

	UserInputService.InputEnded:Connect(function(input)
		if
			input.UserInputType ==
				Enum.UserInputType.MouseButton1
			or
			input.UserInputType ==
				Enum.UserInputType.Touch
		then
			dragging = false
		end
	end)

	return Frame
end

-- Dropdown
local function CreateDropdown(parent, config)
	config = config or {}
	local title = config.Name or ""
	local default = config.Default or ""
	local options = config.Options or {}
	local flag = config.Flag or ""
	local callback = config.Callback

	local titleX = config.TitleX or 20
	local titleY = config.TitleY or 7
	local currentX = config.CurrentX or 20
	local currentY = config.CurrentY or 34
	local titleSize = config.TitleSize or 15
	local currentSize = config.CurrentSize or 17

	local closedHeight = 78
	local optionHeight = 43
	local optionPadding = 5

	local optionsHeight =
		(#options * optionHeight)
		+
		(math.max(#options - 1, 0) * optionPadding)

	local expandedHeight =
		closedHeight
		+
		8
		+
		optionsHeight
		+
		12

	local Frame = New("Frame", {

		Size =
			UDim2.new(
				1,
				0,
				0,
				closedHeight
			),

		BackgroundColor3 = C.Card,

		BorderSizePixel = 0,

		ClipsDescendants = true

	}, parent)

	Round(Frame, 13)

	local HeaderButton = New("TextButton", {

		Size =
			UDim2.new(
				1,
				0,
				0,
				closedHeight
			),

		BackgroundTransparency = 1,

		Text = "",

		AutoButtonColor = false

	}, Frame)

	local Title = Text(
		Frame,
		title,
		titleSize,
		C.Muted,
		Enum.Font.Gotham
	)

	Title.Position =
		UDim2.fromOffset(
			titleX,
			titleY
		)

	Title.Size =
		UDim2.new(
			1,
			-70,
			0,
			22
		)

	local Current = Text(
		Frame,
		default,
		currentSize,
		C.White,
		Enum.Font.GothamMedium
	)

	Current.Position =
		UDim2.fromOffset(
			currentX,
			currentY
		)

	Current.Size =
		UDim2.new(
			1,
			-80,
			0,
			30
		)

	local ArrowBackground = New("Frame", {

		Position =
			UDim2.new(
				1,
				-53,
				0,
				22
			),

		Size =
			UDim2.fromOffset(
				34,
				34
			),

		BackgroundColor3 =
			C.Card2,

		BorderSizePixel = 0

	}, Frame)

	Round(
		ArrowBackground,
		17
	)

	local Arrow = Text(
		ArrowBackground,
		"⌄",
		18,
		C.Text,
		Enum.Font.GothamBold
	)

	Arrow.Size =
		UDim2.fromScale(
			1,
			1
		)

	Arrow.TextXAlignment =
		Enum.TextXAlignment.Center

	local Separator = New("Frame", {

		Position =
			UDim2.fromOffset(
				20,
				closedHeight - 1
			),

		Size =
			UDim2.new(
				1,
				-40,
				0,
				1
			),

		BackgroundColor3 =
			Color3.fromRGB(
				39,
				34,
				49
			),

		BorderSizePixel = 0

	}, Frame)

	local OptionsContainer = New("Frame", {

		Position =
			UDim2.fromOffset(
				10,
				closedHeight + 8
			),

		Size =
			UDim2.new(
				1,
				-20,
				0,
				optionsHeight
			),

		BackgroundTransparency = 1,

		ClipsDescendants = false

	}, Frame)

	local OptionLayout = New("UIListLayout", {

		Padding =
			UDim.new(
				0,
				optionPadding
			),

		SortOrder =
			Enum.SortOrder.LayoutOrder

	}, OptionsContainer)

	local selectedOption = default
	local opened = false
	local OptionButtons = {}

	local function UpdateParentCanvas()
		if not parent then
			return
		end
		if not parent:IsA("ScrollingFrame") then
			return
		end
		local layout =
			parent:FindFirstChildOfClass("UIListLayout")
		if not layout then
			return
		end
		task.defer(function()
			if not parent or not parent.Parent then
				return
			end
			local contentHeight =
				layout.AbsoluteContentSize.Y
			local extraHeight = 0
			if opened then
				extraHeight =
					expandedHeight
					-
					closedHeight
			end
			parent.CanvasSize =
				UDim2.new(
					0,
					0,
					0,
					contentHeight
					+
					extraHeight
					+
					40
				)
		end)
	end

	for i, option in ipairs(options) do
		local Option = New("TextButton", {

			Size =
				UDim2.new(
					1,
					0,
					0,
					optionHeight
				),

			BackgroundColor3 =
				option == default
				and
				Color3.fromRGB(
					39,
					27,
					55
				)
				or
				C.Card2,

			Text = "",

			AutoButtonColor = false,

			LayoutOrder = i

		}, OptionsContainer)

		Round(
			Option,
			10
		)

		local optionText = Text(
			Option,
			option,
			15,
			option == default
			and C.PurpleBright
			or C.Text,
			Enum.Font.GothamMedium
		)

		optionText.Position =
			UDim2.fromOffset(
				16,
				0
			)

		optionText.Size =
			UDim2.new(
				1,
				-60,
				1,
				0
			)

		local Check = Text(
			Option,
			option == default
			and "✓"
			or "",
			17,
			C.PurpleBright,
			Enum.Font.GothamBold
		)

		Check.Position =
			UDim2.new(
				1,
				-43,
				0,
				0
			)

		Check.Size =
			UDim2.fromOffset(
				34,
				optionHeight
			)

		Check.TextXAlignment =
			Enum.TextXAlignment.Center

		OptionButtons[option] = {

			Button = Option,

			Text = optionText,

			Check = Check

		}

		Option.Activated:Connect(function()
			selectedOption = option
			Current.Text = option

			for optionName, data in pairs(
				OptionButtons
			) do
				local selected =
					optionName ==
					option

				data.Button.BackgroundColor3 =
					selected
					and
					Color3.fromRGB(
						39,
						27,
						55
					)
					or
					C.Card2

				data.Text.TextColor3 =
					selected
					and
					C.PurpleBright
					or
					C.Text

				data.Check.Text =
					selected
					and
					"✓"
					or
					""
			end

			if callback and type(callback) == "function" then
				callback(selectedOption)
			end

			opened = false

			Tween(
				Frame,
				{
					Size =
						UDim2.new(
							1,
							0,
							0,
							closedHeight
						)
				},
				0.20
			)

			Tween(
				ArrowBackground,
				{
					Rotation = 0
				},
				0.20
			)

			UpdateParentCanvas()
		end)
	end

	HeaderButton.Activated:Connect(function()
		opened = not opened

		if opened then
			UpdateParentCanvas()

			Tween(
				Frame,
				{
					Size =
						UDim2.new(
							1,
							0,
							0,
							expandedHeight
						)
				},
				0.22
			)

			Tween(
				ArrowBackground,
				{
					Rotation = 180
				},
				0.20
			)

			task.delay(
				0.24,
				function()
					if opened then
						UpdateParentCanvas()
					end
				end
			)
		else
			Tween(
				Frame,
				{
					Size =
						UDim2.new(
							1,
							0,
							0,
							closedHeight
						)
				},
				0.20
			)

			Tween(
				ArrowBackground,
				{
					Rotation = 0
				},
				0.20
			)

			task.delay(
				0.22,
				function()
					if not opened then
						UpdateParentCanvas()
					end
				end
			)
		end
	end)

	task.defer(function()
		UpdateParentCanvas()
	end)

	return Frame
end

-- Button (Action Button)
local function CreateButton(parent, config)
	config = config or {}
	local title = config.Name or ""
	local primary = config.Primary or false
	local flag = config.Flag or ""
	local callback = config.Callback

	local Button = New("TextButton", {

		Size =
			UDim2.new(
				1,
				0,
				0,
				64
			),

		BackgroundColor3 =
			primary
			and C.Purple
			or C.Card,

		Text = title,

		TextColor3 =
			C.White,

		TextSize = 19,

		Font =
			Enum.Font.GothamBold,

		AutoButtonColor = false

	}, parent)

	Round(
		Button,
		11
	)

	Button.MouseEnter:Connect(function()
		Tween(
			Button,
			{
				BackgroundColor3 =
					primary
					and C.PurpleBright
					or C.CardHover
			}
		)
	end)

	Button.MouseLeave:Connect(function()
		Tween(
			Button,
			{
				BackgroundColor3 =
					primary
					and C.Purple
					or C.Card
			}
		)
	end)

	Button.Activated:Connect(function()
		if callback and type(callback) == "function" then
			callback()
		end
	end)

	return Button
end

--========================================================--
-- TAB SWITCHING (ilipat dito)
--========================================================--

local function SelectTab(name)

	for tabName, data in pairs(TabButtons) do
		local selected = tabName == name

		data.Button:SetAttribute("Selected", selected)

		Tween(
			data.Button,
			{
				BackgroundColor3 =
					selected
					and C.Purple
					or C.Sidebar
			},
			0.15
		)

		Tween(
			data.Icon,
			{
				TextColor3 =
					selected
					and C.White
					or C.Muted
			},
			0.12
		)

		Tween(
			data.Name,
			{
				TextColor3 =
					selected
					and C.White
					or C.Muted
			},
			0.12
		)
	end

	for pageName, page in pairs(Pages) do
		page.Visible = pageName == name
	end

	local selectedPage = Pages[name]
	if selectedPage then
		selectedPage.CanvasPosition = Vector2.new(0, 0)
	end
end

--========================================================--
-- PAGES (now using the new creators)
--========================================================--

-- DASHBOARD
local Dashboard = CreatePage("Dashboard")
WelcomeCard(Dashboard)
SectionTitle(Dashboard, "Quick Actions")

local QuickRow = New("Frame", {
	Size = UDim2.new(1, 0, 0, 70),
	BackgroundTransparency = 1
}, Dashboard)

local QuickLayout = New("UIListLayout", {
	FillDirection = Enum.FillDirection.Horizontal,
	Padding = UDim.new(0, 10)
}, QuickRow)

QuickAction(QuickRow, "⟳", "Rejoin", function()
    -- Rejoin logic
    game:GetService("TeleportService"):Teleport(game.PlaceId, game.Players.LocalPlayer)
end)

QuickAction(QuickRow, "▤", "Server Hop", function()
    -- Server hop logic
    local servers = game:GetService("HttpService"):JSONDecode(game:HttpGet("https://games.roblox.com/v1/games/" .. game.PlaceId .. "/servers/Public?limit=100"))
    local available = {}
    for _, v in pairs(servers.data) do
        if v.playing < v.maxPlayers and v.id ~= game.JobId then
            table.insert(available, v.id)
        end
    end
    if #available > 0 then
        game:GetService("TeleportService"):TeleportToPlaceInstance(game.PlaceId, available[math.random(#available)], game.Players.LocalPlayer)
    end
end)

QuickAction(QuickRow, "📍", "Teleport", function()
    SelectTab("Teleport")
end)

QuickAction(QuickRow, "☼", "Full Bright", function()
    -- Toggle full bright (example: set Lighting.Brightness)
    local lighting = game:GetService("Lighting")
    lighting.Brightness = lighting.Brightness == 1 and 10 or 1
    lighting.ClockTime = lighting.ClockTime == 14 and 12 or 14
end)

CreateToggle(Dashboard, {
	Name = "Notifications",
	Description = "Display interface notifications.",
	CurrentValue = true,
	Flag = "Dashboard_Notifications",
	Callback = function(v) print("Dashboard Notifications:", v) end
})

CreateToggle(Dashboard, {
	Name = "Animations",
	Description = "Enable interface animations.",
	CurrentValue = true,
	Flag = "Dashboard_Animations",
	Callback = function(v) print("Dashboard Animations:", v) end
})

CreateSlider(Dashboard, {
	Name = "Interface Opacity",
	Default = 80,
	Minimum = 0,
	Maximum = 100,
	Flag = "Dashboard_Opacity",
	Callback = function(v) print("Dashboard Opacity:", v) end
})

CreateDropdown(Dashboard, {
	Name = "Dashboard Preset",
	Default = "Default",
	Options = {"Default", "Compact", "Minimal"},
	Flag = "Dashboard_Preset",
	Callback = function(v) print("Dashboard Preset:", v) end
})

-- PLAYER
local PlayerPage = CreatePage("Player")
WelcomeCard(PlayerPage)
SectionTitle(PlayerPage, "Player Settings")

CreateToggle(PlayerPage, {
	Name = "WalkSpeed Multiplier",
	Description = "Adjust player movement speed.",
	CurrentValue = true,
	Flag = "Player_WalkSpeedMultiplier",
	Callback = function(v) print("WalkSpeed Multiplier:", v) end
})

CreateSlider(PlayerPage, {
	Name = "WalkSpeed Value",
	Default = 16,
	Minimum = 1,
	Maximum = 360,
	Flag = "Player_WalkSpeedValue",
	Callback = function(v) game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = v
   end
})

CreateToggle(PlayerPage, {
	Name = "JumpPower Modifier",
	Description = "Adjust jump power.",
	CurrentValue = false,
	Flag = "Player_JumpPowerModifier",
	Callback = function(v) print("JumpPower Modifier:", v) end
})

CreateSlider(PlayerPage, {
	Name = "JumpPower Value",
	Default = 100,
	Minimum = 1,
	Maximum = 200,
	Flag = "Player_JumpPowerValue",
	Callback = function(v) print("JumpPower Value:", v) end
})

CreateToggle(PlayerPage, {
	Name = "Auto Sprint",
	Description = "Automatically maintain sprint state.",
	CurrentValue = false,
	Flag = "Player_AutoSprint",
	Callback = function(v) print("Auto Sprint:", v) end
})

CreateToggle(PlayerPage, {
	Name = "Infinite Jump",
	Description = "Interface option for repeated jumping.",
	CurrentValue = true,
	Flag = "Player_InfiniteJump",
	Callback = function(v) print("Infinite Jump:", v) end
})

CreateDropdown(PlayerPage, {
	Name = "WalkSpeed Preset",
	Default = "Default",
	Options = {"Default", "Slow", "Normal", "Fast", "Custom"},
	Flag = "Player_WalkSpeedPreset",
	Callback = function(v) print("WalkSpeed Preset:", v) end
})

CreateButton(PlayerPage, {
	Name = "▣   Save Settings",
	Primary = true,
	Flag = "Player_SaveSettings",
	Callback = function() print("Player settings saved") end
})

CreateButton(PlayerPage, {
	Name = "⟳   Reset",
	Primary = false,
	Flag = "Player_ResetSettings",
	Callback = function() print("Player settings reset") end
})

-- VISUALS
local Visuals = CreatePage("Visuals")
WelcomeCard(Visuals)
SectionTitle(Visuals, "Visual Settings")

CreateToggle(Visuals, {
	Name = "Player Names",
	Description = "Display player names.",
	CurrentValue = true,
	Flag = "Visuals_PlayerNames",
	Callback = function(v) print("Player Names:", v) end
})

CreateToggle(Visuals, {
	Name = "Highlight",
	Description = "Highlight selected objects.",
	CurrentValue = false,
	Flag = "Visuals_Highlight",
	Callback = function(v) print("Highlight:", v) end
})

CreateToggle(Visuals, {
	Name = "ESP Display",
	Description = "Display visual information.",
	CurrentValue = false,
	Flag = "Visuals_ESP",
	Callback = function(v) print("ESP Display:", v) end
})

CreateSlider(Visuals, {
	Name = "Brightness",
	Default = 50,
	Minimum = 0,
	Maximum = 100,
	Flag = "Visuals_Brightness",
	Callback = function(v) print("Brightness:", v) end
})

CreateSlider(Visuals, {
	Name = "UI Transparency",
	Default = 0,
	Minimum = 0,
	Maximum = 100,
	Flag = "Visuals_UITransparency",
	Callback = function(v) print("UI Transparency:", v) end
})

CreateDropdown(Visuals, {
	Name = "Visual Preset",
	Default = "Default",
	Options = {"Default", "Minimal", "Detailed", "High Contrast"},
	Flag = "Visuals_Preset",
	Callback = function(v) print("Visual Preset:", v) end
})

-- WORLD
local World = CreatePage("World")
WelcomeCard(World)
SectionTitle(World, "World Settings")

CreateToggle(World, {
	Name = "World Information",
	Description = "Display world information.",
	CurrentValue = true,
	Flag = "World_Info",
	Callback = function(v) print("World Information:", v) end
})

CreateToggle(World, {
	Name = "Environment Effects",
	Description = "Display environment effects.",
	CurrentValue = true,
	Flag = "World_Effects",
	Callback = function(v) print("Environment Effects:", v) end
})

CreateToggle(World, {
	Name = "Low Graphics",
	Description = "Reduce visual interface effects.",
	CurrentValue = false,
	Flag = "World_LowGraphics",
	Callback = function(v) print("Low Graphics:", v) end
})

CreateSlider(World, {
	Name = "Environment Intensity",
	Default = 50,
	Minimum = 0,
	Maximum = 100,
	Flag = "World_Intensity",
	Callback = function(v) print("Environment Intensity:", v) end
})

CreateDropdown(World, {
	Name = "Environment Preset",
	Default = "Default",
	Options = {"Default", "Day", "Night", "Dynamic"},
	Flag = "World_Preset",
	Callback = function(v) print("Environment Preset:", v) end
})

-- COMBAT
local Combat = CreatePage("Combat")
WelcomeCard(Combat)
SectionTitle(Combat, "Combat Interface")

CreateToggle(Combat, {
	Name = "Combat Indicators",
	Description = "Display combat information.",
	CurrentValue = true,
	Flag = "Combat_Indicators",
	Callback = function(v) print("Combat Indicators:", v) end
})

CreateToggle(Combat, {
	Name = "Target Indicators",
	Description = "Display target information.",
	CurrentValue = false,
	Flag = "Combat_TargetIndicators",
	Callback = function(v) print("Target Indicators:", v) end
})

CreateToggle(Combat, {
	Name = "Action Feedback",
	Description = "Display action feedback.",
	CurrentValue = true,
	Flag = "Combat_Feedback",
	Callback = function(v) print("Action Feedback:", v) end
})

CreateToggle(Combat, {
	Name = "Notifications",
	Description = "Display combat notifications.",
	CurrentValue = true,
	Flag = "Combat_Notifications",
	Callback = function(v) print("Combat Notifications:", v) end
})

CreateSlider(Combat, {
	Name = "Indicator Size",
	Default = 50,
	Minimum = 10,
	Maximum = 100,
	Flag = "Combat_IndicatorSize",
	Callback = function(v) print("Indicator Size:", v) end
})

CreateDropdown(Combat, {
	Name = "Indicator Style",
	Default = "Default",
	Options = {"Default", "Minimal", "Compact"},
	Flag = "Combat_IndicatorStyle",
	Callback = function(v) print("Indicator Style:", v) end
})

-- TELEPORT
local Teleport = CreatePage("Teleport")
WelcomeCard(Teleport)
SectionTitle(Teleport, "Teleport Interface")

CreateDropdown(Teleport, {
	Name = "Location",
	Default = "Default",
	Options = {"Default", "Spawn", "Area 1", "Area 2", "Area 3", "Area 4"},
	Flag = "Teleport_Location",
	Callback = function(v) print("Teleport Location:", v) end
})

CreateButton(Teleport, {
	Name = "📍   Select Location",
	Primary = true,
	Flag = "Teleport_Select",
	Callback = function() print("Select location") end
})

CreateButton(Teleport, {
	Name = "⟳   Refresh Locations",
	Primary = false,
	Flag = "Teleport_Refresh",
	Callback = function() print("Refresh locations") end
})

CreateToggle(Teleport, {
	Name = "Confirmation",
	Description = "Ask before selecting a location.",
	CurrentValue = true,
	Flag = "Teleport_Confirmation",
	Callback = function(v) print("Teleport Confirmation:", v) end
})

-- UTILITY
local Utility = CreatePage("Utility")
WelcomeCard(Utility)
SectionTitle(Utility, "Utilities")

CreateToggle(Utility, {
	Name = "Notifications",
	Description = "Display UI notifications.",
	CurrentValue = true,
	Flag = "Utility_Notifications",
	Callback = function(v) print("Utility Notifications:", v) end
})

CreateToggle(Utility, {
	Name = "Animations",
	Description = "Enable interface animations.",
	CurrentValue = true,
	Flag = "Utility_Animations",
	Callback = function(v) print("Utility Animations:", v) end
})

CreateToggle(Utility, {
	Name = "Compact Mode",
	Description = "Use a more compact interface.",
	CurrentValue = false,
	Flag = "Utility_CompactMode",
	Callback = function(v) print("Compact Mode:", v) end
})

CreateDropdown(Utility, {
	Name = "Interface Density",
	Default = "Default",
	Options = {"Default", "Compact", "Small"},
	Flag = "Utility_Density",
	Callback = function(v) print("Interface Density:", v) end
})

CreateSlider(Utility, {
	Name = "Animation Speed",
	Default = 50,
	Minimum = 0,
	Maximum = 100,
	Flag = "Utility_AnimationSpeed",
	Callback = function(v) print("Animation Speed:", v) end
})

CreateButton(Utility, {
	Name = "⟳   Refresh Interface",
	Primary = true,
	Flag = "Utility_Refresh",
	Callback = function() print("Refresh interface") end
})

-- MISCELLANEOUS
local Misc = CreatePage("Miscellaneous")
WelcomeCard(Misc)
SectionTitle(Misc, "Miscellaneous")

CreateToggle(Misc, {
	Name = "Sound Effects",
	Description = "Enable interface sound effects.",
	CurrentValue = true,
	Flag = "Misc_SoundEffects",
	Callback = function(v) print("Sound Effects:", v) end
})

CreateToggle(Misc, {
	Name = "Notifications",
	Description = "Enable interface notifications.",
	CurrentValue = true,
	Flag = "Misc_Notifications",
	Callback = function(v) print("Misc Notifications:", v) end
})

CreateToggle(Misc, {
	Name = "Animations",
	Description = "Enable interface animations.",
	CurrentValue = true,
	Flag = "Misc_Animations",
	Callback = function(v) print("Misc Animations:", v) end
})

CreateSlider(Misc, {
	Name = "Animation Speed",
	Default = 50,
	Minimum = 0,
	Maximum = 100,
	Flag = "Misc_AnimationSpeed",
	Callback = function(v) print("Misc Animation Speed:", v) end
})

CreateDropdown(Misc, {
	Name = "UI Mode",
	Default = "Default",
	Options = {"Default", "Mobile", "Compact"},
	Flag = "Misc_UIMode",
	Callback = function(v) print("UI Mode:", v) end
})

CreateButton(Misc, {
	Name = "▣   Apply Settings",
	Primary = true,
	Flag = "Misc_ApplySettings",
	Callback = function() print("Apply settings") end
})

-- SETTINGS
local Settings = CreatePage("Settings")
WelcomeCard(Settings)
SectionTitle(Settings, "Settings")

CreateToggle(Settings, {
	Name = "Interface Enabled",
	Description = "Enable the interface.",
	CurrentValue = true,
	Flag = "Settings_InterfaceEnabled",
	Callback = function(v) print("Interface Enabled:", v) end
})

CreateToggle(Settings, {
	Name = "Animations",
	Description = "Enable UI animations.",
	CurrentValue = true,
	Flag = "Settings_Animations",
	Callback = function(v) print("Settings Animations:", v) end
})

CreateToggle(Settings, {
	Name = "Notifications",
	Description = "Enable UI notifications.",
	CurrentValue = true,
	Flag = "Settings_Notifications",
	Callback = function(v) print("Settings Notifications:", v) end
})

CreateDropdown(Settings, {
	Name = "Accent Color",
	Default = "Purple",
	Options = {"Purple", "Blue", "Red", "Green"},
	Flag = "Settings_AccentColor",
	Callback = function(v) print("Accent Color:", v) end
})

CreateSlider(Settings, {
	Name = "UI Scale",
	Default = 70,
	Minimum = 40,
	Maximum = 100,
	Flag = "Settings_UIScale",
	Callback = function(v) print("UI Scale:", v) end
})

CreateButton(Settings, {
	Name = "▣   Save Settings",
	Primary = true,
	Flag = "Settings_Save",
	Callback = function() print("Save settings") end
})

CreateButton(Settings, {
	Name = "⟳   Reset Settings",
	Primary = false,
	Flag = "Settings_Reset",
	Callback = function() print("Reset settings") end
})

--========================================================--
-- TAB SWITCHING
--========================================================--

local function SelectTab(name)

	for tabName, data in pairs(TabButtons) do

		local selected =
			tabName == name


		data.Button:SetAttribute(
			"Selected",
			selected
		)


		Tween(
			data.Button,
			{
				BackgroundColor3 =
					selected
					and C.Purple
					or C.Sidebar
			},
			0.15
		)


		Tween(
			data.Icon,
			{
				TextColor3 =
					selected
					and C.White
					or C.Muted
			},
			0.12
		)


		Tween(
			data.Name,
			{
				TextColor3 =
					selected
					and C.White
					or C.Muted
			},
			0.12
		)

	end


	for pageName, page in pairs(Pages) do

		page.Visible =
			pageName == name

	end


	local selectedPage = Pages[name]

	if selectedPage then

		selectedPage.CanvasPosition =
			Vector2.new(
				0,
				0
			)

	end

end


for name, data in pairs(TabButtons) do

	data.Button.Activated:Connect(function()

		SelectTab(name)

	end)

end


SelectTab("Dashboard")

--========================================================--
-- NOTIFICATIONS - SHOW LOADING, THEN WELCOME, THEN DISCORD
--========================================================--

-- Itago muna ang main window
Main.Visible = false

-- Loading notification (3 seconds)
NotifyInfo("Loading Sie Y Hub...", 3, function()
    -- After 3 seconds, ipakita ang main window
    Main.Visible = true
    
    -- Small delay bago lumabas ang welcome at discord
    task.delay(0.3, function()
        -- Welcome notification (3 seconds) - nasa itaas
        NotifySuccess("Welcome back, " .. Player.DisplayName .. "! 👋", 3)
        
        -- Discord notification (5 seconds) - nasa baba ng Welcome
        task.delay(0.5, function()
            NotifyInfo("Join our Discord: discord.gg/example", 5)
        end)
    end)
end)

--========================================================--
-- MAIN DRAG SYSTEM
--========================================================--

local DraggingMain = false

local DragStartMain

local MainStartPosition


Header.InputBegan:Connect(function(input)

	if
		input.UserInputType ==
			Enum.UserInputType.MouseButton1
		or
		input.UserInputType ==
			Enum.UserInputType.Touch
	then

		DraggingMain = true

		DragStartMain =
			input.Position

		MainStartPosition =
			Main.Position

	end

end)


UserInputService.InputChanged:Connect(function(input)

	if not DraggingMain then
		return
	end


	if
		input.UserInputType ==
			Enum.UserInputType.MouseMovement
		or
		input.UserInputType ==
			Enum.UserInputType.Touch
	then

		local delta =
			input.Position -
			DragStartMain


		Main.Position =
			UDim2.new(

				MainStartPosition.X.Scale,

				MainStartPosition.X.Offset
					+
					delta.X,

				MainStartPosition.Y.Scale,

				MainStartPosition.Y.Offset
					+
					delta.Y

			)

	end

end)


UserInputService.InputEnded:Connect(function(input)

	if
		input.UserInputType ==
			Enum.UserInputType.MouseButton1
		or
		input.UserInputType ==
			Enum.UserInputType.Touch
	then

		DraggingMain = false

	end

end)

--========================================================--
-- FLOATING MINIMIZED PILL
--========================================================--

local Floating = New("Frame", {

	AnchorPoint =
		Vector2.new(
			0.5,
			0.5
		),

	Position =
		UDim2.fromScale(
			0.5,
			0.5
		),

	Size =
		UDim2.fromOffset(
			240,
			58
		),

	BackgroundColor3 =
		Color3.fromRGB(
			5,
			4,
			9
		),

	BorderSizePixel = 0,

	Visible = false,

	ZIndex = 100

}, ScreenGui)

Round(
	Floating,
	29
)


--========================================================--
-- FLOATING BORDER
--========================================================--

local FloatingStroke = Stroke(
	Floating,
	Color3.fromRGB(
		220,
		55,
		255
	),
	2
)


--========================================================--
-- FLOATING TITLE
--========================================================--

local FloatingTitle = Text(
	Floating,
	"Sie Y Hub",
	21,
	C.White,
	Enum.Font.GothamBold
)

FloatingTitle.Position =
	UDim2.fromOffset(
		17,
		9
	)

FloatingTitle.Size =
	UDim2.fromOffset(
		145,
		24
	)

FloatingTitle.TextYAlignment =
	Enum.TextYAlignment.Center


--========================================================--
-- FLOATING GAME
--========================================================--

local FloatingGame = Text(
	Floating,
	"HAHAHAHA",
	12,
	Color3.fromRGB(
		180,
		153,
		205
	),
	Enum.Font.Gotham
)

FloatingGame.Position =
	UDim2.fromOffset(
		16,
		29
	)

FloatingGame.Size =
	UDim2.fromOffset(
		150,
		22
	)

FloatingGame.TextYAlignment =
	Enum.TextYAlignment.Center


--========================================================--
-- FLOATING RESTORE BUTTON
--========================================================--

local Restore = New("TextButton", {

	Position =
		UDim2.new(
			1,
			-86,
			0.5,
			-21
		),

	Size =
		UDim2.fromOffset(
			38,
			38
		),

	BackgroundColor3 =
		Color3.fromRGB(
			12,
			9,
			20
		),

	BorderSizePixel = 0,

	Text = "+",

	TextColor3 =
		Color3.fromRGB(
			210,
			105,
			255
		),

	TextSize = 24,

	Font =
		Enum.Font.GothamMedium,

	AutoButtonColor = false,

	ZIndex = 101

}, Floating)

Round(
	Restore,
	19
)


local RestoreStroke = Stroke(
	Restore,
	Color3.fromRGB(
		76,
		34,
		115
	),
	1
)


--========================================================--
-- FLOATING CLOSE BUTTON
--========================================================--

local FloatingClose = New("TextButton", {

	Position =
		UDim2.new(
			1,
			-43,
			0.5,
			-21
		),

	Size =
		UDim2.fromOffset(
			38,
			38
		),

	BackgroundColor3 =
		Color3.fromRGB(
			12,
			9,
			20
		),

	BorderSizePixel = 0,

	Text = "×",

	TextColor3 =
		Color3.fromRGB(
			210,
			105,
			255
		),

	TextSize = 24,

	Font =
		Enum.Font.GothamMedium,

	AutoButtonColor = false,

	ZIndex = 101

}, Floating)

Round(
	FloatingClose,
	19
)


local FloatingCloseStroke = Stroke(
	FloatingClose,
	Color3.fromRGB(
		76,
		34,
		115
	),
	1
)


--========================================================--
-- BUTTON HOVER
--========================================================--

Restore.MouseEnter:Connect(function()

	Tween(
		Restore,
		{
			BackgroundColor3 =
				Color3.fromRGB(
					18,
					13,
					29
				)
		},
		0.15
	)

end)


Restore.MouseLeave:Connect(function()

	Tween(
		Restore,
		{
			BackgroundColor3 =
				Color3.fromRGB(
					12,
					9,
					20
				)
		},
		0.15
	)

end)


FloatingClose.MouseEnter:Connect(function()

	Tween(
		FloatingClose,
		{
			BackgroundColor3 =
				Color3.fromRGB(
					18,
					13,
					29
				)
		},
		0.15
	)

end)


FloatingClose.MouseLeave:Connect(function()

	Tween(
		FloatingClose,
		{
			BackgroundColor3 =
				Color3.fromRGB(
					12,
					9,
					20
				)
		},
		0.15
	)

end)


--========================================================--
-- FLOATING POSITION MEMORY
--========================================================--

local FloatingLastPosition =
	UDim2.fromScale(
		0.5,
		0.5
	)


local HasFloatingPosition =
	false


--========================================================--
-- FLOATING DRAG
-- BODY ONLY
--========================================================--

local FloatingDragging = false

local FloatingDragStart

local FloatingStartPosition


Floating.InputBegan:Connect(function(input)

	if
		input.UserInputType ==
			Enum.UserInputType.MouseButton1
		or
		input.UserInputType ==
			Enum.UserInputType.Touch
	then

		local position =
			input.Position

		local restorePos =
			Restore.AbsolutePosition

		local restoreSize =
			Restore.AbsoluteSize

		local closePos =
			FloatingClose.AbsolutePosition

		local closeSize =
			FloatingClose.AbsoluteSize


		local insideRestore =
			position.X >= restorePos.X
			and
			position.X <=
				restorePos.X + restoreSize.X
			and
			position.Y >= restorePos.Y
			and
			position.Y <=
				restorePos.Y + restoreSize.Y


		local insideClose =
			position.X >= closePos.X
			and
			position.X <=
				closePos.X + closeSize.X
			and
			position.Y >= closePos.Y
			and
			position.Y <=
				closePos.Y + closeSize.Y


		if insideRestore or insideClose then
			return
		end


		FloatingDragging = true

		FloatingDragStart =
			input.Position

		FloatingStartPosition =
			Floating.Position

	end

end)


UserInputService.InputChanged:Connect(function(input)

	if not FloatingDragging then
		return
	end


	if
		input.UserInputType ==
			Enum.UserInputType.MouseMovement
		or
		input.UserInputType ==
			Enum.UserInputType.Touch
	then

		local delta =
			input.Position -
			FloatingDragStart


		Floating.Position =
			UDim2.new(

				FloatingStartPosition.X.Scale,

				FloatingStartPosition.X.Offset
					+
					delta.X,

				FloatingStartPosition.Y.Scale,

				FloatingStartPosition.Y.Offset
					+
					delta.Y

			)

	end

end)


UserInputService.InputEnded:Connect(function(input)

	if
		input.UserInputType ==
			Enum.UserInputType.MouseButton1
		or
		input.UserInputType ==
			Enum.UserInputType.Touch
	then

		if FloatingDragging then

			FloatingLastPosition =
				Floating.Position

			HasFloatingPosition =
				true

		end


		FloatingDragging = false

	end

end)


--========================================================--
-- RAINBOW BORDER
--========================================================--

local RainbowConnection

local function StartRainbow()

	if RainbowConnection then
		RainbowConnection:Disconnect()
	end


	RainbowConnection =
		RunService.RenderStepped:Connect(function()

			if
				not Floating
				or
				not Floating.Parent
			then

				return

			end


			local hue =
				(
					os.clock() * 0.18
				)
				% 1


			FloatingStroke.Color =
				Color3.fromHSV(
					hue,
					0.9,
					1
				)

		end)

end


StartRainbow()


--========================================================--
-- SAVE MAIN POSITION
--========================================================--

local SavedMainPosition =
	Main.Position


--========================================================--
-- MINIMIZE
--========================================================--

local Minimized = false


Minimize.Activated:Connect(function()

	if Minimized then
		return
	end


	Minimized = true


	SavedMainPosition =
		Main.Position


	if not HasFloatingPosition then

		FloatingLastPosition =
			Main.Position

		HasFloatingPosition =

			true

	end


	Floating.Position =
		FloatingLastPosition


	Floating.Visible = true


	Main.Visible = true


	Tween(
		Main,
		{
			Size =
				UDim2.fromOffset(
					0,
					0
				)
		},
		0.20
	)


	task.delay(
		0.22,
		function()

			if not Minimized then
				return
			end


			Main.Visible = false

		end
	)

end)


--========================================================--
-- RESTORE MAIN MENU
--========================================================--

local function RestoreMain()

	if not Minimized then
		return
	end


	Minimized = false


	Floating.Visible = false


	Main.Visible = true


	Main.Position =
		SavedMainPosition


	Main.Size =
		UDim2.fromOffset(
			0,
			0
		)


	Tween(
		Main,
		{
			Size =
				UDim2.fromOffset(
					BASE_WIDTH,
					BASE_HEIGHT
				)
		},
		0.22
	)

end


--========================================================--
-- "+" = SHOW MAIN MENU
--========================================================--

Restore.Activated:Connect(function()

	RestoreMain()

end)


--========================================================--
-- FLOATING × = EXIT
--========================================================--

FloatingClose.Activated:Connect(function()

	if RainbowConnection then

		RainbowConnection:Disconnect()

		RainbowConnection = nil

	end


	Tween(
		Floating,
		{
			Size =
				UDim2.fromOffset(
					240,
					0
				)
		},
		0.18
	)


	task.delay(
		0.20,
		function()

			if ScreenGui then
				ScreenGui:Destroy()
			end

		end
	)

end)


--========================================================--
-- MAIN MENU CLOSE
--========================================================--

Close.Activated:Connect(function()

	if RainbowConnection then

		RainbowConnection:Disconnect()

		RainbowConnection = nil

	end


	Tween(
		Main,
		{
			Size =
				UDim2.fromOffset(
					BASE_WIDTH,
					0
				)
		},
		0.22
	)


	task.delay(
		0.25,
		function()

			if ScreenGui then
				ScreenGui:Destroy()
			end

		end
	)

end)

--========================================================--
-- FINAL CANVAS REFRESH
--========================================================--

task.defer(function()

	task.wait(0.2)

	UpdateScale()


	for name, layout in pairs(
		PageLayouts
	) do

		local page = Pages[name]

		if page then

			page.CanvasSize =
				UDim2.new(
					0,
					0,
					0,
					layout.AbsoluteContentSize.Y
						+
						40
				)

		end

	end

end)

--========================================================--
-- END
--========================================================--
