-- 加载 WindUI 库
local WindUI = loadstring(game:HttpGet("https://tree-hub.vercel.app/api/UI/WindUI"))()


-- 创建窗
local Window = WindUI:CreateWindow({
    Title = "STBB:Subtitle", -- 窗口标题
    Icon = "door-open", -- 窗口图标
    Author = "Subtitle", -- 作者名称
    Folder = "数据文件夹(删了没你好果子吃)", -- 用于保存数据的文件夹名称
    Size = UDim2.fromOffset(640, 320), -- 窗口大小
    Transparent = true, -- 是否透明
    Theme = "Dark", -- 主题颜色，可以是 "Light" 或 "Dark"
    UserEnabled = false, -- 是否允许用户启用/禁用窗口
    SideBarWidth = 130, -- 侧边栏宽度
    HasOutline = true, -- 是否有边框
})

-- 开关按钮
Window:EditOpenButton({
    Title = "神之力", -- 按钮的标题
    Icon = "monitor", -- 按钮的图标，可以是Lucide图标名称
    CornerRadius = UDim.new(0,20), -- 按钮的圆角半径
    StrokeThickness = 1, -- 按钮边框的厚度
    Color = ColorSequence.new( -- 按钮的渐变颜色
        Color3.fromHex("FF0F7B"), 
        Color3.fromHex("F89B29")
    ),
    Position = UDim2.new(0.5,0,0.5,0), -- 按钮的位置
    Enabled = true,   -- 按钮是否启用
    Draggable = true, -- 按钮是否可拖动
})


local MainTab = Window:Tab({
    Title = "主要",
    Icon = "house",
})


local Button = MainTab:Button({
    Title = "UTC页",
    Desc = "开启utc商店页面的",
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
    end,
})









local Button = MainTab:Button({
    Title = "重置人物",
    Desc = "重置CD血量武器储存",
    Callback = function()
         		      		game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(152.35, -497.32, 394.21)
    end,
})








local Button = MainTab:Button({
    Title = "钱即无敌",
    Desc = "只要你有钱就可以让你做到无敌",
    Callback = function()
        local args = {
    [1] = "Buy",
    [2] = "FillHP"
}

while true do
    game:GetService("ReplicatedStorage"):WaitForChild("ShopSystem"):FireServer(unpack(args))
    wait()
end

    end,
})








local Button = MainTab:Button({
    Title = "死亡激光",
    Desc = "反派无需开狂暴就可以使用轨道炮",
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


    end,
})





local Button = MainTab:Button({
    Title = "雷达检测",
    Desc = "检测地图上是否存在神风自爆队",
    Callback = function()
local player = game.Players.LocalPlayer
local playerGui = player:WaitForChild("PlayerGui")

local screenGui = Instance.new("ScreenGui")
screenGui.Name = "TransmitterUI"
screenGui.Parent = playerGui
screenGui.ResetOnSpawn = false

local statusLabel = Instance.new("TextLabel")
statusLabel.Name = "StatusLabel"
statusLabel.Text = "正在检测..."
statusLabel.TextColor3 = Color3.new(1, 1, 1)
statusLabel.BackgroundColor3 = Color3.new(0.8, 0.8, 0.8)
statusLabel.Size = UDim2.new(0, 90, 0, 30)
statusLabel.Position = UDim2.new(0, 10, 0, 10)
statusLabel.Font = Enum.Font.SourceSansBold
statusLabel.TextSize = 20
statusLabel.Parent = screenGui

local poles = {}

local function updatePoleForTransmitter(transmitterToilet)
    if transmitterToilet then
        local rootPart = transmitterToilet:FindFirstChild("HumanoidRootPart")
        if rootPart then
            if not poles[transmitterToilet] then
                local pole = Instance.new("Part")
                pole.Name = "IndicatorPole"
                pole.Size = Vector3.new(2, 50, 2)
                pole.Color = Color3.new(1, 0, 0)
                pole.Material = Enum.Material.SmoothPlastic
                pole.CanCollide = false
                pole.Parent = workspace
                poles[transmitterToilet] = pole
            end

            local pole = poles[transmitterToilet]
            pole.Position = rootPart.Position + Vector3.new(0, pole.Size.Y / 2, 0)
            pole.Size = Vector3.new(2, pole.Size.Y + 1, 2)
        end
    end
end

local function checkTransmitterToilets()
    local livingFolder = workspace:FindFirstChild("Living")
    if livingFolder then
        local transmitterToilets = livingFolder:GetChildren()
        for _, transmitterToilet in ipairs(transmitterToilets) do
            if transmitterToilet.Name == "Transmitter toilet" then
                updatePoleForTransmitter(transmitterToilet)
            end
        end
    end

    for transmitterToilet, pole in pairs(poles) do
        if not transmitterToilet.Parent then
            pole:Destroy()
            poles[transmitterToilet] = nil
        end
    end
end

local function checkTransmitterToilet()
    local transmitterToilet = workspace:FindFirstChild("Living") and workspace.Living:FindFirstChild("Transmitter toilet")
    if transmitterToilet then
        statusLabel.Text = "雷达出现"
        statusLabel.TextColor3 = Color3.new(1, 0, 0)
    else
        statusLabel.Text = "没有雷达"
        statusLabel.TextColor3 = Color3.new(0, 1, 0)
    end
end

local function startChecking()
    while wait() do
        checkTransmitterToilet()
        checkTransmitterToilets()
    end
end

startChecking()

    end,
})



