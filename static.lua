--[[
    ----------------------------------------------------
    STATIC HUB: RED & BLACK EDITION
    ----------------------------------------------------
]]

-- // --- WHITELIST CONFIGURATION --- // --
local whitelist = {
    "aggich5", 
    "khohoi6", 
    "NGRTAIM", 
    "Can19985",
    "themortnaskid2", 
    "PowerOFLukad", 
    "PowerOFLukad", 
    "PowerOFLukad", 
    "PowerOFLukad", 
    "PowerOFLukad", 
    "PowerOFLukad", 
    "PowerOFLukad", 
    "PowerOFLukad", 
    "PowerOFLukad", 
    "PowerOFLukad", 
    "PowerOFLukad", 
    "PowerOFLukad", 
    "PowerOFLukad", 
    "PowerOFLukad", 
    "PowerOFLukad", 
    "PowerOFLukad", 
    "PowerOFLukad", 
    "PowerOFLukad", 
    "PowerOFLukad", 
    "PowerOFLukad", 
    "PowerOFLukad", 
    "PowerOFLukad", 
    "PowerOFLukad", 
    "PowerOFLukad", 
    "PowerOFLukad", 
    
    -- Füge hier weitere hinzu
}

-- // --- WHITELIST LOGIC --- // --
local Players = game:GetService("Players")
local TweenService = game:GetService("TweenService")
local LocalPlayer = Players.LocalPlayer

local function checkWhitelist()
    local isWhitelisted = false
    for _, name in ipairs(whitelist) do
        if string.lower(LocalPlayer.Name) == string.lower(name) then
            isWhitelisted = true
            break
        end
    end
    return isWhitelisted
end

if not checkWhitelist() then
    LocalPlayer:Kick("⛔ You are not whitelisted for STATIC! ⛔")
    return 
end

task.spawn(function()
    local sg = Instance.new("ScreenGui")
    sg.Name = "WhitelistNotify"
    sg.ResetOnSpawn = false
    sg.Parent = LocalPlayer:WaitForChild("PlayerGui")

    local frame = Instance.new("Frame")
    frame.Name = "MainFrame"
    frame.Size = UDim2.new(0, 220, 0, 60)
    frame.Position = UDim2.new(1, 10, 1, -70)
    frame.BackgroundColor3 = Color3.fromRGB(0, 0, 0) -- STATIC SCHWARZ
    frame.BorderSizePixel = 0
    frame.Parent = sg

    local corner = Instance.new("UICorner")
    corner.CornerRadius = UDim.new(0, 10)
    corner.Parent = frame

    local stroke = Instance.new("UIStroke")
    stroke.Color = Color3.fromRGB(255, 0, 0) -- STATIC ROT
    stroke.Thickness = 2
    stroke.Parent = frame

    local label = Instance.new("TextLabel")
    label.Size = UDim2.new(1, 0, 1, 0)
    label.BackgroundTransparency = 1
    label.Text = "STATIC Whitelist success!"
    label.TextColor3 = Color3.fromRGB(255, 255, 255)
    label.TextSize = 16
    label.Font = Enum.Font.GothamBold
    label.Parent = frame

    local tweenIn = TweenService:Create(frame, TweenInfo.new(0.8, Enum.EasingStyle.Quint, Enum.EasingDirection.Out), {
        Position = UDim2.new(1, -230, 1, -70)
    })
    tweenIn:Play()

    task.wait(4)
    local tweenOut = TweenService:Create(frame, TweenInfo.new(0.8, Enum.EasingStyle.Quint, Enum.EasingDirection.In), {
        Position = UDim2.new(1, 10, 1, -70)
    })
    tweenOut:Play()
    tweenOut.Completed:Connect(function() sg:Destroy() end)
end)

-- // --- MAIN CODE START --- // --
local UserInputService = game:GetService("UserInputService")
local RunService = game:GetService("RunService")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local HttpService = game:GetService("HttpService")
local CoreGui = game:GetService("CoreGui")
local Workspace = game:GetService("Workspace")

