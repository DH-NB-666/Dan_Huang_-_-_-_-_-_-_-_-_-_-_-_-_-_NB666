local Player = game:GetService("Players").LocalPlayer
local PlayerGui = Player:WaitForChild("PlayerGui")
local TweenService = game:GetService("TweenService")

if PlayerGui:FindFirstChild("EggKingUISystem") then
    PlayerGui.EggKingUISystem:Destroy()
end
if PlayerGui:FindFirstChild("EggKingUserInfo") then
    PlayerGui.EggKingUserInfo:Destroy()
end

local ScreenGui = Instance.new("ScreenGui")
ScreenGui.Name = "EggKingUISystem"
ScreenGui.Parent = PlayerGui
ScreenGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
ScreenGui.ResetOnSpawn = false

local MainFrame = Instance.new("Frame")
MainFrame.Name = "MainFrame"
MainFrame.Size = UDim2.new(0.8, 0, 0.35, 0)
MainFrame.Position = UDim2.new(0.5, 0, 0.5, 0)
MainFrame.AnchorPoint = Vector2.new(0.5, 0.5)
MainFrame.BackgroundColor3 = Color3.fromRGB(20, 20, 40)
MainFrame.BackgroundTransparency = 0.1
MainFrame.BorderSizePixel = 0
MainFrame.Parent = ScreenGui

local UICorner = Instance.new("UICorner")
UICorner.CornerRadius = UDim.new(0, 12)
UICorner.Parent = MainFrame

local UIStroke = Instance.new("UIStroke")
UIStroke.Color = Color3.fromRGB(100, 100, 255)
UIStroke.Thickness = 2
UIStroke.Transparency = 0.5
UIStroke.Parent = MainFrame

local TitleLabel = Instance.new("TextLabel")
TitleLabel.Name = "TitleLabel"
TitleLabel.Size = UDim2.new(0.9, 0, 0.2, 0)
TitleLabel.Position = UDim2.new(0.5, 0, 0.1, 0)
TitleLabel.AnchorPoint = Vector2.new(0.5, 0)
TitleLabel.BackgroundTransparency = 1
TitleLabel.Text = "蛋皇验证系统"
TitleLabel.Font = Enum.Font.GothamBold
TitleLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
TitleLabel.TextSize = 24
TitleLabel.Parent = MainFrame

local LoadingLabel = Instance.new("TextLabel")
LoadingLabel.Name = "LoadingLabel"
LoadingLabel.Size = UDim2.new(0.9, 0, 0.15, 0)
LoadingLabel.Position = UDim2.new(0.5, 0, 0.3, 0)
LoadingLabel.AnchorPoint = Vector2.new(0.5, 0)
LoadingLabel.BackgroundTransparency = 1
LoadingLabel.Text = "系统初始化中..."
LoadingLabel.Font = Enum.Font.Gotham
LoadingLabel.TextColor3 = Color3.fromRGB(200, 200, 255)
LoadingLabel.TextSize = 16
LoadingLabel.Parent = MainFrame

local ProgressBarBackground = Instance.new("Frame")
ProgressBarBackground.Name = "ProgressBarBackground"
ProgressBarBackground.Size = UDim2.new(0.9, 0, 0.08, 0)
ProgressBarBackground.Position = UDim2.new(0.5, 0, 0.5, 0)
ProgressBarBackground.AnchorPoint = Vector2.new(0.5, 0)
ProgressBarBackground.BackgroundColor3 = Color3.fromRGB(50, 40, 70)
ProgressBarBackground.BorderSizePixel = 0
ProgressBarBackground.Parent = MainFrame

local ProgressBarCorner = Instance.new("UICorner")
ProgressBarCorner.CornerRadius = UDim.new(1, 0)
ProgressBarCorner.Parent = ProgressBarBackground

local ProgressBar = Instance.new("Frame")
ProgressBar.Name = "ProgressBar"
ProgressBar.Size = UDim2.new(0, 0, 1, 0)
ProgressBar.BackgroundColor3 = Color3.fromRGB(100, 150, 255)
ProgressBar.BorderSizePixel = 0
ProgressBar.Parent = ProgressBarBackground

local ProgressBarInnerCorner = Instance.new("UICorner")
ProgressBarInnerCorner.CornerRadius = UDim.new(1, 0)
ProgressBarInnerCorner.Parent = ProgressBar

local PercentLabel = Instance.new("TextLabel")
PercentLabel.Name = "PercentLabel"
PercentLabel.Size = UDim2.new(0.9, 0, 0.15, 0)
PercentLabel.Position = UDim2.new(0.5, 0, 0.6, 0)
PercentLabel.AnchorPoint = Vector2.new(0.5, 0)
PercentLabel.BackgroundTransparency = 1
PercentLabel.Text = "0%"
PercentLabel.Font = Enum.Font.GothamBold
PercentLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
PercentLabel.TextSize = 18
PercentLabel.Parent = MainFrame