local Button = MainTab:Button({
    Title = "监控博士",
    Desc = "拥有机甲状态的部分能力",
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



    end,
})



local Button = MainTab:Button({
    Title = "飞机商店",
    Desc = "直接打开飞机商店",
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

    end,
})




local Button = MainTab:Button({
    Title = "准星调整",
    Desc = "更good的准星",
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


    end,
})



local Button = MainTab:Button({
    Title = "四角传送",
    Desc = "在四个坐标循环传送",
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

    end,
})



local Button = MainTab:Button({
    Title = "无限弹药",
    Desc = "花光所有的钱为快速po枪补充弹药",
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


    end,
})


local HttpService = game:GetService("HttpService")

local folderPath = "WindUI"
makefolder(folderPath)

local function SaveFile(fileName, data)
    local filePath = folderPath .. "/" .. fileName .. ".json"
    local jsonData = HttpService:JSONEncode(data)
    writefile(filePath, jsonData)
end

local function LoadFile(fileName)
    local filePath = folderPath .. "/" .. fileName .. ".json"
    if isfile(filePath) then
        local jsonData = readfile(filePath)
        return HttpService:JSONDecode(jsonData)
    end
end

local function ListFiles()
    local files = {}
    for _, file in ipairs(listfiles(folderPath)) do
        local fileName = file:match("([^/]+)%.json$")
        if fileName then
            table.insert(files, fileName)
        end
    end
    return files
end

-- 创建主标签页
local MainTab = Window:Tab({
    Title = "设置",
    Icon = "settings",
})

-- 创建窗口设置部分
MainTab:Section({ Title = "界面" })

-- 获取所有主题名称
local themeValues = {}
for name, _ in pairs(WindUI:GetThemes()) do
    table.insert(themeValues, name)
end

-- 创建主题选择下拉菜单
local themeDropdown = MainTab:Dropdown({
    Title = "界面样式",
    Multi = false,
    AllowNone = false,
    Value = nil,
    Values = themeValues,
    Callback = function(theme)
        WindUI:SetTheme(theme)
    end
})
themeDropdown:Select(WindUI:GetCurrentTheme())

-- 创建透明度切换按钮
local ToggleTransparency = MainTab:Toggle({
    Title = "背景透明与不透明",
    Callback = function(e)
        Window:ToggleTransparency(e)
    end,
    Value = WindUI:GetTransparency()
})

-- 创建保存文件部分
MainTab:Section({ Title = "保存" })

-- 创建文件名输入框
local fileNameInput = ""
MainTab:Input({
    Title = "输入名字",
    PlaceholderText = "名字",
    Callback = function(text)
        fileNameInput = text
    end
})

-- 创建保存文件按钮
MainTab:Button({
    Title = "保存",
    Callback = function()
        if fileNameInput ~= "" then
            SaveFile(fileNameInput, { Transparent = WindUI:GetTransparency(), Theme = WindUI:GetCurrentTheme() })
        else
            Window:Notify({ -- 假设 Window 有 Notify 方法
                Title = "错误",
                Content = "我不知道!",
                Duration = 5,
            })
        end
    end
})

-- 创建加载文件部分
MainTab:Section({ Title = "加载" })

-- 获取文件列表
local files = ListFiles() -- 确保 ListFiles 函数已定义并返回文件列表

-- 创建文件选择下拉菜单
local filesDropdown = MainTab:Dropdown({
    Title = "选择加载",
    Multi = false,
    AllowNone = true,
    Values = files,
    Callback = function(selectedFile)
        fileNameInput = selectedFile
    end
})

-- 创建加载文件按钮
MainTab:Button({
    Title = "加载",
    Callback = function()
        if fileNameInput ~= "" then
            local data = LoadFile(fileNameInput)
            if data then
                WindUI:Notify({
                    Title = "File Loaded",
                    Content = "Loaded data: " .. HttpService:JSONEncode(data),
                    Duration = 5,
                })
                if data.Transparent then 
                    Window:ToggleTransparency(data.Transparent)
                    ToggleTransparency:SetValue(data.Transparent)
                end
                if data.Theme then WindUI:SetTheme(data.Theme) end
            end
        end
    end
})

-- 创建刷新文件列表按钮
MainTab:Button({
    Title = "刷新",
    Callback = function()
        filesDropdown:Refresh(ListFiles()) -- 确保 ListFiles 函数已定义并返回文件列表
    end
})

-- 获取当前主题的颜色值
local currentThemeName = WindUI:GetCurrentTheme()
local themes = WindUI:GetThemes()

local ThemeAccent = themes[currentThemeName].Accent
local ThemeOutline = themes[currentThemeName].Outline
local ThemeText = themes[currentThemeName].Text
local ThemePlaceholderText = themes[currentThemeName].PlaceholderText

-- 更新主题颜色
function updateTheme()
    WindUI:AddTheme({
        Name = currentThemeName,
        Accent = ThemeAccent,
        Outline = ThemeOutline,
        Text = ThemeText,
        PlaceholderText = ThemePlaceholderText
    })
    WindUI:SetTheme(currentThemeName)
end
