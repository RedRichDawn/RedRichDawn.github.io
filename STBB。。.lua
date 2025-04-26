local Luna = loadstring(game:HttpGet("https://raw.githubusercontent.com/Nebula-Softworks/Luna-Interface-Suite/refs/heads/main/source.lua", true))()

local Window = Luna:CreateWindow({
	Name = "STBB:Subtitle", -- 窗口的标题
	Subtitle = nil, -- 窗口的副标题（灰色文字），这里没有设置
	LogoID = "82795327169782", -- 窗口的Logo图片ID，如果没有Logo可以设置为nil
	LoadingEnabled = true, -- 是否启用加载动画
	LoadingTitle = "STBB:Subtitle", -- 加载屏幕的标题
	LoadingSubtitle = "by Subtitle", -- 加载屏幕的副标题

	ConfigSettings = {
		RootFolder = nil, -- 根文件夹路径，如果不需要可以设置为nil
		ConfigFolder = "zm Hub" -- 配置文件存储的文件夹名称
	}
})

local Tab = Window:CreateTab({
	Name = "主要",
	Icon = "view_in_ar",
	ImageSource = "Material",
	ShowTitle = true
})

local Label = Tab:CreateLabel({
	Text = "点击左上角月亮图标展开侧边栏",
	Style = 2
})

local Button = Tab:CreateButton({
	Name = "UTC页",
	Description = nil,
    	Callback = function()
local Players = game:GetService("Players")
local LocalPlayer = Players.LocalPlayer
local PlayerGui = LocalPlayer:WaitForChild("PlayerGui")

local UpgradeCameraShop = PlayerGui:FindFirstChild("UpgradeCameraShop")
if UpgradeCameraShop then
    local TimerForCommand = PlayerGui:FindFirstChild("TimerForCommand")
    if TimerForCommand then
        UpgradeCameraShop.Parent = TimerForCommand
        print("UpgradeCameraShop has been moved to TimerForCommand")
    else
        warn("TimerForCommand not found in PlayerGui")
    end
else
    warn("UpgradeCameraShop not found in PlayerGui")
end

local ScreenGui = Instance.new("ScreenGui")
ScreenGui.Name = "ToggleGui"
ScreenGui.Parent = PlayerGui

local Button = Instance.new("TextButton")
Button.Name = "ToggleButton"
Button.Text = "UTC"
Button.Size = UDim2.new(0, 100, 0, 30)
Button.Position = UDim2.new(0.5, 340, 0.5, -200)
Button.BackgroundColor3 = Color3.new(0, 0, 1)
Button.Parent = ScreenGui

local isEnabled = false

local dragging = false
local dragStart = nil
local startPos = nil

Button.MouseButton1Click:Connect(function()
    isEnabled = not isEnabled

    local UpgradeCameraShop = PlayerGui.TimerForCommand:FindFirstChild("UpgradeCameraShop")
    if UpgradeCameraShop then
        UpgradeCameraShop.Enabled = isEnabled
    else
        warn("UpgradeCameraShop not found in PlayerGui.TimerForCommand")
    end

    Button.Text = isEnabled and "关闭" or "开启"
end)

Button.MouseButton1Down:Connect(function()
    dragging = true
    dragStart = Button.Position
    startPos = game:GetService("UserInputService"):GetMouseLocation()
end)

game:GetService("UserInputService").InputChanged:Connect(function(input)
    if dragging and input.UserInputType == Enum.UserInputType.MouseMovement then
        local delta = game:GetService("UserInputService"):GetMouseLocation() - startPos
        Button.Position = UDim2.new(dragStart.X.Scale, dragStart.X.Offset + delta.X, dragStart.Y.Scale, dragStart.Y.Offset + delta.Y)
    end
end)

game:GetService("UserInputService").InputEnded:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseButton1 then
        dragging = false
    end
end)
    end
})









local Button = Tab:CreateButton({
	Name = "重置人物",
	Description = nil,
    	Callback = function()
         		      		game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(152.35, -497.32, 394.21)
    end
})








