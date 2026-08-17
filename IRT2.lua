local player = game.Players.LocalPlayer
local UIS = game:GetService("UserInputService")
local RunService = game:GetService("RunService")

local stages = workspace:WaitForChild("BoatStages"):WaitForChild("NormalStages")
local penguinEvent = workspace:WaitForChild("ChangeCharacter")
local goldEvent = workspace:WaitForChild("ClaimRiverResultsGold")

local MAX_STAGES = 10
local STAGE_DURATION = 2.6
local GOLD_COLLECT_RADIUS = 40
local GOD_MODE_ENABLED = true
local LOW_GRAVITY = 0

local originalGravity = workspace.Gravity
local farming = false
local russian = true
local rainbowThread = nil
local hintRainbowThread = nil

-- ==================== ScreenGui ====================
local gui = Instance.new("ScreenGui")
gui.Name = "GoldFarmGUI"
gui.ResetOnSpawn = false
gui.Parent = player:WaitForChild("PlayerGui")

-- ==================== Main Screen ====================
local MainFrame = Instance.new("Frame")
MainFrame.Name = "MainFrame"
MainFrame.Size = UDim2.new(0, 340, 0, 190)
MainFrame.Position = UDim2.new(0.5, -170, 0.4, 0)
MainFrame.BackgroundColor3 = Color3.fromRGB(35, 35, 35)
MainFrame.BorderSizePixel = 0
MainFrame.Active = true
MainFrame.Visible = true
MainFrame.Parent = gui

local TitleBar = Instance.new("TextButton")
TitleBar.Size = UDim2.new(1, 0, 0, 30)
TitleBar.Position = UDim2.new(0, 0, 0, 0)
TitleBar.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
TitleBar.Text = "Gold Farm  |  By: Error"
TitleBar.TextColor3 = Color3.fromRGB(255, 255, 255)
TitleBar.TextScaled = true
TitleBar.Font = Enum.Font.SourceSansBold
TitleBar.Parent = MainFrame

local CloseBtn = Instance.new("TextButton")
CloseBtn.Size = UDim2.new(0, 30, 0, 30)
CloseBtn.Position = UDim2.new(1, -30, 0, 0)
CloseBtn.BackgroundColor3 = Color3.fromRGB(200, 50, 50)
CloseBtn.Text = "X"
CloseBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
CloseBtn.TextScaled = true
CloseBtn.Parent = TitleBar

local langBtn = Instance.new("TextButton")
langBtn.Size = UDim2.new(0, 40, 0, 30)
langBtn.Position = UDim2.new(0, 10, 0, 40)
langBtn.BackgroundColor3 = Color3.fromRGB(100, 100, 255)
langBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
langBtn.TextScaled = true
langBtn.Text = "RU"
langBtn.Parent = MainFrame

local btn = Instance.new("TextButton")
btn.Size = UDim2.new(0, 230, 0, 40)
btn.Position = UDim2.new(0, 55, 0, 40)
btn.BackgroundColor3 = Color3.fromRGB(255, 100, 100)
btn.TextColor3 = Color3.fromRGB(255, 255, 255)
btn.TextScaled = true
btn.Text = "Afk Farm: OFF"
btn.Parent = MainFrame

local durationLabel = Instance.new("TextLabel")
durationLabel.Size = UDim2.new(0, 40, 0, 25)
durationLabel.Position = UDim2.new(0, 10, 0, 90)
durationLabel.BackgroundTransparency = 1
durationLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
durationLabel.TextScaled = true
durationLabel.Text = string.format("%.1f", STAGE_DURATION)
durationLabel.Parent = MainFrame

local minusBtn = Instance.new("TextButton")
minusBtn.Size = UDim2.new(0, 25, 0, 25)
minusBtn.Position = UDim2.new(0, 55, 0, 90)
minusBtn.BackgroundColor3 = Color3.fromRGB(200, 50, 50)
minusBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
minusBtn.TextScaled = true
minusBtn.Text = "-"
minusBtn.Parent = MainFrame