local PlayerGui = LocalPlayer:WaitForChild("PlayerGui")
local AnimalsData = require(ReplicatedStorage:WaitForChild("Datas"):WaitForChild("Animals"))

local SETTINGS_FILE = "Static_Settings.json"
local CONFIG = {
    AUTO_STEAL_NEAREST = false,
    SPEED_HACK_TOGGLE = false,
    FRIENDS_ALLOWED = false 
}

local function LoadSettings()
    if isfile and isfile(SETTINGS_FILE) then
        local success, data = pcall(function() return HttpService:JSONDecode(readfile(SETTINGS_FILE)) end)
        if success and type(data) == "table" then
            for k, v in pairs(data) do CONFIG[k] = v end
        end
    end
end

local function SaveSettings()
    if writefile then writefile(SETTINGS_FILE, HttpService:JSONEncode(CONFIG)) end
end

LoadSettings()

local WAYPOINT_1 = CFrame.new(-410.89, -6.11, 28.41)
local WAYPOINT_2 = CFrame.new(-408.59, -6.11, 119.49)
local WAYPOINT_3 = CFrame.new(-334.84, -4.65, 101.08)
local FINAL_DESTINATION = CFrame.new(-351.00, -7.30, 77.00) 

local isExecutingSequence = false
local canUseSpeedNow = true 

local BOOSTED_WALK_SPEED = 22 
local VELOCITY_MULT = 1.20

local Config = {
    StrokeThickness = 2,
    ESPColor = Color3.fromRGB(255, 0, 0), -- STATIC ROT
    BTNSColor = Color3.fromRGB(200, 0, 0),
    AnimDisable = false
}

local FFlags = {
    DisableDPIScale = "True", S2PhysicsSenderRate = "15000", AngularVelociryLimit = "360",
    StreamJobNOUVolumeCap = "2147483647", GameNetDontSendRedundantDeltaPositionMillionth = "1",
    TimestepArbiterOmegaThou = "1073741823", MaxMissedWorldStepsRemembered = "-2147483648",
    GameNetPVHeaderRotationalVelocityZeroCutoffExponent = "-5000", PhysicsSenderMaxBandwidthBps = "20000",
    LargeReplicatorEnabled9 = "True", CheckPVLinearVelocityIntegrateVsDeltaPositionThresholdPercent = "1",
    TimestepArbiterHumanoidTurningVelThreshold = "1", MaxTimestepMultiplierAcceleration = "2147483647",
    SimOwnedNOUCountThresholdMillionth = "2147483647", SimExplicitlyCappedTimestepMultiplier = "2147483646",
    TimestepArbiterVelocityCriteriaThresholdTwoDt = "2147483646", CheckPVCachedVelThresholdPercent = "10",
    ReplicationFocusNouExtentsSizeCutoffForPauseStuds = "2147483647", InterpolationFramePositionThresholdMillionth = "5",
    DebugSendDistInSteps = "-2147483648", LargeReplicatorEnabled9 = "True",
    CheckPVDifferencesForInterpolationMinRotVelThresholdRadsPerSecHundredth = "1", LargeReplicatorWrite5 = "True",
    NextGenReplicatorEnabledWrite4 = "True", MaxTimestepMultiplierContstraint = "2147483647",
    MaxTimestepMultiplierBuoyancy = "2147483647", MaxDataPacketPerSend = "2147483647", LargeReplicatorRead5 = "True",
    CheckPVDifferencesForInterpolationMinVelThresholdStudsPerSecHundredth = "1", TimestepArbiterHumanoidLinearVelThreshold = "1",
    WorldStepMax = "30", InterpolationFrameVelocityThresholdMillionth = "5", LargeReplicatorSerializeRead3 = "True",
    GameNetPVHeaderLinearVelocityZeroCutoffExponent = "-5000", CheckPVCachedRotVelThresholdPercent = "10",
}

local animDisableConn = nil
local originalAnimIds = {}
local animateScript = nil
local ANIM_TYPES = {"walk", "run", "jump", "fall", "idle", "toolnone"}
local ESPFolder = Instance.new("Folder")
ESPFolder.Name = "StaticESPFolder"
ESPFolder.Parent = workspace
local fakePosESP = nil
local serverPosition = nil