local Button = Tab:CreateButton({
	Name = "有钱即无敌",
	Description = nil, 
    	Callback = function()
        local args = {
    [1] = "Buy",
    [2] = "FillHP"
}

while true do
    game:GetService("ReplicatedStorage"):WaitForChild("ShopSystem"):FireServer(unpack(args))
    wait()
end

    end
})








local Button = Tab:CreateButton({
	Name = "死亡激光",
	Description = nil,
    	Callback = function()
local function createButton()
    local button = Instance.new("TextButton")
    button.Text = "开始"
    button.Position = UDim2.new(0.5, 0, 1, -30)
    button.Size = UDim2.new(0, 50, 0, 25)
    button.Visible = true
    button.Font = Enum.Font.SourceSansBold
    button.TextSize = 18
    button.BackgroundColor3 = Color3.fromRGB(255, 0, 0)
    button.TextColor3 = Color3.fromRGB(255, 255, 255)

    local playerGui = game.Players.LocalPlayer:WaitForChild("PlayerGui")
    local screenGui = playerGui:FindFirstChild("ScreenGui")
    if not screenGui then
        screenGui = Instance.new("ScreenGui")
        screenGui.Name = "ScreenGui"
        screenGui.Parent = playerGui
    end

    button.Parent = screenGui
    return button
end

local button = createButton()
local isRunning = false
local isButtonDestroyed = false
local isPlayerDead = false

local args = {Vector3.new(-791.0179443359375, -516.5932006835938, 324.6893615722656)}

local function fireEvent()
    local event = game:GetService("ReplicatedStorage"):WaitForChild("VillanArcGasterBlaster")
    event:FireServer(unpack(args))
end

button.MouseButton1Click:Connect(function()
    if isButtonDestroyed or isPlayerDead then return end
    isRunning = not isRunning
    button.Text = isRunning and "停止" or "开始"
end)

button.Destroying:Connect(function()
    isButtonDestroyed = true
    isRunning = false
end)

local player = game.Players.LocalPlayer
local function onCharacterAdded(character)
    isPlayerDead = false
    character.Humanoid.Died:Connect(function()
        isPlayerDead = true
        isRunning = false
    end)
end

player.CharacterAdded:Connect(onCharacterAdded)
if player.Character then
    onCharacterAdded(player.Character)
end

while true do
    if isRunning and not isButtonDestroyed and not isPlayerDead then
        fireEvent()
    end
    wait(1 / 3000)
end


    end
})


local Button = Tab:CreateButton({
	Name = "监控博士",
	Description = nil,
    	Callback = function()
local Players = game:GetService("Players")
local LocalPlayer = Players.LocalPlayer
local PlayerGui = LocalPlayer:WaitForChild("PlayerGui")

-- 创建一个 ScreenGui 用于放置按钮
local ScreenGui = Instance.new("ScreenGui")
ScreenGui.Name = "SkillButtonsGui"
ScreenGui.Parent = PlayerGui

-- 创建按钮的函数
local function createButton(name, position, skillName)
    local Button = Instance.new("TextButton")
    Button.Name = name .. "Button"
    Button.Text = name
    Button.Size = UDim2.new(0, 40, 0, 40) -- 设置按钮为正方形，大小为 40x40 像素
    Button.Position = position
    Button.BackgroundColor3 = Color3.new(0, 0, 1) -- 设置按钮颜色为蓝色
    Button.TextColor3 = Color3.new(1, 1, 1) -- 设置文字颜色为白色
    Button.FontSize = Enum.FontSize.Size11 -- 设置文字大小为 11
    Button.Parent = ScreenGui

    -- 定义点击事件
    Button.MouseButton1Click:Connect(function()
        local args = {
            [1] = {
                [1] = skillName
            }
        }
        game:GetService("ReplicatedStorage"):WaitForChild("ScientistCameraSkills"):FireServer(unpack(args))
    end)
end

-- 创建“麻醉针”按钮
createButton("麻醉针", UDim2.new(0.5, 170, 0.5, -70), "StunNeedle")

-- 创建“踩踏”按钮
createButton("踩踏", UDim2.new(0.5, 170, 0.5, -30), "Stomp")

-- 创建“飞行”按钮
createButton("飞行", UDim2.new(0.5, 170, 0.5, 10), "Tackle")



    end
})