local plusBtn = Instance.new("TextButton")
plusBtn.Size = UDim2.new(0, 25, 0, 25)
plusBtn.Position = UDim2.new(0, 85, 0, 90)
plusBtn.BackgroundColor3 = Color3.fromRGB(50, 200, 50)
plusBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
plusBtn.TextScaled = true
plusBtn.Text = "+"
plusBtn.Parent = MainFrame

local speedHintLabel = Instance.new("TextLabel")
speedHintLabel.Size = UDim2.new(0, 120, 0, 25)
speedHintLabel.Position = UDim2.new(0, 115, 0, 90)
speedHintLabel.BackgroundTransparency = 1
speedHintLabel.TextColor3 = Color3.fromRGB(200, 200, 200)
speedHintLabel.TextScaled = true
speedHintLabel.Text = "0.5 is normal"
speedHintLabel.Parent = MainFrame

local resetHintLabel = Instance.new("TextLabel")
resetHintLabel.Size = UDim2.new(0, 320, 0, 20)
resetHintLabel.Position = UDim2.new(0, 10, 0, 118)
resetHintLabel.BackgroundTransparency = 1
resetHintLabel.TextColor3 = Color3.fromRGB(255, 255, 180)
resetHintLabel.TextScaled = true
resetHintLabel.Text = "if gold didn't reset, press + 2 times"
resetHintLabel.Parent = MainFrame

local fixBtn = Instance.new("TextButton")
fixBtn.Size = UDim2.new(0, 130, 0, 30)
fixBtn.Position = UDim2.new(0, 10, 0, 145)
fixBtn.BackgroundColor3 = Color3.fromRGB(255, 150, 50)
fixBtn.TextColor3 = Color3.fromRGB(0, 0, 0)
fixBtn.TextScaled = true
fixBtn.Font = Enum.Font.SourceSansBold
fixBtn.Text = "Fix Spawn"
fixBtn.Parent = MainFrame

-- version
local versionLabel = Instance.new("TextLabel")
versionLabel.Size = UDim2.new(0, 60, 0, 18)
versionLabel.Position = UDim2.new(1, -65, 1, -20)
versionLabel.BackgroundTransparency = 1
versionLabel.TextColor3 = Color3.fromRGB(150, 150, 150)   -- серый
versionLabel.TextScaled = true
versionLabel.Text = "Ver. 1.0"
versionLabel.Parent = MainFrame

local OpenButton = Instance.new("TextButton")
OpenButton.Size = UDim2.new(0, 40, 0, 40)
OpenButton.Position = UDim2.new(0, 10, 1, -50)
OpenButton.BackgroundColor3 = Color3.fromRGB(255, 200, 0)
OpenButton.TextColor3 = Color3.fromRGB(0, 0, 0)
OpenButton.TextScaled = true
OpenButton.Text = "G"
OpenButton.Visible = false
OpenButton.Parent = gui

local hintLabel = Instance.new("TextLabel")
hintLabel.Size = UDim2.new(0, 300, 0, 40)
hintLabel.Position = UDim2.new(0.5, -150, 0, 10)
hintLabel.BackgroundTransparency = 1
hintLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
hintLabel.TextScaled = true
hintLabel.Text = "To Open Press G"
hintLabel.Visible = false
hintLabel.Parent = gui

-- ==================== other screen things ====================
local isDragging = false
local dragStartPos = Vector2.new()
local frameStartPos = nil

TitleBar.MouseButton1Down:Connect(function()
    if not MainFrame.Visible then return end
    isDragging = true
    dragStartPos = UIS:GetMouseLocation()
    frameStartPos = MainFrame.Position
end)

TitleBar.MouseButton1Up:Connect(function()
    isDragging = false
end)

UIS.InputChanged:Connect(function(input)
    if isDragging and input.UserInputType == Enum.UserInputType.MouseMovement then
        local delta = UIS:GetMouseLocation() - dragStartPos
        MainFrame.Position = UDim2.new(
            frameStartPos.X.Scale,
            frameStartPos.X.Offset + delta.X,
            frameStartPos.Y.Scale,
            frameStartPos.Y.Offset + delta.Y
        )
    end
end)