local function cacheOriginalAnimations()
    local char = LocalPlayer.Character
    if not char then return false end
    animateScript = char:FindFirstChild("Animate")
    if not animateScript then return false end
    originalAnimIds = {}
    for _, animType in ipairs(ANIM_TYPES) do
        local animFolder = animateScript:FindFirstChild(animType)
        if animFolder then
            originalAnimIds[animType] = {}
            for _, anim in ipairs(animFolder:GetChildren()) do
                if anim:IsA("Animation") then originalAnimIds[animType][anim.Name] = anim.AnimationId end
            end
        end
    end
    return true
end

local function disableAnimations()
    if not animateScript then return end
    for _, animType in ipairs(ANIM_TYPES) do
        local animFolder = animateScript:FindFirstChild(animType)
        if animFolder then
            for _, anim in ipairs(animFolder:GetChildren()) do
                if anim:IsA("Animation") then anim.AnimationId = "" end
            end
        end
    end
    local char = LocalPlayer.Character
    if char then
        local hum = char:FindFirstChildOfClass("Humanoid")
        if hum then for _, track in ipairs(hum:GetPlayingAnimationTracks()) do track:Stop(0) end end
    end
end

local function restoreAnimations()
    local char = LocalPlayer.Character
    if not char then return end
    animateScript = char:FindFirstChild("Animate")
    if not animateScript or not originalAnimIds then return end
    for animType, anims in pairs(originalAnimIds) do
        local animFolder = animateScript:FindFirstChild(animType)
        if animFolder then
            for animName, animId in pairs(anims) do
                local anim = animFolder:FindFirstChild(animName)
                if anim and anim:IsA("Animation") then anim.AnimationId = animId end
            end
        end
    end
end

local function toggleAnimLoop(state)
    if state then
        if not next(originalAnimIds) then cacheOriginalAnimations() end
        if animDisableConn then animDisableConn:Disconnect() end
        animDisableConn = RunService.Heartbeat:Connect(function() if Config.AnimDisable then disableAnimations() end end)
    else
        if animDisableConn then animDisableConn:Disconnect(); animDisableConn = nil end
        restoreAnimations()
    end
end

local function setFlags()
    for name, value in pairs(FFlags) do pcall(function() setfflag(tostring(name), tostring(value)) end) end
end

local function respawn(plr)
    local char = plr.Character
    local hum = char:FindFirstChildWhichIsA('Humanoid')
    if hum then hum:ChangeState(Enum.HumanoidStateType.Dead) end
    char:ClearAllChildren()
    local newChar = Instance.new('Model')
    newChar.Parent = workspace
    plr.Character = newChar
    task.wait()
    plr.Character = char
    newChar:Destroy()
end

function createESPVisual()
    local part = Instance.new("Part")
    part.Name = "ServerPosBox"; part.Size = Vector3.new(4, 6, 2); part.Transparency = 1; part.Anchored = true; part.CanCollide = false; part.Parent = ESPFolder
    local box = Instance.new("SelectionBox")
    box.Name = "Outline"; box.Adornee = part; box.Parent = part; box.Color3 = Config.ESPColor; box.LineThickness = 0.10; box.SurfaceTransparency = 0.85
    local bb = Instance.new("BillboardGui")
    bb.Parent = part; bb.Adornee = part; bb.Size = UDim2.new(0, 100, 0, 50); bb.AlwaysOnTop = true; bb.StudsOffset = Vector3.new(0, 4, 0)
    local text = Instance.new("TextLabel")
    text.Parent = bb; text.Size = UDim2.new(1, 0, 1, 0); text.BackgroundTransparency = 1; text.Text = "STATIC POSITION"; text.TextColor3 = Config.ESPColor; text.Font = Enum.Font.GothamBold; text.TextSize = 10
    return part
end