local progress = 0
local loadingTexts = {
    "正在检查系统完整性...",
    "正在连接服务器...",
    "正在加载模块...",
    "马上就好...",
    "最终准备中..."
}

local function showUserInfo()
    local UserInfoGui = Instance.new("ScreenGui")
    UserInfoGui.Name = "EggKingUserInfo"
    UserInfoGui.Parent = PlayerGui
    UserInfoGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
    UserInfoGui.ResetOnSpawn = false
    
    local InfoFrame = Instance.new("Frame")
    InfoFrame.Name = "InfoFrame"
    InfoFrame.Size = UDim2.new(0.3, 0, 0.15, 0)
    InfoFrame.Position = UDim2.new(0.02, 0, 0.02, 0)
    InfoFrame.BackgroundColor3 = Color3.fromRGB(10, 20, 30)
    InfoFrame.BackgroundTransparency = 0.3
    InfoFrame.BorderSizePixel = 0
    InfoFrame.Parent = UserInfoGui
    
    local InfoCorner = Instance.new("UICorner")
    InfoCorner.CornerRadius = UDim.new(0, 8)
    InfoCorner.Parent = InfoFrame
    
    local InfoStroke = Instance.new("UIStroke")
    InfoStroke.Color = Color3.fromRGB(100, 100, 255)
    InfoStroke.Thickness = 2
    InfoStroke.Parent = InfoFrame
    
    local EggKingLabel = Instance.new("TextLabel")
    EggKingLabel.Name = "EggKingLabel"
    EggKingLabel.Size = UDim2.new(1, 0, 0.3, 0)
    EggKingLabel.BackgroundTransparency = 1
    EggKingLabel.Text = "蛋皇牛逼 ★★★★★"
    EggKingLabel.Font = Enum.Font.GothamBlack
    EggKingLabel.TextColor3 = Color3.fromRGB(255, 215, 0)
    EggKingLabel.TextSize = 18
    EggKingLabel.Parent = InfoFrame
    
    local UserLabel = Instance.new("TextLabel")
    UserLabel.Name = "UserLabel"
    UserLabel.Size = UDim2.new(1, 0, 0.35, 0)
    UserLabel.Position = UDim2.new(0, 0, 0.3, 0)
    UserLabel.BackgroundTransparency = 1
    UserLabel.Text = "用户: "..Player.Name
    UserLabel.Font = Enum.Font.Gotham
    UserLabel.TextColor3 = Color3.fromRGB(200, 200, 255)
    UserLabel.TextSize = 14
    UserLabel.Parent = InfoFrame
    
    local UserIdLabel = Instance.new("TextLabel")
    UserIdLabel.Name = "UserIdLabel"
    UserIdLabel.Size = UDim2.new(1, 0, 0.35, 0)
    UserIdLabel.Position = UDim2.new(0, 0, 0.65, 0)
    UserIdLabel.BackgroundTransparency = 1
    UserIdLabel.Text = "ID: "..Player.UserId
    UserIdLabel.Font = Enum.Font.Gotham
    UserIdLabel.TextColor3 = Color3.fromRGB(200, 200, 255)
    UserIdLabel.TextSize = 14
    UserIdLabel.Parent = InfoFrame
    
    InfoFrame.Position = UDim2.new(-0.5, 0, 0.02, 0)
    TweenService:Create(
        InfoFrame,
        TweenInfo.new(0.8, Enum.EasingStyle.Back, Enum.EasingDirection.Out),
        {Position = UDim2.new(0.02, 0, 0.02, 0)}
    ):Play()
end