UIS.InputEnded:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseButton1 then
        isDragging = false
    end
end)

-- ==================== logic ====================
local function updateUI()
    if russian then
        TitleBar.Text = "Фарм Золота  |  От: IRT"
        if farming then
            btn.Text = "Афк Фарм: ВКЛ"
        else
            btn.Text = "Афк Фарм: ВЫКЛ"
            btn.BackgroundColor3 = Color3.fromRGB(255, 100, 100)
        end
        langBtn.Text = "EN"
        speedHintLabel.Text = "2.6 норм"
        hintLabel.Text = "Чтобы открыть нажми G"
        resetHintLabel.Text = ""
        fixBtn.Text = "РЕСПАВН"
    else
        TitleBar.Text = "Gold Farm  |  By: IRT"
        if farming then
            btn.Text = "Afk Farm: ON"
        else
            btn.Text = "Afk Farm: OFF"
            btn.BackgroundColor3 = Color3.fromRGB(255, 100, 100)
        end
        langBtn.Text = "RU"
        speedHintLabel.Text = "2.6 is normal"
        hintLabel.Text = "To Open Press G"
        resetHintLabel.Text = ""
        fixBtn.Text = "respawn"
    end
    durationLabel.Text = string.format("%.1f", STAGE_DURATION)
end

langBtn.MouseButton1Click:Connect(function()
    russian = not russian
    updateUI()
end)

minusBtn.MouseButton1Click:Connect(function()
    STAGE_DURATION = math.max(0.1, STAGE_DURATION - 0.1)
    updateUI()
end)

plusBtn.MouseButton1Click:Connect(function()
    STAGE_DURATION = math.min(5.0, STAGE_DURATION + 0.1)
    updateUI()
end)

-- Fix Spawn
fixBtn.MouseButton1Click:Connect(function()
    local char = player.Character
    if char and char:FindFirstChild("Humanoid") then
        pcall(function()
            char.Humanoid.MaxHealth = 100
            char.Humanoid.Health = 0
        end)
        if char:FindFirstChild("HumanoidRootPart") and char.Humanoid.Health > 0 then
            pcall(function() char:BreakJoints() end)
        end
        if farming then
            workspace.Gravity = originalGravity
        end
    end
end)

local function startRainbow()
    local hue = 0
    while farming do
        local color = Color3.fromHSV(hue % 1, 1, 1)
        btn.BackgroundColor3 = color
        hue = hue + 0.01
        task.wait(0.05)
    end
end

local function stopRainbow()
    if rainbowThread then
        pcall(function() coroutine.close(rainbowThread) end)
        rainbowThread = nil
    end
end

local function startHintRainbow()
    local hue = 0
    while hintLabel.Visible do
        local color = Color3.fromHSV(hue % 1, 1, 1)
        hintLabel.TextColor3 = color
        hue = hue + 0.01
        task.wait(0.05)
    end
end

local function stopHintRainbow()
    if hintRainbowThread then
        pcall(function() coroutine.close(hintRainbowThread) end)
        hintRainbowThread = nil
    end
end

local function isAlive(char)
    return char and char:FindFirstChild("Humanoid") and char.Humanoid.Health > 0
end

local function applyGodMode(char)
    if not GOD_MODE_ENABLED then return end
    local hum = char and char:FindFirstChild("Humanoid")
    if hum then
        pcall(function()
            hum.MaxHealth = 1e9
            hum.Health = 1e9
        end)
    end
end