local Button = Tab:CreateButton({
	Name = "飞机商店",
	Description = nil,
    	Callback = function()
local Players = game:GetService("Players")
local LocalPlayer = Players.LocalPlayer
local PlayerGui = LocalPlayer:WaitForChild("PlayerGui")

-- 创建一个 ScreenGui 用于放置按钮
local ScreenGui = Instance.new("ScreenGui")
ScreenGui.Name = "ToggleGui"
ScreenGui.Parent = PlayerGui

-- 创建按钮
local Button = Instance.new("TextButton")
Button.Name = "ToggleButton"
Button.Text = "切换 003-A"
Button.Size = UDim2.new(0, 100, 0, 30) -- 缩小按钮大小
Button.Position = UDim2.new(0.5, 340, 0.5, -200) -- 调整按钮位置
Button.Parent = ScreenGui

-- 定义一个变量来存储当前状态
local isEnabled = false

-- 定义拖动功能所需的变量
local dragging = false
local dragStart = nil
local startPos = nil

-- 按钮点击事件
Button.MouseButton1Click:Connect(function()
    -- 切换状态
    isEnabled = not isEnabled

    -- 检查 PlayerGui 中是否存在 "003-A"
    if PlayerGui:FindFirstChild("003-A") then
        PlayerGui["003-A"].Enabled = isEnabled
    else
        warn("003-A not found in PlayerGui")
    end

    -- 更新按钮文本
    Button.Text = isEnabled and "关闭 003-A" or "开启 003-A"
end)

-- 按钮按下事件
Button.MouseButton1Down:Connect(function()
    dragging = true
    dragStart = Button.Position
    startPos = game:GetService("UserInputService"):GetMouseLocation()
end)

    end
})




local Button = Tab:CreateButton({
	Name = "准心调整",
	Description = nil,
    	Callback = function()
local Players = game:GetService("Players")
local LocalPlayer = Players.LocalPlayer
local PlayerGui = LocalPlayer:WaitForChild("PlayerGui")

-- 等待 ShiftLock 加载完成
local ShiftLock = PlayerGui:WaitForChild("ShiftLock")

-- 关闭 LockOnGuiEnabled
if ShiftLock:FindFirstChild("LockOnGuiEnabled") then
    ShiftLock.LockOnGuiEnabled.Value = false
else
    warn("LockOnGuiEnabled not found in ShiftLock")
end

-- 等待 Frame.MiddleIcon 加载完成
local MiddleIcon = ShiftLock.Frame:WaitForChild("MiddleIcon")

-- 修改 MiddleIcon 的大小和位置
MiddleIcon.Size = UDim2.new(0.0200000033, 0, 0.204999968, 0)
MiddleIcon.Position = UDim2.new(0.5, 0, 0.5, 0)  -- 调整到正中心


    end
})


local Button = Tab:CreateButton({
	Name = "无限子弹",
	Description = nil, 
    	Callback = function()
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Players = game:GetService("Players")
local LocalPlayer = Players.LocalPlayer

-- 定义购买弹药的函数
local function buyAmmo()
    local character = LocalPlayer.Character or LocalPlayer.CharacterAdded:Wait()
    local shotHarpoonGun = character:FindFirstChild("Shot Harpoon Gun")
    if not shotHarpoonGun then
        warn("没枪'")
        return
    end

    local args = {
        [1] = "Ammo",
        [2] = shotHarpoonGun
    }

    local shopSystem = ReplicatedStorage:WaitForChild("ShopSystem")
    if shopSystem then
        shopSystem:FireServer(unpack(args))
    else
        warn("ShopSystem RemoteEvent not found")
    end
end

-- 循环运行购买弹药的函数
while wait() do
    buyAmmo()
end


    end
})


