-- Checkpoint 1
local function showDiagnostic(text)
    local player = game:GetService("Players").LocalPlayer
    local gui = player:WaitForChild("PlayerGui")

    local screen = Instance.new("ScreenGui")
    screen.Name = "SylaDiagnostic"
    screen.ResetOnSpawn = false
    screen.Parent = gui

    local label = Instance.new("TextLabel")
    label.Size = UDim2.new(0, 350, 0, 60)
    label.Position = UDim2.new(0.5, -175, 0, 20)
    label.TextScaled = true
    label.Text = text
    label.Parent = screen
end

showDiagnostic("SYLA CHECKPOINT 1")
warn("SYLA CHECKPOINT 2")
warn("SYLA CHECKPOINT 3")
Status: Ready
local function showFeatures()
    clearContent()

    local title = Instance.new("TextLabel")
    title.Parent = content
    title.Size = UDim2.new(1, -20, 0, 40)
    title.Position = UDim2.new(0, 10, 0, 10)
    title.BackgroundTransparency = 1
    title.Text = "⭐ Features"
    title.TextSize = 24
    title.Font = Enum.Font.GothamBold
    title.TextColor3 = Color3.fromRGB(255, 255, 255)
    title.TextXAlignment = Enum.TextXAlignment.Left

    local status = Instance.new("TextLabel")
    status.Parent = content
    status.Size = UDim2.new(1, -20, 0, 30)
    status.Position = UDim2.new(0, 10, 0, 55)
    status.BackgroundTransparency = 1
    status.Text = "Status: Ready"
    status.TextSize = 14
    status.Font = Enum.Font.Gotham
    status.TextColor3 = Color3.fromRGB(180, 180, 180)
    status.TextXAlignment = Enum.TextXAlignment.Left

    local function featureButton(text, callback)
        local button = Instance.new("TextButton")
        button.Parent = content
        button.Size = UDim2.new(1, -20, 0, 42)
        button.BackgroundColor3 = Color3.fromRGB(35, 35, 45)
        button.Text = text
        button.TextSize = 16
        button.Font = Enum.Font.GothamMedium
        button.TextColor3 = Color3.fromRGB(255, 255, 255)

        local corner = Instance.new("UICorner")
        corner.CornerRadius = UDim.new(0, 8)
        corner.Parent = button

        button.MouseButton1Click:Connect(callback)

        return button
    end

    featureButton("🔄 Refresh Player Info", function()
        showPlayer()
    end)

    featureButton("🧹 Clear UI", function()
        clearContent()
        status.Text = "Status: UI Cleared"
    end)
end
makeButton("Features", 160, showFeatures)
featureButton("♻️ Reset Character", function()
    local character = player.Character
    local humanoid = character and character:FindFirstChildOfClass("Humanoid")

    if humanoid then
        humanoid.Health = 0
    end
end)
featureButton("🏃 WalkSpeed 32", function()
    local character = player.Character
    local humanoid = character and character:FindFirstChildOfClass("Humanoid")

    if humanoid then
        humanoid.WalkSpeed = 32
    end
end)

featureButton("🦘 JumpPower 75", function()
    local character = player.Character
    local humanoid = character and character:FindFirstChildOfClass("Humanoid")

    if humanoid then
        humanoid.UseJumpPower = true
        humanoid.JumpPower = 75
    end
end)
featureButton("📍 Teleport to Spawn", function()
    local character = player.Character
    local root = character and character:FindFirstChild("HumanoidRootPart")
    local spawn = workspace:FindFirstChildOfClass("SpawnLocation")

    if root and spawn then
        root.CFrame = spawn.CFrame + Vector3.new(0, 3, 0)
    end
end)
local animationsEnabled = true

featureButton("✨ Animations: ON", function()
    animationsEnabled = not animationsEnabled

    if animationsEnabled then
        -- Enable animations
    else
        -- Disable animations
    end
end)
featureButton("✨ Animations: ON", function()
    -- Toggle your existing UI animations here
end)

featureButton("🔔 Notifications: ON", function()
    -- Toggle notifications here
end)

featureButton("🧹 Reset Settings", function()
    -- Restore default settings
end)
local animationsEnabled = true
local notificationsEnabled = true
local mobileModeEnabled = true

local function showSettings()
    clearContent()

    featureButton("✨ Animations: " .. (animationsEnabled and "ON" or "OFF"), function()
        animationsEnabled = not animationsEnabled
        showSettings()
    end)

    featureButton("🔔 Notifications: " .. (notificationsEnabled and "ON" or "OFF"), function()
        notificationsEnabled = not notificationsEnabled
        showSettings()
    end)

    featureButton("📱 Mobile Mode: " .. (mobileModeEnabled and "ON" or "OFF"), function()
        mobileModeEnabled = not mobileModeEnabled
        showSettings()
    end)

    featureButton("🎨 UI Transparency", function()
        -- Add transparency selector here
    end)

    featureButton("🔄 Reset Settings", function()
        animationsEnabled = true
        notificationsEnabled = true
        mobileModeEnabled = true
        showSettings()
    end)
end
-- Settings
local animationsEnabled = true
local notificationsEnabled = true
local mobileModeEnabled = true
local transparencyLevel = 0

local function applyTransparency()
    -- Change these to the actual UI objects in your hub if needed
    showSettings()
        mainFrame.BackgroundTransparency = transparencyLevel
    end
end

local function showSettings()
    clearContent()

    featureButton("✨ Animations: " .. (animationsEnabled and "ON" or "OFF"), function()
        animationsEnabled = not animationsEnabled
        showSettings()
    end)

    featureButton("🔔 Notifications: " .. (notificationsEnabled and "ON" or "OFF"), function()
        notificationsEnabled = not notificationsEnabled
        showSettings()
    end)

    featureButton("📱 Mobile Mode: " .. (mobileModeEnabled and "ON" or "OFF"), function()
        mobileModeEnabled = not mobileModeEnabled
        showSettings()
    end)

    featureButton("🎨 UI Transparency", function()
        if transparencyLevel == 0 then
            transparencyLevel = 0.25
        elseif transparencyLevel == 0.25 then
            transparencyLevel = 0.5
        elseif transparencyLevel == 0.5 then
            transparencyLevel = 0.75
        else
            transparencyLevel = 0
        end

        applyTransparency()
        showSettings()
    end)

    featureButton("🔄 Reset Settings", function()
        animationsEnabled = true
        notificationsEnabled = true
        mobileModeEnabled = true
        transparencyLevel = 0

        applyTransparency()
        showSettings()
    end)
end
print("Syla Hub V3: script started")
print("Syla Hub V3: creating loading UI")
