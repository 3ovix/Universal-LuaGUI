local CoreGui = game:GetService("CoreGui")
local Workspace = game:GetService("Workspace")

local GUI_NAME = "UniversalLuaGUI"

for _, child in ipairs(CoreGui:GetChildren()) do
    if child.Name == GUI_NAME then
        child:Destroy()
    end
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

local Frame2 = Instance.new("Frame")
Frame2.Name = "Piece2"
Frame2.BorderSizePixel = 0
Frame2.Parent = ScreenGui

local function updateFrames()
    local camera = Workspace.CurrentCamera
    if not camera then
        return
    end

    local viewport = camera.ViewportSize
    local piece1Size = viewport.X * 0.10
    local piece2Width = viewport.X * 0.80
    local piece2Height = math.max(0, viewport.Y - piece1Size)

    Frame.Size = UDim2.fromOffset(piece1Size, piece1Size)
    Frame.Position = UDim2.new(0.45, 0, 0, 0)

    Frame2.Size = UDim2.fromOffset(piece2Width, piece2Height)
    Frame2.Position = UDim2.new(0.10, 0, 0, piece1Size)
end

updateFrames()

Workspace:GetPropertyChangedSignal("CurrentCamera"):Connect(updateFrames)

if Workspace.CurrentCamera then
    Workspace.CurrentCamera:GetPropertyChangedSignal("ViewportSize"):Connect(updateFrames)
end
