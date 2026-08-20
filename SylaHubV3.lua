-- Syla Hub V3
-- UI foundation + legitimate client-side features
-- Intended for use in your own Roblox experience / Studio testing.

local Players = game:GetService("Players")
local TweenService = game:GetService("TweenService")

local player = Players.LocalPlayer
local playerGui = player:WaitForChild("PlayerGui")

-- Remove an older copy
local oldGui = playerGui:FindFirstChild("SylaHubV3")
if oldGui then
    oldGui:Destroy()
end

--// GUI
local gui = Instance.new("ScreenGui")
gui.Name = "SylaHubV3"
gui.ResetOnSpawn = false
gui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
gui.Parent = playerGui

--// Main window
local main = Instance.new("Frame")
main.Name = "Main"
main.Size = UDim2.fromOffset(520, 330)
main.Position = UDim2.new(0.5, -260, 0.5, -165)
main.BackgroundColor3 = Color3.fromRGB(25, 25, 32)
main.BorderSizePixel = 0
main.Parent = gui

local corner = Instance.new("UICorner")
corner.CornerRadius = UDim.new(0, 12)
corner.Parent = main

--// Title bar
local titleBar = Instance.new("Frame")
titleBar.Size = UDim2.new(1, 0, 0, 55)
titleBar.BackgroundColor3 = Color3.fromRGB(35, 35, 45)
titleBar.BorderSizePixel = 0
titleBar.Parent = main

local titleCorner = Instance.new("UICorner")
titleCorner.CornerRadius = UDim.new(0, 12)
titleCorner.Parent = titleBar

local title = Instance.new("TextLabel")
title.BackgroundTransparency = 1
title.Position = UDim2.fromOffset(18, 5)
title.Size = UDim2.new(1, -70, 0, 45)
title.Font = Enum.Font.GothamBold
title.Text = "Syla Hub V3"
title.TextColor3 = Color3.fromRGB(255, 255, 255)
title.TextSize = 22
title.TextXAlignment = Enum.TextXAlignment.Left
title.Parent = titleBar

--// Close button
local close = Instance.new("TextButton")
close.Size = UDim2.fromOffset(40, 40)
close.Position = UDim2.new(1, -47, 0, 7)
close.BackgroundColor3 = Color3.fromRGB(180, 55, 65)
close.Text = "×"
close.TextColor3 = Color3.fromRGB(255, 255, 255)
close.TextSize = 25
close.Font = Enum.Font.GothamBold
close.Parent = titleBar

local closeCorner = Instance.new("UICorner")
closeCorner.CornerRadius = UDim.new(0, 8)
closeCorner.Parent = close

close.MouseButton1Click:Connect(function()
    gui:Destroy()
end)

--// Sidebar
local sidebar = Instance.new("Frame")
sidebar.Size = UDim2.fromOffset(135, 265)
sidebar.Position = UDim2.fromOffset(10, 65)
sidebar.BackgroundColor3 = Color3.fromRGB(30, 30, 39)
sidebar.BorderSizePixel = 0
sidebar.Parent = main

local sidebarCorner = Instance.new("UICorner")
sidebarCorner.CornerRadius = UDim.new(0, 9)
sidebarCorner.Parent = sidebar

--// Content area
local content = Instance.new("Frame")
content.Size = UDim2.new(1, -165, 1, -75)
content.Position = UDim2.fromOffset(155, 65)
content.BackgroundTransparency = 1
content.Parent = main

local function clearContent()
    for _, child in ipairs(content:GetChildren()) do
        child:Destroy()
    end
end

local function makeLabel(text, position, size)
    local label = Instance.new("TextLabel")
    label.BackgroundTransparency = 1
    label.Position = position
    label.Size = size
    label.Font = Enum.Font.Gotham
    label.Text = text
    label.TextColor3 = Color3.fromRGB(225, 225, 230)
    label.TextSize = 15
    label.TextWrapped = true
    label.TextXAlignment = Enum.TextXAlignment.Left
    label.Parent = content
    return label
end

local function makeButton(text, y, callback)
    local button = Instance.new("TextButton")
    button.Size = UDim2.new(1, -20, 0, 42)
    button.Position = UDim2.fromOffset(10, y)
    button.BackgroundColor3 = Color3.fromRGB(45, 45, 58)
    button.BorderSizePixel = 0
    button.Font = Enum.Font.GothamSemibold
    button.Text = text
    button.TextColor3 = Color3.fromRGB(245, 245, 250)
    button.TextSize = 14
    button.Parent = sidebar

    local buttonCorner = Instance.new("UICorner")
    buttonCorner.CornerRadius = UDim.new(0, 7)
    buttonCorner.Parent = button

    button.MouseEnter:Connect(function()
        TweenService:Create(
            button,
            TweenInfo.new(0.15),
            {BackgroundColor3 = Color3.fromRGB(60, 60, 75)}
        ):Play()
    end)

    button.MouseLeave:Connect(function()
        TweenService:Create(
            button,
            TweenInfo.new(0.15),
            {BackgroundColor3 = Color3.fromRGB(45, 45, 58)}
        ):Play()
    end)

    button.MouseButton1Click:Connect(callback)

    return button
