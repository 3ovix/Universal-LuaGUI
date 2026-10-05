local CoreGui = game:GetService("CoreGui")
local Workspace = game:GetService("Workspace")

local GUI_NAME = "UniversalLuaGUI"

local oldGui = CoreGui:FindFirstChild(GUI_NAME)
if oldGui then
    oldGui:Destroy()
end

local ScreenGui = Instance.new("ScreenGui")
ScreenGui.Name = GUI_NAME
ScreenGui.IgnoreGuiInset = true
ScreenGui.ResetOnSpawn = false
ScreenGui.Parent = CoreGui

local Frame = Instance.new("Frame")
Frame.Name = "MainFrame"
Frame.BorderSizePixel = 0
Frame.Parent = ScreenGui

local function updateFrame()
    local camera = Workspace.CurrentCamera
    if not camera then
        return
    end

    local viewport = camera.ViewportSize
    local size = viewport.X * 0.20

    Frame.Size = UDim2.fromOffset(size, size)
    Frame.Position = UDim2.new(0.4, 0, 0, 0)
end

updateFrame()

Workspace:GetPropertyChangedSignal("CurrentCamera"):Connect(updateFrame)

if Workspace.CurrentCamera then
    Workspace.CurrentCamera:GetPropertyChangedSignal("ViewportSize"):Connect(updateFrame)
end