local Button = Tab:CreateButton({
	Name = "传送最近马桶",
	Description = nil,
    	Callback = function()
-- Auto Farm for ST: Blockade Reboot
-- Bypasses Anti-Cheat, Instantly Teleports, and Attacks NPCs
-- WARNING: Use at your own risk!

local Library = loadstring(game:HttpGet("https://raw.githubusercontent.com/bloodball/-back-ups-for-libs/main/wizard"))()
local Window = Library:NewWindow("Auto Farm")
local Section = Window:NewSection("Options")

local autoFarmActive = false

Section:CreateToggle("Auto Farm", function(value)
    autoFarmActive = value
    if autoFarmActive then
        startAutoFarm()
    end
end)

function startAutoFarm()
    spawn(function()
        while autoFarmActive do
            pcall(function()
                local player = game.Players.LocalPlayer
                local char = player.Character or player.CharacterAdded:Wait()
                local hrp = char:FindFirstChild("HumanoidRootPart")
                
                if char and hrp then
                    local target = findClosestAliveNPC(5000, hrp)
                    
                    if target and target:FindFirstChild("HumanoidRootPart") then
                        -- Instant teleport directly above the NPC
                        hrp.CFrame = target.HumanoidRootPart.CFrame * CFrame.new(0, 3, 0)
                        attackNPC(target)
                    end
                end
            end)
            wait(0.05) -- Faster reaction time
        end
    end)
end

function attackNPC(npc)
    pcall(function()
        if npc and npc:FindFirstChild("Humanoid") and npc.Humanoid.Health > 0 then
            local tool = game.Players.LocalPlayer.Character:FindFirstChildOfClass("Tool")
            if tool then
                tool:Activate()
            end
        end
    end)
end

function findClosestAliveNPC(maxDistance, part)
    local lastDist = maxDistance
    local closest = nil

    for _, v in pairs(workspace:GetDescendants()) do
        if v:IsA("Model") and v:FindFirstChild("Humanoid") and v:FindFirstChild("HumanoidRootPart") then
            local hum = v:FindFirstChild("Humanoid")
            if hum and hum.Health > 0 and not game.Players:GetPlayerFromCharacter(v) then
                local thisDist = (v.HumanoidRootPart.Position - part.Position).Magnitude
                if thisDist < lastDist then
                    closest = v
                    lastDist = thisDist
                end
            end
        end
    end
    return closest
end

    end
})


local Button = Tab:CreateButton({
	Name = "无限暂停",
	Description = nil,
    	Callback = function()
while true do
    game:GetService("ReplicatedStorage"):WaitForChild("TimeStops"):FireServer()
    wait(1 / 3000)
end

    end
})