local function initializeESP()
    ESPFolder:ClearAllChildren()
    fakePosESP = createESPVisual()
    local char = LocalPlayer.Character
    if char then
        local hrp = char:FindFirstChild("HumanoidRootPart")
        if hrp then
            serverPosition = hrp.Position
            fakePosESP.CFrame = CFrame.new(serverPosition)
            hrp:GetPropertyChangedSignal("CFrame"):Connect(function() task.wait(0.2); serverPosition = hrp.Position end)
        end
    end
end

local function ExecuteDesync()
    setFlags()
    respawn(LocalPlayer)
    task.wait(5.1)
    initializeESP()
end

local allAnimalsCache = {}
local InternalStealCache = {}
local AUTO_STEAL_PROX_RADIUS = 100 
local IsStealing = false
local StealProgress = 0
local circleParts = {}
local PartsCount = 65
local PART_COLOR = Color3.fromRGB(255, 0, 0) -- STATIC ROT

local function getHRP()
    local char = LocalPlayer.Character
    return char and (char:FindFirstChild("HumanoidRootPart") or char:FindFirstChild("UpperTorso"))
end

local function isMyBase(plotName)
    local plot = workspace.Plots:FindFirstChild(plotName)
    if not plot then return false end
    local sign = plot:FindFirstChild("PlotSign")
    if sign then
        local yourBase = sign:FindFirstChild("YourBase")
        if yourBase and yourBase:IsA("BillboardGui") then return yourBase.Enabled == true end
    end
    return false
end

local function scanSinglePlot(plot)
    if not plot or not plot:IsA("Model") or isMyBase(plot.Name) then return end
    local podiums = plot:FindFirstChild("AnimalPodiums")
    if not podiums then return end
    for _, podium in ipairs(podiums:GetChildren()) do
        if podium:IsA("Model") and podium:FindFirstChild("Base") then
            local animalName = "Unknown"
            local spawn = podium.Base:FindFirstChild("Spawn")
            if spawn then
                for _, child in ipairs(spawn:GetChildren()) do
                    if child:IsA("Model") and child.Name ~= "PromptAttachment" then
                        animalName = child.Name
                        local animalInfo = AnimalsData[animalName]
                        if animalInfo and animalInfo.DisplayName then animalName = animalInfo.DisplayName end
                        break
                    end
                end
            end
            table.insert(allAnimalsCache, {
                name = animalName, plot = plot.Name, slot = podium.Name,
                worldPosition = podium:GetPivot().Position,
                uid = plot.Name .. "_" .. podium.Name,
            })
        end
    end
end

local function initializeScanner()
    task.wait(2)
    local plots = workspace:WaitForChild("Plots", 10)
    if not plots then return end
    for _, plot in ipairs(plots:GetChildren()) do scanSinglePlot(plot) end
    task.spawn(function()
        while task.wait(5) do
            allAnimalsCache = {}
            for _, plot in ipairs(plots:GetChildren()) do if plot:IsA("Model") then scanSinglePlot(plot) end end
        end
    end)
end

local function findProximityPromptForAnimal(animalData)
    local plot = workspace.Plots:FindFirstChild(animalData.plot)
    local podiums = plot and plot:FindFirstChild("AnimalPodiums")
    local podium = podiums and podiums:FindFirstChild(animalData.slot)
    local spawn = podium and podium.Base:FindFirstChild("Spawn")
    local attach = spawn and spawn:FindFirstChild("PromptAttachment")
    if attach then
        for _, p in ipairs(attach:GetChildren()) do if p:IsA("ProximityPrompt") then return p end end
    end
    return nil
end

local function buildStealCallbacks(prompt)
    if InternalStealCache[prompt] then return end
    local data = { holdCallbacks = {}, triggerCallbacks = {}, ready = true }
    local ok1, conns1 = pcall(getconnections, prompt.PromptButtonHoldBegan)
    if ok1 and type(conns1) == "table" then
        for _, conn in ipairs(conns1) do if type(conn.Function) == "function" then table.insert(data.holdCallbacks, conn.Function) end end
    end
    local ok2, conns2 = pcall(getconnections, prompt.Triggered)
    if ok2 and type(conns2) == "table" then
        for _, conn in ipairs(conns2) do if type(conn.Function) == "function" then table.insert(data.triggerCallbacks, conn.Function) end end
    end
    InternalStealCache[prompt] = data