local function collectGoldNearby(char)
    if not isAlive(char) then return end
    local hrp = char:FindFirstChild("HumanoidRootPart")
    if not hrp then return end

    local goldNames = {"gold", "goldnugget", "coin", "money", "ingot", "goldpiece"}
    local function isGoldPart(p)
        if not p:IsA("BasePart") then return false end
        local n = p.Name:lower()
        for _, kw in ipairs(goldNames) do
            if n:find(kw) then return true end
        end
        if p.Parent and p.Parent ~= workspace then
            local pn = p.Parent.Name:lower()
            for _, kw in ipairs(goldNames) do
                if pn:find(kw) then return true end
            end
        end
        return false
    end

    for _, part in ipairs(workspace:GetDescendants()) do
        if isGoldPart(part) and (part.Position - hrp.Position).Magnitude <= GOLD_COLLECT_RADIUS then
            pcall(function()
                firetouchinterest(hrp, part, 0)
                firetouchinterest(hrp, part, 1)
            end)
        end
    end

    local statueNames = {"gold", "statue", "treasure", "chest"}
    for _, obj in ipairs(workspace:GetDescendants()) do
        if obj:IsA("ClickDetector") then
            local parent = obj.Parent
            if parent and parent:IsA("BasePart") then
                local n = parent.Name:lower()
                for _, kw in ipairs(statueNames) do
                    if n:find(kw) and (parent.Position - hrp.Position).Magnitude <= GOLD_COLLECT_RADIUS then
                        pcall(function() fireclickdetector(obj, 50) end)
                        break
                    end
                end
            end
        end
    end
end

local function farmLoop()
    while farming do
        repeat task.wait(0.1) until not farming or (player.Character and isAlive(player.Character))
        if not farming then break end

        local char = player.Character
        applyGodMode(char)

        for i = 1, MAX_STAGES do
            if not farming then break end

            local success = false
            repeat
                if not isAlive(player.Character) then
                    repeat task.wait(0.1) until not farming or isAlive(player.Character)
                    if not farming then break end
                    char = player.Character
                    applyGodMode(char)
                end

                local stageName = "CaveStage"..i
                local darknessPart = stages:FindFirstChild(stageName) and stages[stageName]:FindFirstChild("DarknessPart")

                if not darknessPart then
                    task.wait(0.5)
                    continue
                end

                char.HumanoidRootPart.CFrame = darknessPart.CFrame
                task.wait(0.05)

                if isAlive(char) then
                    collectGoldNearby(char)
                end

                local startTime = tick()
                while (tick() - startTime) < STAGE_DURATION and farming do
                    if not isAlive(player.Character) then break end
                    task.wait(0.05)
                end

                if isAlive(player.Character) then
                    success = true
                end
            until success or not farming

            if farming and success and isAlive(player.Character) then
                pcall(function() goldEvent:FireServer() end)
            end
        end

        if farming then
            char = player.Character
            if char and isAlive(char) then
                char.Humanoid.Health = 0
            end
            repeat task.wait(0.1) until not farming or isAlive(player.Character)
        end
    end
end

local function stopFarmSafe()
    if farming then
        farming = false
        updateUI()
        workspace.Gravity = originalGravity
        stopRainbow()
        btn.BackgroundColor3 = Color3.fromRGB(255, 100, 100)
    end
end

local function closeWindow()
    stopFarmSafe()
    MainFrame.Visible = false
    OpenButton.Visible = true
    hintLabel.Visible = true
    stopHintRainbow()
    hintRainbowThread = coroutine.create(startHintRainbow)
    coroutine.resume(hintRainbowThread)
end

local function openWindow()
    MainFrame.Visible = true
    OpenButton.Visible = false
    hintLabel.Visible = false
    stopHintRainbow()
end

CloseBtn.MouseButton1Click:Connect(closeWindow)
OpenButton.MouseButton1Click:Connect(openWindow)

UIS.InputBegan:Connect(function(input, gameProcessed)
    if gameProcessed then return end
    if input.KeyCode == Enum.KeyCode.G then
        if not MainFrame.Visible then
            openWindow()
        end
    end
end)

btn.MouseButton1Click:Connect(function()
    if not farming then
        farming = true
        updateUI()
        workspace.Gravity = LOW_GRAVITY
        task.spawn(farmLoop)
        rainbowThread = coroutine.create(startRainbow)
        coroutine.resume(rainbowThread)
    else
        farming = false
        updateUI()
        workspace.Gravity = originalGravity
        stopRainbow()
        btn.BackgroundColor3 = Color3.fromRGB(255, 100, 100)
        if player.Character and player.Character:FindFirstChild("Humanoid") then
            player.Character.Humanoid.Health = 0
        end
    end
end)

player.CharacterAdded:Connect(function(char) end)
updateUI()