local Button = Tab:CreateButton({
    Name = "雷达检测",
    Description = nil,
    Callback = function()
        local espLabels = {} -- 用于存储ESP标签
        local detectedTransmitters = {} -- 用于记录已经检测到的Transmitter toilet对象

        -- 创建ESP标签的函数
        local function createESPLabelForTransmitter(transmitterToilet)
            if transmitterToilet and not espLabels[transmitterToilet] then
                -- 获取模型的PrimaryPart，如果没有则使用模型本身
                local adornee = transmitterToilet:FindFirstChildWhichIsA("BasePart") or transmitterToilet

                -- 创建一个BillboardGui来显示ESP文字
                local billboardGui = Instance.new("BillboardGui")
                billboardGui.Name = "ESPBillboard"
                billboardGui.Size = UDim2.new(0, 200, 0, 50)
                billboardGui.AlwaysOnTop = true
                billboardGui.Adornee = adornee
                billboardGui.Parent = game:GetService("CoreGui")

                -- 创建一个TextLabel来显示文字
                local textLabel = Instance.new("TextLabel")
                textLabel.Name = "ESPText"
                textLabel.Text = "雷达"
                textLabel.Font = Enum.Font.SourceSansBold
                textLabel.TextSize = 20
                textLabel.TextColor3 = Color3.new(1, 0, 0) -- 红色文字
                textLabel.BackgroundTransparency = 1
                textLabel.Size = UDim2.new(1, 0, 1, 0)
                textLabel.Parent = billboardGui

                espLabels[transmitterToilet] = billboardGui
            end
        end

        -- 检测所有Transmitter toilet并创建ESP标签
        local function checkTransmitterToilets()
            local livingFolder = workspace:FindFirstChild("Living")
            if livingFolder then
                local transmitterToilets = livingFolder:GetChildren()
                for _, transmitterToilet in ipairs(transmitterToilets) do
                    if transmitterToilet.Name == "Transmitter toilet" and not detectedTransmitters[transmitterToilet] then
                        -- 创建ESP标签
                        createESPLabelForTransmitter(transmitterToilet)
                        -- 触发通知
                        Luna:Notification({
                            Title = "雷达出现",
                            Icon = "dangerous",
                            ImageSource = "Material",
                            Content = "赶紧去清理，不然你死定了"
                        })
                        -- 记录已经检测到的Transmitter toilet对象
                        detectedTransmitters[transmitterToilet] = true
                    end
                end
            end

            -- 清理不存在的ESP标签
            for transmitterToilet, billboardGui in pairs(espLabels) do
                if not transmitterToilet.Parent then
                    billboardGui:Destroy()
                    espLabels[transmitterToilet] = nil
                    detectedTransmitters[transmitterToilet] = nil -- 从已检测对象中移除
                end
            end
        end

        -- 持续检测
        local function startChecking()
            while wait() do
                checkTransmitterToilets()
            end
        end

        startChecking()
    end
})



local Button = Tab:CreateButton({
    Name = "获取音响装甲",
    Description = nil,
    Callback = function()
game:GetService("ReplicatedStorage"):WaitForChild("ChangeToCinema"):FireServer()
    end
})




local Tab = Window:CreateTab({
	Name = "自动刷等级",
	Icon = "auto_awesome_motion",
	ImageSource = "Material",
	ShowTitle = true
})

local Label = Tab:CreateLabel({
	Text = "___",
	Style = 1
})

Tab:CreateSection("丧尸13波(zuttv没有出来之前)")
Tab:CreateSection("开启钱即无敌")
Tab:CreateSection("和下面这个")


local Button = Tab:CreateButton({
	Name = "四角传送(地面版本)",
	Description = nil,
    	Callback = function()
local Players = game:GetService("Players")
local LocalPlayer = Players.LocalPlayer
local PlayerGui = LocalPlayer:WaitForChild("PlayerGui")

-- 创建一个 ScreenGui 用于放置按钮
local ScreenGui = Instance.new("ScreenGui")
ScreenGui.Name = "TeleportControlGui"
ScreenGui.ResetOnSpawn = false
ScreenGui.Parent = PlayerGui

-- 创建按钮
local Button = Instance.new("TextButton")
Button.Name = "ToggleTeleportButton"
Button.Text = "开启传送"
Button.Size = UDim2.new(0, 120, 0, 30)
Button.Position = UDim2.new(0.5, -60, 0.5, -15)
Button.Font = Enum.Font.SourceSansBold
Button.TextSize = 18
Button.Parent = ScreenGui

-- 定义四个坐标
local positions = {
    Vector3.new(-53.27527618408203, 4.706789493560791, -24.541484832763672),
    Vector3.new(-40.269386291503906, 4.706789970397949, 27.70499038696289),
    Vector3.new(26.435800552368164, 4.706790924072266, 24.221435546875),
    Vector3.new(26.77167510986328, 4.706789970397949, -45.562496185302734)
}

-- 当前位置索引
local currentIndex = 1

-- 控制传送功能的开关
local isTeleporting = false

-- 传送函数
local function teleportToNextPosition()
    -- 获取下一个位置
    local nextIndex = currentIndex + 1
    if nextIndex > #positions then
        nextIndex = 1  -- 如果超出范围，回到第一个位置
    end
    currentIndex = nextIndex

    -- 传送玩家到下一个位置
    local Character = LocalPlayer.Character or LocalPlayer.CharacterAdded:Wait()
    local HumanoidRootPart = Character:WaitForChild("HumanoidRootPart")
    HumanoidRootPart.CFrame = CFrame.new(positions[currentIndex])
end

-- 按钮点击事件
Button.MouseButton1Click:Connect(function()
    isTeleporting = not isTeleporting
    Button.Text = isTeleporting and "关闭传送" or "开启传送"
end)

-- 每0.7秒传送一次，但可以通过按钮控制开启和关闭
while wait(0.7) do
    if isTeleporting then
        teleportToNextPosition()
    end
end

    end
})