end

--// Home
local function showHome()
    clearContent()

    makeLabel(
        "Welcome to Syla Hub V3!",
        UDim2.fromOffset(10, 10),
        UDim2.new(1, -20, 0, 40)
    ).TextSize = 22

    makeLabel(
        "A simple hub UI for your Roblox experience.\nUse the tabs on the left to explore the available features.",
        UDim2.fromOffset(10, 55),
        UDim2.new(1, -20, 0, 70)
    )

    local playerName = makeLabel(
        "Player: " .. player.Name,
        UDim2.fromOffset(10, 135),
        UDim2.new(1, -20, 0, 30)
    )

    local placeInfo = makeLabel(
        "Place ID: " .. tostring(game.PlaceId),
        UDim2.fromOffset(10, 170),
        UDim2.new(1, -20, 0, 30)
    )

    makeLabel(
        "Syla Hub V3 • UI Edition",
        UDim2.fromOffset(10, 220),
        UDim2.new(1, -20, 0, 30)
    ).TextColor3 = Color3.fromRGB(170, 170, 180)
end

--// Player information
local function showPlayer()
    clearContent()

    makeLabel(
        "Player",
        UDim2.fromOffset(10, 10),
        UDim2.new(1, -20, 0, 40)
    ).TextSize = 22

    makeLabel(
        "Username: " .. player.Name ..
        "\nDisplay name: " .. player.DisplayName ..
        "\nUser ID: " .. tostring(player.UserId),
        UDim2.fromOffset(10, 60),
        UDim2.new(1, -20, 0, 100)
    )
end

--// Legitimate utility page
local function showUtilities()
    clearContent()

    makeLabel(
        "Utilities",
        UDim2.fromOffset(10, 10),
        UDim2.new(1, -20, 0, 40)
    ).TextSize = 22

    local status = makeLabel(
        "Ready.",
        UDim2.fromOffset(10, 55),
        UDim2.new(1, -20, 0, 40)
    )

    local refresh = Instance.new("TextButton")
    refresh.Size = UDim2.fromOffset(180, 42)
    refresh.Position = UDim2.fromOffset(10, 105)
    refresh.BackgroundColor3 = Color3.fromRGB(45, 45, 58)
    refresh.Text = "Refresh Player Info"
    refresh.TextColor3 = Color3.fromRGB(255, 255, 255)
    refresh.Font = Enum.Font.GothamSemibold
    refresh.TextSize = 14
    refresh.Parent = content

    local refreshCorner = Instance.new("UICorner")
    refreshCorner.CornerRadius = UDim.new(0, 7)
    refreshCorner.Parent = refresh

    refresh.MouseButton1Click:Connect(function()
        status.Text = "Player: " .. player.Name ..
            "\nHealth: " ..
            (player.Character and player.Character:FindFirstChildOfClass("Humanoid")
                and math.floor(player.Character:FindFirstChildOfClass("Humanoid").Health)
                or "N/A")

        task.delay(3, function()
            if status then
                status.Text = "Ready."
            end
        end)
    end)
end

--// Sidebar buttons
makeButton("Home", 10, showHome)
makeButton("Player", 60, showPlayer)
makeButton("Utilities", 110, showUtilities)

--// Dragging
local dragging = false
local dragStart
local startPosition

titleBar.InputBegan:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseButton1
        or input.UserInputType == Enum.UserInputType.Touch then

        dragging = true
        dragStart = input.Position
        startPosition = main.Position

        input.Changed:Connect(function()
            if input.UserInputState == Enum.UserInputState.End then
                dragging = false
            end
        end)
    end
end)

titleBar.InputChanged:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseMovement
        or input.UserInputType == Enum.UserInputType.Touch then

        dragStart = dragStart or input.Position
    end
end)

game:GetService("UserInputService").InputChanged:Connect(function(input)
    if dragging and (
        input.UserInputType == Enum.UserInputType.MouseMovement
        or input.UserInputType == Enum.UserInputType.Touch
    ) then

        local delta = input.Position - dragStart

        main.Position = UDim2.new(
            startPosition.X.Scale,
            startPosition.X.Offset + delta.X,
            startPosition.Y.Scale,
            startPosition.Y.Offset + delta.Y
        )
    end
end)

-- Start on Home
showHome()
button.Activated:Connect(function()
button.Activated:Connect(callback)
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local actionEvent = ReplicatedStorage:WaitForChild("SylaHubAction")

button.Activated:Connect(function()
    actionEvent:FireServer("RefreshPlayer")
end)