end

local function executeInternalStealAsync(prompt)
    local data = InternalStealCache[prompt]
    if not data or not data.ready then return end
    data.ready = false; IsStealing = true
    task.spawn(function()
        for _, fn in ipairs(data.holdCallbacks) do task.spawn(fn) end
        local startTime = tick()
        while tick() - startTime < 1.3 do
            StealProgress = (tick() - startTime) / 1.3
            task.wait(0.05)
        end
        StealProgress = 1
        for _, fn in ipairs(data.triggerCallbacks) do task.spawn(fn) end
        task.wait(0.1); data.ready = true; task.wait(0.3); IsStealing = false; StealProgress = 0
    end)
end

-- // --- UI CONSTRUCTION (STATIC RED/BLACK) --- // --
local mainGui = Instance.new("ScreenGui", PlayerGui)
mainGui.Name = "StaticHubMain"
mainGui.ResetOnSpawn = false

local dragFrame = Instance.new("Frame", mainGui)
dragFrame.Size = UDim2.new(0, 220, 0, 340) 
dragFrame.Position = UDim2.new(0.5, -110, 0.5, -170)
dragFrame.BackgroundColor3 = Color3.fromRGB(0, 0, 0) -- STATIC SCHWARZ
dragFrame.BorderSizePixel = 0
Instance.new("UICorner", dragFrame).CornerRadius = UDim.new(0, 15)

local mainStroke = Instance.new("UIStroke", dragFrame)
mainStroke.Thickness = 2 
mainStroke.Color = Color3.fromRGB(255, 0, 0) -- STATIC ROT

local title = Instance.new("TextLabel", dragFrame)
title.Size = UDim2.new(1, 0, 0, 40); title.Text = "STATIC HUB"; title.Font = Enum.Font.GothamBold; title.TextColor3 = Color3.fromRGB(255, 0, 0); title.TextSize = 20; title.BackgroundTransparency = 1

local container = Instance.new("Frame", dragFrame)
container.Size = UDim2.new(0.9, 0, 0.75, 0); container.Position = UDim2.new(0.05, 0, 0.15, 0); container.BackgroundTransparency = 1
local layout = Instance.new("UIListLayout", container)
layout.Padding = UDim.new(0, 8); layout.HorizontalAlignment = Enum.HorizontalAlignment.Center

local function createBtn(txt, col)
    local b = Instance.new("TextButton", container)
    b.Size = UDim2.new(1, 0, 0, 32); b.BackgroundColor3 = col; b.Text = txt; b.Font = Enum.Font.GothamBold; b.TextColor3 = Color3.new(1,1,1); b.BorderSizePixel = 0
    b.TextSize = 12 
    Instance.new("UICorner", b).CornerRadius = UDim.new(0, 8)
    local bs = Instance.new("UIStroke", b); bs.Thickness = 1; bs.Color = Color3.fromRGB(255, 0, 0)
    return b
end

local grabButton = createBtn("INSTA GRAB: OFF", Color3.fromRGB(20, 20, 20))
local speedBtn = createBtn("SPEED HACK: OFF", Color3.fromRGB(20, 20, 20))
local friendsBtn = createBtn("FRIENDS: BLOCKED", Color3.fromRGB(20, 20, 20))
local startButton = createBtn("START TELEPORT (F)", Color3.fromRGB(60, 0, 0))
local desyncBtn = createBtn("INSTA DESYNC (K)", Color3.fromRGB(100, 0, 0)) 

local showbarFrame = Instance.new("Frame", dragFrame)
showbarFrame.Size = UDim2.new(0.9, 0, 0, 6); showbarFrame.Position = UDim2.new(0.05, 0, 0.90, 0); showbarFrame.BackgroundColor3 = Color3.fromRGB(20, 20, 20)
Instance.new("UICorner", showbarFrame)
local progressBarFill = Instance.new("Frame", showbarFrame)
progressBarFill.Size = UDim2.new(0, 0, 1, 0); progressBarFill.BackgroundColor3 = Color3.fromRGB(255, 0, 0); Instance.new("UICorner", progressBarFill)