Tab:CreateSection("使用连点器")
Tab:CreateSection("把点击放在你要用的技能上")
Tab:CreateSection("如果是一些小型普通角色需要买枪的我是建议用脉冲炮")
Tab:CreateSection("然后用那个在空中传送的4个角落")
Tab:CreateSection("再用空中行走在天上放个屏障让你待在空中传送")
Tab:CreateSection("也就是这个")

local Button = Tab:CreateButton({
	Name = "四角传送(天空版本)",
	Description = nil, 
    	Callback = function()
local Players = game:GetService("Players")
local LocalPlayer = Players.LocalPlayer
local PlayerGui = LocalPlayer:WaitForChild("PlayerGui")

-- 创建一个 ScreenGui 用于放置按钮
local ScreenGui = Instance.new("ScreenGui")
ScreenGui.Name = "TeleportControlGui"
ScreenGui.ResetOnSpawn = false
ScreenGui.Parent = PlayerGui

-- 创建按钮
local Button = Instance.new("TextButton")
Button.Name = "ToggleTeleportButton"
Button.Text = "开启传送"
Button.Size = UDim2.new(0, 120, 0, 30)
Button.Position = UDim2.new(0.5, -60, 0.5, -15)
Button.Font = Enum.Font.SourceSansBold
Button.TextSize = 18
Button.Parent = ScreenGui

-- 定义四个坐标
local positions = {
    Vector3.new(-63.550140380859375, 39.00679397583008, 42.31529998779297),
    Vector3.new(26.513303756713867, 39.00679397583008, 44.285369873046875),
    Vector3.new(26.766094207763672, 39.00679397583008, -53.3952522277832),
    Vector3.new(-79.17745971679688, 39.00679397583008, -63.349891662597656)
}

-- 当前位置索引
local currentIndex = 1

-- 控制传送功能的开关
local isTeleporting = false

-- 传送函数
local function teleportToNextPosition()
    -- 获取下一个位置
    local nextIndex = currentIndex + 1
    if nextIndex > #positions then
        nextIndex = 1  -- 如果超出范围，回到第一个位置
    end
    currentIndex = nextIndex

    -- 传送玩家到下一个位置
    local Character = LocalPlayer.Character or LocalPlayer.CharacterAdded:Wait()
    local HumanoidRootPart = Character:WaitForChild("HumanoidRootPart")
    HumanoidRootPart.CFrame = CFrame.new(positions[currentIndex])
end

-- 按钮点击事件
Button.MouseButton1Click:Connect(function()
    isTeleporting = not isTeleporting
    Button.Text = isTeleporting and "关闭传送" or "开启传送"
end)

-- 每0.7秒传送一次，但可以通过按钮控制开启和关闭
while wait(0.7) do
    if isTeleporting then
        teleportToNextPosition()
    end
end

    	end
})

local Label = Tab:CreateLabel({
	Text = "使用连点器可以避免进入afk",
	Style = 2
})