local function showKeyInput()
    ProgressBarBackground.Visible = false
    PercentLabel.Visible = false
    LoadingLabel.Visible = false
    
    TitleLabel.Text = "请输入卡密"
    
    local InputFrame = Instance.new("Frame")
    InputFrame.Name = "InputFrame"
    InputFrame.Size = UDim2.new(0.9, 0, 0.25, 0)
    InputFrame.Position = UDim2.new(0.5, 0, 0.5, 0)
    InputFrame.AnchorPoint = Vector2.new(0.5, 0.5)
    InputFrame.BackgroundColor3 = Color3.fromRGB(30, 30, 50)
    InputFrame.BackgroundTransparency = 0.2
    InputFrame.Parent = MainFrame
    
    local InputCorner = Instance.new("UICorner")
    InputCorner.CornerRadius = UDim.new(0, 8)
    InputCorner.Parent = InputFrame
    
    local KeyInput = Instance.new("TextBox")
    KeyInput.Name = "KeyInput"
    KeyInput.Size = UDim2.new(0.8, 0, 0.5, 0)
    KeyInput.Position = UDim2.new(0.5, 0, 0.3, 0)
    KeyInput.AnchorPoint = Vector2.new(0.5, 0)
    KeyInput.BackgroundColor3 = Color3.fromRGB(40, 40, 60)
    KeyInput.TextColor3 = Color3.fromRGB(255, 255, 255)
    KeyInput.PlaceholderText = "在此输入卡密..."
    KeyInput.PlaceholderColor3 = Color3.fromRGB(150, 150, 150)
    KeyInput.Font = Enum.Font.Gotham
    KeyInput.TextSize = 16
    KeyInput.Text = ""
    KeyInput.ClearTextOnFocus = false
    KeyInput.Parent = InputFrame
    
    local KeyInputCorner = Instance.new("UICorner")
    KeyInputCorner.CornerRadius = UDim.new(0, 6)
    KeyInputCorner.Parent = KeyInput
    
    local KeyInputStroke = Instance.new("UIStroke")
    KeyInputStroke.Color = Color3.fromRGB(100, 100, 255)
    KeyInputStroke.Thickness = 1
    KeyInputStroke.Parent = KeyInput
    
    local SubmitButton = Instance.new("TextButton")
    SubmitButton.Name = "SubmitButton"
    SubmitButton.Size = UDim2.new(0.6, 0, 0.4, 0)
    SubmitButton.Position = UDim2.new(0.5, 0, 0.8, 0)
    SubmitButton.AnchorPoint = Vector2.new(0.5, 0)
    SubmitButton.BackgroundColor3 = Color3.fromRGB(70, 120, 255)
    SubmitButton.TextColor3 = Color3.fromRGB(255, 255, 255)
    SubmitButton.Font = Enum.Font.GothamBold
    SubmitButton.TextSize = 16
    SubmitButton.Text = "验证卡密"
    SubmitButton.Parent = InputFrame
    
    local SubmitCorner = Instance.new("UICorner")
    SubmitCorner.CornerRadius = UDim.new(0, 8)
    SubmitCorner.Parent = SubmitButton
    
    SubmitButton.MouseEnter:Connect(function()
        TweenService:Create(
            SubmitButton,
            TweenInfo.new(0.2),
            {BackgroundColor3 = Color3.fromRGB(90, 140, 255)}
        ):Play()
    end)
    
    SubmitButton.MouseLeave:Connect(function()
        TweenService:Create(
            SubmitButton,
            TweenInfo.new(0.2),
            {BackgroundColor3 = Color3.fromRGB(70, 120, 255)}
        ):Play()
    end)
    
    SubmitButton.MouseButton1Click:Connect(function()
        local key = KeyInput.Text:upper():gsub("%s+", "")
        
        if key == "DHNB666" then
            TitleLabel.Text = "验证成功"
            InputFrame:Destroy()
            
            local SuccessLabel = Instance.new("TextLabel")
            SuccessLabel.Name = "SuccessLabel"
            SuccessLabel.Size = UDim2.new(0.9, 0, 0.3, 0)
            SuccessLabel.Position = UDim2.new(0.5, 0, 0.5, 0)
            SuccessLabel.AnchorPoint = Vector2.new(0.5, 0.5)
            SuccessLabel.BackgroundTransparency = 1
            SuccessLabel.Text = "验证成功！加载脚本中..."
            SuccessLabel.Font = Enum.Font.GothamBold
            SuccessLabel.TextColor3 = Color3.fromRGB(100, 255, 100)
            SuccessLabel.TextSize = 20
            SuccessLabel.Parent = MainFrame
            
            wait(2)
            ScreenGui:Destroy()
            showUserInfo()
            loadstring(game:HttpGet("https://pastebin.com/raw/F6wJc0uV"))()
        else
            TitleLabel.Text = "卡密错误"
            TitleLabel.TextColor3 = Color3.fromRGB(255, 100, 100)
            
            local shake = 0
            for i = 1, 10 do
                shake = shake + 5
                InputFrame.Position = UDim2.new(0.5, math.random(-shake, shake), 0.5, 0)
                wait(0.02)
            end
            InputFrame.Position = UDim2.new(0.5, 0, 0.5, 0)
            
            wait(3)
            Player:Kick("卡密验证失败")
        end
    end)
end

local function updateProgress()
    while progress < 100 do
        progress = progress + math.random(3, 6)
        if progress > 100 then progress = 100 end
        
        ProgressBar.Size = UDim2.new(progress/100, 0, 1, 0)
        PercentLabel.Text = progress.."%"
        
        if progress < 20 then
            LoadingLabel.Text = loadingTexts[1]
        elseif progress < 40 then
            LoadingLabel.Text = loadingTexts[2]
        elseif progress < 60 then
            LoadingLabel.Text = loadingTexts[3]
        elseif progress < 80 then
            LoadingLabel.Text = loadingTexts[4]
        else
            LoadingLabel.Text = loadingTexts[5]
        end
        
        wait(math.random(3, 8)/10)
    end
    
    ProgressBar.Size = UDim2.new(1, 0, 1, 0)
    PercentLabel.Text = "100%"
    LoadingLabel.Text = "准备就绪"
    
    showKeyInput()
end

coroutine.wrap(updateProgress)()