local function updateUI()
    grabButton.Text = CONFIG.AUTO_STEAL_NEAREST and "INSTA GRAB: ON" or "INSTA GRAB: OFF"
    grabButton.BackgroundColor3 = CONFIG.AUTO_STEAL_NEAREST and Color3.fromRGB(150, 0, 0) or Color3.fromRGB(20, 20, 20)
    speedBtn.Text = CONFIG.SPEED_HACK_TOGGLE and "SPEED HACK: ON" or "SPEED HACK: OFF"
    speedBtn.BackgroundColor3 = CONFIG.SPEED_HACK_TOGGLE and Color3.fromRGB(150, 0, 0) or Color3.fromRGB(20, 20, 20)
    if CONFIG.FRIENDS_ALLOWED then
        friendsBtn.Text = "FRIENDS: ALLOWED"; friendsBtn.BackgroundColor3 = Color3.fromRGB(0, 50, 0); friendsBtn.TextColor3 = Color3.new(0, 1, 0)
    else
        friendsBtn.Text = "FRIENDS: BLOCKED"; friendsBtn.BackgroundColor3 = Color3.fromRGB(20, 20, 20); friendsBtn.TextColor3 = Color3.new(1, 1, 1)
    end
end

local function makeDraggable(gui)
    local dragging, dragInput, dragStart, startPos
    gui.InputBegan:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseButton1 then
            dragging = true; dragStart = input.Position; startPos = gui.Position
            input.Changed:Connect(function() if input.UserInputState == Enum.UserInputState.End then dragging = false end end)
        end
    end)
    UserInputService.InputChanged:Connect(function(input)
        if dragging and input.UserInputType == Enum.UserInputType.MouseMovement then
            local delta = input.Position - dragStart
            gui.Position = UDim2.new(startPos.X.Scale, startPos.X.Offset + delta.X, startPos.Y.Scale, startPos.Y.Offset + delta.Y)
        end
    end)
end
makeDraggable(dragFrame)

local function toggleFriends()
    CONFIG.FRIENDS_ALLOWED = not CONFIG.FRIENDS_ALLOWED
    SaveSettings(); updateUI()
    if CONFIG.FRIENDS_ALLOWED then
        for _, obj in pairs(workspace:GetDescendants()) do
            if obj:IsA("ProximityPrompt") and (obj.ObjectText .. obj.ActionText):lower():find("allow") then fireproximityprompt(obj) end
        end
    end
end

local function RunTeleportSequence()
    if isExecutingSequence then return end
    local hrp = getHRP()
    if not hrp then return end
    isExecutingSequence = true; canUseSpeedNow = false
    hrp.CFrame = WAYPOINT_1; task.wait(0.1); hrp.CFrame = WAYPOINT_2; task.wait(0.1); hrp.CFrame = WAYPOINT_3
    CONFIG.AUTO_STEAL_NEAREST = true; updateUI(); task.wait(1.3)
    hrp.CFrame = FINAL_DESTINATION; task.wait(0.2)
    CONFIG.AUTO_STEAL_NEAREST = false; updateUI(); isExecutingSequence = false; canUseSpeedNow = true
end

grabButton.MouseButton1Click:Connect(function() CONFIG.AUTO_STEAL_NEAREST = not CONFIG.AUTO_STEAL_NEAREST; updateUI(); SaveSettings() end)
speedBtn.MouseButton1Click:Connect(function() CONFIG.SPEED_HACK_TOGGLE = not CONFIG.SPEED_HACK_TOGGLE; updateUI(); SaveSettings() end)
friendsBtn.MouseButton1Click:Connect(toggleFriends)
startButton.MouseButton1Click:Connect(RunTeleportSequence)
desyncBtn.MouseButton1Click:Connect(ExecuteDesync)

RunService.RenderStepped:Connect(function()
    progressBarFill.Size = IsStealing and UDim2.new(StealProgress, 0, 1, 0) or UDim2.new(0, 0, 1, 0)
    local hrp = getHRP()
    if hrp and #circleParts > 0 then
        for i, part in ipairs(circleParts) do
            local angle = math.rad(i * 360 / PartsCount)
            local pos = hrp.Position + Vector3.new(math.cos(angle) * AUTO_STEAL_PROX_RADIUS, -2.5, math.sin(angle) * AUTO_STEAL_PROX_RADIUS)
            part.CFrame = CFrame.new(pos, hrp.Position)
        end
    end
    if fakePosESP and serverPosition then fakePosESP.CFrame = fakePosESP.CFrame:Lerp(CFrame.new(serverPosition), 0.2) end
end)

RunService.Heartbeat:Connect(function()
    if CONFIG.SPEED_HACK_TOGGLE and canUseSpeedNow then
        local char = LocalPlayer.Character
        local hrp = char and char:FindFirstChild("HumanoidRootPart")
        local hum = char and char:FindFirstChildOfClass("Humanoid")
        if hrp and hum and hum.MoveDirection.Magnitude > 0 then
            hrp.Velocity = Vector3.new(hum.MoveDirection.X * BOOSTED_WALK_SPEED * VELOCITY_MULT, hrp.Velocity.Y, hum.MoveDirection.Z * BOOSTED_WALK_SPEED * VELOCITY_MULT)
        end
    end
    if not CONFIG.AUTO_STEAL_NEAREST or IsStealing then return end
    local hrp = getHRP()
    if not hrp then return end
    local nearest, minDist = nil, math.huge
    for _, animalData in ipairs(allAnimalsCache) do
        local dist = (hrp.Position - animalData.worldPosition).Magnitude
        if dist < minDist and dist <= AUTO_STEAL_PROX_RADIUS then minDist = dist; nearest = animalData end
    end
    if nearest then
        local prompt = findProximityPromptForAnimal(nearest)
        if prompt then buildStealCallbacks(prompt); executeInternalStealAsync(prompt) end
    end
end)

UserInputService.InputBegan:Connect(function(input, gp)
    if gp then return end
    if input.KeyCode == Enum.KeyCode.K then ExecuteDesync()
    elseif input.KeyCode == Enum.KeyCode.F then RunTeleportSequence()
    elseif input.KeyCode == Enum.KeyCode.H then toggleFriends() end
end)

local function createCircle()
    for _, v in ipairs(circleParts) do v:Destroy() end
    circleParts = {}
    for i = 1, PartsCount do
        local p = Instance.new("Part", workspace)
        p.Anchored = true; p.CanCollide = false; p.Material = Enum.Material.Neon; p.Color = PART_COLOR; p.Transparency = 0.3
        p.Size = Vector3.new(1, 0.2, 0.3); table.insert(circleParts, p)
    end
end

initializeScanner()
createCircle()
updateUI()

local plotsFolder = workspace:FindFirstChild("Plots")
local baseEspInstances = {}
local function updateBaseESP()
    if not plotsFolder then return end
    for _, plot in ipairs(plotsFolder:GetChildren()) do
        local main = plot:FindFirstChild("Purchases") and plot.Purchases:FindFirstChild("PlotBlock") and plot.Purchases.PlotBlock:FindFirstChild("Main")
        local timeLabel = main and main:FindFirstChild("BillboardGui") and main.BillboardGui:FindFirstChild("RemainingTime")
        if timeLabel and main then
            local billboard = baseEspInstances[plot.Name] or Instance.new("BillboardGui", plot)
            billboard.Size = UDim2.new(0, 50, 0, 25); billboard.AlwaysOnTop = true; billboard.Adornee = main
            local label = billboard:FindFirstChildWhichIsA("TextLabel") or Instance.new("TextLabel", billboard)
            label.Size = UDim2.new(1, 0, 1, 0); label.BackgroundTransparency = 1; label.TextScaled = true; label.TextColor3 = Color3.fromRGB(255, 0, 0) -- ROTER TIMER
            label.Text = timeLabel.Text; baseEspInstances[plot.Name] = billboard
        end
    end
end
RunService.RenderStepped:Connect(updateBaseESP)
