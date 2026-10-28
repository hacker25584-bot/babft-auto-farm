return(function(B7zcl, ...)
local k2D1WV = {"o4zPiMDA3We";"lo2";"D19";"Uu0Uo";"anvnh3";"wDFEka"}
local 7pKvlTUz = function(...)
-- Panda Auth - PUSL-V4
-- Paste this at the very top of your script.

local PUSL = loadstring(game:HttpGet(loadstring(base64decode("aHR0cHM6Ly9zZWN1cmUucGFuZGF1dGguY29tL3B2NC9saWI="))()))()
if not PUSL or type(PUSL.configure) ~= loadstring(base64decode("ZnVuY3Rpb24="))() then
    return warn(loadstring(base64decode("W1BhbmRhXSBMaWJyYXJ5IGZhaWxlZCB0byBpbml0aWFsaXplLg=="))())
end

PUSL.configure({
    serviceId = loadstring(base64decode("aXJ0"))(),
})

local key = loadstring(base64decode("VVNFUl9LRVlfSEVSRQ=="))() -- replace with your own key input
local result = PUSL.validate(key)

if not result.success then
    warn(loadstring(base64decode("W1BhbmRhXSBHZXQgYSBrZXk6IA=="))() .. PUSL.getKeyUrl())
    return
end

print(loadstring(base64decode("W1BhbmRhXSBBdXRoZW50aWNhdGVkLiBQcmVtaXVtOg=="))(), result.isPremium)

-- Your protected code goes below this line.

local Players = game:GetService(loadstring(base64decode("UGxheWVycw=="))())
local LocalPlayer = Players.LocalPlayer
local Camera = workspace.CurrentCamera
local RunService = game:GetService(loadstring(base64decode("UnVuU2VydmljZQ=="))())
local Lighting = game:GetService(loadstring(base64decode("TGlnaHRpbmc="))())
local UserInputService = game:GetService(loadstring(base64decode("VXNlcklucHV0U2VydmljZQ=="))())
local PathfindingService = game:GetService(loadstring(base64decode("UGF0aGZpbmRpbmdTZXJ2aWNl"))())
local ReplicatedStorage = game:GetService(loadstring(base64decode("UmVwbGljYXRlZFN0b3JhZ2U="))())
local Debris = game:GetService(loadstring(base64decode("RGVicmlz"))())
local ProximityPromptService = game:GetService(loadstring(base64decode("UHJveGltaXR5UHJvbXB0U2VydmljZQ=="))())
local TweenService = game:GetService(loadstring(base64decode("VHdlZW5TZXJ2aWNl"))())
repeat task.wait() until game:IsLoaded()
if game:GetService(loadstring(base64decode("UGxheWVycw=="))()).LocalPlayer:GetAttribute(loadstring(base64decode("Tm92YUxvYWRlZA=="))()) then
if getgenv().Library then
getgenv().Library:Notify(loadstring(base64decode("SVJUIOOAjiBBbHJlYWR5IExvYWRlZCDjgI8="))(),4)
else
print(loadstring(base64decode("SVJUIOOAjiBBbHJlYWR5IExvYWRlZCDjgI8="))())
end
return end
game:GetService(loadstring(base64decode("UGxheWVycw=="))()).LocalPlayer:SetAttribute(loadstring(base64decode("Tm92YUxvYWRlZA=="))(),true)
local LibraryName = 'IRT'
repeat task.wait() until LocalPlayer.Character
if   getgenv().ScriptLibrary ~= loadstring(base64decode("TGlub3JpYQ=="))() then
getgenv().ScriptLibrary = getgenv().ScriptLibrary or loadstring(base64decode("TGlub3JpYQ=="))()
end
local repo = getgenv().ScriptLibrary == loadstring(base64decode("T2JzaWRpYW4="))() and 'https://raw.githubusercontent.com/mstudio45/Obsidian/main/' or getgenv().ScriptLibrary == loadstring(base64decode("TGlub3JpYQ=="))() and 'https://raw.githubusercontent.com/mstudio45/LinoriaLib/main/'
local Library = loadstring(game:HttpGet(repo .. 'Library.lua'))()
task.wait()
local ThemeManager, SaveManager
pcall(function() ThemeManager = loadstring(game:HttpGet(repo .. 'addons/ThemeManager.lua'))() end)
pcall(function() SaveManager = loadstring(game:HttpGet(repo .. 'addons/SaveManager.lua'))() end)
local ESPLibrary = loadstring(game:HttpGet(loadstring(base64decode("aHR0cHM6Ly9yYXcuZ2l0aHVidXNlcmNvbnRlbnQuY29tL1RoZUh1bnRlclNvbG8xL1NjcmlwdHMvbWFpbi9FU1BMaWJyYXJ5"))()))() 
local HttpService = game:GetService(loadstring(base64decode("SHR0cFNlcnZpY2U="))())
if SaveManager then
local oldSave = SaveManager.Save
SaveManager.Save = function(self, name)
if Library.KeybindFrame then
local pos = Library.KeybindFrame.Position
local data = { pos.X.Scale, pos.X.Offset, pos.Y.Scale, pos.Y.Offset }
getgenv().NovaHub_KeybindPos = data
pcall(function()
if writefile and self.Folder then
writefile(self.Folder .. '/settings/' .. name .. '_keybindpos.json', HttpService:JSONEncode(data))
end
end)
end
return oldSave(self, name)
end
local oldLoad = SaveManager.Load
SaveManager.Load = function(self, name)
local result = oldLoad(self, name)
pcall(function()
if isfile and self.Folder and isfile(self.Folder .. '/settings/' .. name .. '_keybindpos.json') then
local data = HttpService:JSONDecode(readfile(self.Folder .. '/settings/' .. name .. '_keybindpos.json'))
if data and Library.KeybindFrame then
Library.KeybindFrame.Position = UDim2.new(data[1], data[2], data[3], data[4])
getgenv().NovaHub_KeybindPos = data
end
end
end)
return result
end
end
local Options = Library.Options
local Toggles = Library.Toggles
local Connections = {}
local Window = Library:CreateWindow({
Title = LibraryName,
Center = true,
ToggleKeybind = Enum.KeyCode.RightControl,
AutoShow = true,
NotifySide = loadstring(base64decode("UmlnaHQ="))(),
ShowCustomCursor = true,
})
if Library.KeybindFrame then
if getgenv().NovaHub_KeybindPos then
local p = getgenv().NovaHub_KeybindPos
Library.KeybindFrame.Position = UDim2.new(p[1], p[2], p[3], p[4])
end
table.insert(Connections, Library.KeybindFrame:GetPropertyChangedSignal(loadstring(base64decode("UG9zaXRpb24="))()):Connect(function()
local pos = Library.KeybindFrame.Position
getgenv().NovaHub_KeybindPos = { pos.X.Scale, pos.X.Offset, pos.Y.Scale, pos.Y.Offset }
end))
end
local Notifying = loadstring(base64decode("TGlicmFyeQ=="))()
local PlaySound = true
local function Notify(txt, duration)
Library:Notify(txt, duration)
if PlaySound then
local Sound = Instance.new(loadstring(base64decode("U291bmQ="))(), game:GetService(loadstring(base64decode("U291bmRTZXJ2aWNl"))()))
Sound.SoundId = loadstring(base64decode("cmJ4YXNzZXRpZDovLzEwMTUxMTM2MTQ2ODg1Mg=="))()
Sound.PlaybackSpeed = 0.77
Sound.Volume = 2
Sound:Play()
game:GetService(loadstring(base64decode("RGVicmlz"))()):AddItem(Sound, 3)
end
end
function AddESP(part,txt,color)
ESPLibrary:AddESP({
Object = part, Text = txt, Color = color })
end
function AddEntityESP(part,txt,color)
if part:IsA(loadstring(base64decode("TW9kZWw="))()) then
while not part.PrimaryPart do
for _, v in pairs(part:GetChildren()) do
if v:IsA(loadstring(base64decode("QmFzZVBhcnQ="))()) then
part.PrimaryPart = v
end
end
task.wait()
end
if part.PrimaryPart then
part.PrimaryPart.Transparency = 0.99
end
if not part:FindFirstChildOfClass(loadstring(base64decode("SHVtYW5vaWQ="))()) then
Instance.new(loadstring(base64decode("SHVtYW5vaWQ="))(),part)
end
end
if part.Name == loadstring(base64decode("RmlndXJlUmln"))() or part.Name == loadstring(base64decode("RmlndXJlUmFnZG9sbA=="))() then
part:WaitForChild(loadstring(base64decode("Um9vdA=="))()).Size = Vector3.new(0.001, 0.001, 0.001)
end
ESPLibrary:AddESP({
Object = part, Text = txt, Color =  color, })
end
function GetLibraryCode()
local CodeLength = game.ReplicatedStorage.GameData.Floor.Value == loadstring(base64decode("Rm9vbHM="))() and 10 or 5
local Slot = table.create(CodeLength, loadstring(base64decode("Xw=="))())
local Paper
for _, plr in pairs(Players:GetPlayers()) do
local char = plr.Character
if char then
Paper = char:FindFirstChild(loadstring(base64decode("TGlicmFyeUhpbnRQYXBlcg=="))()) or char:FindFirstChild(loadstring(base64decode("TGlicmFyeUhpbnRQYXBlckhhcmQ="))()) or
plr.Backpack:FindFirstChild(loadstring(base64decode("TGlicmFyeUhpbnRQYXBlcg=="))()) or plr.Backpack:FindFirstChild(loadstring(base64decode("TGlicmFyeUhpbnRQYXBlckhhcmQ="))())
if Paper then break end
end
end
if not Paper then return table.concat(Slot) end
local Hints = LocalPlayer.PlayerGui.PermUI.Hints:GetChildren()
for _, i in pairs(Paper.UI:GetChildren()) do
if i:IsA(loadstring(base64decode("SW1hZ2VMYWJlbA=="))()) and i.Name ~= loadstring(base64decode("SW1hZ2U="))() then
local Pos = tonumber(i.Name)
if Pos and Slot[Pos] then
for _, v in pairs(Hints) do
if v.Name == loadstring(base64decode("SWNvbg=="))() and v.ImageRectOffset.X == i.ImageRectOffset.X then
local Label = v:FindFirstChild(loadstring(base64decode("VGV4dExhYmVs"))())
if Label then
Slot[Pos] = Label.Text
end
break
end
end
end
end
end
return table.concat(Slot)
end
if workspace:FindFirstChild(loadstring(base64decode("TG9iYnk="))()) then
local Tabs = {
Main = Window:AddTab('Game', loadstring(base64decode("c3Rhcg=="))()),
Settings = Window:AddTab('Settings',loadstring(base64decode("c2V0dGluZ3M="))()),
}
local Tp = Tabs.Main:AddLeftGroupbox(loadstring(base64decode("VGVsZXBvcnQ="))())
Tp:AddLabel('Main menu appears after teleport', true)
local function FastElevator(dest, settings)
local Event = game:GetService(loadstring(base64decode("UmVwbGljYXRlZFN0b3JhZ2U="))()):FindFirstChild(loadstring(base64decode("UmVtb3Rlc0ZvbGRlcg=="))()) and game:GetService(loadstring(base64decode("UmVwbGljYXRlZFN0b3JhZ2U="))()).RemotesFolder:FindFirstChild(loadstring(base64decode("Q3JlYXRlRWxldmF0b3I="))())
if Event then
Event:FireServer({
Mods = {},
Settings = settings or {},
Destination = dest,
FriendsOnly = false,
MaxPlayers = loadstring(base64decode("MQ=="))()
})
end
end
Tp:AddButton(loadstring(base64decode("VGVsZXBvcnQgdG8gSG90ZWw="))(), function() FastElevator(loadstring(base64decode("SG90ZWw="))()) end)
Tp:AddButton(loadstring(base64decode("VGVsZXBvcnQgdG8gTWluZXM="))(), function() FastElevator(loadstring(base64decode("TWluZXM="))()) end)
Tp:AddButton(loadstring(base64decode("VGVsZXBvcnQgdG8gUm9vbXMgKE5PVCBXT1JrKQ=="))(), function() FastElevator(loadstring(base64decode("Um9vbXM="))()) end)
Tp:AddButton(loadstring(base64decode("VGVsZXBvcnQgdG8gQmFja2Rvb3Jz"))(), function() FastElevator(loadstring(base64decode("QmFja2Rvb3I="))()) end)
Tp:AddButton(loadstring(base64decode("VGVsZXBvcnQgdG8gT3V0ZG9vcnMgKEZSRUUp"))(), function() FastElevator(loadstring(base64decode("R2FyZGVu"))()) end)
Tp:AddButton(loadstring(base64decode("VGVsZXBvcnQgdG8gUmV0cm8gTW9kZQ=="))(), function() FastElevator(loadstring(base64decode("UmV0cm8="))()) end)
Tp:AddButton(loadstring(base64decode("VGVsZXBvcnQgdG8gU3VwZXIgSGFyZCBNb2Rl"))(), function() FastElevator(loadstring(base64decode("U3VwZXJIYXJkTW9kZQ=="))()) end)
Tp:AddButton(loadstring(base64decode("VGVsZXBvcnQgdG8gRW5kbGVzcw=="))(), function() FastElevator(loadstring(base64decode("RW5kbGVzcw=="))()) end)
Tp:AddButton(loadstring(base64decode("VGVsZXBvcnQgdG8gUnVzaCBNb2Rl"))(), function() FastElevator(loadstring(base64decode("Rm9vbHMyNg=="))()) end)
Tp:AddButton(loadstring(base64decode("VGVsZXBvcnQgdG8gQmF0dGxlIE1vZGU="))(), function() FastElevator(loadstring(base64decode("UGFydHk="))()) end)
Tp:AddButton(loadstring(base64decode("VGVsZXBvcnQgdG8gQ2hhb3M="))(), function() FastElevator(loadstring(base64decode("Q3VyYXRlZA=="))(), { youtube = loadstring(base64decode(""))(), twitch = loadstring(base64decode(""))() }) end)
Tp:AddButton(loadstring(base64decode("VGVsZXBvcnQgdG8gRGFpbHkgUnVu"))(), function() FastElevator(loadstring(base64decode("RGFpbHk="))()) end)
Tp:AddButton(loadstring(base64decode("VGVsZXBvcnQgdG8gQ3JpbmdsZXMgV29ya3Nob3A="))(), function() FastElevator(loadstring(base64decode("Q3JpbmdsZXNXb3Jrc2hvcA=="))()) end)
Tp:AddButton(loadstring(base64decode("VGVsZXBvcnQgdG8gVHJpY2sgT3IgVHJlYXQ="))(), function() FastElevator(loadstring(base64decode("SGFsbG93ZWVuMjU="))()) end)
Tp:AddButton(loadstring(base64decode("VGVsZXBvcnQgdG8gSG90ZWwt"))(), function() FastElevator(loadstring(base64decode("QmVmb3JlUGx1cw=="))()) end)
local MenuGroup = Tabs.Settings:AddLeftGroupbox('UI Settings')
local UtilityBox = Tabs.Settings:AddRightGroupbox('Hub Utilities')
MenuGroup:AddLabel(loadstring(base64decode("TWVudSBiaW5k"))()):AddKeyPicker(loadstring(base64decode("TWVudUtleWJpbmQ="))(), { Default = loadstring(base64decode("UmlnaHRTaGlmdA=="))(), NoUI = true, Text = loadstring(base64decode("TWVudSBrZXliaW5k"))() })
Library.ToggleKeybind = Options.MenuKeybind
MenuGroup:AddToggle(loadstring(base64decode("U2hvd0tleWJpbmRz"))(), { Text = loadstring(base64decode("U2hvdyBLZXliaW5kcyBPdmVybGF5"))(), Default = false }):OnChanged(function()
Library.KeybindFrame.Visible = Toggles.ShowKeybinds.Value
end)
MenuGroup:AddToggle(loadstring(base64decode("U2hvd0N1c3RvbUN1cnNvcg=="))(), {
Text = loadstring(base64decode("Q3VzdG9tIEN1cnNvcg=="))(),
Default = true,
Callback = function(Value)
Library.ShowCustomCursor = Value
end,
})
MenuGroup:AddDivider()
MenuGroup:AddToggle('PlayNotifySound',{
Text = loadstring(base64decode("UGxheSBOb3RpZmljYXRpb24gU291bmQ="))(),
Default = true,
Callback = function(Value)
PlaySound = Value
end
})
MenuGroup:AddDropdown(loadstring(base64decode("Tm90aWZpY2F0aW9uU2lkZQ=="))(), {
Values = { loadstring(base64decode("TGVmdA=="))(), loadstring(base64decode("UmlnaHQ="))() },
Default = loadstring(base64decode("UmlnaHQ="))(),
Text = loadstring(base64decode("Tm90aWZpY2F0aW9uIFNpZGU="))(),
Callback = function(Value)
Library:SetNotifySide(Value)
end,
})
MenuGroup:AddButton('Test Notification',function()
Notify(loadstring(base64decode("SGVsbG8gV29ybGQ="))(),2)
end)
MenuGroup:AddDropdown(loadstring(base64decode("TGlicmFyeQ=="))(), {
Values = { loadstring(base64decode("T2JzaWRpYW4="))(), loadstring(base64decode("TGlub3JpYQ=="))() },
Default = 2,
Text = loadstring(base64decode("TGlicmFyeQ=="))(),
Callback = function(Value)
getgenv().ScriptLibrary = tostring(Value)
Notify('Please Unload Script and Execute Again to Take Effect',4)
end,
})
MenuGroup:AddDivider()
MenuGroup:AddDropdown(loadstring(base64decode("RFBJRHJvcGRvd24="))(), {
Values = { loadstring(base64decode("NTAl"))(), loadstring(base64decode("NzUl"))(), loadstring(base64decode("MTAwJQ=="))(), loadstring(base64decode("MTI1JQ=="))(), loadstring(base64decode("MTUwJQ=="))(), loadstring(base64decode("MTc1JQ=="))(), loadstring(base64decode("MjAwJQ=="))() },
Default = loadstring(base64decode("MTAwJQ=="))(),
Text = loadstring(base64decode("RFBJIFNjYWxl"))(),
Callback = function(Value)
Value = Value:gsub(loadstring(base64decode("JSU="))(), loadstring(base64decode(""))())
local DPI = tonumber(Value)
Library:SetDPIScale(DPI)
end,
})
UtilityBox:AddButton({
Text = loadstring(base64decode("VW5sb2FkIEh1Yg=="))(),
Func = function()
LocalPlayer:SetAttribute(loadstring(base64decode("Tm92YUxvYWRlZA=="))(), nil)
if Library.KeybindFrame then
local pos = Library.KeybindFrame.Position
getgenv().NovaHub_KeybindPos = { pos.X.Scale, pos.X.Offset, pos.Y.Scale, pos.Y.Offset }
end
for _, con in pairs(Connections) do con:Disconnect() end
Library:Unload()
ESPLibrary:Unload()
end
})
if ThemeManager then
ThemeManager:SetLibrary(Library)
ThemeManager:SetFolder(loadstring(base64decode("Tm92YUh1Yg=="))())
end
if SaveManager then
SaveManager:SetLibrary(Library)
SaveManager:IgnoreThemeSettings()
SaveManager:SetIgnoreIndexes({'MenuKeybind'})
SaveManager:SetFolder(loadstring(base64decode("Tm92YUh1Yi9ET09SU0xPQkJZ"))())
SaveManager:BuildConfigSection(Tabs['Settings'])
end
if ThemeManager then
ThemeManager:ApplyToTab(Tabs['Settings'])
end
Notify(loadstring(base64decode("U3VjY2Vzc2Z1bGx5IExvYWRlZCBmb3IgR2FtZSB8ICBET09SUyBMb2JieSA="))(),4)
else
local function GetDistanceToPlayer(Pos)
local DisA = LocalPlayer.Character and LocalPlayer.Character:FindFirstChild(loadstring(base64decode("SHVtYW5vaWRSb290UGFydA=="))()) and LocalPlayer.Character:FindFirstChild(loadstring(base64decode("SHVtYW5vaWRSb290UGFydA=="))()).Position or workspace.CurrentCamera and workspace.CurrentCamera.CFrame.Position or Vector3.new(0, 0, 0)
local Dis = (DisA - Pos).Magnitude
return Dis
end
local PathFolder = Instance.new(loadstring(base64decode("Rm9sZGVy"))(),workspace)
PathFolder.Name = loadstring(base64decode("UGF0aEZvbGRlcg=="))()
function PathTo(Pos)
local Character = LocalPlayer.Character
local Root = Character and Character:FindFirstChild(loadstring(base64decode("SHVtYW5vaWRSb290UGFydA=="))())
local Humanoid = Character and Character:FindFirstChild(loadstring(base64decode("SHVtYW5vaWQ="))())
if not Root or not Humanoid then return end
local p = PathfindingService:CreatePath({
AgentRadius = 2,
AgentHeight = 5,
AgentCanJump = true,
WaypointSpacing = 2,
AgentCanSprint = false,
AgentMaxSlope = 45,
AgentJumpHeight = 0
})
local AdjustedPos = Pos and Pos +Vector3.new(0, 0, 1)
p:ComputeAsync(Root.Position, AdjustedPos)
if  p.Status ~= Enum.PathStatus.Success then return end
for _, waypoint in ipairs(p:GetWaypoints()) do
if not Toggles.AutoRooms.Value or Library.Unloaded then break end
local Dist = (Root.Position - waypoint.Position).Magnitude
if Dist >= 2 then
Humanoid:MoveTo(waypoint.Position)
Humanoid.MoveToFinished:Wait()
end
end
end
InfCrucfixTable = {
RushMoving = 90,
AmbushMoving = 160,
A60 = 140,
A120 = 99,
GlitchRush = 150,
GlitchAmbush = 110,
}
local Firepp = fireproximityprompt
local Require = require
local ReplicateSignal = replicatesignal or (typeof(replicatesignal) == loadstring(base64decode("ZnVuY3Rpb24="))() and replicatesignal)
local FireTouch = firetouchinterest
local HookMeta = hookmetamethod
local IsNetworkOwner = isnetworkowner
Items = {
[loadstring(base64decode("QmFuZGFnZQ=="))()] = loadstring(base64decode("QmFuZGFnZQ=="))(),
[loadstring(base64decode("Rmxhc2hsaWdodA=="))()] = loadstring(base64decode("Rmxhc2ggbGlnaHQ="))(),
[loadstring(base64decode("QmF0dGVyeQ=="))()] = loadstring(base64decode("QmF0dGVyeQ=="))(),
[loadstring(base64decode("QmF0dGVyeVBhY2s="))()] = loadstring(base64decode("QmF0dGVyeSBQYWNr"))(),
[loadstring(base64decode("U2tlbGV0b25LZXk="))()] = loadstring(base64decode("U2tlbGV0b24gS2V5"))(),
[loadstring(base64decode("Q3J1Y2lmaXg="))()] = loadstring(base64decode("Q3J1Y2lmaXg="))(),
[loadstring(base64decode("U3RyYXBsaWdodA=="))()] = loadstring(base64decode("U3RyYXAgTGlnaHQ="))(),
[loadstring(base64decode("TG9ja3BpY2s="))()] = loadstring(base64decode("TG9ja3BpY2s="))(),
[loadstring(base64decode("QnVsa2xpZ2h0"))()] = loadstring(base64decode("QnVsayBMaWdodA=="))(),
[loadstring(base64decode("Vml0YW1pbnM="))()] = loadstring(base64decode("Vml0YW1pbg=="))(),
[loadstring(base64decode("U2hlYXJz"))()] = loadstring(base64decode("U2hlYXJz"))(),
[loadstring(base64decode("TGFzZXJQb2ludGVy"))()] = loadstring(base64decode("TGFzZXIgUG9pbnRlcg=="))(),
[loadstring(base64decode("Q2FuZGxl"))()] = loadstring(base64decode("Q2FuZGxl"))(),
[loadstring(base64decode("U21vb3RoaWU="))()] = loadstring(base64decode("U21vb3RoaWU="))(),
[loadstring(base64decode("U3Rhckp1Zw=="))()] = loadstring(base64decode("SnVnIG9mIEJvdHRsZQ=="))(),
[loadstring(base64decode("U3RhcmR1c3RQaWNrdXA="))()] = loadstring(base64decode("U3RhcmR1c3Q="))(),
[loadstring(base64decode("Q2hlc3RCb3hMb2NrZWQ="))()] = loadstring(base64decode("TG9ja2VkIENoZXN0"))(),
[loadstring(base64decode("Q2hlc3RCb3g="))()] = loadstring(base64decode("Q2hlc3Q="))(),
[loadstring(base64decode("Q2hlc3RfVmluZQ=="))()] = loadstring(base64decode("Q2hlc3QgVmluZQ=="))(),
[loadstring(base64decode("VG9vbGJveF9Mb2NrZWQ="))()] = loadstring(base64decode("TG9ja2VkIFRvb2xib3g="))(),
[loadstring(base64decode("VG9vbHNoZWRfU21hbGw="))()] = loadstring(base64decode("VG9vbHNoZWQ="))(),
[loadstring(base64decode("VGltZXJMZXZlcg=="))()] = loadstring(base64decode("TGV2ZXI="))(),
[loadstring(base64decode("SG9seUdyZW5hZGU="))()] = loadstring(base64decode("SG9seSBHcmVuYWRl"))(),
[loadstring(base64decode("U2hpZWxkTWluaQ=="))()] = loadstring(base64decode("TWluaSBTaGllbGQ="))(),
[loadstring(base64decode("U2hpZWxkQmln"))()] = loadstring(base64decode("QmlnIFNoaWVsZA=="))(),
[loadstring(base64decode("Q3J1Y2lmaXhXYWxs"))()] = loadstring(base64decode("Q3J1Y2lmaXg="))(),
[loadstring(base64decode("R2xvd3N0aWNrcw=="))()] = loadstring(base64decode("R2xvdyBTdGlja3M="))(),
[loadstring(base64decode("QmFuZGFnZVBhY2s="))()] = loadstring(base64decode("QmFuZGFnZSBQYWNr"))(),
[loadstring(base64decode("QWxhcm1DbG9jaw=="))()] = loadstring(base64decode("QWxhcm0gQ2xvY2s="))(),
[loadstring(base64decode("TW91c2VIb2xl"))()] = loadstring(base64decode("TG91aWUgTW91c2U="))(),
[loadstring(base64decode("U3RhclZpYWw="))()] = loadstring(base64decode("U3RhciBWaWFs"))(),
[loadstring(base64decode("U3RhckJvdHRsZQ=="))()] = loadstring(base64decode("U3RhciBCb3R0bGU="))(),
[loadstring(base64decode("Q29tcGFzcw=="))()] = loadstring(base64decode("Q29tcGFzcw=="))(),
[loadstring(base64decode("TGFudGVybg=="))()] = loadstring(base64decode("TGFudGVybg=="))(),
[loadstring(base64decode("S2V5SXJvbg=="))()] = loadstring(base64decode("SXJvbiBLZXk="))(),
[loadstring(base64decode("R29sZEd1bg=="))()] = loadstring(base64decode("R29sZGVuIEd1bg=="))(),
[loadstring(base64decode("Q2FuZHk="))()] = loadstring(base64decode("Q2FuZHk="))(),
[loadstring(base64decode("V2F0ZXJQdW1w"))()] = loadstring(base64decode("V2F0ZXIgUHVtcA=="))(),
[loadstring(base64decode("VmluZUd1aWxsb3RpbmU="))()] = loadstring(base64decode("VmluZSBMZXZlcg=="))(),
[loadstring(base64decode("U2hha2VsaWdodA=="))()] = loadstring(base64decode("U2hha2UgTGlnaHQ="))(),
[loadstring(base64decode("TGlicmFyeUhpbnRQYXBlcg=="))()] = loadstring(base64decode("SGludCBQYXBlcg=="))(),
[loadstring(base64decode("TG90dXNQZXRhbFBpY2t1cA=="))()] = loadstring(base64decode("TG90dXMgUGV0YWw="))(),
}
local Floor = ReplicatedStorage:WaitForChild(loadstring(base64decode("R2FtZURhdGE="))()):WaitForChild(loadstring(base64decode("Rmxvb3I="))())
local LatestRoom = ReplicatedStorage:WaitForChild(loadstring(base64decode("R2FtZURhdGE="))()):WaitForChild(loadstring(base64decode("TGF0ZXN0Um9vbQ=="))())
local MainGame = LocalPlayer:WaitForChild(loadstring(base64decode("UGxheWVyR3Vp"))()):WaitForChild(loadstring(base64decode("TWFpblVJ"))()).Initiator:WaitForChild(loadstring(base64decode("TWFpbl9HYW1l"))())
local RemoteListener = MainGame:WaitForChild(loadstring(base64decode("UmVtb3RlTGlzdGVuZXI="))())
local RequiredMainGame
local ClientModules = ReplicatedStorage:FindFirstChild(loadstring(base64decode("TW9kdWxlc0NsaWVudA=="))()) or ReplicatedStorage:FindFirstChild(loadstring(base64decode("Q2xpZW50TW9kdWxlcw=="))())
local RemotesFolder = ReplicatedStorage:FindFirstChild(loadstring(base64decode("RW50aXR5SW5mbw=="))()) and ReplicatedStorage:FindFirstChild(loadstring(base64decode("RW50aXR5SW5mbw=="))())  or ReplicatedStorage:FindFirstChild(loadstring(base64decode("QnJpY2tz"))())  and ReplicatedStorage:FindFirstChild(loadstring(base64decode("QnJpY2tz"))()) or ReplicatedStorage:FindFirstChild(loadstring(base64decode("UmVtb3Rlc0ZvbGRlcg=="))())
local MotorReplication = RemotesFolder:WaitForChild(loadstring(base64decode("TW90b3JSZXBsaWNhdGlvbg=="))())
local CollisionClone
local CamLock = RemotesFolder:WaitForChild(loadstring(base64decode("Q2FtTG9jaw=="))())
local AnchorArgs
local PL = RemotesFolder:WaitForChild(loadstring(base64decode("UEw="))())
local ClutchHeartbeat = RemotesFolder:WaitForChild(loadstring(base64decode("Q2x1dGNoSGVhcnRiZWF0"))())
local params = RaycastParams.new()
params.FilterDescendantsInstances = {LocalPlayer.Character}
local  SeekPath = Instance.new(loadstring(base64decode("Rm9sZGVy"))(),workspace)
SeekPath.Name = loadstring(base64decode("U2Vla1BhdGg="))()
function ShowSeekPath(v)
local Part = Instance.new(loadstring(base64decode("UGFydA=="))(), SeekPath)
Part.Size = Vector3.new(1.5, 1.5, 1.5)
Part.Anchored = true
Part.Shape = loadstring(base64decode("QmFsbA=="))()
Part.Position = v.Position
Part.CanCollide = false
Part.Color = Color3.new(0, 1, 0)
Debris:AddItem(Part, 60)
end
function FixBridge(v)
for _, i in pairs(v:GetChildren()) do
if i.Name == loadstring(base64decode("UGxheWVyQmFycmllcg=="))() and i.Rotation.X == 180 then
local Barrier = i:Clone()
Barrier.CFrame = CFrame.new(i.Position.X, i.Position.Y, i.Position.Z)
Barrier.CFrame = Barrier.CFrame * CFrame.new(0, -7, 0)
Barrier.Size = Vector3.new(40, 0.1, 40)
Barrier.Transparency = 0.5
Barrier.Color = Color3.new(0.5, 0, 0.5)
Barrier.Material = loadstring(base64decode("Rm9yY2VGaWVsZA=="))()
Barrier.Parent = v
Barrier.Name = loadstring(base64decode("QnJpZGdlQmFycmllcg=="))()
Barrier.Anchored = true
Barrier.CanCollide = true
end
end
end
if Require then
RequiredMainGame = require(MainGame)
end
local getcons = getconnections or get_signal_cons or get_relative_connections
if getcons then
for _, con in pairs(getcons(LocalPlayer.Idled)) do
if con.Disable then
con:Disable()
end
end
end
table.insert(Connections,LocalPlayer.CharacterAdded:Connect(function()
task.wait(1.5)
if LocalPlayer.Character then
MainGame = LocalPlayer.PlayerGui.MainUI.Initiator:WaitForChild(loadstring(base64decode("TWFpbl9HYW1l"))())
RemoteListener = MainGame.RemoteListener
params.FilterDescendantsInstances = {LocalPlayer.Character}
if Toggles.NoScenes.Value then
local Cutscene = RemoteListener:FindFirstChild(loadstring(base64decode("Q3V0c2NlbmVz"))()) or RemoteListener:FindFirstChild(loadstring(base64decode("Q3V0c2NlbmVzXw=="))())
Cutscene.Name = loadstring(base64decode("Q3V0c2NlbmVzXw=="))()
end
if Require then
RequiredMainGame = require(MainGame)
end
end
if Toggles.Jamming.Value then
if  ReplicatedStorage:FindFirstChild(loadstring(base64decode("TGl2ZU1vZGlmaWVycw=="))()) and ReplicatedStorage:FindFirstChild(loadstring(base64decode("TGl2ZU1vZGlmaWVycw=="))()):FindFirstChild(loadstring(base64decode("SmFtbWlu"))()) then
local Jam = LocalPlayer.PlayerGui.MainUI.Initiator:FindFirstChild(loadstring(base64decode("TWFpbl9HYW1l"))()).Health.Jam
Jam.Playing = false
local Jamming = game:GetService(loadstring(base64decode("U291bmRTZXJ2aWNl"))()).Main.Jamming
Jamming.Enabled =  false
end
end
if Toggles.Godmode.Value and RemotesFolder.Name ~= loadstring(base64decode("UmVtb3Rlc0ZvbGRlcg=="))() then
LocalPlayer.Character.Collision.Position -= Vector3.new(0, 4, 0)
end
if Toggles.Dread.Value then
local Dread = LocalPlayer:FindFirstChild(loadstring(base64decode("RHJlYWQ="))(),true) or LocalPlayer:FindFirstChild(loadstring(base64decode("X0RyZWFk"))(),true)
if Dread then
Dread.Name = loadstring(base64decode("X0RyZWFk"))()
end
end
if Toggles.Halt.Value then
local Dread = ClientModules.EntityModules:FindFirstChild(loadstring(base64decode("U2hhZGU="))(),true) or ClientModules.EntityModules:FindFirstChild(loadstring(base64decode("X1NoYWRl"))(),true)
if Dread then
Dread.Name = loadstring(base64decode("X1NoYWRl"))()
end
end
end))
-- ===== Заглушки вкладок Player / Bypass / Visuals / Floor (вкладки удалены) =====
-- Все опции этих вкладок продолжают существовать внутри Library.Toggles / Library.Options
-- со значениями по умолчанию, но не имеют UI: код, который их читает, не падает.
-- Если тело хаба создаёт опцию с тем же флагом, оно перезаписывает заглушку реальным тогглом.
local function StubOption(OptionType, Flag, Info)
	Info = Info or {}
	Flag = tostring(Flag or Info.Flag or Info.Text or (loadstring(base64decode("U3R1Yl8="))() .. OptionType .. loadstring(base64decode("Xw=="))() .. tostring(math.random(1, 1e9))))
	local Default
	if OptionType == loadstring(base64decode("Q29sb3JQaWNrZXI="))() then
		Default = Info.DefaultColor or Info.Default or Color3.fromRGB(255, 255, 255)
	elseif OptionType == loadstring(base64decode("U2xpZGVy"))() then
		Default = Info.Default or Info.Min or 0
	else
		Default = Info.Default
	end
	local Node = {
		Type = OptionType,
		Flag = Flag,
		Text = Info.Text or Flag,
		Value = Default,
		Min = Info.Min,
		Max = Info.Max,
		Values = Info.Values or {},
		Default = Default,
		IsStub = true,
	}
	Node.Callbacks = {}
	if type(Info.Callback) == loadstring(base64decode("ZnVuY3Rpb24="))() then
		table.insert(Node.Callbacks, Info.Callback)
	end
	if OptionType == loadstring(base64decode("S2V5UGlja2Vy"))() then
		Node.Value = Enum.KeyCode.Unknown
		Node.State = false
	else
		Node.State = Default
	end
	function Node:OnChanged(Callback)
		if type(Callback) == loadstring(base64decode("ZnVuY3Rpb24="))() then
			table.insert(self.Callbacks, Callback)
		end
		self.Connection = Callback
		return self
	end
	function Node:SetValue(NewValue, NoCallback)
		self.Value = NewValue
		if self.Type ~= loadstring(base64decode("S2V5UGlja2Vy"))() then
			self.State = NewValue
		end
		if not NoCallback then
			for _, Callback in ipairs(self.Callbacks or {}) do
				pcall(Callback, NewValue)
			end
		end
	end
	Node.Set = Node.SetValue
	function Node:SetValues(NewValues) self.Values = NewValues or {} end
	function Node:GetState() return self.State end
	function Node:SetText() end
	function Node:SetMax(Max) self.Max = Max end
function Node:SetMin(Min) self.Min = Min end
	function Node:AddToggle(Flag, Info)
		if type(Flag) == loadstring(base64decode("dGFibGU="))() then Info, Flag = Flag, Flag.Flag end
		return StubOption(loadstring(base64decode("VG9nZ2xl"))(), Flag, Info)
	end
	function Node:AddSlider(Flag, Info)
		if type(Flag) == loadstring(base64decode("dGFibGU="))() then Info, Flag = Flag, Flag.Flag end
		return StubOption(loadstring(base64decode("U2xpZGVy"))(), Flag, Info)
	end
	function Node:AddDropdown(Flag, Info)
		if type(Flag) == loadstring(base64decode("dGFibGU="))() then Info, Flag = Flag, Flag.Flag end
		return StubOption(loadstring(base64decode("RHJvcGRvd24="))(), Flag, Info)
	end
	function Node:AddColorPicker(Flag, Info)
		if type(Flag) == loadstring(base64decode("dGFibGU="))() then Info, Flag = Flag, Flag.Flag end
		return StubOption(loadstring(base64decode("Q29sb3JQaWNrZXI="))(), Flag, Info)
	end
	function Node:AddKeyPicker(Flag, Info)
		if type(Flag) == loadstring(base64decode("dGFibGU="))() then Info, Flag = Flag, Flag.Flag end
		return StubOption(loadstring(base64decode("S2V5UGlja2Vy"))(), Flag, Info)
	end
	function Node:AddInput(Flag, Info)
		if type(Flag) == loadstring(base64decode("dGFibGU="))() then Info, Flag = Flag, Flag.Flag end
		return StubOption(loadstring(base64decode("SW5wdXQ="))(), Flag, Info)
	end
	if Library.Options[Flag] == nil then
		Library.Options[Flag] = Node
		if OptionType == loadstring(base64decode("VG9nZ2xl"))() then
			Library.Toggles[Flag] = Node
		end
	end
	return Node
end
local function StubGroup()
	local Group = {}
	local Kinds = {
		AddToggle = loadstring(base64decode("VG9nZ2xl"))(),
		AddSlider = loadstring(base64decode("U2xpZGVy"))(),
		AddDropdown = loadstring(base64decode("RHJvcGRvd24="))(),
		AddColorPicker = loadstring(base64decode("Q29sb3JQaWNrZXI="))(),
		AddKeyPicker = loadstring(base64decode("S2V5UGlja2Vy"))(),
		AddInput = loadstring(base64decode("SW5wdXQ="))(),
	}
	for Method, Kind in pairs(Kinds) do
		Group[Method] = function(_, Flag, Info)
			if type(Flag) == loadstring(base64decode("dGFibGU="))() then
				Info, Flag = Flag, Flag.Flag
			end
			return StubOption(Kind, Flag, Info)
		end
	end
	function Group:AddButton(...) return { SetText = function() end } end
	function Group:AddLabel(_, Text) return { Text = Text, SetText = function() end } end
	function Group:AddDivider() return end
	return Group
end
local function StubTab(TabName)
	local Tab = { Name = TabName }
	Tab.AddLeftGroupbox = function(_, Title) return StubGroup() end
	Tab.AddRightGroupbox = function(_, Title) return StubGroup() end
	Tab.UpdateWarningBox = function() end
	return Tab
end
-- ===== Конец заглушек =====

-- ===== Мост: заглушки базы -> реальные опции тела =====
local BridgeAliases = {
	NoClip = loadstring(base64decode("Tm9jbGlwVG9nZ2xl"))(),
	Flight = loadstring(base64decode("Rmx5VG9nZ2xl"))(),
	FlightSpeed = loadstring(base64decode("Rmx5U3BlZWQ="))(),
	InfJump = loadstring(base64decode("SW5maW5pdGVKdW1wcw=="))(),
	EnableJump = loadstring(base64decode("RW5hYmxlQ2hhcmFjdGVySnVtcA=="))(),
	FOV = loadstring(base64decode("RmllbGRPZlZpZXc="))(),
}
table.insert(Connections, RunService.Heartbeat:Connect(function()
	for BaseFlag, BodyFlag in pairs(BridgeAliases) do
		local Real, Stub = Options[BodyFlag], Options[BaseFlag]
		if Real and Stub and Stub.IsStub then
			local NewValue = Real.Value
			if BaseFlag == loadstring(base64decode("Rk9W"))() and Toggles.FOVToggle and not Toggles.FOVToggle.Value then
				NewValue = 70
			end
			if Stub.Value ~= NewValue then
				Stub.Value = NewValue
				if Stub.Type ~= loadstring(base64decode("S2V5UGlja2Vy"))() then
					Stub.State = NewValue
				end
				for _, Callback in ipairs(Stub.Callbacks or {}) do
					pcall(Callback, NewValue)
				end
			end
		end
	end
end))
local Tabs = {
	Main = StubTab('Player'),
	Bypass = StubTab('Bypass'),
	Visuals = StubTab('Visuals'),
	Floor = StubTab('Floor'),
	Settings = Window:AddTab('Settings',loadstring(base64decode("c2V0dGluZ3M="))()),
}
local PlayerBox = Tabs.Main:AddLeftGroupbox('Player')
local GameBox = Tabs.Main:AddLeftGroupbox('Game Management')
local HotelFloor = Tabs.Floor:AddLeftGroupbox('Hotel')
local MinesFloor = Tabs.Floor:AddRightGroupbox('Mines')
local FoolsFloor = Tabs.Floor:AddRightGroupbox('Fools')
local RoomsFloor = Tabs.Floor:AddLeftGroupbox('Rooms')
local RetroFloor = Tabs.Floor:AddLeftGroupbox('Retro')
local AutoBox = Tabs.Main:AddRightGroupbox('Auto')
local ReachBox = Tabs.Main:AddRightGroupbox('Reach')
local CameraBox = Tabs.Visuals:AddLeftGroupbox('Camera')
local LightingBox = Tabs.Visuals:AddLeftGroupbox('Lighting')
local ESPBox = Tabs.Visuals:AddRightGroupbox('ESP')
local ESPSettings = Tabs.Visuals:AddRightGroupbox('Settings')
local NotifyBox = Tabs.Visuals:AddRightGroupbox('Notifying')
local BypassEntityBox = Tabs.Bypass:AddLeftGroupbox('Bypass Entities')
local BypassBox = Tabs.Bypass:AddRightGroupbox('Bypass')
RetroFloor:AddToggle('AntiLava',{
Text = loadstring(base64decode("QW50aSBMYXZh"))(),
Default = false,
Callback = function(Value)
for _, v in pairs(workspace.CurrentRooms:GetDescendants()) do
if v.Name == loadstring(base64decode("TGF2YQ=="))() then
v.CanTouch = not Value
end
end
end
})
FoolsFloor:AddToggle('AntiBanana',{
Text = loadstring(base64decode("QW50aSBCYW5hbmE="))(),
Default = false,
Callback = function(Value)
for _, v in pairs(workspace:GetChildren()) do
if v.Name == loadstring(base64decode("QmFuYW5hUGVlbA=="))() then
v.CanTouch = not Value
end
end
end
})
FoolsFloor:AddToggle('AntiJeff',{
Text = loadstring(base64decode("QW50aSBKZWZm"))(),
Default = false,
Callback = function(Value)
local v = workspace:FindFirstChild(loadstring(base64decode("SmVmZlRoZUtpbGxlcg=="))())
if v.Name == loadstring(base64decode("SmVmZlRoZUtpbGxlcg=="))() then
repeat task.wait() until v.PrimaryPart and isnetworkowner(v.PrimaryPart)
for _, i in pairs(v:GetChildren()) do
if i:IsA(loadstring(base64decode("QmFzZVBhcnQ="))()) then
i.CanTouch = Value and false or true
end
end
v.Humanoid.Health = Value and 0 or 100
end
end
})
GameBox:AddButton({
Text = loadstring(base64decode("UmV2aXZl"))(),
DoubleClick = true,
Func = function()
RemotesFolder.Revive:FireServer()
end
})
GameBox:AddButton({
Text = loadstring(base64decode("UGxheSBBZ2Fpbg=="))(),
DoubleClick = true,
Func = function()
RemotesFolder.PlayAgain:FireServer()
end
})
local Pressed = false
GameBox:AddButton({
Text = loadstring(base64decode("UmVzZXQ="))(),
DoubleClick = true,
Func = function()
Pressed = not Pressed
if not Pressed then
if RemotesFolder:FindFirstChild(loadstring(base64decode("VW5kZXJ3YXRlcg=="))()) then
RemotesFolder.Underwater:FireServer(false)
end
return
end
if ReplicateSignal then
replicatesignal(LocalPlayer.Kill)
else
Notify(loadstring(base64decode("RG91YmxlIENsaWNrIHRvIHN0b3A="))(), 5)
task.spawn(function()
while Pressed and LocalPlayer:GetAttribute(loadstring(base64decode("QWxpdmU="))()) ~= false do
if RemotesFolder:FindFirstChild(loadstring(base64decode("VW5kZXJ3YXRlcg=="))()) then
RemotesFolder.Underwater:FireServer(true)
end
task.wait()
end
if RemotesFolder:FindFirstChild(loadstring(base64decode("VW5kZXJ3YXRlcg=="))()) then
RemotesFolder.Underwater:FireServer(false)
end
Pressed = false
end)
end
end
})
GameBox:AddButton({
Text = loadstring(base64decode("TG9iYnk="))(),
DoubleClick = true,
Func = function()
RemotesFolder.Lobby:FireServer()
end
})
FoolsFloor:AddToggle('InfRevive',{
Text = loadstring(base64decode("SW5maW5pdGUgUmV2aXZl"))(),
Default = false
})
FoolsFloor:AddToggle('DeleteSeekFE',{
Text = loadstring(base64decode("RGVsZXRlIFNlZWsgKEZFKQ=="))(),
Default = false,
Callback = function(Value)
if Value then
for _, v in pairs(workspace.CurrentRooms:GetDescendants()) do
if v.Name == loadstring(base64decode("VHJpZ2dlckV2ZW50Q29sbGlzaW9u"))() then
Notify(loadstring(base64decode("RGVsZXRpbmcgU2Vlaw=="))(),3)
for _, i  in pairs(v:GetChildren()) do
if i.Name == loadstring(base64decode("Q29sbGlzaW9u"))() then
if FireTouch then
firetouchinterest(LocalPlayer.Character.HumanoidRootPart, i, 0)
end
end
end
task.wait(0.5)
if v:FindFirstChild(loadstring(base64decode("Q29sbGlzaW9u"))()) then
Notify(loadstring(base64decode("RmFpbGVkIHRvIHJlbW92ZSBTZWVr"))(), 3)
else
Notify(loadstring(base64decode("RGVsZXRlZCBTZWVrIFN1Y2Nlc3NmdWxseQ=="))(), 3)
end
end
end
end
end
})
RetroFloor:AddToggle('AntiWall',{
Text = loadstring(base64decode("QW50aSBTZWVrV2FsbA=="))(),
Default = false,
Callback = function(Value)
for _, v in pairs(workspace.CurrentRooms:GetDescendants()) do
if v.Name == loadstring(base64decode("U2NhcnlXYWxs"))() then
for _, i in pairs(v:GetChildren()) do
if i:IsA(loadstring(base64decode("QmFzZVBhcnQ="))()) then
i.CanTouch = not Value
end
end
end
end
end
})
RetroFloor:AddToggle('RealBridge',{
Text = loadstring(base64decode("U2hvdyBSZWFsIEJyaWRnZQ=="))(),
Default = false,
Callback = function(Value)
for _, v in pairs(workspace.CurrentRooms:GetDescendants()) do
if v.Name == loadstring(base64decode("QnJpZGdl"))() then
if v.CanCollide == false then
v.Transparency = Value and 1 or 0
end
end
end
end
})
local Figures = {}
MinesFloor:AddToggle('DeleteFigureFE',{
Text = loadstring(base64decode("RGVsZXRlIEZpZ3VyZSAoRkUp"))(),
Default = false,
Callback = function(Value)
for _, v in pairs(workspace.CurrentRooms:GetDescendants()) do
if v.Name == loadstring(base64decode("RmlndXJlUmln"))() or v.Name == loadstring(base64decode("RmlndXJlUmFnZG9sbA=="))() then
table.insert(Figures,v)
end
end
end
})
MinesFloor:AddToggle('ShowPath',{
Text = loadstring(base64decode("U2hvdyBTZWVrIFBhdGg="))(),
Default = false,
Callback = function(Value)
if Value then
for _, v in pairs(workspace.CurrentRooms:GetDescendants()) do
if v.Name == loadstring(base64decode("U2Vla0d1aWRpbmdMaWdodA=="))() then
ShowSeekPath(v)
end
end
else
SeekPath:ClearAllChildren()
end
end
})
MinesFloor:AddToggle('FixBrokenBridge',{
Text = loadstring(base64decode("Rml4IEJyb2tlbiBCcmlkZ2U="))(),
Default = false,
Callback = function(Value)
if Value then
for _, v in pairs(workspace.CurrentRooms:GetDescendants()) do
if v.Name == loadstring(base64decode("QnJpZGdl"))() then
FixBridge(v)
end
end
else
for _, v in pairs(workspace.CurrentRooms:GetDescendants()) do
if v.Name == loadstring(base64decode("QnJpZGdlQmFycmllcg=="))() then
v:Destroy()
end
end
end
end
})
local DuckBoards = {}
local Nodes = {}
if Require then
local Control = require(LocalPlayer.PlayerScripts.PlayerModule):GetControls().GetMoveVector
end
MinesFloor:AddToggle('AutoMinecart',{
Text = loadstring(base64decode("QXV0byBNaW5lY2FydA=="))(),
Risky = true,
Default = false,
Callback = function(Value)
if Value then
for _, v in workspace.CurrentRooms:GetDescendants() do
if v.Name == loadstring(base64decode("RHVja0JvYXJk"))() then
table.insert(DuckBoards, v)
end
if string.find(v.Name, loadstring(base64decode("TWluZWNhcnROb2Rl"))()) then
table.insert(Nodes, v)
end
end
else
require(LocalPlayer.PlayerScripts.PlayerModule):GetControls().GetMoveVector = Control
table.clear(Nodes)
table.clear(DuckBoards)
end
end
})
local Anchors = {}
MinesFloor:AddToggle('AutoAnchorSolver',{
Text = loadstring(base64decode("QXV0byBBbmNob3IgU29sdmVy"))(),
Default = false,
Callback = function(Value)
if Value then
for _, v in pairs(workspace.CurrentRooms:GetDescendants()) do
if v.Name == loadstring(base64decode("TWluZXNBbmNob3I="))() then
table.insert(Anchors,v)
end
end
end
end
})
MinesFloor:AddToggle('AntiSeekFlood',{
Text = loadstring(base64decode("QW50aSBTZWVrIEZsb29k"))(),
Default = false,
Callback = function(Value)
for _, v in pairs(workspace.CurrentRooms:GetDescendants()) do
if v.Name == loadstring(base64decode("U2Vla0Zsb29kbGluZQ=="))() then
v.CanCollide = Value
end
end
end
})
RoomsFloor:AddToggle('AutoRooms',{
Text = loadstring(base64decode("QXV0byBBLTEwMDA="))(),
Default = false,
Callback = function(Value)
if not Value then
PathFolder:ClearAllChildren()
if LocalPlayer.Character then
LocalPlayer.Character.Collision.Size = Vector3.new(5.5,3,3)
LocalPlayer.Character.Humanoid:MoveTo(LocalPlayer.Character.HumanoidRootPart.Position)
PathActive = false
end
end
end
})
if (getrawmetatable or debug.getmetatable) and (setreadonly or make_writeable) and newcclosure then
local getmt = getrawmetatable or debug.getmetatable
local setro = setreadonly or (make_writeable and function(t, b) if b then make_writeable(t) else make_readonly(t) end end)
local mt = getmt(game)
local oldIndex = mt.__index
setro(mt, false)
mt.__index = newcclosure(function(t, k)
if not checkcaller() and k == loadstring(base64decode("TW92ZURpcmVjdGlvbg=="))() and t:IsA(loadstring(base64decode("SHVtYW5vaWQ="))()) then
local char = LocalPlayer.Character
if char and Toggles.AutoRooms.Value and not char:GetAttribute(loadstring(base64decode("SGlkaW5n"))()) then
return Vector3.new(0, 0, 1)
end
end
return oldIndex(t, k)
end)
setro(mt, true)
end
RoomsFloor:AddToggle('IgnoreA60',{
Text = loadstring(base64decode("SWdub3JlIEEtNjA="))(),
})
ESPSettings:AddToggle('ShowDistance',{
Text = loadstring(base64decode("U2hvdyBFU1AgRGlzdGFuY2U="))(),
Default = true,
Callback = function(Value)
ESPLibrary:SetShowDistance(Value)
end
})
ESPSettings:AddToggle('ShowTracers',{
Text = loadstring(base64decode("U2hvdyBFU1AgVHJhY2Vycw=="))(),
Default = false,
Callback = function(Value)
ESPLibrary:SetTracers(Value)
end
})
ESPSettings:AddToggle('ShowRainbow',{
Text = loadstring(base64decode("U2hvdyBFU1AgUmFpbmJvdw=="))(),
Default = false,
Callback = function(Value)
ESPLibrary:SetRainbow(Value)
end
})
ESPSettings:AddDropdown(loadstring(base64decode("U2V0RVNQTW9kZQ=="))(), {
Text = loadstring(base64decode("U2V0IEVTUCBNb2Rl"))(),
Values = {loadstring(base64decode("SGlnaGxpZ2h0L1RleHQ="))(), loadstring(base64decode("VGV4dA=="))(), loadstring(base64decode("SGlnaGxpZ2h0"))()},
Default = 1,
Multi = false,
Callback = function(Value)
ESPLibrary:SetESPMode(Value)
end
})
ESPSettings:AddDropdown(loadstring(base64decode("U2V0Rm9udA=="))(), {
Text = loadstring(base64decode("U2V0IEZvbnQ="))(),
Values = {
loadstring(base64decode("TGVnYWN5"))(), loadstring(base64decode("QXJpYWw="))(), loadstring(base64decode("QXJpYWxCb2xk"))(), loadstring(base64decode("U291cmNlU2Fucw=="))(), loadstring(base64decode("U291cmNlU2Fuc0JvbGQ="))(),
loadstring(base64decode("U291cmNlU2Fuc0xpZ2h0"))(), loadstring(base64decode("U291cmNlU2Fuc0l0YWxpYw=="))(), loadstring(base64decode("Qm9kb25p"))(), loadstring(base64decode("R2FyYW1vbmQ="))(),
loadstring(base64decode("Q2FydG9vbg=="))(), loadstring(base64decode("Q29kZQ=="))(), loadstring(base64decode("SGlnaHdheQ=="))(), loadstring(base64decode("U2NpRmk="))(), loadstring(base64decode("QXJjYWRl"))(), loadstring(base64decode("RmFudGFzeQ=="))(),
loadstring(base64decode("QW50aXF1ZQ=="))(), loadstring(base64decode("R290aGFt"))(), loadstring(base64decode("R290aGFtTWVkaXVt"))(), loadstring(base64decode("R290aGFtQm9sZA=="))(), loadstring(base64decode("R290aGFtQmxhY2s="))(),
loadstring(base64decode("QW1hdGljU0M="))(), loadstring(base64decode("QmFuZ2Vycw=="))(), loadstring(base64decode("Q3JlZXBzdGVy"))(), loadstring(base64decode("RGVua09uZQ=="))(), loadstring(base64decode("RnJlZG9rYU9uZQ=="))(),
loadstring(base64decode("SW5kaWVGbG93ZXI="))(), loadstring(base64decode("THVja2llc3RHdXk="))(), loadstring(base64decode("TWljaHJvbWE="))(), loadstring(base64decode("TnVuaXRv"))(), loadstring(base64decode("T3N3YWxk"))(),
loadstring(base64decode("UGF0cmlja0hhbmQ="))(), loadstring(base64decode("UGVybWFuZW50TWFya2Vy"))(), loadstring(base64decode("Um9ib3Rv"))(), loadstring(base64decode("Um9ib3RvQ29uZGVuc2Vk"))(),
loadstring(base64decode("Um9ib3RvTW9ubw=="))(), loadstring(base64decode("U2FycGFuY2g="))(), loadstring(base64decode("U3BlY2lhbEVsaXRl"))(), loadstring(base64decode("VGl0aWxsaXVtV2Vi"))(), loadstring(base64decode("VWJ1bnR1"))()
},
Default = loadstring(base64decode("TGVnYWN5"))(),
Multi = false,
Callback = function(Value)
ESPLibrary:SetFont(Value)
end
})
task.spawn(function()
task.wait(0.1)
ESPLibrary:SetTracers(false)
ESPLibrary:SetFont(loadstring(base64decode("TGVnYWN5"))())
end)
PlayerBox:AddSlider(loadstring(base64decode("TW92ZW1lbnRTcGVlZA=="))(), {
Text = loadstring(base64decode("TW92ZW1lbnQgU3BlZWQ="))(),
Default = 15,
Min = 15,
Max = 21,
Rounding = 1,
Compact = false,
Callback = function(Value)
end,
Tooltip = loadstring(base64decode("V2Fsa2luZyBTcGVlZA=="))(),
})
PlayerBox:AddToggle('EnableMovementSpeed',{
Text = loadstring(base64decode("RW5hYmxlIE1vdmVtZW50IFNwZWVk"))(),
Default = false,
Callback = function(Value)
if not Value then
LocalPlayer.Character.Humanoid.WalkSpeed = 15
end
end
})
PlayerBox:AddSlider(loadstring(base64decode("Q2xpbWJpbmdTcGVlZA=="))(), {
Text = loadstring(base64decode("Q2xpbWJpbmcgU3BlZWQ="))(),
Default = 15,
Min = 15,
Max = 30,
Rounding = 1,
Compact = false,
Callback = function(Value)
end,
Tooltip = loadstring(base64decode("Q2xpbWJpbmcgU3BlZWQ="))(),
})
PlayerBox:AddToggle('EnableClimbingSpeed',{
Text = loadstring(base64decode("RW5hYmxlIENsaW1iaW5nIFNwZWVk"))(),
Default = false,
Callback = function(Value)
if not Value then
LocalPlayer.Character.Humanoid.WalkSpeed = 15
end
end
})
PlayerBox:AddDivider()
local OldAccel
PlayerBox:AddToggle('NoAcc',{
Text = loadstring(base64decode("Tm8gU2xpcHBpbmc="))(),
Default = false,
Callback = function(Value)
if Value then
OldAccel = LocalPlayer.Character.HumanoidRootPart.CustomPhysicalProperties
else
if OldAccel then
LocalPlayer.Character.HumanoidRootPart.CustomPhysicalProperties = OldAccel
OldAccel = nil
end
end
end
})
PlayerBox:AddToggle('NoClip',{
Text = loadstring(base64decode("Tm8gQ2xpcA=="))(),
Default = false,
Tooltip = loadstring(base64decode("WW91IENhbiBNb3ZlIFRocm91Z2ggV2FsbA=="))(),
Callback = function(Value) end,
}):AddKeyPicker(loadstring(base64decode("Tm9jbGlwS2V5YmluZA=="))(), {
Default = loadstring(base64decode("Tg=="))(), 	SyncToggleState = true,
Mode =loadstring(base64decode("VG9nZ2xl"))() , 
Text = loadstring(base64decode("Tm8gQ2xpcA=="))(), 	NoUI = false, 
Callback = function(Value)
end,
ChangedCallback = function(NewKey, NewModifiers)
end,
})
PlayerBox:AddToggle('Flight',{
Text = loadstring(base64decode("RmxpZ2h0"))(),
Default = false,
Callback = function(Value)
if not Value then
if LocalPlayer.Character.HumanoidRootPart:FindFirstChild(loadstring(base64decode("RmxpZ2h0VmVsb2NpdHk="))()) then
LocalPlayer.Character.HumanoidRootPart:FindFirstChild(loadstring(base64decode("RmxpZ2h0VmVsb2NpdHk="))()):Destroy()
end
end
end
}):AddKeyPicker(loadstring(base64decode("RmxpZ2h0S2V5YmluZA=="))(), {
Default = loadstring(base64decode("Rg=="))(), 	SyncToggleState = true,
Mode =loadstring(base64decode("VG9nZ2xl"))() , 
Text = loadstring(base64decode("RmxpZ2h0"))(), 	NoUI = false, 
Callback = function(Value)
end,
ChangedCallback = function(NewKey, NewModifiers)
end,
})
PlayerBox:AddSlider(loadstring(base64decode("RmxpZ2h0U3BlZWQ="))(), {
Text = loadstring(base64decode("RmxpZ2h0IFNwZWVk"))(),
Default = 15,
Min = 15,
Max = 21,
Rounding = 1,
Compact = false,
Callback = function(Value)
end,
Tooltip = loadstring(base64decode("RmxpZ2h0IFNwZWVk"))(),
})
PlayerBox:AddToggle('EnableJump',{
Text = loadstring(base64decode("RW5hYmxlIEp1bXBpbmc="))(),
Default = false,
Tooltip = loadstring(base64decode("WW91IENhbiBNb3ZlIEp1bXA="))(),
Callback = function(Value)
if not Value then
LocalPlayer.Character:SetAttribute(loadstring(base64decode("Q2FuSnVtcA=="))(),false)
end
end
})
PlayerBox:AddToggle('InstaInteract',{
Text = loadstring(base64decode("SW5zdGFudCBJbnRlcmFjdA=="))(),
Default = false,
Tooltip = loadstring(base64decode("SW50ZXJhY3Rpb25zIGFyZSBJbnN0YW50bHk="))(),
Callback = function(Value)
if Value then
for _, v in ipairs(workspace:GetDescendants()) do
if v:IsA(loadstring(base64decode("UHJveGltaXR5UHJvbXB0"))()) then
v:SetAttribute(loadstring(base64decode("RHVyYXRpb24="))(),v.HoldDuration)
v.HoldDuration = 0
end
end
else
for _, v in ipairs(workspace:GetDescendants()) do
if v:IsA(loadstring(base64decode("UHJveGltaXR5UHJvbXB0"))()) then
v.HoldDuration = v:GetAttribute(loadstring(base64decode("RHVyYXRpb24="))()) or 0
end
end
end
end
})
PlayerBox:AddToggle('InfJump',{
Text = loadstring(base64decode("SW5maW5pdGUgSnVtcA=="))(),
Default = false
})
if UserInputService.KeyboardEnabled then
local d = false
table.insert(Connections, UserInputService.JumpRequest:Connect(function()
if Toggles.InfJump.Value and not d and LocalPlayer.Character then
d = true
LocalPlayer.Character.Humanoid:ChangeState(Enum.HumanoidStateType.Jumping, true)
task.wait(0.1)
d = false
end
end))
elseif UserInputService.TouchEnabled then
table.insert(Connections, LocalPlayer.CharacterAdded:Connect(function()
task.wait(1)
if LocalPlayer.PlayerGui.MainUI.MainFrame.MobileButtons:FindFirstChild(loadstring(base64decode("SnVtcEJ1dHRvbg=="))()) then
table.insert(Connections, LocalPlayer.PlayerGui.MainUI.MainFrame.MobileButtons.JumpButton.MouseButton1Click:Connect(function()
if Toggles.InfJump.Value and LocalPlayer.Character then
LocalPlayer.Character.Humanoid:ChangeState(Enum.HumanoidStateType.Jumping, true)
end
end))
end
end))
if LocalPlayer.PlayerGui.MainUI.MainFrame.MobileButtons:FindFirstChild(loadstring(base64decode("SnVtcEJ1dHRvbg=="))()) then
table.insert(Connections, LocalPlayer.PlayerGui.MainUI.MainFrame.MobileButtons.JumpButton.MouseButton1Click:Connect(function()
if Toggles.InfJump.Value and LocalPlayer.Character then
LocalPlayer.Character.Humanoid:ChangeState(Enum.HumanoidStateType.Jumping, true)
end
end))
end
end
PlayerBox:AddToggle('Godmode',{
Text = loadstring(base64decode("R29kbW9kZQ=="))(),
Default = false,
Tooltip = loadstring(base64decode("Q2FuIExhZ2JhY2sgeW91IG9yIG5vdCB3b3Jr"))(),
Risky  = true,
Callback = function(Value)
if Value and RemotesFolder.Name ~= loadstring(base64decode("UmVtb3Rlc0ZvbGRlcg=="))() then
LocalPlayer.Character.Collision.Position -= Vector3.new(0, 4, 0)
end
if Value and RemotesFolder.Name == loadstring(base64decode("UmVtb3Rlc0ZvbGRlcg=="))() then
LocalPlayer.Character:PivotTo(LocalPlayer.Character.CollisionPart.CFrame * CFrame.new(0, -2,0))
end
if not Value and RemotesFolder.Name == loadstring(base64decode("UmVtb3Rlc0ZvbGRlcg=="))() then
LocalPlayer.Character.Humanoid.HipHeight = 2.4
LocalPlayer.Character.Collision.Size = Vector3.new(5.5, 3, 3)
LocalPlayer.Character.LowerTorso.Root.C1 = CFrame.new(Vector3.new(0, 0, 0))
LocalPlayer.Character.Collision.CollisionCrouch.Size = Vector3.new(5.5, 3, 3)
LocalPlayer.Character:PivotTo(LocalPlayer.Character.CollisionPart.CFrame * CFrame.new(0, 2,0))
end
if not Value and RemotesFolder.Name ~= loadstring(base64decode("UmVtb3Rlc0ZvbGRlcg=="))() then
LocalPlayer.Character.Collision.Position = LocalPlayer.Character.HumanoidRootPart.Position
end
end
}):AddKeyPicker(loadstring(base64decode("R29kbW9kZUtleWJpbmQ="))(), {
Default = loadstring(base64decode("Rw=="))(), 	SyncToggleState = true,
Mode =loadstring(base64decode("VG9nZ2xl"))() , 
Text = loadstring(base64decode("R29kbW9kZQ=="))(), 	NoUI = false, 
Callback = function(Value)
end,
ChangedCallback = function(NewKey, NewModifiers)
end,
})
HidingPlaces = {
[loadstring(base64decode("V2FyZHJvYmU="))()] = loadstring(base64decode("Q2xvc2V0"))(),
[loadstring(base64decode("Um9vbXNfTG9ja2Vy"))()] = loadstring(base64decode("TG9ja2Vy"))(),
[loadstring(base64decode("Um9vbXNfTG9ja2VyX0ZyaWRnZQ=="))()] = loadstring(base64decode("RnJpZGdl"))(),
[loadstring(base64decode("TG9ja2VyX0xhcmdl"))()] = loadstring(base64decode("TG9ja2Vy"))(),
[loadstring(base64decode("QmFja2Rvb3JfV2FyZHJvYmU="))()] = loadstring(base64decode("Q2xvc2V0"))(),
[loadstring(base64decode("QmVk"))()] = loadstring(base64decode("QmVk"))(),
[loadstring(base64decode("RG91YmxlX0JlZA=="))()]  = loadstring(base64decode("RG91YmxlIEJlZA=="))(),
[loadstring(base64decode("VG9vbHNoZWQ="))()] = loadstring(base64decode("Q2xvc2V0"))(),
[loadstring(base64decode("UmV0cm9XYXJkcm9iZQ=="))()] = loadstring(base64decode("Q2xvc2V0"))(),
[loadstring(base64decode("Q2lyY3VsYXJWZW50"))()] = loadstring(base64decode("VmVudA=="))(),
[loadstring(base64decode("QmVk"))()] = loadstring(base64decode("QmVk"))(),
[loadstring(base64decode("RG91YmxlX0JlZA=="))()] = loadstring(base64decode("RG91YmxlX0JlZA=="))(),
}
Closets = {}
AutoBox:AddDivider()
AutoBox:AddToggle('AutoLibraryCode',{
Text = loadstring(base64decode("QXV0byBMaWJyYXJ5IENvZGU="))(),
Default = false,
})
AutoBox:AddToggle('BruteForceLibCode',{
Text = loadstring(base64decode("QnJ1dGVmb3JjZSBMaWJyYXJ5IENvZGU="))(),
Default = false,
})
AutoBox:AddToggle('AutoHeartbeat',{
Text = loadstring(base64decode("QXV0byBIZWFydGJlYXQgTWluaWdhbWU="))(),
Default = false
})
local function Breaker(part)
local label = part:WaitForChild(loadstring(base64decode("U3VyZmFjZUd1aQ=="))()):WaitForChild(loadstring(base64decode("RnJhbWU="))()):WaitForChild(loadstring(base64decode("Q29kZQ=="))())
local function run()
task.wait(0.05)
if not Toggles.AutoBreaker.Value then return end
local target = tonumber(label.Text)
if target then
for _, v in part:GetChildren() do
if v.Name == loadstring(base64decode("QnJlYWtlclN3aXRjaA=="))() and v:GetAttribute(loadstring(base64decode("SUQ="))()) == target then
local trans = part:WaitForChild(loadstring(base64decode("U3VyZmFjZUd1aQ=="))()):WaitForChild(loadstring(base64decode("RnJhbWU="))()):WaitForChild(loadstring(base64decode("Q29kZQ=="))()):WaitForChild(loadstring(base64decode("RnJhbWU="))()).BackgroundTransparency
local pc = v:FindFirstChild(loadstring(base64decode("UHJpc21hdGljQ29uc3RyYWludA=="))())
local light = v:FindFirstChild(loadstring(base64decode("TGlnaHQ="))())
local sound = v:FindFirstChild(loadstring(base64decode("U291bmQ="))())
if trans == 0 then
if v:GetAttribute(loadstring(base64decode("RW5hYmxlZA=="))()) then return end
v:SetAttribute(loadstring(base64decode("RW5hYmxlZA=="))(), true)
if pc then pc.TargetPosition = -0.2 end
if light then
light.Material = Enum.Material.Neon
local spark = light:FindFirstChild(loadstring(base64decode("U3Bhcms="))(), true)
if spark then spark:Emit(1) end
end
if sound then sound:Play() end
elseif trans == 1 then
if not v:GetAttribute(loadstring(base64decode("RW5hYmxlZA=="))()) then return end
v:SetAttribute(loadstring(base64decode("RW5hYmxlZA=="))(), false)
if pc then pc.TargetPosition = 0.2 end
if light then light.Material = Enum.Material.Glass end
if sound then sound:Play() end
end
break
end
end
end
end
label:GetPropertyChangedSignal(loadstring(base64decode("VGV4dA=="))()):Connect(run)
run()
end
AutoBox:AddToggle('AutoBreaker',{
Text = loadstring(base64decode("QXV0byBCcmVha2VyIE1pbmlnYW1l"))(),
Default = false,
Callback = function(Value)
if Value then
for _, v in pairs(workspace.CurrentRooms:GetDescendants()) do
if v.Name == loadstring(base64decode("RWxldmF0b3JCcmVha2Vy"))() then
Breaker(v)
end
end
end
end
})
local OldFogEnd
LightingBox:AddToggle('NoFog',{
Text = loadstring(base64decode("Tm8gRm9n"))(),
Default = false,
Tooltip = loadstring(base64decode("Tm8gZm9n"))(),
Callback = function(Value)
if not Value then
for _, v in pairs(Lighting:GetChildren()) do
if v:IsA(loadstring(base64decode("QXRtb3NwaGVyZQ=="))()) then
v.Density = 0.94
end
end
end
if Value then
OldFogEnd = Lighting.FogEnd
else
if OldFogEnd then
Lighting.FogEnd = OldFogEnd
OldFogEnd = nil
end
end
end
})
LightingBox:AddToggle('FullBright',{
Text = loadstring(base64decode("RnVsbGJyaWdodA=="))(),
Default = false,
Tooltip = loadstring(base64decode("TWFrZSB5b3Ugc2VlIGluIGRhcmtuZXNz"))(),
Callback = function(Value)
if not Value then
Lighting.Ambient = Color3.fromRGB(0, 0, 0)
Lighting.GlobalShadows = true
for _, v in pairs(workspace.CurrentRooms:GetChildren()) do
v:SetAttribute(loadstring(base64decode("QW1iaWVudA=="))(), v:GetAttribute(loadstring(base64decode("T2xkQW1iaWVudA=="))()))
end
end
end
})

for _, v in pairs(workspace.CurrentRooms:GetDescendants()) do
if HidingPlaces[v.Name] then
table.insert(Closets, v)
end
end
ESPHooks = {}
task.spawn(function()
local DoorColor         = Color3.fromRGB(120, 255, 120)
local ItemsColor        = Color3.fromRGB(0, 50, 180)
local HidingPlaceColor  = Color3.fromRGB(255, 255, 255)
local LeverColor        = Color3.fromRGB(150, 150, 150)
local BookColor         = Color3.fromRGB(0, 50, 180)
local BreakerColor      = Color3.fromRGB(0, 50, 180)
local GoldColor         = Color3.fromRGB(255, 255, 0)
local LadderColor       = Color3.fromRGB(0, 191, 255)
local FuseColor         = Color3.fromRGB(255, 170, 0)
local EntityColor       = Color3.new(1, 0, 0)
local DoorActiveESP = {}
local DoorRoomCache = {}
local DoorStringCache = {}
local function RemoveDoorESP(part)
if part and DoorActiveESP[part] then
DoorActiveESP[part] = nil
ESPLibrary:RemoveESP(part)
end
end
local function AddDoorESP(part, txt, color, roomNum)
if not part then return end
local data = DoorActiveESP[part]
if data and data.text == txt then return end
if data then ESPLibrary:RemoveESP(part) end
DoorActiveESP[part] = { text = txt, room = roomNum }
if roomNum then
local bucket = DoorRoomCache[roomNum]
if not bucket then bucket = {} DoorRoomCache[roomNum] = bucket end
table.insert(bucket, part)
end
AddESP(part, txt, color)
end
local function CleanOldDoorRooms(currentRoomNum)
currentRoomNum = tonumber(currentRoomNum) or 0
for roomNum, parts in pairs(DoorRoomCache) do
if roomNum < currentRoomNum or roomNum > (currentRoomNum + 1) then
for i = 1, #parts do RemoveDoorESP(parts[i]) end
DoorRoomCache[roomNum] = nil
end
end
end
local function ClearAllDoorESP()
for part in pairs(DoorActiveESP) do
ESPLibrary:RemoveESP(part)
end
table.clear(DoorActiveESP)
table.clear(DoorRoomCache)
table.clear(DoorStringCache)
end
local function ProcessRoomDoors(roomFolder, roomNum)
if not roomFolder then return end
local doorModel = roomFolder:FindFirstChild(loadstring(base64decode("RG9vcg=="))())
if doorModel then
local doorPart = doorModel:FindFirstChild(loadstring(base64decode("RG9vcg=="))())
if doorPart then
local roomID = doorModel:GetAttribute(loadstring(base64decode("Um9vbUlE"))()) or doorPart:GetAttribute(loadstring(base64decode("Um9vbUlE"))()) or tostring(roomNum)
local cached = DoorStringCache[roomID]
if not cached then
cached = loadstring(base64decode("RG9vciA="))() .. tostring(roomID)
DoorStringCache[roomID] = cached
end
AddDoorESP(doorPart, cached, DoorColor, roomNum)
local boards = doorPart:FindFirstChild(loadstring(base64decode("Q3Jvc3NCb2FyZHM="))())
if boards then AddDoorESP(boards, loadstring(base64decode(""))(), DoorColor, roomNum) end
end
end
for _, v in ipairs(roomFolder:GetDescendants()) do
if v.Name == loadstring(base64decode("S2V5T2J0YWlu"))() then
AddDoorESP(v, loadstring(base64decode("S2V5"))(), DoorColor, roomNum)
elseif v.Name == loadstring(base64decode("RWxlY3RyaWFsS2V5T2J0YWlu"))() then
AddDoorESP(v, loadstring(base64decode("RWxlY3RyaWNhbCBLZXk="))(), DoorColor, roomNum)
end
end
end
local function UpdateDoorESP()
if not (Toggles.Door and Toggles.Door.Value) then return end
local currentRoomNum = tonumber(LocalPlayer:GetAttribute(loadstring(base64decode("Q3VycmVudFJvb20="))())) or 0
CleanOldDoorRooms(currentRoomNum)
local rooms = workspace:FindFirstChild(loadstring(base64decode("Q3VycmVudFJvb21z"))())
if not rooms then return end
ProcessRoomDoors(rooms:FindFirstChild(tostring(currentRoomNum)), currentRoomNum)
ProcessRoomDoors(rooms:FindFirstChild(tostring(currentRoomNum + 1)), currentRoomNum + 1)
end
local ObjectiveActiveESP = {}
local ObjectiveRoomCache = {}
local ObjectiveStringCache = {}
local function RemoveObjectiveESP(part)
if part and ObjectiveActiveESP[part] then
ObjectiveActiveESP[part] = nil
ESPLibrary:RemoveESP(part)
end
end
local function AddObjectiveESP(part, txt, color, roomNum)
if not part then return end
local data = ObjectiveActiveESP[part]
if data and data.text == txt then return end
if data then ESPLibrary:RemoveESP(part) end
ObjectiveActiveESP[part] = { text = txt, room = roomNum }
if roomNum then
local bucket = ObjectiveRoomCache[roomNum]
if not bucket then bucket = {} ObjectiveRoomCache[roomNum] = bucket end
table.insert(bucket, part)
end
AddESP(part, txt, color)
end
local function CleanOldObjectiveRooms(currentRoomNum)
currentRoomNum = tonumber(currentRoomNum) or 0
for roomNum, parts in pairs(ObjectiveRoomCache) do
if roomNum < currentRoomNum or roomNum > (currentRoomNum + 1) then
for i = 1, #parts do RemoveObjectiveESP(parts[i]) end
ObjectiveRoomCache[roomNum] = nil
end
end
end
local function ClearAllObjectiveESP()
for part in pairs(ObjectiveActiveESP) do
ESPLibrary:RemoveESP(part)
end
table.clear(ObjectiveActiveESP)
table.clear(ObjectiveRoomCache)
table.clear(ObjectiveStringCache)
end
local function ProcessRoomObjectives(roomFolder, roomNum)
if not roomFolder then return end
for _, v in ipairs(roomFolder:GetDescendants()) do
local itemName = Items[v.Name]
if itemName then
local cached = ObjectiveStringCache[itemName]
if not cached then
cached = itemName
ObjectiveStringCache[itemName] = cached
end
AddObjectiveESP(v, cached, ItemsColor, roomNum)
elseif v.Name == loadstring(base64decode("TWluZXNBbmNob3I="))() then
local sign = v:FindFirstChild(loadstring(base64decode("U2lnbg=="))())
local label = sign and sign:FindFirstChild(loadstring(base64decode("VGV4dExhYmVs"))())
local text = label and label.Text or loadstring(base64decode(""))()
local key = loadstring(base64decode("QW5jaG9yIA=="))() .. text
local cached = ObjectiveStringCache[key]
if not cached then
cached = key
ObjectiveStringCache[key] = cached
end
AddObjectiveESP(v, cached, ItemsColor, roomNum)
end
end
end
local function UpdateObjectiveESP()
if not (Toggles.Objective and Toggles.Objective.Value) then return end
local currentRoomNum = tonumber(LocalPlayer:GetAttribute(loadstring(base64decode("Q3VycmVudFJvb20="))())) or 0
CleanOldObjectiveRooms(currentRoomNum)
local rooms = workspace:FindFirstChild(loadstring(base64decode("Q3VycmVudFJvb21z"))())
if not rooms then return end
ProcessRoomObjectives(rooms:FindFirstChild(tostring(currentRoomNum)), currentRoomNum)
ProcessRoomObjectives(rooms:FindFirstChild(tostring(currentRoomNum + 1)), currentRoomNum + 1)
end
local HidingPlaceActiveESP = {}
local HidingPlaceRoomCache = {}
local HidingPlaceStringCache = {}
local function RemoveHidingPlaceESP(part)
if part and HidingPlaceActiveESP[part] then
HidingPlaceActiveESP[part] = nil
ESPLibrary:RemoveESP(part)
end
end
local function AddHidingPlaceESP(part, txt, color, roomNum)
if not part then return end
local data = HidingPlaceActiveESP[part]
if data and data.text == txt then return end
if data then ESPLibrary:RemoveESP(part) end
HidingPlaceActiveESP[part] = { text = txt, room = roomNum }
if roomNum then
local bucket = HidingPlaceRoomCache[roomNum]
if not bucket then bucket = {} HidingPlaceRoomCache[roomNum] = bucket end
table.insert(bucket, part)
end
AddESP(part, txt, color)
end
local function CleanOldHidingPlaceRooms(currentRoomNum)
currentRoomNum = tonumber(currentRoomNum) or 0
for roomNum, parts in pairs(HidingPlaceRoomCache) do
if roomNum < currentRoomNum or roomNum > (currentRoomNum + 1) then
for i = 1, #parts do RemoveHidingPlaceESP(parts[i]) end
HidingPlaceRoomCache[roomNum] = nil
end
end
end
local function ClearAllHidingPlaceESP()
for part in pairs(HidingPlaceActiveESP) do
ESPLibrary:RemoveESP(part)
end
table.clear(HidingPlaceActiveESP)
table.clear(HidingPlaceRoomCache)
table.clear(HidingPlaceStringCache)
end
local function ProcessRoomHidingPlaces(roomFolder, roomNum)
if not roomFolder then return end
for _, v in ipairs(roomFolder:GetDescendants()) do
local name = HidingPlaces[v.Name]
if name then
local cached = HidingPlaceStringCache[name]
if not cached then
cached = name
HidingPlaceStringCache[name] = cached
end
AddHidingPlaceESP(v, cached, HidingPlaceColor, roomNum)
end
end
end
local function UpdateHidingPlaceESP()
if not (Toggles.HidingPlace and Toggles.HidingPlace.Value) then return end
local currentRoomNum = tonumber(LocalPlayer:GetAttribute(loadstring(base64decode("Q3VycmVudFJvb20="))())) or 0
CleanOldHidingPlaceRooms(currentRoomNum)
local rooms = workspace:FindFirstChild(loadstring(base64decode("Q3VycmVudFJvb21z"))())
if not rooms then return end
ProcessRoomHidingPlaces(rooms:FindFirstChild(tostring(currentRoomNum)), currentRoomNum)
ProcessRoomHidingPlaces(rooms:FindFirstChild(tostring(currentRoomNum + 1)), currentRoomNum + 1)
end
local GateLeverActiveESP = {}
local GateLeverRoomCache = {}
local GateLeverStringCache = {}
local function RemoveGateLeverESP(part)
if part and GateLeverActiveESP[part] then
GateLeverActiveESP[part] = nil
ESPLibrary:RemoveESP(part)
end
end
local function AddGateLeverESP(part, txt, color, roomNum)
if not part then return end
local data = GateLeverActiveESP[part]
if data and data.text == txt then return end
if data then ESPLibrary:RemoveESP(part) end
GateLeverActiveESP[part] = { text = txt, room = roomNum }
if roomNum then
local bucket = GateLeverRoomCache[roomNum]
if not bucket then bucket = {} GateLeverRoomCache[roomNum] = bucket end
table.insert(bucket, part)
end
AddESP(part, txt, color)
end
local function CleanOldGateLeverRooms(currentRoomNum)
currentRoomNum = tonumber(currentRoomNum) or 0
for roomNum, parts in pairs(GateLeverRoomCache) do
if roomNum < currentRoomNum or roomNum > (currentRoomNum + 1) then
for i = 1, #parts do RemoveGateLeverESP(parts[i]) end
GateLeverRoomCache[roomNum] = nil
end
end
end
local function ClearAllGateLeverESP()
for part in pairs(GateLeverActiveESP) do
ESPLibrary:RemoveESP(part)
end
table.clear(GateLeverActiveESP)
table.clear(GateLeverRoomCache)
table.clear(GateLeverStringCache)
end
local function ProcessRoomGateLevers(roomFolder, roomNum)
if not roomFolder then return end
local cached = GateLeverStringCache[loadstring(base64decode("TGV2ZXI="))()]
if not cached then
cached = loadstring(base64decode("R2F0ZSBMZXZlcg=="))()
GateLeverStringCache[loadstring(base64decode("TGV2ZXI="))()] = cached
end
for _, v in ipairs(roomFolder:GetDescendants()) do
if v.Name == loadstring(base64decode("TGV2ZXJGb3JHYXRl"))() then
AddGateLeverESP(v, cached, LeverColor, roomNum)
end
end
end
local function UpdateGateLeverESP()
if not (Toggles.GateLever and Toggles.GateLever.Value) then return end
local currentRoomNum = tonumber(LocalPlayer:GetAttribute(loadstring(base64decode("Q3VycmVudFJvb20="))())) or 0
CleanOldGateLeverRooms(currentRoomNum)
local rooms = workspace:FindFirstChild(loadstring(base64decode("Q3VycmVudFJvb21z"))())
if not rooms then return end
ProcessRoomGateLevers(rooms:FindFirstChild(tostring(currentRoomNum)), currentRoomNum)
ProcessRoomGateLevers(rooms:FindFirstChild(tostring(currentRoomNum + 1)), currentRoomNum + 1)
end
local BookActiveESP = {}
local BookRoomCache = {}
local BookStringCache = {}
local function RemoveBookESP(part)
if part and BookActiveESP[part] then
BookActiveESP[part] = nil
ESPLibrary:RemoveESP(part)
end
end
local function AddBookESP(part, txt, color, roomNum)
if not part then return end
local data = BookActiveESP[part]
if data and data.text == txt then return end
if data then ESPLibrary:RemoveESP(part) end
BookActiveESP[part] = { text = txt, room = roomNum }
if roomNum then
local bucket = BookRoomCache[roomNum]
if not bucket then bucket = {} BookRoomCache[roomNum] = bucket end
table.insert(bucket, part)
end
AddESP(part, txt, color)
end
local function CleanOldBookRooms(currentRoomNum)
currentRoomNum = tonumber(currentRoomNum) or 0
for roomNum, parts in pairs(BookRoomCache) do
if roomNum < currentRoomNum or roomNum > (currentRoomNum + 1) then
for i = 1, #parts do RemoveBookESP(parts[i]) end
BookRoomCache[roomNum] = nil
end
end
end
local function ClearAllBookESP()
for part in pairs(BookActiveESP) do
ESPLibrary:RemoveESP(part)
end
table.clear(BookActiveESP)
table.clear(BookRoomCache)
table.clear(BookStringCache)
end
local function ProcessRoomBooks(roomFolder, roomNum)
if not roomFolder then return end
if (tonumber(roomNum) or 0) ~= 50 then return end
local cached = BookStringCache[loadstring(base64decode("Qm9vaw=="))()]
if not cached then
cached = loadstring(base64decode("TGlicmFyeSBCb29r"))()
BookStringCache[loadstring(base64decode("Qm9vaw=="))()] = cached
end
for _, v in ipairs(roomFolder:GetDescendants()) do
if v.Name == loadstring(base64decode("TGl2ZUhpbnRCb29r"))() then
AddBookESP(v, cached, BookColor, roomNum)
end
end
end
local function UpdateBookESP()
if not (Toggles.Books and Toggles.Books.Value) then return end
local currentRoomNum = tonumber(LocalPlayer:GetAttribute(loadstring(base64decode("Q3VycmVudFJvb20="))())) or 0
CleanOldBookRooms(currentRoomNum)
local rooms = workspace:FindFirstChild(loadstring(base64decode("Q3VycmVudFJvb21z"))())
if not rooms then return end
ProcessRoomBooks(rooms:FindFirstChild(tostring(currentRoomNum)), currentRoomNum)
ProcessRoomBooks(rooms:FindFirstChild(tostring(currentRoomNum + 1)), currentRoomNum + 1)
end
local BreakerActiveESP = {}
local BreakerRoomCache = {}
local BreakerStringCache = {}
local function RemoveBreakerESP(part)
if part and BreakerActiveESP[part] then
BreakerActiveESP[part] = nil
ESPLibrary:RemoveESP(part)
end
end
local function AddBreakerESP(part, txt, color, roomNum)
if not part then return end
local data = BreakerActiveESP[part]
if data and data.text == txt then return end
if data then ESPLibrary:RemoveESP(part) end
BreakerActiveESP[part] = { text = txt, room = roomNum }
if roomNum then
local bucket = BreakerRoomCache[roomNum]
if not bucket then bucket = {} BreakerRoomCache[roomNum] = bucket end
table.insert(bucket, part)
end
AddESP(part, txt, color)
end
local function CleanOldBreakerRooms(currentRoomNum)
currentRoomNum = tonumber(currentRoomNum) or 0
for roomNum, parts in pairs(BreakerRoomCache) do
if roomNum < currentRoomNum or roomNum > (currentRoomNum + 1) then
for i = 1, #parts do RemoveBreakerESP(parts[i]) end
BreakerRoomCache[roomNum] = nil
end
end
end
local function ClearAllBreakerESP()
for part in pairs(BreakerActiveESP) do
ESPLibrary:RemoveESP(part)
end
table.clear(BreakerActiveESP)
table.clear(BreakerRoomCache)
table.clear(BreakerStringCache)
end
local function ProcessRoomBreakers(roomFolder, roomNum)
if not roomFolder then return end
if (tonumber(roomNum) or 0) ~= 100 then return end
local cached = BreakerStringCache[loadstring(base64decode("QnJlYWtlcg=="))()]
if not cached then
cached = loadstring(base64decode("QnJlYWtlcg=="))()
BreakerStringCache[loadstring(base64decode("QnJlYWtlcg=="))()] = cached
end
for _, v in ipairs(roomFolder:GetDescendants()) do
if v.Name == loadstring(base64decode("TGl2ZUJyZWFrZXJQb2xlUGlja3Vw"))() then
AddBreakerESP(v, cached, BreakerColor, roomNum)
end
end
end
local function UpdateBreakerESP()
if not (Toggles.Breakers and Toggles.Breakers.Value) then return end
local currentRoomNum = tonumber(LocalPlayer:GetAttribute(loadstring(base64decode("Q3VycmVudFJvb20="))())) or 0
CleanOldBreakerRooms(currentRoomNum)
local rooms = workspace:FindFirstChild(loadstring(base64decode("Q3VycmVudFJvb21z"))())
if not rooms then return end
ProcessRoomBreakers(rooms:FindFirstChild(tostring(currentRoomNum)), currentRoomNum)
ProcessRoomBreakers(rooms:FindFirstChild(tostring(currentRoomNum + 1)), currentRoomNum + 1)
end
local GoldActiveESP = {}
local GoldRoomCache = {}
local GoldStringCache = {}
local function RemoveGoldESP(part)
if part and GoldActiveESP[part] then
GoldActiveESP[part] = nil
ESPLibrary:RemoveESP(part)
end
end
local function AddGoldESP(part, txt, color, roomNum)
if not part then return end
local data = GoldActiveESP[part]
if data and data.text == txt then return end
if data then ESPLibrary:RemoveESP(part) end
GoldActiveESP[part] = { text = txt, room = roomNum }
if roomNum then
local bucket = GoldRoomCache[roomNum]
if not bucket then bucket = {} GoldRoomCache[roomNum] = bucket end
table.insert(bucket, part)
end
AddESP(part, txt, color)
end
local function CleanOldGoldRooms(currentRoomNum)
currentRoomNum = tonumber(currentRoomNum) or 0
for roomNum, parts in pairs(GoldRoomCache) do
if roomNum < currentRoomNum or roomNum > (currentRoomNum + 1) then
for i = 1, #parts do RemoveGoldESP(parts[i]) end
GoldRoomCache[roomNum] = nil
end
end
end
local function ClearAllGoldESP()
for part in pairs(GoldActiveESP) do
ESPLibrary:RemoveESP(part)
end
table.clear(GoldActiveESP)
table.clear(GoldRoomCache)
table.clear(GoldStringCache)
end
local function ProcessRoomGold(roomFolder, roomNum)
if not roomFolder then return end
for _, v in ipairs(roomFolder:GetDescendants()) do
if v.Name == loadstring(base64decode("R29sZFBpbGU="))() then
local value = tonumber(v:GetAttribute(loadstring(base64decode("R29sZFZhbHVl"))())) or 0
local cached = GoldStringCache[value]
if not cached then
cached = loadstring(base64decode("R29sZCA="))() .. tostring(value)
GoldStringCache[value] = cached
end
AddGoldESP(v, cached, GoldColor, roomNum)
end
end
end
local function UpdateGoldESP()
if not (Toggles.Gold and Toggles.Gold.Value) then return end
local currentRoomNum = tonumber(LocalPlayer:GetAttribute(loadstring(base64decode("Q3VycmVudFJvb20="))())) or 0
CleanOldGoldRooms(currentRoomNum)
local rooms = workspace:FindFirstChild(loadstring(base64decode("Q3VycmVudFJvb21z"))())
if not rooms then return end
ProcessRoomGold(rooms:FindFirstChild(tostring(currentRoomNum)), currentRoomNum)
ProcessRoomGold(rooms:FindFirstChild(tostring(currentRoomNum + 1)), currentRoomNum + 1)
end
local LadderActiveESP = {}
local LadderRoomCache = {}
local LadderStringCache = {}
local function RemoveLadderESP(part)
if part and LadderActiveESP[part] then
LadderActiveESP[part] = nil
ESPLibrary:RemoveESP(part)
end
end
local function AddLadderESP(part, txt, color, roomNum)
if not part then return end
local data = LadderActiveESP[part]
if data and data.text == txt then return end
if data then ESPLibrary:RemoveESP(part) end
LadderActiveESP[part] = { text = txt, room = roomNum }
if roomNum then
local bucket = LadderRoomCache[roomNum]
if not bucket then bucket = {} LadderRoomCache[roomNum] = bucket end
table.insert(bucket, part)
end
AddESP(part, txt, color)
end
local function CleanOldLadderRooms(currentRoomNum)
currentRoomNum = tonumber(currentRoomNum) or 0
for roomNum, parts in pairs(LadderRoomCache) do
if roomNum < currentRoomNum or roomNum > (currentRoomNum + 1) then
for i = 1, #parts do RemoveLadderESP(parts[i]) end
LadderRoomCache[roomNum] = nil
end
end
end
local function ClearAllLadderESP()
for part in pairs(LadderActiveESP) do
ESPLibrary:RemoveESP(part)
end
table.clear(LadderActiveESP)
table.clear(LadderRoomCache)
table.clear(LadderStringCache)
end
local function ProcessRoomLadders(roomFolder, roomNum)
if not roomFolder then return end
local cached = LadderStringCache[loadstring(base64decode("TGFkZGVy"))()]
if not cached then
cached = loadstring(base64decode("TGFkZGVy"))()
LadderStringCache[loadstring(base64decode("TGFkZGVy"))()] = cached
end
for _, v in ipairs(roomFolder:GetDescendants()) do
if v.Name == loadstring(base64decode("TGFkZGVy"))() then
AddLadderESP(v, cached, LadderColor, roomNum)
end
end
end
local function UpdateLadderESP()
if not (Toggles.Ladder and Toggles.Ladder.Value) then return end
local currentRoomNum = tonumber(LocalPlayer:GetAttribute(loadstring(base64decode("Q3VycmVudFJvb20="))())) or 0
CleanOldLadderRooms(currentRoomNum)
local rooms = workspace:FindFirstChild(loadstring(base64decode("Q3VycmVudFJvb21z"))())
if not rooms then return end
ProcessRoomLadders(rooms:FindFirstChild(tostring(currentRoomNum)), currentRoomNum)
ProcessRoomLadders(rooms:FindFirstChild(tostring(currentRoomNum + 1)), currentRoomNum + 1)
end
local FuseActiveESP = {}
local FuseRoomCache = {}
local FuseStringCache = {}
local function RemoveFuseESP(part)
if part and FuseActiveESP[part] then
FuseActiveESP[part] = nil
ESPLibrary:RemoveESP(part)
end
end
local function AddFuseESP(part, txt, color, roomNum)
if not part then return end
local data = FuseActiveESP[part]
if data and data.text == txt then return end
if data then ESPLibrary:RemoveESP(part) end
FuseActiveESP[part] = { text = txt, room = roomNum }
if roomNum then
local bucket = FuseRoomCache[roomNum]
if not bucket then bucket = {} FuseRoomCache[roomNum] = bucket end
table.insert(bucket, part)
end
AddESP(part, txt, color)
end
local function CleanOldFuseRooms(currentRoomNum)
currentRoomNum = tonumber(currentRoomNum) or 0
for roomNum, parts in pairs(FuseRoomCache) do
if roomNum < currentRoomNum or roomNum > (currentRoomNum + 1) then
for i = 1, #parts do RemoveFuseESP(parts[i]) end
FuseRoomCache[roomNum] = nil
end
end
end
local function ClearAllFuseESP()
for part in pairs(FuseActiveESP) do
ESPLibrary:RemoveESP(part)
end
table.clear(FuseActiveESP)
table.clear(FuseRoomCache)
table.clear(FuseStringCache)
end
local function ProcessRoomFuses(roomFolder, roomNum)
if not roomFolder then return end
for _, v in ipairs(roomFolder:GetDescendants()) do
local n = v.Name
if n == loadstring(base64decode("RnVzZU9idGFpbg=="))() then
AddFuseESP(v, loadstring(base64decode("RnVzZQ=="))(), FuseColor, roomNum)
elseif n == loadstring(base64decode("TWluZXNHZW5lcmF0b3I="))() then
AddFuseESP(v, loadstring(base64decode("R2VuZXJhdG9y"))(), FuseColor, roomNum)
elseif n == loadstring(base64decode("TWluZXNHYXRlQnV0dG9u"))() then
AddFuseESP(v, loadstring(base64decode("R2F0ZSBCdXR0b24="))(), FuseColor, roomNum)
end
end
end
local function UpdateFuseESP()
if not (Toggles.Fuse and Toggles.Fuse.Value) then return end
local currentRoomNum = tonumber(LocalPlayer:GetAttribute(loadstring(base64decode("Q3VycmVudFJvb20="))())) or 0
CleanOldFuseRooms(currentRoomNum)
local rooms = workspace:FindFirstChild(loadstring(base64decode("Q3VycmVudFJvb21z"))())
if not rooms then return end
ProcessRoomFuses(rooms:FindFirstChild(tostring(currentRoomNum)), currentRoomNum)
ProcessRoomFuses(rooms:FindFirstChild(tostring(currentRoomNum + 1)), currentRoomNum + 1)
end
local EntityNear = {
[loadstring(base64decode("U25hcmU="))()] = loadstring(base64decode("U25hcmU="))(),
[loadstring(base64decode("TWFuZHJha2VMaXZl"))()] = loadstring(base64decode("TWFuIERyYWtl"))(),
[loadstring(base64decode("TWFuZHJha2U="))()] = loadstring(base64decode("TWFuIERyYWtl"))(),
[loadstring(base64decode("SmVmZlRoZUtpbGxlcg=="))()] = loadstring(base64decode("SmVmZg=="))(),
[loadstring(base64decode("RXllcw=="))()] = loadstring(base64decode("RXllcw=="))(),
[loadstring(base64decode("TG9va21hbg=="))()] = loadstring(base64decode("RXllcw=="))(),
[loadstring(base64decode("QmFja2Rvb3JMb29rbWFu"))()] = loadstring(base64decode("TG9va21hbg=="))(),
}
local EntityCurrent = {
[loadstring(base64decode("RmlndXJlUmln"))()] = loadstring(base64decode("RmlndXJl"))(),
[loadstring(base64decode("RmlndXJlUmFnZG9sbA=="))()] = loadstring(base64decode("RmlndXJl"))(),
[loadstring(base64decode("R3JvdW5kc2tlZXBlcg=="))()] = loadstring(base64decode("R3JvdW5kIEtlZXBlcg=="))(),
[loadstring(base64decode("TGl2ZUVudGl0eUJyYW1ibGU="))()] = loadstring(base64decode("QnJhbWJsZQ=="))(),
}
local EntityGlobal = {
[loadstring(base64decode("UnVzaE1vdmluZw=="))()] = loadstring(base64decode("UnVzaA=="))(),
[loadstring(base64decode("QW1idXNoTW92aW5n"))()] = loadstring(base64decode("QW1idXNo"))(),
[loadstring(base64decode("QTYw"))()] = loadstring(base64decode("QS02MA=="))(),
[loadstring(base64decode("QTEyMA=="))()] = loadstring(base64decode("QS0xMjA="))(),
[loadstring(base64decode("R2xpdGNoUnVzaA=="))()] = loadstring(base64decode("R2xpdGNoIFJ1c2g="))(),
[loadstring(base64decode("R2xpdGNoQW1idXNo"))()] = loadstring(base64decode("R2xpdGNoIEFtYnVzaA=="))(),
[loadstring(base64decode("QmFja2Rvb3JSdXNo"))()] = loadstring(base64decode("QmxpdHo="))(),
}
local EntityRoom150 = {
[loadstring(base64decode("R3J1bWJsZVJpZw=="))()] = loadstring(base64decode("R3J1bWJsZQ=="))(),
}
local EntityAll = {}
for k, v in pairs(EntityNear) do EntityAll[k] = v end
for k, v in pairs(EntityCurrent) do EntityAll[k] = v end
for k, v in pairs(EntityGlobal) do EntityAll[k] = v end
for k, v in pairs(EntityRoom150) do EntityAll[k] = v end
EntityAll[loadstring(base64decode("RG9vckZha2U="))()] = loadstring(base64decode("RHVwZQ=="))()
EntityAll[loadstring(base64decode("R2lnZ2xlQ2VpbGluZw=="))()] = loadstring(base64decode("R2lnZ2xl"))()
local EntityActiveESP = {}
local EntityRoomCache = {}
local EntityStringCache = {}
local function PrepareEntity(part)
if not part then return false end
if part:IsA(loadstring(base64decode("TW9kZWw="))()) then
if not part.PrimaryPart then
local base = part:FindFirstChildWhichIsA(loadstring(base64decode("QmFzZVBhcnQ="))())
if not base then return false end
part.PrimaryPart = base
end
pcall(function() part.PrimaryPart.Transparency = 0.99 end)
if not part:FindFirstChildOfClass(loadstring(base64decode("SHVtYW5vaWQ="))()) then
Instance.new(loadstring(base64decode("SHVtYW5vaWQ="))(), part)
end
end
if part.Name == loadstring(base64decode("RmlndXJlUmln"))() or part.Name == loadstring(base64decode("RmlndXJlUmFnZG9sbA=="))() then
local root = part:FindFirstChild(loadstring(base64decode("Um9vdA=="))())
if root then root.Size = Vector3.new(0.001, 0.001, 0.001) end
end
return true
end
local function RemoveEntityESP(part)
if part and EntityActiveESP[part] then
EntityActiveESP[part] = nil
ESPLibrary:RemoveESP(part)
end
end
local function AddEntityESP(part, txt, color, roomNum)
if not part then return end
local data = EntityActiveESP[part]
if data and data.text == txt then return end
if data then ESPLibrary:RemoveESP(part) end
if not PrepareEntity(part) then return end
local cached = EntityStringCache[txt]
if not cached then
cached = txt
EntityStringCache[txt] = cached
end
EntityActiveESP[part] = { text = cached, room = roomNum }
if roomNum then
local bucket = EntityRoomCache[roomNum]
if not bucket then bucket = {} EntityRoomCache[roomNum] = bucket end
table.insert(bucket, part)
end
AddESP(part, cached, color)
end
local function CleanOldEntityRooms(currentRoomNum)
currentRoomNum = tonumber(currentRoomNum) or 0
for roomNum, parts in pairs(EntityRoomCache) do
if roomNum < currentRoomNum or roomNum > (currentRoomNum + 1) then
for i = 1, #parts do RemoveEntityESP(parts[i]) end
EntityRoomCache[roomNum] = nil
end
end
end
local function ClearAllEntityESP()
for part in pairs(EntityActiveESP) do
ESPLibrary:RemoveESP(part)
end
table.clear(EntityActiveESP)
table.clear(EntityRoomCache)
table.clear(EntityStringCache)
end
local function ProcessRoomEntities(roomFolder, roomNum)
if not roomFolder then return end
roomNum = tonumber(roomNum) or 0
local currentRoomNum = tonumber(LocalPlayer:GetAttribute(loadstring(base64decode("Q3VycmVudFJvb20="))())) or 0
local isCurrent = (roomNum == currentRoomNum)
for _, v in ipairs(roomFolder:GetDescendants()) do
local n = v.Name
local label = EntityNear[n]
if label then
if n ~= loadstring(base64decode("U25hcmU="))() or v:FindFirstChild(loadstring(base64decode("SGl0Ym94"))()) then
AddEntityESP(v, label, EntityColor, roomNum)
end
elseif n == loadstring(base64decode("RG9vckZha2U="))() then
if v.Parent and v.Parent.Name == loadstring(base64decode("U2lkZXJvb21EdXBl"))() then
local fake = v:FindFirstChild(loadstring(base64decode("RG9vcg=="))())
if fake then AddEntityESP(fake, loadstring(base64decode("RHVwZQ=="))(), EntityColor, roomNum) end
end
elseif n == loadstring(base64decode("R2lnZ2xlQ2VpbGluZw=="))() then
if v:FindFirstChild(loadstring(base64decode("SGl0Ym94"))()) then
AddEntityESP(v, loadstring(base64decode("R2lnZ2xl"))(), EntityColor, roomNum)
end
elseif isCurrent then
label = EntityCurrent[n]
if label then
AddEntityESP(v, label, EntityColor, roomNum)
elseif EntityRoom150[n] and currentRoomNum == 150 then
AddEntityESP(v, EntityRoom150[n], EntityColor, roomNum)
end
end
end
end
local function UpdateEntityESP()
if not (Toggles.Entity and Toggles.Entity.Value) then return end
local currentRoomNum = tonumber(LocalPlayer:GetAttribute(loadstring(base64decode("Q3VycmVudFJvb20="))())) or 0
for part in pairs(EntityActiveESP) do
if not part.Parent then RemoveEntityESP(part) end
end
CleanOldEntityRooms(currentRoomNum)
local rooms = workspace:FindFirstChild(loadstring(base64decode("Q3VycmVudFJvb21z"))())
if rooms then
ProcessRoomEntities(rooms:FindFirstChild(tostring(currentRoomNum)), currentRoomNum)
ProcessRoomEntities(rooms:FindFirstChild(tostring(currentRoomNum + 1)), currentRoomNum + 1)
end
for _, v in ipairs(workspace:GetChildren()) do
local n = v.Name
local label = EntityGlobal[n]
if label then
AddEntityESP(v, label, EntityColor, nil)
else
label = EntityNear[n]
if label then
AddEntityESP(v, label, EntityColor, currentRoomNum)
end
end
end
end
local NotifiedEntities = {}
local NotifyNames = {
[loadstring(base64decode("UnVzaE1vdmluZw=="))()] = loadstring(base64decode("UnVzaA=="))(),
[loadstring(base64decode("QW1idXNoTW92aW5n"))()] = loadstring(base64decode("QW1idXNo"))(),
[loadstring(base64decode("QTYw"))()] = loadstring(base64decode("QS02MA=="))(),
[loadstring(base64decode("QTEyMA=="))()] = loadstring(base64decode("QS0xMjA="))(),
[loadstring(base64decode("R2xpdGNoUnVzaA=="))()] = loadstring(base64decode("R2xpdGNoIFJ1c2g="))(),
[loadstring(base64decode("R2xpdGNoQW1idXNo"))()] = loadstring(base64decode("R2xpdGNoIEFtYnVzaA=="))(),
[loadstring(base64decode("RXllcw=="))()] = loadstring(base64decode("RXllcw=="))(),
[loadstring(base64decode("TG9va21hbg=="))()] = loadstring(base64decode("RXllcw=="))(),
[loadstring(base64decode("QmFja2Rvb3JSdXNo"))()] = loadstring(base64decode("QmxpdHo="))(),
[loadstring(base64decode("QmFja2Rvb3JMb29rbWFu"))()] = loadstring(base64decode("TG9va21hbg=="))(),
[loadstring(base64decode("SmVmZlRoZUtpbGxlcg=="))()] = loadstring(base64decode("SmVmZg=="))(),
}
local NotifyOptionKey = {
[loadstring(base64decode("UnVzaE1vdmluZw=="))()] = loadstring(base64decode("UnVzaA=="))(),
[loadstring(base64decode("QW1idXNoTW92aW5n"))()] = loadstring(base64decode("QW1idXNo"))(),
[loadstring(base64decode("QTYw"))()] = loadstring(base64decode("QS02MA=="))(),
[loadstring(base64decode("QTEyMA=="))()] = loadstring(base64decode("QS0xMjA="))(),
[loadstring(base64decode("R2xpdGNoUnVzaA=="))()] = loadstring(base64decode("R2xpdGNoUnVzaA=="))(),
[loadstring(base64decode("R2xpdGNoQW1idXNo"))()] = loadstring(base64decode("R2xpdGNoQW1idXNo"))(),
[loadstring(base64decode("RXllcw=="))()] = loadstring(base64decode("RXllcw=="))(),
[loadstring(base64decode("TG9va21hbg=="))()] = loadstring(base64decode("RXllcw=="))(),
[loadstring(base64decode("QmFja2Rvb3JSdXNo"))()] = loadstring(base64decode("QmxpdHo="))(),
[loadstring(base64decode("QmFja2Rvb3JMb29rbWFu"))()] = loadstring(base64decode("TG9va21hbg=="))(),
[loadstring(base64decode("SmVmZlRoZUtpbGxlcg=="))()] = loadstring(base64decode("SmVmZg=="))(),
}
local function CheckAndNotifyEntity(entity)
if not entity then return end
if NotifiedEntities[entity] then return end
if not (Toggles.NotifySpawn and Toggles.NotifySpawn.Value) then return end
local key = NotifyOptionKey[entity.Name]
if not key then return end
local selected = Options.Notify and Options.Notify.Value
if type(selected) ~= loadstring(base64decode("dGFibGU="))() or not selected[key] then return end
NotifiedEntities[entity] = true
local con
con = entity.AncestryChanged:Connect(function(_, parent)
if not parent then
NotifiedEntities[entity] = nil
if con then con:Disconnect() con = nil end
end
end)
table.insert(Connections, con)
Notify(NotifyNames[entity.Name] .. loadstring(base64decode("IGhhcyBTcGF3bmVk"))(), 5)
end
local function ScanNotifyEntities()
if not (Toggles.NotifySpawn and Toggles.NotifySpawn.Value) then return end
for _, v in ipairs(workspace:GetChildren()) do
if NotifyOptionKey[v.Name] then
CheckAndNotifyEntity(v)
end
end
end
local function UpdateAllESP()
UpdateDoorESP()
UpdateObjectiveESP()
UpdateHidingPlaceESP()
UpdateGateLeverESP()
UpdateBookESP()
UpdateBreakerESP()
UpdateGoldESP()
UpdateLadderESP()
UpdateFuseESP()
UpdateEntityESP()
end
local function ClearAllESP()
ClearAllDoorESP()
ClearAllObjectiveESP()
ClearAllHidingPlaceESP()
ClearAllGateLeverESP()
ClearAllBookESP()
ClearAllBreakerESP()
ClearAllGoldESP()
ClearAllLadderESP()
ClearAllFuseESP()
ClearAllEntityESP()
table.clear(NotifiedEntities)
end
ESPHooks.UpdateAll = UpdateAllESP
ESPHooks.ClearAll = ClearAllESP
ESPHooks.ScanNotify = ScanNotifyEntities
ESPHooks.CheckNotify = CheckAndNotifyEntity
ESPBox:AddToggle('Door', {
Text = loadstring(base64decode("RG9vcg=="))(),
Default = false,
Callback = function(Value)
if Value then task.defer(UpdateDoorESP) else ClearAllDoorESP() end
end
}):AddColorPicker(loadstring(base64decode("Q29sb3JQaWNrZXIy"))(), {
Default = DoorColor,
Title = loadstring(base64decode("RG9vciBFU1AgQ29sb3I="))(),
Callback = function(Value)
DoorColor = Value
if Toggles.Door and Toggles.Door.Value then
ClearAllDoorESP()
task.defer(UpdateDoorESP)
end
end,
})
ESPBox:AddToggle('Objective', {
Text = loadstring(base64decode("T2JqZWN0aXZl"))(),
Default = false,
Callback = function(Value)
if Value then task.defer(UpdateObjectiveESP) else ClearAllObjectiveESP() end
end
}):AddColorPicker(loadstring(base64decode("Q29sb3JQaWNrZXIz"))(), {
Default = ItemsColor,
Title = loadstring(base64decode("T2JqZWN0aXZlIEVTUCBDb2xvcg=="))(),
Callback = function(Value)
ItemsColor = Value
if Toggles.Objective and Toggles.Objective.Value then
ClearAllObjectiveESP()
task.defer(UpdateObjectiveESP)
end
end,
})
ESPBox:AddToggle('HidingPlace', {
Text = loadstring(base64decode("SGlkaW5nIFBsYWNl"))(),
Default = false,
Callback = function(Value)
if Value then task.defer(UpdateHidingPlaceESP) else ClearAllHidingPlaceESP() end
end
}):AddColorPicker(loadstring(base64decode("Q29sb3JQaWNrZXIz"))(), {
Default = HidingPlaceColor,
Title = loadstring(base64decode("SGlkaW5nIFBsYWNlIEVTUCBDb2xvcg=="))(),
Callback = function(Value)
HidingPlaceColor = Value
if Toggles.HidingPlace and Toggles.HidingPlace.Value then
ClearAllHidingPlaceESP()
task.defer(UpdateHidingPlaceESP)
end
end,
})
ESPBox:AddToggle('GateLever', {
Text = loadstring(base64decode("R2F0ZSBMZXZlcg=="))(),
Default = false,
Callback = function(Value)
if Value then task.defer(UpdateGateLeverESP) else ClearAllGateLeverESP() end
end
}):AddColorPicker(loadstring(base64decode("Q29sb3JQaWNrZXIz"))(), {
Default = LeverColor,
Title = loadstring(base64decode("R2F0ZSBMZXZlciBFU1AgQ29sb3I="))(),
Callback = function(Value)
LeverColor = Value
if Toggles.GateLever and Toggles.GateLever.Value then
ClearAllGateLeverESP()
task.defer(UpdateGateLeverESP)
end
end,
})
ESPBox:AddToggle('Books', {
Text = loadstring(base64decode("TGlicmFyeSBCb29r"))(),
Default = false,
Callback = function(Value)
if Value then task.defer(UpdateBookESP) else ClearAllBookESP() end
end
}):AddColorPicker(loadstring(base64decode("Q29sb3JQaWNrZXIz"))(), {
Default = BookColor,
Title = loadstring(base64decode("TGlicmFyeSBFU1AgQ29sb3I="))(),
Callback = function(Value)
BookColor = Value
if Toggles.Books and Toggles.Books.Value then
ClearAllBookESP()
task.defer(UpdateBookESP)
end
end,
})
ESPBox:AddToggle('Breakers', {
Text = loadstring(base64decode("QnJlYWtlcg=="))(),
Default = false,
Callback = function(Value)
if Value then task.defer(UpdateBreakerESP) else ClearAllBreakerESP() end
end
}):AddColorPicker(loadstring(base64decode("Q29sb3JQaWNrZXIz"))(), {
Default = BreakerColor,
Title = loadstring(base64decode("QnJlYWtlciBFU1AgQ29sb3I="))(),
Callback = function(Value)
BreakerColor = Value
if Toggles.Breakers and Toggles.Breakers.Value then
ClearAllBreakerESP()
task.defer(UpdateBreakerESP)
end
end,
})
ESPBox:AddToggle('Gold', {
Text = loadstring(base64decode("R29sZA=="))(),
Default = false,
Callback = function(Value)
if Value then task.defer(UpdateGoldESP) else ClearAllGoldESP() end
end
}):AddColorPicker(loadstring(base64decode("Q29sb3JQaWNrZXIz"))(), {
Default = GoldColor,
Title = loadstring(base64decode("R29sZCBFU1AgQ29sb3I="))(),
Callback = function(Value)
GoldColor = Value
if Toggles.Gold and Toggles.Gold.Value then
ClearAllGoldESP()
task.defer(UpdateGoldESP)
end
end,
})
ESPBox:AddToggle('Entity', {
Text = loadstring(base64decode("RW50aXR5"))(),
Default = false,
Callback = function(Value)
if Value then task.defer(UpdateEntityESP) else ClearAllEntityESP() end
end
}):AddColorPicker(loadstring(base64decode("Q29sb3JQaWNrZXIz"))(), {
Default = EntityColor,
Title = loadstring(base64decode("RW50aXR5IEVTUCBDb2xvcg=="))(),
Callback = function(Value)
EntityColor = Value
if Toggles.Entity and Toggles.Entity.Value then
ClearAllEntityESP()
task.defer(UpdateEntityESP)
end
end,
})
ESPBox:AddToggle('Ladder', {
Text = loadstring(base64decode("TGFkZGVy"))(),
Default = false,
Callback = function(Value)
if Value then task.defer(UpdateLadderESP) else ClearAllLadderESP() end
end
}):AddColorPicker(loadstring(base64decode("Q29sb3JQaWNrZXJMYWRkZXI="))(), {
Default = LadderColor,
Title = loadstring(base64decode("TGFkZGVyIEVTUCBDb2xvcg=="))(),
Callback = function(Value)
LadderColor = Value
if Toggles.Ladder and Toggles.Ladder.Value then
ClearAllLadderESP()
task.defer(UpdateLadderESP)
end
end,
})
ESPBox:AddToggle('Fuse', {
Text = loadstring(base64decode("RnVzZQ=="))(),
Default = false,
Callback = function(Value)
if Value then task.defer(UpdateFuseESP) else ClearAllFuseESP() end
end
}):AddColorPicker(loadstring(base64decode("Q29sb3JQaWNrZXJGdXNl"))(), {
Default = FuseColor,
Title = loadstring(base64decode("RnVzZSBFU1AgQ29sb3I="))(),
Callback = function(Value)
FuseColor = Value
if Toggles.Fuse and Toggles.Fuse.Value then
ClearAllFuseESP()
task.defer(UpdateFuseESP)
end
end,
})
local ESPWatch = {
[loadstring(base64decode("RG9vcg=="))()] = UpdateDoorESP,
[loadstring(base64decode("S2V5T2J0YWlu"))()] = UpdateDoorESP,
[loadstring(base64decode("RWxlY3RyaWFsS2V5T2J0YWlu"))()] = UpdateDoorESP,
[loadstring(base64decode("TWluZXNBbmNob3I="))()] = UpdateObjectiveESP,
[loadstring(base64decode("TGV2ZXJGb3JHYXRl"))()] = UpdateGateLeverESP,
[loadstring(base64decode("TGl2ZUhpbnRCb29r"))()] = UpdateBookESP,
[loadstring(base64decode("TGl2ZUJyZWFrZXJQb2xlUGlja3Vw"))()] = UpdateBreakerESP,
[loadstring(base64decode("R29sZFBpbGU="))()] = UpdateGoldESP,
[loadstring(base64decode("TGFkZGVy"))()] = UpdateLadderESP,
[loadstring(base64decode("RnVzZU9idGFpbg=="))()] = UpdateFuseESP,
[loadstring(base64decode("TWluZXNHZW5lcmF0b3I="))()] = UpdateFuseESP,
[loadstring(base64decode("TWluZXNHYXRlQnV0dG9u"))()] = UpdateFuseESP,
}
table.insert(Connections, LocalPlayer:GetAttributeChangedSignal(loadstring(base64decode("Q3VycmVudFJvb20="))()):Connect(function()
task.defer(UpdateAllESP)
task.defer(ScanNotifyEntities)
end))
table.insert(Connections, workspace.DescendantAdded:Connect(function(v)
local n = v.Name
local fn = ESPWatch[n]
if fn then task.defer(fn) end
if Items[n] then task.defer(UpdateObjectiveESP) end
if HidingPlaces[n] then task.defer(UpdateHidingPlaceESP) end
if EntityAll[n] then
task.defer(UpdateEntityESP)
if NotifyOptionKey[n] then CheckAndNotifyEntity(v) end
end
end))
table.insert(Connections, workspace.ChildAdded:Connect(function(v)
local n = v.Name
if EntityAll[n] then
task.defer(UpdateEntityESP)
if NotifyOptionKey[n] then CheckAndNotifyEntity(v) end
end
end))
table.insert(Connections, workspace.ChildRemoved:Connect(function(v)
if EntityAll[v.Name] then
RemoveEntityESP(v)
end
end))
end)
CameraBox:AddSlider(loadstring(base64decode("Rk9W"))(), {
Text = loadstring(base64decode("Rk9W"))(),
Default = 70,
Min = 70,
Max = 120,
Rounding = 1,
Compact = false,
Callback = function(Value)
end,
Tooltip = loadstring(base64decode("RmllbGQgb2YgVmlldw=="))(),
})
CameraBox:AddDivider()
CameraBox:AddToggle('ThirdPerson',{
Text = loadstring(base64decode("VGhpcmQgUGVyc29u"))(),
Default = false
}):AddKeyPicker(loadstring(base64decode("VGhpcmRwZXJzb25LZXliaW5k"))(), {
Default = loadstring(base64decode("VA=="))(), 	SyncToggleState = true,
Mode = loadstring(base64decode("VG9nZ2xl"))(), 
Text = loadstring(base64decode("VGhpcmQgUGVyc29u"))(), 	NoUI = false, 
Callback = function(Value)
end,
ChangedCallback = function(NewKey, NewModifiers)
end,
})
CameraBox:AddSlider(loadstring(base64decode("WA=="))(), {
Text = loadstring(base64decode("WA=="))(),
Default = 2,
Min = -10,
Max = 10,
Rounding = 1,
Compact = false,
Callback = function(Value)
end,
Tooltip = loadstring(base64decode("WA=="))(),
})
CameraBox:AddSlider(loadstring(base64decode("WQ=="))(), {
Text = loadstring(base64decode("WQ=="))(),
Default = 0,
Min = -10,
Max = 10,
Rounding = 1,
Compact = false,
Callback = function(Value)
end,
Tooltip = loadstring(base64decode("WQ=="))(),
})
CameraBox:AddSlider(loadstring(base64decode("Wg=="))(), {
Text = loadstring(base64decode("Wg=="))(),
Default = 4,
Min = -10,
Max = 10,
Rounding = 1,
Compact = false,
Callback = function(Value)
end,
Tooltip = loadstring(base64decode("Wg=="))(),
})
CameraBox:AddToggle('NoCamShake',{
Text = loadstring(base64decode("Tm8gQ2FtZXJhIFNoYWtl"))(),
Disabled = not require and true or false,
})
local OldMinZoom = LocalPlayer.CameraMinZoomDistance
local OldMaxZoom  = LocalPlayer.CameraMaxZoomDistance
CameraBox:AddToggle('Freecam',{
Text = loadstring(base64decode("RnJlZWNhbQ=="))(),
Default = false,
Callback = function(Value)
if not Value then
local fcPart = workspace:FindFirstChild(loadstring(base64decode("RnJlZWNhbVBhcnQ="))())
if fcPart then
fcPart:Destroy()
local root = LocalPlayer.Character and LocalPlayer.Character:FindFirstChild(loadstring(base64decode("SHVtYW5vaWRSb290UGFydA=="))())
if root then root.Anchored = false end
LocalPlayer.CameraMinZoomDistance = LocalPlayer:GetAttribute(loadstring(base64decode("ZmNfb20="))()) or 0.5
LocalPlayer.CameraMaxZoomDistance = LocalPlayer:GetAttribute(loadstring(base64decode("ZmNfb3g="))()) or 128
end
end
end
}):AddKeyPicker(loadstring(base64decode("RnJlZWNhbUtleWJpbmQ="))(), {
Default = loadstring(base64decode("Qg=="))(), 	SyncToggleState = true,
Mode =loadstring(base64decode("VG9nZ2xl"))() , 
Text = loadstring(base64decode("RnJlZWNhbQ=="))(), 	NoUI = false, 
Callback = function(Value)
end,
ChangedCallback = function(NewKey, NewModifiers)
end,
})
CameraBox:AddToggle('NoScenes',{
Text = loadstring(base64decode("Tm8gQ3V0c2NlbmVz"))(),
Default = false,
Callback = function(Value)
local Cutscene = RemoteListener:FindFirstChild(loadstring(base64decode("Q3V0c2NlbmVz"))()) or RemoteListener:FindFirstChild(loadstring(base64decode("Q3V0c2NlbmVzXw=="))())
if Value then
Cutscene.Name = loadstring(base64decode("Q3V0c2NlbmVzXw=="))()
else
Cutscene.Name = loadstring(base64decode("Q3V0c2NlbmVz"))()
end
end
})
NotifyBox:AddDropdown(loadstring(base64decode("Tm90aWZ5"))(), {
Values = { loadstring(base64decode("UnVzaA=="))(),loadstring(base64decode("QW1idXNo"))(),loadstring(base64decode("R2xpdGNoUnVzaA=="))(),loadstring(base64decode("R2xpdGNoQW1idXNo"))(),loadstring(base64decode("QS02MA=="))(),loadstring(base64decode("QS0xMjA="))(),loadstring(base64decode("RXllcw=="))(),loadstring(base64decode("QmxpdHo="))(),loadstring(base64decode("TG9va21hbg=="))(),loadstring(base64decode("SmVmZg=="))()},
Default = 1, 	Multi = true, 
Text = loadstring(base64decode("Q2hvb3NlIHRvIE5vdGlmeQ=="))(),
Callback = function(Value)
end,
})
NotifyBox:AddToggle('NotifySpawn',{
Text = loadstring(base64decode("Tm90aWZ5IEVudGl0eQ=="))(),
Default = false,
Tooltip = loadstring(base64decode("Tm90aWZ5IEVudGl0eSBJbiBTcGF3bg=="))(),
Callback = function(Value)
if Value and ESPHooks and ESPHooks.ScanNotify then
task.defer(ESPHooks.ScanNotify)
end
end
})
local FakeScreech = Instance.new(loadstring(base64decode("UmVtb3RlRXZlbnQ="))(),RemotesFolder)
FakeScreech.Name = loadstring(base64decode("U2NyZWVjaF8="))()
local FakeA90 = Instance.new(loadstring(base64decode("UmVtb3RlRXZlbnQ="))(),RemotesFolder)
FakeA90.Name = loadstring(base64decode("QTkwXw=="))()
local gotToggled = false
local gotToggled2 = false
BypassEntityBox:AddToggle('Screech',{
Text = loadstring(base64decode("QW50aSBTY3JlZWNoIERhbWFnZQ=="))(),
Default = false,
Callback = function(Value)
if Value then
gotToggled = true
RemotesFolder.Screech.Name = loadstring(base64decode("U2NyZWVjaF8="))()
FakeScreech.Name = loadstring(base64decode("U2NyZWVjaA=="))()
else
if gotToggled then
RemotesFolder[loadstring(base64decode("U2NyZWVjaF8="))()].Name = loadstring(base64decode("U2NyZWVjaA=="))()
FakeScreech.Name = loadstring(base64decode("U2NyZWVjaF8="))()
end
end
end
})
BypassEntityBox:AddToggle('A90',{
Text = loadstring(base64decode("QW50aSBBOTAgRGFtYWdl"))(),
Default = false,
Callback = function(Value)
if Value then
gotToggled2 = true
RemotesFolder.A90.Name = loadstring(base64decode("QTkwXw=="))()
FakeA90.Name = loadstring(base64decode("QTkw"))()
else
if gotToggled2 then
RemotesFolder[loadstring(base64decode("QTkwXw=="))()].Name = loadstring(base64decode("QTkw"))()
FakeA90.Name = loadstring(base64decode("QTkwXw=="))()
end
end
end
})
BypassEntityBox:AddToggle('Dread',{
Text = loadstring(base64decode("QW50aSBEcmVhZA=="))(),
Default = false,
Callback = function(Value)
if Value then
local Dread = LocalPlayer:FindFirstChild(loadstring(base64decode("RHJlYWQ="))(),true) or LocalPlayer:FindFirstChild(loadstring(base64decode("X0RyZWFk"))(),true)
if Dread then
Dread.Name = loadstring(base64decode("X0RyZWFk"))()
end
else
local Dread = LocalPlayer:FindFirstChild(loadstring(base64decode("RHJlYWQ="))(),true) or LocalPlayer:FindFirstChild(loadstring(base64decode("X0RyZWFk"))(),true)
if Dread then
Dread.Name = loadstring(base64decode("RHJlYWQ="))()
end
end
end
})
BypassEntityBox:AddToggle('Halt',{
Text = loadstring(base64decode("QW50aSBIYWx0"))(),
Default = false,
Callback = function(Value)
if Value then
local Dread = ClientModules.EntityModules:FindFirstChild(loadstring(base64decode("U2hhZGU="))(),true) or ClientModules.EntityModules:FindFirstChild(loadstring(base64decode("X1NoYWRl"))(),true)
if Dread then
Dread.Name = loadstring(base64decode("X1NoYWRl"))()
end
else
local Dread = ClientModules.EntityModules:FindFirstChild(loadstring(base64decode("U2hhZGU="))(),true) or ClientModules.EntityModules:FindFirstChild(loadstring(base64decode("X1NoYWRl"))(),true)
if Dread then
Dread.Name = loadstring(base64decode("U2hhZGU="))()
end
end
end
})
BypassEntityBox:AddToggle('Jamming',{
Text = loadstring(base64decode("QW50aSBKYW1taW1n"))(),
Default = false,
Callback = function(Value)
if  ReplicatedStorage:FindFirstChild(loadstring(base64decode("TGl2ZU1vZGlmaWVycw=="))()) and ReplicatedStorage:FindFirstChild(loadstring(base64decode("TGl2ZU1vZGlmaWVycw=="))()):FindFirstChild(loadstring(base64decode("SmFtbWlu"))()) then
local Jam = LocalPlayer.PlayerGui.MainUI.Initiator:FindFirstChild(loadstring(base64decode("TWFpbl9HYW1l"))()).Health.Jam
Jam.Playing = not Value
local Jamming = game:GetService(loadstring(base64decode("U291bmRTZXJ2aWNl"))()).Main.Jamming
Jamming.Enabled =  not Value
end
end
})
local Surge = Instance.new(loadstring(base64decode("UmVtb3RlRXZlbnQ="))(),ReplicatedStorage)
Surge.Name = loadstring(base64decode("U3VyZ2VSZW1vdGU="))()
BypassEntityBox:AddToggle('BypassSurgeDamage',{
Text = loadstring(base64decode("QW50aSBTdXJnZSBEYW1hZ2U="))(),
Default = false,
Callback = function(Value)
if Value then
if RemotesFolder:FindFirstChild(loadstring(base64decode("U3VyZ2VSZW1vdGU="))()) then
RemotesFolder.SurgeRemote.Parent = ReplicatedStorage
Surge.Parent = RemotesFolder
end
else
if RemotesFolder:FindFirstChild(loadstring(base64decode("U3VyZ2VSZW1vdGU="))()) then
ReplicatedStorage.SurgeRemote.Parent = RemotesFolder
Surge.Parent = ReplicatedStorage
end
end
end
})
BypassEntityBox:AddToggle('Snare',{
Text = loadstring(base64decode("QW50aSBTbmFyZQ=="))(),
Default = false,
Callback = function(Value)
for _, v in pairs(workspace.CurrentRooms:GetDescendants()) do
if   v.Name == loadstring(base64decode("U25hcmU="))() then
local wait = 0
repeat task.wait(0.01) wait = wait  + 0.01 until wait > 2 or v:FindFirstChild(loadstring(base64decode("SGl0Ym94"))())
if v:FindFirstChild(loadstring(base64decode("SGl0Ym94"))()) then
v.Hitbox.CanTouch = not Value
end
end
end
end
})
BypassEntityBox:AddToggle('Giggle',{
Text = loadstring(base64decode("QW50aSBHaWdnbGU="))(),
Default = false,
Callback = function(Value)
for _, v in pairs(workspace.CurrentRooms:GetDescendants()) do
if   v.Name == loadstring(base64decode("R2lnZ2xlQ2VpbGluZw=="))() then
local wait = 0
repeat task.wait(0.01) wait = wait  + 0.01 until wait > 2 or v:FindFirstChild(loadstring(base64decode("SGl0Ym94"))())
if v:FindFirstChild(loadstring(base64decode("SGl0Ym94"))()) then
v.Hitbox.CanTouch = not Value
end
end
end
end
})
BypassEntityBox:AddToggle('Dupe',{
Text = loadstring(base64decode("QW50aSBEdXBl"))(),
Default = false,
Callback = function(Value)
for _, v in pairs(workspace.CurrentRooms:GetDescendants()) do
if v.Name == loadstring(base64decode("RG9vckZha2U="))()  and v.Parent.Name == loadstring(base64decode("U2lkZXJvb21EdXBl"))() then
v:WaitForChild(loadstring(base64decode("SGlkZGVu"))(),9e9).CanTouch = not Value
end
end
end
})
BypassBox:AddToggle('BypassSpeed',{
Text = loadstring(base64decode("U3BlZWQgQnlwYXNz"))(),
Default = false,
Callback  = function(Value)
Options.MovementSpeed:SetMax(Value and 75 or 21)
Options.FlightSpeed:SetMax(Value and 75 or 21)
end
})
BypassBox:AddDivider()
BypassBox:AddDropdown(loadstring(base64decode("QW50aUNoZWF0TWFuaU1ldGhvZA=="))(), {
Values = { loadstring(base64decode("VmVsb2NpdHk="))(), loadstring(base64decode("QW50aWNoZWF0"))() },
Default = 1,
Text = loadstring(base64decode("TWFuaXB1bGF0aW9uIE1ldGhvZA=="))(),
Callback = function(Value)
end,
})
BypassBox:AddToggle('AntiCheatMani',{
Text = loadstring(base64decode("TWFuaXB1bGF0aW9u"))(),
Default = false,
Callback = function(Value)
if not Value then
if LocalPlayer.Character.HumanoidRootPart:FindFirstChild(loadstring(base64decode("VmVsb2NpdHlNYW5p"))()) then
LocalPlayer.Character.HumanoidRootPart:FindFirstChild(loadstring(base64decode("VmVsb2NpdHlNYW5p"))()):Destroy()
end
if Toggles.NoclipToggle and Toggles.NoclipToggle.Value then
Toggles.NoclipToggle:SetValue(false)
end
end
end
}):AddKeyPicker(loadstring(base64decode("QW50aUNoZWF0TWFu"))(), {
Default = loadstring(base64decode("Vg=="))(), 	SyncToggleState = true,
Mode = Library.IsMobile and loadstring(base64decode("VG9nZ2xl"))() or loadstring(base64decode("SG9sZA=="))(),  
Text = loadstring(base64decode("IE1hbmlwdWxhdGlvbg=="))(), 	NoUI = false, 
Callback = function(Value)
print(loadstring(base64decode("W2NiXSBLZXliaW5kIGNsaWNrZWQh"))(), Value)
end,
ChangedCallback = function(NewKey, NewModifiers)
end,
})
task.spawn(function()
while task.wait() do
if Library.Unloaded then break end
if Toggles.BypassSpeed.Value then
if CollisionClone then
CollisionClone.Massless = true
end
RemotesFolder.Crouch:FireServer(true, true)
end
end
end)
table.insert(Connections,workspace.ChildAdded:Connect(function(v)
if Toggles.AntiBanana.Value then
if v.Name == loadstring(base64decode("QmFuYW5hUGVlbA=="))() then
v.CanTouch = false
end
end
if Toggles.AntiJeff.Value then
if v.Name == loadstring(base64decode("SmVmZlRoZUtpbGxlcg=="))() then
repeat task.wait() until v.PrimaryPart and isnetworkowner(v.PrimaryPart)
for _, i in pairs(v:GetChildren()) do
if i:IsA(loadstring(base64decode("QmFzZVBhcnQ="))()) then
i.CanTouch = false
end
end
v.Humanoid.Health = 0
end
end
end))
BypassEntityBox:AddToggle('EyesDamage',{
Text = loadstring(base64decode("QW50aSBFeWVzIERhbWFnZQ=="))(),
Default = false
})
BypassEntityBox:AddToggle('LookmanDamage',{
Text = loadstring(base64decode("QW50aSBMb29rbWFuIERhbWFnZQ=="))(),
Default = false
})
BypassEntityBox:AddToggle('GloomEggDamage',{
Text = loadstring(base64decode("QW50aSBHbG9vbSBFZ2c="))(),
Default = false,
Callback = function(Value)
for _, v in pairs(workspace.CurrentRooms:GetDescendants()) do
if v.Name == loadstring(base64decode("R2xvb21FZ2c="))() then
for _, i in pairs(v:GetChildren()) do
if i:IsA(loadstring(base64decode("QmFzZVBhcnQ="))())  then
i.CanTouch = not Value
end
end
end
end
end
})
HotelFloor:AddToggle('NotifyLibraryCode',{
Text = loadstring(base64decode("Tm90aWZ5IExpYnJhcnkgQ29kZQ=="))(),
Default = false,
})
HotelFloor:AddToggle('SeekObf',{
Text = loadstring(base64decode("QW50aSBTZWVrIE9ic3RhY2xlcw=="))(),
Default = false,
Callback = function(Value)
for _, v in pairs(workspace.CurrentRooms:GetDescendants()) do
if v.Name == loadstring(base64decode("U2Vla19Bcm0="))() or v.Name == loadstring(base64decode("Q2hhbmRlbGllck9ic3RydWN0aW9u"))() then
for _, i in pairs(v:GetChildren()) do
if i:IsA(loadstring(base64decode("QmFzZVBhcnQ="))()) then
i.CanTouch = not Value
end
end
end
end
end
})
BypassEntityBox:AddToggle('FigureHearing',{
Text = loadstring(base64decode("QW50aSBGaWd1cmUgSGVhcmluZw=="))(),
Default = false,
Callback = function(Value)
if not Value then
RemotesFolder.Crouch:FireServer(false)
else
RemotesFolder.Crouch:FireServer(true)
end
end
})
BypassEntityBox:AddToggle('AntiLag',{
Text = loadstring(base64decode("QW50aSBMYWcg"))(),
Default = false,
Callback = function(Value)
if Value then
for _, v in workspace.CurrentRooms:GetDescendants() do
if v:IsA(loadstring(base64decode("QmFzZVBhcnQ="))()) then
v:SetAttribute(loadstring(base64decode("TWF0"))(), v.Material)
v.Material = loadstring(base64decode("UGxhc3RpYw=="))()
end
end
else
for _, v in workspace.CurrentRooms:GetDescendants() do
if v:IsA(loadstring(base64decode("QmFzZVBhcnQ="))()) then
if v:GetAttribute(loadstring(base64decode("TWF0"))()) then
v.Material = v:GetAttribute(loadstring(base64decode("TWF0"))()) or loadstring(base64decode("UGxhc3RpYw=="))()
end
end
end
end
end
})
ReachBox:AddToggle('PromptReach',{
Text = loadstring(base64decode("UHJvbXB0IFJlYWNo"))(),
Default = false,
Callback = function(Value)
if Value then
for _, v in pairs(workspace:GetDescendants()) do
if v:IsA(loadstring(base64decode("UHJveGltaXR5UHJvbXB0"))()) then
v:SetAttribute(loadstring(base64decode("UmFuZ2U="))(), v.MaxActivationDistance)
v.MaxActivationDistance = v.MaxActivationDistance * 2
end
end
else
for _, v in pairs(workspace:GetDescendants()) do
if v:IsA(loadstring(base64decode("UHJveGltaXR5UHJvbXB0"))()) then
v.MaxActivationDistance = v:GetAttribute(loadstring(base64decode("UmFuZ2U="))()) or v.MaxActivationDistance
end
end
end
end
})
ReachBox:AddToggle('PromptClip',{
Text = loadstring(base64decode("UHJvbXB0IENsaXA="))(),
Default = false,
Callback = function(Value)
if Value then
for _, v in pairs(workspace:GetDescendants()) do
if v:IsA(loadstring(base64decode("UHJveGltaXR5UHJvbXB0"))()) then
v:SetAttribute(loadstring(base64decode("Q2xpcA=="))(), v.RequiresLineOfSight)
v.RequiresLineOfSight = false
end
end
else
for _, v in pairs(workspace:GetDescendants()) do
if v:IsA(loadstring(base64decode("UHJveGltaXR5UHJvbXB0"))()) then
v.RequiresLineOfSight = v:GetAttribute(loadstring(base64decode("Q2xpcA=="))()) or true
end
end
end
end
})
ReachBox:AddToggle('DoorReach',{
Text = loadstring(base64decode("RG9vciBSZWFjaA=="))(),
Default = false
})
PlayerColor = Color3.fromRGB(150, 150, 150)
ESPBox:AddToggle('Player', {
Text = loadstring(base64decode("UGxheWVy"))(),
Default = false,
Callback = function(Value)
for _, v in pairs(Players:GetPlayers()) do
if v ~= LocalPlayer and v.Character then
ESPLibrary:RemoveESP(v.Character)
if Value then
local hum = v.Character:FindFirstChildOfClass(loadstring(base64decode("SHVtYW5vaWQ="))())
if hum and hum.Health > 0 then
AddESP(v.Character, v.Name .. loadstring(base64decode("IFs="))() .. math.floor((hum.Health / hum.MaxHealth) * 100) .. loadstring(base64decode("JV0="))(), PlayerColor)
end
end
end
end
end
}):AddColorPicker(loadstring(base64decode("Q29sb3JQaWNrZXI5OQ=="))(), {
Default = PlayerColor,
Title = loadstring(base64decode("UGxheWVyIEVTUCBDb2xvcg=="))(),
Callback = function(Value)
PlayerColor = Value
Toggles.Player:SetValue(false)
Toggles.Player:SetValue(true)
end,
})
BypassBox:AddDivider()
BypassBox:AddLabel(loadstring(base64decode("SW5maW5pdGUgQ3J1Y2ZpeCBPbmx5IFdvcmtzIG9uIEEtNjAsIEEtMTIwLCBSdXNoLCBBbWJ1c2guIEhhdmUgYSBjaGFuY2UgdG8gZmFpbA=="))(),true)
BypassBox:AddToggle('InfCrucifix',{
Text = loadstring(base64decode("SW5maW5pdGUgQ3J1Y2lmaXgg"))(),
Risky = true,
})
BypassBox:AddDivider()
local Stored = {}
local Names = {
Lock = true,
ChestBoxLocked = true,
Cellar = true,
Chest_Vine = true,
CuttableVines = true,
SkullLock = true,
Toolbox_Locked = true,
Lock1 = true,
Lock2 = true,
}
local function IsInfItemTarget(prompt)
if not prompt or not prompt:IsA(loadstring(base64decode("UHJveGltaXR5UHJvbXB0"))()) then return false end
if prompt.Name == loadstring(base64decode("RnVzZXNQcm9tcHQ="))() then return true end
local parent = prompt.Parent
if not parent then return false end
local parentName = parent.Name
local grandParentName = parent.Parent and parent.Parent.Name
if Names[parentName] or (grandParentName and Names[grandParentName]) then return true end
if grandParentName == loadstring(base64decode("TG9ja2VyX1NtYWxsX0xvY2tlZA=="))() then return true end
return false
end
local function RestorePrompt(Prompt)
if not Prompt then return end
if Prompt.Parent then
local ExistingPrompt = Prompt.Parent:FindFirstChild(loadstring(base64decode("SW5mUHJvbXB0"))())
if ExistingPrompt then
ExistingPrompt:Destroy()
end
end
Prompt:SetAttribute(loadstring(base64decode("SW5mSXRlbXM="))(), nil)
Prompt:SetAttribute(loadstring(base64decode("VG9vbA=="))(), nil)
Prompt:SetAttribute(loadstring(base64decode("SW5mVGltZQ=="))(), nil)
Prompt.Enabled = true
Prompt.ClickablePrompt = true
end
local function InfPrompt(Prompt)
local Char = LocalPlayer.Character
if not Char then return end
local RootPart = Char:FindFirstChild(loadstring(base64decode("SHVtYW5vaWRSb290UGFydA=="))())
if not RootPart then return end
local Tool = Char:FindFirstChild(loadstring(base64decode("TG9ja3BpY2s="))()) or Char:FindFirstChild(loadstring(base64decode("U2tlbGV0b25LZXk="))()) or Char:FindFirstChild(loadstring(base64decode("U2hlYXJz"))())
local Name = Tool and Tool.Name
local TargetPart = Prompt.Parent and (Prompt.Parent:IsA(loadstring(base64decode("QmFzZVBhcnQ="))()) and Prompt.Parent or Prompt.Parent:FindFirstChildWhichIsA(loadstring(base64decode("QmFzZVBhcnQ="))()))
local Dist = TargetPart and GetDistanceToPlayer(TargetPart.Position) or 999
if Tool and Dist <= (Prompt.MaxActivationDistance + 5) then
if Prompt:GetAttribute(loadstring(base64decode("SW5mSXRlbXM="))()) and Prompt:GetAttribute(loadstring(base64decode("VG9vbA=="))()) ~= Name then
RestorePrompt(Prompt)
end
if Prompt:GetAttribute(loadstring(base64decode("SW5mSXRlbXM="))()) then
local startTime = Prompt:GetAttribute(loadstring(base64decode("SW5mVGltZQ=="))()) or 0
if (tick() - startTime > 8) or (Dist > Prompt.MaxActivationDistance + 7) then
RestorePrompt(Prompt)
end
return
end
if not Prompt:GetAttribute(loadstring(base64decode("SW5mSXRlbXM="))()) then
Prompt.Enabled = false
Prompt:SetAttribute(loadstring(base64decode("SW5mSXRlbXM="))(), true)
Prompt:SetAttribute(loadstring(base64decode("VG9vbA=="))(), Name)
Prompt:SetAttribute(loadstring(base64decode("SW5mVGltZQ=="))(), tick())
Prompt.ClickablePrompt = false
local Clone = Prompt:Clone()
Clone.Name = loadstring(base64decode("SW5mUHJvbXB0"))()
Clone.MaxActivationDistance = Prompt.MaxActivationDistance
Clone.Parent = Prompt.Parent
Clone.Enabled = true
Clone.ClickablePrompt = true
local Con, ConEnded
local function Cleanup()
if Con then Con:Disconnect() end
if ConEnded then ConEnded:Disconnect() end
RestorePrompt(Prompt)
end
ConEnded = Clone.PromptButtonHoldEnded:Connect(function()
task.delay(0.15, function()
if Clone and Clone.Parent then
Cleanup()
end
end)
end)
Con = Clone.Triggered:Connect(function()
if ConEnded then ConEnded:Disconnect() end
if Con then Con:Disconnect() end
if Clone and Clone.Parent then Clone:Destroy() end
if Char:FindFirstChild(Name) then
task.spawn(function()
local Drop = nil
local StartTime = tick()
repeat
RemotesFolder.DropItem:FireServer(Tool)
task.wait(0.01)
local ClosestDist = 15
if workspace:FindFirstChild(loadstring(base64decode("RHJvcHM="))()) then
for _, v in ipairs(workspace.Drops:GetChildren()) do
if v.Name == Name then
local d = GetDistanceToPlayer(v:GetPivot().Position)
if d < ClosestDist then
ClosestDist = d
Drop = v
end
end
end
end
until Drop or not Char:FindFirstChild(Name) or (tick() - StartTime) > 2.5
local firePromptFunc = Firepp or fireproximityprompt
if Name == loadstring(base64decode("U2hlYXJz"))() then
if firePromptFunc then firePromptFunc(Prompt) end
if Drop then
local DropPrompt = Drop:FindFirstChildWhichIsA(loadstring(base64decode("UHJveGltaXR5UHJvbXB0"))(), true)
if DropPrompt and firePromptFunc then firePromptFunc(DropPrompt) end
end
else
if Drop then
local DropPrompt = Drop:FindFirstChildWhichIsA(loadstring(base64decode("UHJveGltaXR5UHJvbXB0"))(), true)
if DropPrompt and firePromptFunc then firePromptFunc(DropPrompt) end
end
if firePromptFunc then firePromptFunc(Prompt) end
end
RestorePrompt(Prompt)
end)
else
RestorePrompt(Prompt)
end
end)
end
else
if Prompt:GetAttribute(loadstring(base64decode("SW5mSXRlbXM="))()) then
RestorePrompt(Prompt)
end
end
end
BypassBox:AddToggle('InfItems',{
Text = loadstring(base64decode("SW5maW5pdGUgSXRlbXM="))(),
BypassBox:AddLabel(loadstring(base64decode("SWYgSW5maW5pdGUgSXRlbXMgZG9lc24ndCB3b3JrIHdpdGggQXV0by1JbnRlcmFjdCAoUiksIGl0IHdpbGwgd29yayB3aXRoIHRoZSBkZWZhdWx0IGdhbWUgYmluZCAoRSkuIEp1c3Qga2VlcCB0YXBwaW5nIGl0"))(),true),
Callback = function(Value)
if Value then
for _, v in pairs(workspace.CurrentRooms:GetDescendants()) do
if IsInfItemTarget(v) then
table.insert(Stored, v)
end
end
else
for _, Prompt in pairs(workspace.CurrentRooms:GetDescendants()) do
if Prompt:IsA(loadstring(base64decode("UHJveGltaXR5UHJvbXB0"))()) and Prompt:GetAttribute(loadstring(base64decode("SW5mSXRlbXM="))()) then
RestorePrompt(Prompt)
end
end
table.clear(Stored)
end
end
})
local InfParams = RaycastParams.new()
InfParams.FilterType = Enum.RaycastFilterType.Exclude
local AutoLibrary = 0
local AutoAnchorSolver  = 0
local NotifyCode = 0
local InfItemsDelay = 0
local PlayerESP = 0
local DoorReach = 0
table.insert(Connections,RunService.RenderStepped:Connect(function(dt)
NotifyCode += dt
AutoAnchorSolver += dt
InfItemsDelay += dt
PlayerESP += dt
AutoLibrary += dt
DoorReach += dt
if not LocalPlayer:GetAttribute(loadstring(base64decode("QWxpdmU="))()) then
if Toggles.InfRevive.Value then
RemotesFolder.Revive:FireServer()
end
if CollisionClone then
CollisionClone = nil
end
return
end
if Camera ~= workspace.CurrentCamera then
Camera = workspace.CurrentCamera
end
if not LocalPlayer.Character:GetAttribute(loadstring(base64decode("Q2xpbWJpbmc="))()) and Toggles.EnableMovementSpeed.Value then
if LocalPlayer.Character.Humanoid.WalkSpeed ~= Options.MovementSpeed.Value then
LocalPlayer.Character.Humanoid.WalkSpeed = Options.MovementSpeed.Value
end
elseif LocalPlayer.Character:GetAttribute(loadstring(base64decode("Q2xpbWJpbmc="))()) and Toggles.EnableClimbingSpeed.Value then
if LocalPlayer.Character.Humanoid.WalkSpeed ~= Options.ClimbingSpeed.Value then
LocalPlayer.Character.Humanoid.WalkSpeed = Options.ClimbingSpeed.Value
end
end
if Toggles.ThirdPerson.Value then
Camera.CFrame = Camera.CFrame * CFrame.new(Options.X.Value, Options.Y.Value, Options.Z.Value)
end
for _, v in pairs(LocalPlayer.Character:GetChildren()) do
if v:IsA(loadstring(base64decode("QmFzZVBhcnQ="))()) and (v.Name == loadstring(base64decode("SGVhZA=="))() or v.Name == loadstring(base64decode("RmFrZUhlYWQ="))()) then
v.Transparency = Toggles.ThirdPerson.Value and 0 or 1
v.LocalTransparencyModifier = Toggles.ThirdPerson.Value and 0 or 1
end
if v:IsA(loadstring(base64decode("QWNjZXNzb3J5"))()) then
local handle = v:FindFirstChild(loadstring(base64decode("SGFuZGxl"))())
if handle then
handle.Transparency = Toggles.ThirdPerson.Value and 0 or 1
handle.LocalTransparencyModifier = Toggles.ThirdPerson.Value and 0 or 1
end
end
end
if not (Toggles.FOVToggle and Toggles.FOVToggle.Value) then
Camera.FieldOfView = Options.FOV.Value
end
if Toggles.Freecam.Value then
local char = LocalPlayer.Character
local hum = char and char:FindFirstChild(loadstring(base64decode("SHVtYW5vaWQ="))())
local root = char and char:FindFirstChild(loadstring(base64decode("SHVtYW5vaWRSb290UGFydA=="))())
if root and not root.Anchored then root.Anchored = true end
if not workspace:FindFirstChild(loadstring(base64decode("RnJlZWNhbVBhcnQ="))()) then
local part = Instance.new(loadstring(base64decode("UGFydA=="))())
part.Name = loadstring(base64decode("RnJlZWNhbVBhcnQ="))()
part.Size = Vector3.new(0.01, 0.01, 0.01)
part.Transparency = 1
part.CanCollide = false
part.Anchored = true
part.CFrame = Camera.CFrame
part.Parent = workspace
LocalPlayer:SetAttribute(loadstring(base64decode("ZmNfb20="))(), LocalPlayer.CameraMinZoomDistance)
LocalPlayer:SetAttribute(loadstring(base64decode("ZmNfb3g="))(), LocalPlayer.CameraMaxZoomDistance)
LocalPlayer.CameraMinZoomDistance = 0
LocalPlayer.CameraMaxZoomDistance = 0
local rx, ry, rz = Camera.CFrame:ToOrientation()
LocalPlayer:SetAttribute(loadstring(base64decode("ZmNfcA=="))(), math.deg(rx))
LocalPlayer:SetAttribute(loadstring(base64decode("ZmNfeQ=="))(), math.deg(ry))
end
local fcPart = workspace:FindFirstChild(loadstring(base64decode("RnJlZWNhbVBhcnQ="))())
local curCam = Camera
if fcPart and curCam then
local delta = UserInputService:GetMouseDelta()
local sensitivity = UserInputService.KeyboardEnabled and 0.3 or 0.6
local pitch = (LocalPlayer:GetAttribute(loadstring(base64decode("ZmNfcA=="))()) or 0) - (delta.Y * sensitivity)
local yaw = (LocalPlayer:GetAttribute(loadstring(base64decode("ZmNfeQ=="))()) or 0) - (delta.X * sensitivity)
pitch = math.clamp(pitch, -80, 80)
LocalPlayer:SetAttribute(loadstring(base64decode("ZmNfcA=="))(), pitch)
LocalPlayer:SetAttribute(loadstring(base64decode("ZmNfeQ=="))(), yaw)
fcPart.CFrame = CFrame.new(fcPart.Position) * CFrame.fromOrientation(math.rad(pitch), math.rad(yaw), 0)
curCam.CFrame = fcPart.CFrame
curCam.Focus = curCam.CFrame * CFrame.new(0, 0, -10)
if hum and hum.MoveDirection.Magnitude > 0 then
local speed = 75
local moveVec = hum.MoveDirection
local localMove = curCam.CFrame:VectorToObjectSpace(moveVec)
local finalMove = (curCam.CFrame.RightVector * localMove.X) + (curCam.CFrame.LookVector * -localMove.Z)
fcPart.Position = fcPart.Position + (finalMove * speed * dt)
end
end
end
if Toggles.DeleteFigureFE.Value and Figures then
for _, v in pairs(Figures) do
local Root = v:FindFirstChild(loadstring(base64decode("Um9vdA=="))())
if not IsNetworkOwner then
Notify(loadstring(base64decode("U29ycnkgeW91ciBleGVjdXRvciB3b250IHN1cHBvcnQgRGVsZXRlIEZpZ3VyZSBCZWNhdXNlIGlzbmV0d29ya293bmVy"))(), 5)
Toggles.DeleteFigureFE:SetValue(false)
end
if Root and isnetworkowner(Root) then
if Root:FindFirstChild(loadstring(base64decode("Qm9keUZvcmNl"))()) then
Root.BodyForce.Force = Vector3.new(0, -50000, 0)
else
Root:PivotTo(CFrame.new(0, -50000, 0))
end
for _, part in pairs(v:GetDescendants()) do
if part:IsA(loadstring(base64decode("QmFzZVBhcnQ="))()) and part.CanCollide then
part.CanCollide = false
part.Anchored = false
end
end
if Root.Position.Y < -1000 and not v:GetAttribute(loadstring(base64decode("RGVsZXRlZA=="))()) then
Notify(loadstring(base64decode("RGVsZXRlZCBGaWd1cmUgU3VjY2Vzc2Z1bGx5"))(), 4)
v:SetAttribute(loadstring(base64decode("RGVsZXRlZA=="))(), true)
end
end
end
end
if Toggles.AutoAnchorSolver.Value and LatestRoom.Value == 50 and AutoAnchorSolver > 0.5  then
AutoAnchorSolver = 0
local Hint = LocalPlayer.PlayerGui.MainUI:FindFirstChild(loadstring(base64decode("QW5jaG9ySGludEZyYW1l"))())
if Anchors and Hint and Hint.Visible then
local ID = Hint.AnchorCode.Text
for _, v in pairs(Anchors) do
if v:FindFirstChild(loadstring(base64decode("U2lnbg=="))()) and v.Sign.TextLabel.Text == ID then
local Code = Hint.Code.Text
local Note = v:FindFirstChild(loadstring(base64decode("Tm90ZQ=="))())
local NoteText = Note and Note.SurfaceGui.TextLabel.Text or loadstring(base64decode(""))()
local Mod = tonumber(string.match(NoteText, loadstring(base64decode("JWQr"))())) or 0
local Final = loadstring(base64decode(""))()
for i = 1, #Code do
local Digit = tonumber(string.sub(Code, i, i)) or 0
local Res = string.find(NoteText, loadstring(base64decode("Kw=="))()) and (Digit + Mod) % 10 or (Digit - Mod) % 10
Final = Final .. tostring(Res < 0 and Res + 10 or Res)
end
local Dis = (LocalPlayer.Character.HumanoidRootPart.Position - v:GetPivot().Position).Magnitude
if Dis < 20 then
local AnchorRemote = v:FindFirstChildOfClass(loadstring(base64decode("UmVtb3RlRnVuY3Rpb24="))())
if AnchorRemote then
AnchorRemote:InvokeServer(tostring(Code))
end
Notify(loadstring(base64decode("QW5jaG9yIA=="))() .. Final, 1)
end
end
end
end
end
if Toggles.AutoMinecart.Value and Camera:FindFirstChild(loadstring(base64decode("TWluZWNhcnRSaWc="))()) then
if LatestRoom.Value < 49 then
if not LocalPlayer:GetAttribute(loadstring(base64decode("Tm90aWZ5TWluZWNhcnQ="))()) then
Notify(loadstring(base64decode("W0F1dG8gTWluZWNhcnRdIERPTlQgTU9WRQ=="))(), 5)
LocalPlayer:SetAttribute(loadstring(base64decode("Tm90aWZ5TWluZWNhcnQ="))(), true)
end
local Root = LocalPlayer.Character.HumanoidRootPart
local ClosestDuckDist = math.huge
for _, v in pairs(DuckBoards) do
local Dist = GetDistanceToPlayer(v:GetPivot().Position)
if Dist < ClosestDuckDist then
ClosestDuckDist = Dist
end
end
if RequiredMainGame.crouching ~= (ClosestDuckDist < 30) then
RequiredMainGame.crouching = (ClosestDuckDist < 30)
end
local CurrentNode = nil
local MinDist = math.huge
for _, Node in pairs(Nodes) do
if Node:GetAttribute(loadstring(base64decode("Rm9yY2VDb25uZWN0"))()) then
local Dist = (Root.Position - Node.Position).Magnitude
if Dist < MinDist then
MinDist = Dist
CurrentNode = Node
end
end
end
if CurrentNode then
local CurrentNum = tonumber(string.match(CurrentNode.Name, loadstring(base64decode("JWQr"))()))
if CurrentNum then
local Node1
for _, Node in pairs(Nodes) do
if Node.Name == loadstring(base64decode("TWluZWNhcnROb2Rl"))() .. tostring(CurrentNum + 3) then
Node1 = Node
break
end
end
if Node1 then
local DistToNode = GetDistanceToPlayer(CurrentNode.Position)
if DistToNode > 30 then
require(LocalPlayer.PlayerScripts.PlayerModule):GetControls().GetMoveVector = function()
return Vector3.new(0, 0, -1)
end
else
local DirectionToNode = (CurrentNode.Position - Node1.Position).Unit
local Dot = DirectionToNode:Dot(CurrentNode.CFrame.RightVector)
require(LocalPlayer.PlayerScripts.PlayerModule):GetControls().GetMoveVector = function()
if Dot > 0.15 then
return Vector3.new(1, 0, 0)
elseif Dot < -0.15 then
return Vector3.new(1, 0, 0)
end
return Vector3.new(0, 0, -1)
end
end
end
end
end
elseif LatestRoom.Value >= 50 then
if LocalPlayer:GetAttribute(loadstring(base64decode("Tm90aWZ5TWluZWNhcnQ="))()) then
Notify(loadstring(base64decode("W0F1dG8gTWluZWNhcnRdIFlPVSBDQU4gTU9WRQ=="))(), 5)
LocalPlayer:SetAttribute(loadstring(base64decode("Tm90aWZ5TWluZWNhcnQ="))(), false)
end
Toggles.AutoMinecart:SetValue(false)
require(LocalPlayer.PlayerScripts.PlayerModule):GetControls().GetMoveVector = Control
end
end
if Toggles.InfItems.Value and InfItemsDelay > 0.15 then
InfItemsDelay = 0
for _, Prompt in pairs(Stored) do
InfPrompt(Prompt)
end
end
if Toggles.NotifyLibraryCode.Value and NotifyCode >  5 then
NotifyCode = 0
local Code = GetLibraryCode()
if Code and LatestRoom.Value == 50 then
Notify(loadstring(base64decode("Q29kZSA="))() .. Code)
end
end
if Toggles.Flight.Value then
if not LocalPlayer.Character.HumanoidRootPart:FindFirstChild(loadstring(base64decode("RmxpZ2h0VmVsb2NpdHk="))()) then
local Velocity = Instance.new(loadstring(base64decode("Qm9keVZlbG9jaXR5"))(), LocalPlayer.Character.HumanoidRootPart)
Velocity.MaxForce = Vector3.new(math.huge, math.huge, math.huge)
Velocity.Velocity = Vector3.zero
Velocity.Name = loadstring(base64decode("RmxpZ2h0VmVsb2NpdHk="))()
Velocity.P = math.huge
end
if OldAccel then
LocalPlayer.Character.HumanoidRootPart.CustomPhysicalProperties = OldAccel
end
local moveDir = LocalPlayer.Character.Humanoid.MoveDirection
local flatLook = Camera.CFrame.LookVector * Vector3.new(1, 0, 1)
if flatLook.Magnitude < 0.001 then
flatLook = Camera.CFrame.UpVector * Vector3.new(1, 0, 1) * math.sign(-Camera.CFrame.LookVector.Y)
end
local flatCam = CFrame.lookAt(Vector3.zero, flatLook)
local localInput = flatCam:VectorToObjectSpace(moveDir)
LocalPlayer.Character.HumanoidRootPart:FindFirstChild(loadstring(base64decode("RmxpZ2h0VmVsb2NpdHk="))()).Velocity = Camera.CFrame:VectorToWorldSpace(localInput) * Options.FlightSpeed.Value
end
if Toggles.Godmode.Value then
if RemotesFolder.Name == loadstring(base64decode("UmVtb3Rlc0ZvbGRlcg=="))() then
if not Toggles.FigureHearing.Value then
Notify(loadstring(base64decode("RW5hYmxlZCBGaWd1cmUgSGVhcmluZyBBdXRvbWF0aWNsbHkgY2F1c2UgR29kbW9kZSBuZWVkcyBpdA=="))(), 3)
Toggles.FigureHearing:SetValue(true)
end
if LocalPlayer.Character.LowerTorso.Root.C1 ~= CFrame.new(0, -2.3, 0) then
LocalPlayer.Character.LowerTorso.Root.C1 = CFrame.new(0, -2.3, 0)
end
if LocalPlayer.Character.Humanoid.HipHeight ~= 0.22 then
LocalPlayer.Character.Humanoid.HipHeight = 0.22
end
if LocalPlayer.Character.Collision.Size ~= Vector3.new(1, 1, 4) then
LocalPlayer.Character.Collision.Size = Vector3.new(1, 1, 4)
end
if LocalPlayer.Character.Collision.CollisionCrouch.Size ~= Vector3.new(1, 1, 4) then
LocalPlayer.Character.Collision.CollisionCrouch.Size = Vector3.new(1, 1, 4)
end
end
if (Floor.Value == loadstring(base64decode("Rm9vbHM="))() or RemotesFolder.Name == loadstring(base64decode("QnJpY2tz"))()) and not (Toggles.NoclipToggle and Toggles.NoclipToggle.Value) then
Toggles.NoclipToggle:SetValue(true)
end
end
if not LocalPlayer.Character:FindFirstChild(loadstring(base64decode("Q29sbGlzaW9uQ2xvbmU="))()) then
if LocalPlayer.Character:FindFirstChild(loadstring(base64decode("Q29sbGlzaW9uUGFydA=="))()) then
CollisionClone = LocalPlayer.Character.CollisionPart:Clone()
CollisionClone.Parent = LocalPlayer.Character
CollisionClone.Name = loadstring(base64decode("Q29sbGlzaW9uQ2xvbmU="))()
CollisionClone.RootPriority = 127
CollisionClone.Anchored = false
CollisionClone.CanCollide = false
if CollisionClone:FindFirstChild(loadstring(base64decode("Q29sbGlzaW9uQ3JvdWNo"))()) then
CollisionClone:FindFirstChild(loadstring(base64decode("Q29sbGlzaW9uQ3JvdWNo"))()):Destroy()
end
end
end
if Toggles.NoScenes.Value and LatestRoom.Value == 100 then
Toggles.NoScenes:SetValue(false)
end
if not HookMeta then
if Toggles.FigureHearing.Value then
if RemotesFolder:FindFirstChild(loadstring(base64decode("Q3JvdWNo"))()) then
RemotesFolder.Crouch:FireServer(true)
end
end
end
if Toggles.InfCrucifix.Value and not Toggles.Godmode.Value and LocalPlayer.Character and LocalPlayer.Character:FindFirstChild(loadstring(base64decode("SHVtYW5vaWRSb290UGFydA=="))()) then
local Origin = LocalPlayer.Character.HumanoidRootPart.Position
local Tool = LocalPlayer.Character:FindFirstChild(loadstring(base64decode("Q3J1Y2lmaXg="))())
if Tool then
for _, Entity in pairs(workspace:GetChildren()) do
local MaxRange = InfCrucfixTable[Entity.Name]
if MaxRange and Entity.PrimaryPart then
local Target = Entity.PrimaryPart.Position
local Dist = (Origin - Target).Magnitude
if Dist < (MaxRange + 40) then
InfParams.FilterDescendantsInstances = {LocalPlayer.Character, Entity}
local Hit = workspace:Raycast(Origin, Target - Origin, InfParams)
if not Hit then
task.spawn(function()
RemotesFolder.DropItem:FireServer(Tool)
local FireFunc = Firepp or fireproximityprompt
local StartTime = tick()
repeat
task.wait(0.01)
local Drops = workspace:FindFirstChild(loadstring(base64decode("RHJvcHM="))())
local Drop = Drops and Drops:FindFirstChild(loadstring(base64decode("Q3J1Y2lmaXg="))())
local Prompt = Drop and Drop:FindFirstChildOfClass(loadstring(base64decode("UHJveGltaXR5UHJvbXB0"))())
if Prompt and FireFunc then
FireFunc(Prompt)
end
until LocalPlayer.Character:FindFirstChild(loadstring(base64decode("Q3J1Y2lmaXg="))()) or (tick() - StartTime) > 1.2
end)
break
end
end
end
end
end
end
if Toggles.AutoLibraryCode.Value then
if LatestRoom.Value == 50 then
local Code = GetLibraryCode()
if Code then
if Toggles.BruteForceLibCode.Value and string.find(Code, loadstring(base64decode("Xw=="))()) then
local Bruted = loadstring(base64decode(""))()
for i = 1, #Code do
local char = string.sub(Code, i, i)
Bruted ..= (char == loadstring(base64decode("Xw=="))() and math.random(0, 9) or char)
end
Code = Bruted
end
PL:FireServer(Code)
end
end
end
if Toggles.DoorReach.Value and DoorReach > 0.2 then
DoorReach = 0
local Rooms = workspace:FindFirstChild(loadstring(base64decode("Q3VycmVudFJvb21z"))())
local Room = Rooms and Rooms:FindFirstChild(tostring(tonumber(LatestRoom.Value) or 0))
local Door = Room and Room:FindFirstChild(loadstring(base64decode("RG9vcg=="))())
if Door and Door:FindFirstChild(loadstring(base64decode("RG9vcg=="))()) and Door.Parent and Door.Parent.Name ~= loadstring(base64decode("MTAx"))() and GetDistanceToPlayer(Door.Door.Position) < 30 then
Door.ClientOpen:FireServer()
end
end
if Toggles.NoAcc.Value then
if not Toggles.Flight.Value then
if LocalPlayer.Character.HumanoidRootPart.CustomPhysicalProperties ~= PhysicalProperties.new(100, 0.1, 0.1, 0.1, 0.1) then
LocalPlayer.Character.HumanoidRootPart.CustomPhysicalProperties = PhysicalProperties.new(100, 0.1, 0.1, 0.1, 0.1)
end
end
end
if Toggles.EnableJump.Value then
if not LocalPlayer.Character:GetAttribute(loadstring(base64decode("Q2FuSnVtcA=="))()) then
LocalPlayer.Character:SetAttribute(loadstring(base64decode("Q2FuSnVtcA=="))(),true)
end
end
if Toggles.NoFog.Value then
if Lighting.FogEnd < 100000 then
Lighting.FogEnd = 100000
end
for _, v in pairs(Lighting:GetChildren()) do
if v:IsA(loadstring(base64decode("QXRtb3NwaGVyZQ=="))()) and v.Density > 0 then
v.Density = 0
end
end
end
if Toggles.NoCamShake.Value then
if RequiredMainGame then
RequiredMainGame.csgo = CFrame.new(0,0,0)
end
end
if Toggles.Player.Value and PlayerESP > 1 then
PlayerESP = 0
for _, v in pairs(Players:GetPlayers()) do
if v ~= LocalPlayer and v.Character then
local hum = v.Character:FindFirstChildOfClass(loadstring(base64decode("SHVtYW5vaWQ="))())
if hum then
if hum.Health > 0 then
AddESP(v.Character, v.Name .. loadstring(base64decode("IFs="))() .. math.floor((hum.Health / hum.MaxHealth) * 100) .. loadstring(base64decode("JV0="))(), PlayerColor)
else
ESPLibrary:RemoveESP(v.Character)
end
end
end
end
end
if Toggles.EyesDamage.Value then
if (workspace:FindFirstChild(loadstring(base64decode("RXllcw=="))()) or workspace:FindFirstChild(loadstring(base64decode("TG9va21hbg=="))())) and not LocalPlayer.Character:GetAttribute(loadstring(base64decode("SGlkaW5n"))()) then
if RemotesFolder.Name ~= loadstring(base64decode("UmVtb3Rlc0ZvbGRlcg=="))() then
MotorReplication:FireServer(0, -650, 0, false)
else
MotorReplication:FireServer(-650)
end
end
end
if Toggles.LookmanDamage.Value then
if workspace:FindFirstChild(loadstring(base64decode("QmFja2Rvb3JMb29rbWFu"))()) then
if not LocalPlayer.Character:GetAttribute(loadstring(base64decode("SGlkaW5n"))()) then
MotorReplication:FireServer(-650)
end
end
end
if Toggles.FullBright.Value then
if Lighting.Ambient ~= Color3.new(1, 1, 1) then
Lighting.Ambient = Color3.new(1, 1, 1)
end
local FBRooms = workspace:FindFirstChild(loadstring(base64decode("Q3VycmVudFJvb21z"))())
local FBNum = tonumber(LocalPlayer:GetAttribute(loadstring(base64decode("Q3VycmVudFJvb20="))())) or 0
local FBRoom = FBRooms and FBRooms:FindFirstChild(tostring(FBNum))
if FBRoom then
if not FBRoom:GetAttribute(loadstring(base64decode("T2xkQW1iaWVudA=="))()) then
FBRoom:SetAttribute(loadstring(base64decode("T2xkQW1iaWVudA=="))(), FBRoom:GetAttribute(loadstring(base64decode("QW1iaWVudA=="))()))
end
if FBRoom:GetAttribute(loadstring(base64decode("QW1iaWVudA=="))()) ~= Color3.new(1, 1, 1) then
FBRoom:SetAttribute(loadstring(base64decode("QW1iaWVudA=="))(), Color3.new(1, 1, 1))
end
end
if (tonumber(LatestRoom.Value) or 0) < 100 then
local FBNext = FBRooms and FBRooms:FindFirstChild(tostring(FBNum + 1))
if FBNext then
if not FBNext:GetAttribute(loadstring(base64decode("T2xkQW1iaWVudA=="))()) then
FBNext:SetAttribute(loadstring(base64decode("T2xkQW1iaWVudA=="))(), FBNext:GetAttribute(loadstring(base64decode("QW1iaWVudA=="))()))
end
if FBNext:GetAttribute(loadstring(base64decode("QW1iaWVudA=="))()) ~= Color3.new(1, 1, 1) then
FBNext:SetAttribute(loadstring(base64decode("QW1iaWVudA=="))(), Color3.new(1, 1, 1))
end
end
end
end
if Toggles.AntiCheatMani.Value and LocalPlayer.Character and LocalPlayer.Character:FindFirstChild(loadstring(base64decode("SHVtYW5vaWRSb290UGFydA=="))()) then
if Options.AntiCheatManiMethod.Value == loadstring(base64decode("VmVsb2NpdHk="))() then
if Toggles.NoclipToggle and not Toggles.NoclipToggle.Value then
Toggles.NoclipToggle:SetValue(true)
end
local BodyVelocity = LocalPlayer.Character.HumanoidRootPart:FindFirstChild(loadstring(base64decode("VmVsb2NpdHlNYW5p"))()) or Instance.new(loadstring(base64decode("Qm9keVZlbG9jaXR5"))(), LocalPlayer.Character.HumanoidRootPart)
local LookingVector = LocalPlayer.Character.HumanoidRootPart.CFrame.LookVector * 2
BodyVelocity.Velocity = Vector3.new(LookingVector.X, LookingVector.Y, LookingVector.Z)
BodyVelocity.MaxForce = Vector3.new(math.huge, math.huge, math.huge)
BodyVelocity.Name = loadstring(base64decode("VmVsb2NpdHlNYW5p"))()
else
local currentPivot = LocalPlayer.Character:GetPivot()
LocalPlayer.Character:PivotTo(currentPivot  * CFrame.new(0, 0, 10000))
end
end
if Options.ThirdpersonKeybind:GetState() and not Toggles.ThirdPerson.Value then
Toggles.ThirdPerson:SetValue(true)
end
if not Options.ThirdpersonKeybind:GetState() and  Toggles.ThirdPerson.Value then
Toggles.ThirdPerson:SetValue(false)
end
if Options.AntiCheatMan:GetState() and not Toggles.AntiCheatMani.Value then
Toggles.AntiCheatMani:SetValue(true)
end
if not Options.AntiCheatMan:GetState() and  Toggles.AntiCheatMani.Value then
Toggles.AntiCheatMani:SetValue(false)
end
if Toggles.NoClip.Value then
for _, v in ipairs(LocalPlayer.Character:GetChildren()) do
if v:IsA(loadstring(base64decode("QmFzZVBhcnQ="))()) and v.Name ~= loadstring(base64decode("Q29sbGlzaW9uQ2xvbmU="))() and v.CanCollide then
v.CanCollide = false
end
end
if LocalPlayer.Character:FindFirstChild(loadstring(base64decode("Q29sbGlzaW9u"))()) then
LocalPlayer.Character.Collision.CanCollide = false
if LocalPlayer.Character.Collision:FindFirstChild(loadstring(base64decode("Q29sbGlzaW9uQ3JvdWNo"))()) then
LocalPlayer.Character.Collision.CollisionCrouch.CanCollide = false
end
end
end
if not Toggles.NoClip.Value and not (Toggles.NoclipToggle and Toggles.NoclipToggle.Value) and not (Toggles.VelocityManipulationToggle and Toggles.VelocityManipulationToggle.Value) then
for _, v in pairs(LocalPlayer.Character:GetChildren()) do
if v.Name ~= loadstring(base64decode("Q29sbGlzaW9uQ2xvbmU="))() and v.Name ~= loadstring(base64decode("Q29sbGlzaW9u"))() then
if v:IsA(loadstring(base64decode("QmFzZVBhcnQ="))()) and not v.CanCollide then
v.CanCollide = true
end
end
end
if LocalPlayer.Character:FindFirstChild(loadstring(base64decode("Q29sbGlzaW9u"))()) then
LocalPlayer.Character.Collision.CanCollide = (LocalPlayer.Character.Collision.CollisionGroup == loadstring(base64decode("UGxheWVyQ3JvdWNoaW5n"))() and false or LocalPlayer.Character.Collision.CollisionGroup ~= loadstring(base64decode("UGxheWVyQ3JvdWNoaW5n"))() and true)
if LocalPlayer.Character.Collision:FindFirstChild(loadstring(base64decode("Q29sbGlzaW9uQ3JvdWNo"))()) then
LocalPlayer.Character.Collision.CollisionCrouch.CanCollide = LocalPlayer.Character.Collision.CanCollide
end
end
end
end))
table.insert(Connections, RunService.RenderStepped:Connect(function()
if Toggles.AutoRooms.Value then
if IsMoving then return end
if Toggles.IgnoreA60.Value and not Toggles.Godmode.Value then
Toggles.Godmode:SetValue(true)
Notify(loadstring(base64decode("R29kbW9kZSBFbmFibGVkIEF1dG9tYXRpY2FsbHkgRm9yIElnbm9yZSBBLTYw"))(), 5)
end
LocalPlayer.Character.Collision.Size = Vector3.new(1, 1, 3)
local DangerousEntity = workspace:FindFirstChild(loadstring(base64decode("QTEyMA=="))()) or workspace:FindFirstChild(loadstring(base64decode("R2xpdGNoUnVzaA=="))()) or workspace:FindFirstChild(loadstring(base64decode("R2xpdGNoQW1idXNo"))())
local A60 = workspace:FindFirstChild(loadstring(base64decode("QTYw"))())
local ShouldHide = false
if DangerousEntity and DangerousEntity.PrimaryPart and DangerousEntity.PrimaryPart.Position.Y > -4 then
ShouldHide = true
elseif A60 and A60.PrimaryPart and A60.PrimaryPart.Position.Y > -4 then
if not Toggles.IgnoreA60.Value then
ShouldHide = true
end
end
if ShouldHide then
local Closet = GetNearestHidingSpot()
if Closet then
Closet.Base.CanCollide = false
PathTo(Closet.Base.Position)
if not LocalPlayer.Character.CollisionPart.Anchored then
fireproximityprompt(Closet.HidePrompt)
end
end
else
LocalPlayer.Character:SetAttribute(loadstring(base64decode("SGlkaW5n"))(), false)
local CurrentRoom = workspace.CurrentRooms:FindFirstChild(tostring(LatestRoom.Value))
if CurrentRoom then
local TargetDoor = CurrentRoom:FindFirstChild(loadstring(base64decode("RG9vcg=="))())
if TargetDoor and TargetDoor:FindFirstChild(loadstring(base64decode("RG9vcg=="))()) then
PathTo(TargetDoor.Door.Position)
end
end
end
end
end))
if HookMeta then
local Old
Old = hookmetamethod(game, loadstring(base64decode("X19uYW1lY2FsbA=="))(), function(Self, ...)
if Library.Unloaded then
return Old(Self, ...)
end
local Method = getnamecallmethod()
if Method == loadstring(base64decode("RmlyZVNlcnZlcg=="))() or Method == loadstring(base64decode("SW52b2tlU2VydmVy"))() then
if Toggles.AutoHeartbeat.Value and Self.Name == loadstring(base64decode("Q2x1dGNoSGVhcnRiZWF0"))() then
return Old(Self, true)
end
if Method == loadstring(base64decode("RmlyZVNlcnZlcg=="))() and Toggles.FigureHearing.Value and Self.Name == loadstring(base64decode("Q3JvdWNo"))() then
return Old(Self, true,true)
end
end
return Old(Self, ...)
end)
end
table.insert(Connections,workspace.DescendantAdded:Connect(function(v)
local timeout = 0
repeat task.wait(0.03) timeout += 0.03 until v.Parent or timeout > 0.5
if v.Parent then
if v.Parent:FindFirstChildOfClass(loadstring(base64decode("SHVtYW5vaWQ="))()) then return end
if (v.Name == loadstring(base64decode("Q2FuZGxl"))() and v.Parent.Name == loadstring(base64decode("Q2FuZGxl"))() or v.Parent.Parent and v.Parent.Parent.Name == loadstring(base64decode("Q2FuZGxl"))()) then return end
if  HidingPlaces[v.Name] then
table.insert(Closets, v)
end
if Toggles.AntiLag.Value then
if v:IsA(loadstring(base64decode("QmFzZVBhcnQ="))()) then
v:SetAttribute(loadstring(base64decode("TWF0"))(), v.Material)
v.Material = loadstring(base64decode("UGxhc3RpYw=="))()
end
end
if Toggles.InfItems.Value then
if IsInfItemTarget(v) then
table.insert(Stored, v)
end
end
if Toggles.DeleteSeekFE.Value then
if v.Name == loadstring(base64decode("VHJpZ2dlckV2ZW50Q29sbGlzaW9u"))() then
Notify(loadstring(base64decode("RGVsZXRpbmcgU2Vlaw=="))(), 3)
local Part = v:FindFirstChild(loadstring(base64decode("Q29sbGlzaW9u"))()) or v.ChildAdded:Wait()
if Part then
Notify(loadstring(base64decode("RE9OVCBPUEVOIE5FWFQgRE9PUg=="))(), 1)
task.wait(0.1)
for _, Item in pairs(v:GetChildren()) do
if Item.Name == loadstring(base64decode("Q29sbGlzaW9u"))() then
if LocalPlayer.Character and LocalPlayer.Character:FindFirstChild(loadstring(base64decode("SHVtYW5vaWRSb290UGFydA=="))()) then
if FireTouch then
firetouchinterest(LocalPlayer.Character.HumanoidRootPart, Item, 0)
task.wait()
firetouchinterest(LocalPlayer.Character.HumanoidRootPart, Item, 1)
end
end
end
end
task.wait(0.5)
local Success = true
for _, Item in pairs(v:GetChildren()) do
if Item.Name == loadstring(base64decode("Q29sbGlzaW9u"))() then
Success = false
break
end
end
if Success then
Notify(loadstring(base64decode("RGVsZXRlZCBTZWVrIFN1Y2Nlc3NmdWxseSBPcGVuIE5leHQgRG9vcg=="))(), 3)
else
Notify(loadstring(base64decode("RmFpbGVkIFRvIERlbGV0ZSBTZWVrIE9wZW4gTmV4dCBEb29y"))(), 3)
end
end
end
end
if Toggles.SeekObf.Value then
if v.Name == loadstring(base64decode("U2Vla19Bcm0="))() or v.Name == loadstring(base64decode("Q2hhbmRlbGllck9ic3RydWN0aW9u"))() then
for _, i in pairs(v:GetChildren()) do
if i:IsA(loadstring(base64decode("QmFzZVBhcnQ="))()) then
i.CanTouch = false
end
end
end
end
if Toggles.AutoMinecart.Value then
if v.Name == loadstring(base64decode("RHVja0JvYXJk"))() then
table.insert(DuckBoards, v)
end
if string.find(v.Name, loadstring(base64decode("TWluZWNhcnROb2Rl"))()) then
table.insert(Nodes, v)
end
end
if Toggles.AntiSeekFlood.Value then
if v.Name == loadstring(base64decode("U2Vla0Zsb29kbGluZQ=="))() then
v.CanCollide = true
end
end
if Toggles.ShowPath.Value then
if v.Name == loadstring(base64decode("U2Vla0d1aWRpbmdMaWdodA=="))() then
ShowSeekPath(v)
end
end
if Toggles.DeleteFigureFE.Value then
if v.Name == loadstring(base64decode("RmlndXJlUmln"))() or v.Name == loadstring(base64decode("RmlndXJlUmFnZG9sbA=="))() then
table.insert(Figures,v)
end
end
if Toggles.PromptClip.Value then
if v:IsA(loadstring(base64decode("UHJveGltaXR5UHJvbXB0"))()) then
v:SetAttribute(loadstring(base64decode("Q2xpcA=="))(), v.RequiresLineOfSight)
v.RequiresLineOfSight = false
end
end
if Toggles.AutoBreaker.Value then
if v.Name == loadstring(base64decode("RWxldmF0b3JCcmVha2Vy"))() then
Breaker(v)
end
end
if Toggles.PromptReach.Value then
if v:IsA(loadstring(base64decode("UHJveGltaXR5UHJvbXB0"))()) then
v:SetAttribute(loadstring(base64decode("UmFuZ2U="))(), v.MaxActivationDistance)
v.MaxActivationDistance = v.MaxActivationDistance * 2
end
end
if Toggles.Snare.Value then
if  v.Name == loadstring(base64decode("U25hcmU="))() then
local wait = 0
repeat task.wait(0.01) wait = wait  + 0.01 until wait > 1 or v:FindFirstChild(loadstring(base64decode("SGl0Ym94"))())
if v:FindFirstChild(loadstring(base64decode("SGl0Ym94"))()) then
v.Hitbox.CanTouch = false
end
end
end
if Toggles.AntiLava.Value then
if v.Name == loadstring(base64decode("TGF2YQ=="))() then
v.CanTouch = false
end
end
if Toggles.AntiWall.Value then
if v.Name == loadstring(base64decode("U2NhcnlXYWxs"))() then
for _, i in pairs(v:GetChildren()) do
if i:IsA(loadstring(base64decode("QmFzZVBhcnQ="))()) then
i.CanTouch = false
end
end
end
end
if Toggles.RealBridge.Value then
if v.Name == loadstring(base64decode("QnJpZGdl"))() then
if v.CanCollide == false then
v.Transparency = 1
end
end
end
if Toggles.Dupe.Value then
if v.Name == loadstring(base64decode("RG9vckZha2U="))()  and v.Parent.Name == loadstring(base64decode("U2lkZXJvb21EdXBl"))() then
v:WaitForChild(loadstring(base64decode("SGlkZGVu"))(),9e9).CanTouch = false
end
end
if Toggles.FixBrokenBridge.Value then
if v.Name == loadstring(base64decode("QnJpZGdl"))() then
FixBridge(v)
end
end
if Toggles.AutoAnchorSolver.Value then
if v.Name == loadstring(base64decode("TWluZXNBbmNob3I="))() then
table.insert(Anchors,v)
end
end
if Toggles.GloomEggDamage.Value then
if v.Name == loadstring(base64decode("R2xvb21FZ2c="))() then
repeat task.wait() until v:FindFirstChildWhichIsA(loadstring(base64decode("QmFzZVBhcnQ="))())
for _, i in pairs(v:GetChildren()) do
if i:IsA(loadstring(base64decode("QmFzZVBhcnQ="))())  then
i.CanTouch = false
end
end
end
end
if Toggles.Giggle.Value then
if   v.Name == loadstring(base64decode("R2lnZ2xlQ2VpbGluZw=="))() then
repeat task.wait() until v:FindFirstChild(loadstring(base64decode("SGl0Ym94"))())
v.Hitbox.CanTouch = false
end
end
if v:IsA(loadstring(base64decode("UHJveGltaXR5UHJvbXB0"))()) then
if Toggles.InstaInteract.Value then
v:SetAttribute(loadstring(base64decode("RHVyYXRpb24="))(),v.HoldDuration)
v.HoldDuration = 0
end
end
end
end))
table.insert(Connections,workspace.DescendantRemoving:Connect(function(v)
for i, g in pairs(Closets) do
if v == g then
table.remove(Closets, i)
end
end
for i, k in pairs(Stored) do
if v == k then
table.remove(Stored, i)
end
end
end))
task.spawn(function()
local MenuGroup = Tabs.Settings:AddLeftGroupbox('UI Settings')
local UtilityBox = Tabs.Settings:AddRightGroupbox('Hub Utilities')
MenuGroup:AddLabel(loadstring(base64decode("TWVudSBiaW5k"))()):AddKeyPicker(loadstring(base64decode("TWVudUtleWJpbmQ="))(), { Default = loadstring(base64decode("UmlnaHRTaGlmdA=="))(), NoUI = true, Text = loadstring(base64decode("TWVudSBrZXliaW5k"))() })
Library.ToggleKeybind = Options.MenuKeybind
MenuGroup:AddToggle(loadstring(base64decode("U2hvd0tleWJpbmRz"))(), { Text = loadstring(base64decode("U2hvdyBLZXliaW5kcyBPdmVybGF5"))(), Default = false }):OnChanged(function()
Library.KeybindFrame.Visible = Toggles.ShowKeybinds.Value
end)
MenuGroup:AddToggle(loadstring(base64decode("U2hvd0N1c3RvbUN1cnNvcg=="))(), {
Text = loadstring(base64decode("Q3VzdG9tIEN1cnNvcg=="))(),
Default = true,
Callback = function(Value)
Library.ShowCustomCursor = Value
end,
})
MenuGroup:AddDivider()
MenuGroup:AddToggle('PlayNotifySound',{
Text = loadstring(base64decode("UGxheSBOb3RpZmljYXRpb24gU291bmQ="))(),
Default = true,
Callback = function(Value)
PlaySound = Value
end
})
MenuGroup:AddDropdown(loadstring(base64decode("Tm90aWZpY2F0aW9uU2lkZQ=="))(), {
Values = { loadstring(base64decode("TGVmdA=="))(), loadstring(base64decode("UmlnaHQ="))() },
Default = loadstring(base64decode("UmlnaHQ="))(),
Text = loadstring(base64decode("Tm90aWZpY2F0aW9uIFNpZGU="))(),
Callback = function(Value)
Library:SetNotifySide(Value)
end,
})
MenuGroup:AddButton('Test Notification',function()
Notify(loadstring(base64decode("SGVsbG8gV29ybGQ="))(),2)
end)
MenuGroup:AddDropdown(loadstring(base64decode("TGlicmFyeQ=="))(), {
Values = { loadstring(base64decode("T2JzaWRpYW4="))(), loadstring(base64decode("TGlub3JpYQ=="))() },
Default = getgenv().ScriptLibrary,
Text = loadstring(base64decode("TGlicmFyeQ=="))(),
Callback = function(Value)
getgenv().ScriptLibrary = tostring(Value)
Notify('Please Unload Script and Execute Again to Take Effect',4)
end,
})
MenuGroup:AddDropdown(loadstring(base64decode("UmVuZGVyRVNQU3BlZWQ="))(), {
Values = { loadstring(base64decode("MTA="))(), loadstring(base64decode("MzA="))(), loadstring(base64decode("NjA="))(), loadstring(base64decode("OTA="))(), loadstring(base64decode("MTIw"))(),loadstring(base64decode("MTQ0"))(), loadstring(base64decode("MjQw"))()},
Default = Library.IsMobile and 2 or 6,
Text = loadstring(base64decode("RVNQIFJlbmRlcmluZyBTcGVlZA=="))(),
Callback = function(Value)
ESPLibrary:SetRenderingSpeed(Value)
end,
})
MenuGroup:AddDivider()
MenuGroup:AddDropdown(loadstring(base64decode("RFBJRHJvcGRvd24="))(), {
Values = { loadstring(base64decode("NTAl"))(), loadstring(base64decode("NzUl"))(), loadstring(base64decode("MTAwJQ=="))(), loadstring(base64decode("MTI1JQ=="))(), loadstring(base64decode("MTUwJQ=="))(), loadstring(base64decode("MTc1JQ=="))(), loadstring(base64decode("MjAwJQ=="))() },
Default = loadstring(base64decode("MTAwJQ=="))(),
Text = loadstring(base64decode("RFBJIFNjYWxl"))(),
Callback = function(Value)
Value = Value:gsub(loadstring(base64decode("JSU="))(), loadstring(base64decode(""))())
local DPI = tonumber(Value)
Library:SetDPIScale(DPI)
end,
})
UtilityBox:AddButton({
Text = loadstring(base64decode("VW5sb2FkIEh1Yg=="))(),
Func = function()
LocalPlayer:SetAttribute(loadstring(base64decode("Tm92YUxvYWRlZA=="))(), nil)
for _, con in pairs(Connections) do con:Disconnect() end
if ESPHooks and ESPHooks.ClearAll then
ESPHooks.ClearAll()
end
local Dread = LocalPlayer:FindFirstChild(loadstring(base64decode("RHJlYWQ="))(),true) or LocalPlayer:FindFirstChild(loadstring(base64decode("X0RyZWFk"))(),true)
if Dread then
Dread.Name = loadstring(base64decode("RHJlYWQ="))()
end
local Dread = ClientModules.EntityModules:FindFirstChild(loadstring(base64decode("U2hhZGU="))(),true) or ClientModules.EntityModules:FindFirstChild(loadstring(base64decode("X1NoYWRl"))(),true)
if Dread then
Dread.Name = loadstring(base64decode("U2hhZGU="))()
end
FakeA90:Destroy()
FakeScreech:Destroy()
if ReplicatedStorage:FindFirstChild(loadstring(base64decode("U2NyZWVjaA=="))()) then
ReplicatedStorage:FindFirstChild(loadstring(base64decode("U2NyZWVjaA=="))()).Parent = RemotesFolder
end
local getcons = getconnections or get_signal_cons or get_relative_connections
if getcons then
for _, con in pairs(getcons(LocalPlayer.Idled)) do
if con.Enable then
con:Enable()
end
end
end
local fcPart = workspace:FindFirstChild(loadstring(base64decode("RnJlZWNhbVBhcnQ="))())
if fcPart then
fcPart:Destroy()
local root = LocalPlayer.Character and LocalPlayer.Character:FindFirstChild(loadstring(base64decode("SHVtYW5vaWRSb290UGFydA=="))())
if root then root.Anchored = false end
LocalPlayer.CameraMinZoomDistance = LocalPlayer:GetAttribute(loadstring(base64decode("ZmNfb20="))()) or 0.5
LocalPlayer.CameraMaxZoomDistance = LocalPlayer:GetAttribute(loadstring(base64decode("ZmNfb3g="))()) or 128
end
if ReplicatedStorage:FindFirstChild(loadstring(base64decode("QTkw"))()) then
ReplicatedStorage:FindFirstChild(loadstring(base64decode("QTkw"))()).Parent = RemotesFolder
end
for _, v in pairs(workspace:GetDescendants()) do
if v:IsA(loadstring(base64decode("QmFzZVBhcnQ="))()) then
v.CanTouch = true
end
if v.Name == loadstring(base64decode("QnJpZGdlQmFycmllcg=="))() then
v:Destroy()
end
end
if LocalPlayer.Character then
LocalPlayer.Character.Humanoid.WalkSpeed = 16
LocalPlayer.Character:SetAttribute(loadstring(base64decode("Q2FuSnVtcA=="))(),false)
for _, v in pairs(LocalPlayer.Character:GetChildren()) do
if not (v.Name == loadstring(base64decode("Q29sbGlzaW9uQ2xvbmU="))()) and v:IsA(loadstring(base64decode("QmFzZVBhcnQ="))()) then
v.CanCollide  = true
end
end
if OldAccel then
LocalPlayer.Character.HumanoidRootPart.CustomPhysicalProperties = OldAccel
OldAccel = nil
end
end
for _, v in ipairs(workspace:GetDescendants()) do
if v:IsA(loadstring(base64decode("UHJveGltaXR5UHJvbXB0"))()) then
v.HoldDuration = v:GetAttribute(loadstring(base64decode("RHVyYXRpb24="))()) or
v.HoldDuration
end
end
if OldFogEnd then
Lighting.FogEnd = OldFogEnd
OldFogEnd = nil
end
for _, v in pairs(Lighting:GetChildren()) do
if v:IsA(loadstring(base64decode("QXRtb3NwaGVyZQ=="))()) then
v.Density = 0.94
end
end
if LocalPlayer.Character.HumanoidRootPart:FindFirstChild(loadstring(base64decode("VmVsb2NpdHlNYW5p"))()) then
LocalPlayer.Character.HumanoidRootPart:FindFirstChild(loadstring(base64decode("VmVsb2NpdHlNYW5p"))()):Destroy()
end
Lighting.Ambient = Color3.fromRGB(0, 0, 0)
Lighting.GlobalShadows = true
for _, v in pairs(workspace.CurrentRooms:GetChildren()) do
v:SetAttribute(loadstring(base64decode("QW1iaWVudA=="))(), v:GetAttribute(loadstring(base64decode("T2xkQW1iaWVudA=="))()) and v:GetAttribute(loadstring(base64decode("T2xkQW1iaWVudA=="))()) or Color3.new(0, 0, 0))
end
FakeScreech:Destroy()
FakeA90:Destroy()
task.wait()
if RemotesFolder:FindFirstChild(loadstring(base64decode("QTkwXw=="))()) then
RemotesFolder:FindFirstChild(loadstring(base64decode("QTkwXw=="))()).Name = loadstring(base64decode("QTkw"))()
end
if RemotesFolder:FindFirstChild(loadstring(base64decode("U2NyZWVjaF8="))()) then
local Cutscene = RemoteListener:FindFirstChild(loadstring(base64decode("Q3V0c2NlbmVz"))()) or RemoteListener:FindFirstChild(loadstring(base64decode("Q3V0c2NlbmVzXw=="))())
Cutscene.Name = loadstring(base64decode("Q3V0c2NlbmVz"))()
RemotesFolder:FindFirstChild(loadstring(base64decode("U2NyZWVjaF8="))()).Name = loadstring(base64decode("U2NyZWVjaA=="))()
end
for _, v in pairs(workspace:GetDescendants()) do
if v:IsA(loadstring(base64decode("UHJveGltaXR5UHJvbXB0"))()) then
v.MaxActivationDistance = v:GetAttribute(loadstring(base64decode("UmFuZ2U="))()) or v.MaxActivationDistance
end
if v.Name == loadstring(base64decode("U2Vla0Zsb29kbGluZQ=="))() then
v.CanCollide = false
end
end
for _, Prompt in pairs(workspace.CurrentRooms:GetDescendants()) do
if Prompt:IsA(loadstring(base64decode("UHJveGltaXR5UHJvbXB0"))()) and Prompt:GetAttribute(loadstring(base64decode("SW5mSXRlbXM="))()) then
RestorePrompt(Prompt)
end
end
for _, v in workspace.CurrentRooms:GetDescendants() do
if v:IsA(loadstring(base64decode("QmFzZVBhcnQ="))()) then
if v:GetAttribute(loadstring(base64decode("TWF0"))()) then
v.Material = v:GetAttribute(loadstring(base64decode("TWF0"))()) or loadstring(base64decode("UGxhc3RpYw=="))()
end
end
end
if CollisionClone then
CollisionClone:Destroy()
CollisionClone = nil
end
for _, v in pairs(workspace:GetDescendants()) do
if v:IsA(loadstring(base64decode("UHJveGltaXR5UHJvbXB0"))()) then
v.RequiresLineOfSight = v:GetAttribute(loadstring(base64decode("Q2xpcA=="))()) or true
end
end
if PathFolder then
PathFolder:Destroy()
end
if LocalPlayer.Character then
LocalPlayer.Character.Humanoid:MoveTo(LocalPlayer.Character.HumanoidRootPart.Position)
LocalPlayer.Character.LowerTorso.Root.C1 = CFrame.new(Vector3.new(0, 0, 0))
end
if LocalPlayer.Character.HumanoidRootPart:FindFirstChild(loadstring(base64decode("RmxpZ2h0VmVsb2NpdHk="))()) then
LocalPlayer.Character.HumanoidRootPart:FindFirstChild(loadstring(base64decode("RmxpZ2h0VmVsb2NpdHk="))()):Destroy()
end
if RemotesFolder:FindFirstChild(loadstring(base64decode("Q3JvdWNo"))()) then
RemotesFolder.Crouch:FireServer(false)
end
if LocalPlayer.Character then
LocalPlayer.Character.Collision.Position = LocalPlayer.Character.HumanoidRootPart.Position
LocalPlayer.Character.Humanoid.HipHeight =2.4
if RemotesFolder.Name ~= loadstring(base64decode("UmVtb3Rlc0ZvbGRlcg=="))() then
LocalPlayer.Character.Collision.Position = LocalPlayer.Character.HumanoidRootPart.Position
end
end
if GodmodeFolder then Folder:Destroy()
end
if LocalPlayer.Character then
for _, v in pairs(LocalPlayer.Character:GetChildren()) do
if v.Name ~= loadstring(base64decode("Q29sbGlzaW9uQ2xvbmU="))()  and v.Name ~= loadstring(base64decode("Q29sbGlzaW9u"))() and v.Name ~= loadstring(base64decode("SHVtYW5vaWRSb290UGFydA=="))() and v.Name ~= loadstring(base64decode("Q29sbGlzaW9uUGFydA=="))() then
if v:IsA(loadstring(base64decode("QmFzZVBhcnQ="))()) then
v.Transparency = 0
end
end
end
end
if  ReplicatedStorage:FindFirstChild(loadstring(base64decode("TGl2ZU1vZGlmaWVycw=="))()) and ReplicatedStorage:FindFirstChild(loadstring(base64decode("TGl2ZU1vZGlmaWVycw=="))()):FindFirstChild(loadstring(base64decode("SmFtbWlu"))()) then
local Jam = LocalPlayer.PlayerGui.MainUI.Initiator:FindFirstChild(loadstring(base64decode("TWFpbl9HYW1l"))()).Health.Jam
Jam.Playing = true
local Jamming = game:GetService(loadstring(base64decode("U291bmRTZXJ2aWNl"))()).Main.Jamming
Jamming.Enabled =  true
end
if Library.KeybindFrame then
local pos = Library.KeybindFrame.Position
getgenv().NovaHub_KeybindPos = { pos.X.Scale, pos.X.Offset, pos.Y.Scale, pos.Y.Offset }
end
Library:Unload()
ESPLibrary:Unload()
ShouldStop = true
end
})
end)
if ThemeManager then
ThemeManager:SetLibrary(Library)
ThemeManager:SetFolder(loadstring(base64decode("Tm92YUh1Yg=="))())
end
if SaveManager then
SaveManager:SetLibrary(Library)
SaveManager:IgnoreThemeSettings()
SaveManager:SetIgnoreIndexes({'MenuKeybind'})
SaveManager:SetFolder(loadstring(base64decode("Tm92YUh1Yi9ET09SU0xPQkJZ"))())
SaveManager:BuildConfigSection(Tabs['Settings'])
end
if ThemeManager then
ThemeManager:ApplyToTab(Tabs['Settings'])
end
Notify(loadstring(base64decode("U3VjY2Vzc2Z1bGx5IExvYWRlZCBmb3IgR2FtZSB8ICBET09SUyA="))(),4)
end

--==================================================================--
--  IRT | Тело Abysall Continued, перенесённое на базу IRTDoorsBETA
--  Совместимый слой: Linoria-база -> API тела скрипта
--==================================================================--


local LoadStart = tick()

local BaseUrl = loadstring(base64decode("aHR0cHM6Ly9yYXcuZ2l0aHVidXNlcmNvbnRlbnQuY29tL3RoZXJlYWxjb29raWVtb25zdGVyb2YxOTY2L0FieXNhbGxDb250aW51ZWQvbWFpbi8="))()

-- Таблица IRT: Environment (функции исполнителя) и ESPLibrary (полный ESP-API)
getgenv().IRT = {
	Legit = true
}
-- Алиас: внешние компоненты (ESP.luau, STX и др.) читают старое имя getgenv().Abysall
getgenv().Abysall = getgenv().IRT

getgenv().IRT.Environment = loadstring(game:HttpGet(BaseUrl .. loadstring(base64decode("Q29tcG9uZW50cy9FbnZpcm9ubWVudC5sdWF1"))()))()
getgenv().IRT.ESPLibrary  = loadstring(game:HttpGet(BaseUrl .. loadstring(base64decode("Q29tcG9uZW50cy9FU1AubHVhdQ=="))()))()

local IRT = getgenv().IRT

local function CloneReference(Object)
	if IRT and IRT.Environment.cloneref then
		return IRT.Environment.cloneref(Object)
	end
	return Object
end

local Services = setmetatable({}, {
	__index = function(Self, Name)
		return CloneReference(game:GetService(Name))
	end
})

-- Совместимость с Linoria ------------------------------------------------

-- Library:Notify принимает и таблицу (формат Obsidian), и строку (формат Linoria)
do
	local RealNotify = Library.Notify
	Library.Notify = function(self, Data, Body, Time)
		if type(Data) == loadstring(base64decode("dGFibGU="))() then
			return RealNotify(self, Data.Description or Data.Title or loadstring(base64decode("Li4u"))(), Data.Time or Body or 5)
		end
		return RealNotify(self, Data, Body, Time)
	end
end

-- Library:OnUnload, если форк Linoria его не даёт
if not Library.OnUnload then
	local UnloadCallbacks = {}
	function Library:OnUnload(Callback)
		table.insert(UnloadCallbacks, Callback)
	end
	local RealUnload = Library.Unload
	Library.Unload = function(self, ...)
		for _, Callback in ipairs(UnloadCallbacks) do
			pcall(Callback)
		end
		if RealUnload then
			return RealUnload(self, ...)
		end
	end
end

-- Tab:UpdateWarningBox (Obsidian) поверх Linoria + чистка иконок табов
do
	local RealAddTab = Window.AddTab
	Window.AddTab = function(self, TabName, Icon)
		if type(Icon) == loadstring(base64decode("c3RyaW5n"))() and not Icon:match(loadstring(base64decode("XnJieGFzc2V0aWQ="))()) then
			Icon = nil
		end
		local Ok, Tab = pcall(RealAddTab, self, TabName, Icon)
		if not Ok or not Tab then
			Tab = RealAddTab(self, TabName)
		end
		if not Tab.UpdateWarningBox then
			function Tab:UpdateWarningBox(Warning)
				if type(Warning) ~= loadstring(base64decode("dGFibGU="))() then return end
				if not self._IRTWarningBox then
					self._IRTWarningBox = self:AddLeftGroupbox(loadstring(base64decode("4pqg77iPIFdhcm5pbmc="))())
					self._IRTWarningLabel = self._IRTWarningBox:AddLabel(loadstring(base64decode(""))())
				end
				local Text = (Warning.Title and (Warning.Title .. loadstring(base64decode("OiA="))()) or loadstring(base64decode(""))()) .. (Warning.Text or loadstring(base64decode(""))())
				if self._IRTWarningLabel.SetText then
					pcall(function() self._IRTWarningLabel:SetText(Text) end)
				end
			end
		end
		return Tab
	end
end

-- archives and stairwell locals
local TimeShowerSourceLabel
local TimeShowerToken = 0
local TimeShowerConnection
local BypassDronesStampedeConnection
local HonchoCorrectBoxConnection
local HonchoAutoDepositConnection
local HonchoESPObjects = {}
local HonchoProcessedRooms = {}
local HonchoDepositCache = {}
local AntiClosetTrash_Connection
local AntiRansom_Connection
local ForgetMeNotConnection
local ForgetMeNotRunning = false
local ForgetMeNotProcessing = {}
local ForgetMeNotNotified = {}
local WaterBypassConnection
local WaterParts = {}
local AlmaConnection
local AntiScribbles_Connection
local DroneConnection
local DroneWalkedIntoParents = {}
local OrbitDroppedItemsConnection
local OrbitDroppedItemsAngle = 0
local OrbitDroppedItemsLastTeleport = 0
local OrbitDroppedItemsPauseUntil = 0
local droppedItemsIntervalRunning = false
local Connections = {}



local Globals = {}
local Connections = {}
local ESPConnections = {}
local Groupboxes = {}
local FakePrompts = {}
local Functions = {}
local PartProperties = {}

local Objects = {
	Prompts = {},
	Objectives = {},
	Doors = {},
	HidingSpots = {},
	Entities = {},
	SeekObstructions = {},
	Items = {},
	Chests = {},
	Currency = {},
	Ladders = {},
	Misc = {},
	Obstructions = {},
	EventTriggers = {},
	JumpscareModules = {},
	SeekHighlights = {},
	EyestalkHighlights = {},
	SeekNodes = {},
	SeekDuckBoards = {},
	SeekBridges = {},
	PathLights = {}
}

Globals.IncompatibleMessage = loadstring(base64decode("WW91ciBleGVjdXRvciBkb2Vzbid0IHN1cHBvcnQgdGhpcyBmZWF0dXJlLg=="))()

Functions.CheckCompatability = function(Array)
	for _, Name in Array do
		if not IRT.Environment[Name] then
			return false
		end
	end
	return true
end



local LocalPlayer = Services.Players.LocalPlayer


local PortraitName = loadstring(base64decode("TWlycm9yUmlnX1BvcnRyYWl0Xw=="))() .. LocalPlayer.Name


local Entities = {
	[loadstring(base64decode("VFZfU3RhbmQ="))()] = {
		Alias = loadstring(base64decode("Tm9pc2VfVFY="))(),
		NotifyMessage = { Title = loadstring(base64decode("Tm9pc2UgdHYgc3Bhd25lZC4="))(), Body = loadstring(base64decode("RG9udCBnZXQgbmVhciBpdA=="))() }
	},
	[PortraitName] = {
		Alias = loadstring(base64decode("UG9ydHJhaXQ="))(),
		NotifyMessage = { Title = loadstring(base64decode("UG9ydHJhaXQnIGhhcyBzcGF3bmVkLg=="))(), Body = loadstring(base64decode("VXNlIGhpbSB0byBkdXBsaWNhdGUgaXRlbXMu"))() }
	},
	[loadstring(base64decode("U3RlbXNFbnRpdHk="))()] = {
	    Alias = 'Balls',
		NotifyMessage = { Title = loadstring(base64decode("QmFsbHM="))(), Body = loadstring(base64decode("QmFsbHMu"))()}
	},
	[loadstring(base64decode("Tm9pc2VNb2RlbA=="))()] = {
		Alias = 'Noise',
		NotifyMessage = { Title = loadstring(base64decode("RW50aXR5ICdOb2lzZScgaGFzIHNwYXduZWQu"))(), Body = loadstring(base64decode("RG9udCBsZXQgaXQgdG91Y2ggeW91Lg=="))() }
	},
	[loadstring(base64decode("Q3JlYWs="))()] = {
		Alias = loadstring(base64decode("Q3JlYWs="))(),
		NotifyMessage = { Title = loadstring(base64decode("RW50aXR5ICdDcmVhaycgaGFzIHNwYXduZWQu"))(), Body = loadstring(base64decode("RG9udCB0b3VjaCBoaW0u"))() }
	},
	[loadstring(base64decode("RHJvbmVzU3RhbXBlZGU="))()] = {
		Alias = loadstring(base64decode("RHJvbmVzU3RhbXBlZGU="))(),
		NotifyMessage = { Title = loadstring(base64decode("RW50aXR5ICdEcm9uZXMgU3RhbXBlZGUnIGhhcyBzcGF3bmVkLg=="))(), Body = loadstring(base64decode("RmluZCBhIGhpZGluZyBzcG90Lg=="))() }
	},
	[loadstring(base64decode("VGVsbGVyUmln"))()] = {
		Alias = loadstring(base64decode("VGVsbGVy"))(),
		NotifyMessage = { Title = loadstring(base64decode("RW50aXR5ICdUZWxsZXInIGhhcyBzcGF3bmVkLg=="))(), Body = loadstring(base64decode("RG9udCB3b3JyeSwgaGVzIG9ubHkgYW5ub3lpbmcu"))() }
	},
	[loadstring(base64decode("U2NyaWJibGVz"))()] = {
		Alias = loadstring(base64decode("U2NyaWJibGVz"))(),
		NotifyMessage = { Title = loadstring(base64decode("RW50aXR5ICdTY3JpYmJsZXMnIGhhcyBzcGF3bmVkLg=="))(), Body = loadstring(base64decode("RmluZCBhIGhpZGluZyBzcG90Lg=="))() }
	},
	[loadstring(base64decode("QmFzaE1vdmluZw=="))()] = {
		Alias = loadstring(base64decode("QmFzaA=="))(),
		NotifyMessage = { Title = loadstring(base64decode("RW50aXR5ICdCYXNoJyBoYXMgc3Bhd25lZC4="))(), Body = loadstring(base64decode("RmluZCBhIGhpZGluZyBzcG90Lg=="))()}
	},
	[loadstring(base64decode("UnVzaE1vdmluZw=="))()] = {
		Alias = loadstring(base64decode("UnVzaA=="))(),
		NotifyMessage = { Title = loadstring(base64decode("RW50aXR5ICdSdXNoJyBoYXMgc3Bhd25lZC4="))(), Body = loadstring(base64decode("RmluZCBhIGhpZGluZyBzcG90Lg=="))() }
	},
	[loadstring(base64decode("QW1idXNoTW92aW5n"))()] = {
		Alias = loadstring(base64decode("QW1idXNo"))(),
		NotifyMessage = { Title = loadstring(base64decode("RW50aXR5ICdBbWJ1c2gnIGhhcyBzcGF3bmVkLg=="))(), Body = loadstring(base64decode("RmluZCBhIGhpZGluZyBzcG90Lg=="))() }
	},
	[loadstring(base64decode("RXllcw=="))()] = {
		Alias = loadstring(base64decode("RXllcw=="))(),
		NotifyMessage = { Title = loadstring(base64decode("RW50aXR5ICdFeWVzJyBoYXMgc3Bhd25lZC4="))(), Body = loadstring(base64decode("QXZvaWQgbG9va2luZyBhdCBpdC4="))() }
	},
	[loadstring(base64decode("TG9va21hbg=="))()] = {
		Alias = loadstring(base64decode("RXllcw=="))(),
		NotifyMessage = { Title = loadstring(base64decode("RW50aXR5ICdFeWVzJyBoYXMgc3Bhd25lZC4="))(), Body = loadstring(base64decode("QXZvaWQgbG9va2luZyBhdCBpdC4="))() }
	},
	[loadstring(base64decode("QmFja2Rvb3JSdXNo"))()] = {
		Alias = loadstring(base64decode("QmxpdHo="))(),
		NotifyMessage = { Title = loadstring(base64decode("RW50aXR5ICdCbGl0eicgaGFzIHNwYXduZWQu"))(), Body = loadstring(base64decode("RmluZCBhIGhpZGluZyBzcG90Lg=="))() }
	},
	[loadstring(base64decode("QmFja2Rvb3JMb29rbWFu"))()] = {
		Alias = loadstring(base64decode("TG9va21hbg=="))(),
		NotifyMessage = { Title = loadstring(base64decode("RW50aXR5ICdMb29rbWFuJyBoYXMgc3Bhd25lZC4="))(), Body = loadstring(base64decode("QXZvaWQgbG9va2luZyBhdCBpdHMgZXllcy4="))() }
	},
	[loadstring(base64decode("R3JvdW5kc2tlZXBlcg=="))()] = {
		Alias = loadstring(base64decode("R3JvdW5kc2tlZXBlcg=="))(),
		NotifyMessage = { Title = loadstring(base64decode("RW50aXR5ICdHcm91bmRza2VlcGVyJyBoYXMgc3Bhd25lZC4="))(), Body = loadstring(base64decode("QXZvaWQgc3RlcHBpbmcgb24gdGhlIGdyYXNzLg=="))() }
	},
	[loadstring(base64decode("QTYw"))()] = {
		Alias = loadstring(base64decode("QS02MA=="))(),
		NotifyMessage = { Title = loadstring(base64decode("RW50aXR5ICdBLTYwJyBoYXMgc3Bhd25lZC4="))(), Body = loadstring(base64decode("RmluZCBhIGhpZGluZyBzcG90Lg=="))() }
	},
	[loadstring(base64decode("QTEyMA=="))()] = {
		Alias = loadstring(base64decode("QS0xMjA="))(),
		NotifyMessage = { Title = loadstring(base64decode("RW50aXR5ICdBLTEyMCcgaGFzIHNwYXduZWQu"))(), Body = loadstring(base64decode("RmluZCBhIGhpZGluZyBzcG90Lg=="))() }
	},
	[loadstring(base64decode("R2xvb21iYXRTd2FybQ=="))()] = {
		Alias = loadstring(base64decode("R2xvb21iYXQgU3dhcm0="))(),
		NotifyMessage = { Title = loadstring(base64decode("RW50aXR5ICdHbG9vbWJhdCBTd2FybScgaGFzIHNwYXduZWQu"))(), Body = loadstring(base64decode("S2VlcCBhbGwgbGlnaHQgc291cmNlcyB0dXJuZWQgb2ZmLg=="))() }
	},
	[loadstring(base64decode("R2xpdGNoUnVzaA=="))()] = {
		Alias = loadstring(base64decode("Uk5JVVNIQ0c9PQ=="))(),
		NotifyMessage = { Title = loadstring(base64decode("RW50aXR5ICdSTklVU0hDRz09JyBoYXMgc3Bhd25lZC4="))(), Body = loadstring(base64decode("RmluZCBhIGhpZGluZyBzcG90Lg=="))() }
	},
	[loadstring(base64decode("R2xpdGNoQW1idXNo"))()] = {
		Alias = loadstring(base64decode("QVIweE1CVVNI"))(),
		NotifyMessage = { Title = loadstring(base64decode("RW50aXR5ICdBUjB4TUJVU0gnIGhhcyBzcGF3bmVkLg=="))(), Body = loadstring(base64decode("RmluZCBhIGhpZGluZyBzcG90Lg=="))() }
	},
	[loadstring(base64decode("TW9udW1lbnRFbnRpdHk="))()] = {
		Alias = loadstring(base64decode("TW9udW1lbnQ="))(),
		NotifyMessage = { Title = loadstring(base64decode("RW50aXR5ICdNb251bWVudCcgaGFzIHNwYXduZWQu"))(), Body = loadstring(base64decode("SXQgY2FuJ3QgbW92ZSB3aGlsZSB5b3UgYXJlIGxvb2tpbmcgYXQgaXQu"))() }
	},
	[loadstring(base64decode("SmVmZlRoZUtpbGxlcg=="))()] = {
		Alias = loadstring(base64decode("SmVmZiB0aGUgS2lsbGVy"))(),
		NotifyMessage = { Title = loadstring(base64decode("RW50aXR5ICdKZWZmIHRoZSBLaWxsZXInIGhhcyBzcGF3bmVkLg=="))(), Body = loadstring(base64decode("QXZvaWQgdG91Y2hpbmcgaGltLg=="))() }
	},
	[loadstring(base64decode("Q3VzdG9tRW50aXR5"))()] = {
		Alias = loadstring(base64decode("Q3VzdG9tIEVudGl0eQ=="))(),
		NotifyMessage = { Title = loadstring(base64decode("RW50aXR5ICdDdXN0b20gRW50aXR5JyBoYXMgc3Bhd25lZC4="))(), Body = loadstring(base64decode("RmluZCBhIGhpZGluZyBzcG90Lg=="))() }
	},
	[loadstring(base64decode("RnJvemVuQW1idXNo"))()] = {
		Alias = loadstring(base64decode("RnJvemVuIEFtYnVzaA=="))(),
		NotifyMessage = { Title = loadstring(base64decode("RW50aXR5ICdGcm96ZW4gQW1idXNoJyBoYXMgc3Bhd25lZC4="))(), Body = loadstring(base64decode("RmluZCBhIGhpZGluZyBzcG90Lg=="))() }
	},
	[loadstring(base64decode("U2FsbHlNb3Zpbmc="))()] = {
		Alias = loadstring(base64decode("U2FsbHk="))(),
		NotifyMessage = { Title = loadstring(base64decode("RW50aXR5ICdTYWxseScgaGFzIHNwYXduZWQu"))(), Body = loadstring(base64decode("RmluZCBoZXIgaG9yc2UgYW5kIHJvcCBpdC4="))() }
	}
}

local EntityIcons = {
	[loadstring(base64decode("UnVzaE1vdmluZw=="))()]      = loadstring(base64decode("cmJ4YXNzZXRpZDovLzEwNzE2MDMyMjYy"))(),
	[loadstring(base64decode("QW1idXNoTW92aW5n"))()]    = loadstring(base64decode("cmJ4YXNzZXRpZDovLzEwMTEwNTc2NjYz"))(),
	[loadstring(base64decode("QTYw"))()]             = loadstring(base64decode("cmJ4YXNzZXRpZDovLzEyNTcxMDkyMjk1"))(),
	[loadstring(base64decode("QTEyMA=="))()]            = loadstring(base64decode("cmJ4YXNzZXRpZDovLzEyNzExNTkxNjY1"))(),
	[loadstring(base64decode("QmFja2Rvb3JSdXNo"))()]    = loadstring(base64decode("cmJ4YXNzZXRpZDovLzE2NjAyMDIzNDkw"))(),
	[loadstring(base64decode("RXllcw=="))()]            = loadstring(base64decode("cmJ4YXNzZXRpZDovLzEwMTgzNzA0Nzcy"))(),
	[loadstring(base64decode("TG9va21hbg=="))()]         = loadstring(base64decode("cmJ4YXNzZXRpZDovLzEwMTgzNzA0Nzcy"))(),
	[loadstring(base64decode("QmFja2Rvb3JMb29rbWFu"))()] = loadstring(base64decode("cmJ4YXNzZXRpZDovLzE2NzY0ODcyNjc3"))(),
	[loadstring(base64decode("R2xvb21iYXRTd2FybQ=="))()]   = loadstring(base64decode("cmJ4YXNzZXRpZDovLzc5MjIxMjAzMTE2NDcw"))(),
	[loadstring(base64decode("SGFsdA=="))()]            = loadstring(base64decode("cmJ4YXNzZXRpZDovLzExMzMxNzk1Mzk4"))(),
	[loadstring(base64decode("SmVmZlRoZUtpbGxlcg=="))()]   = loadstring(base64decode("cmJ4YXNzZXRpZDovLzk0NDc5NDMyMTU2Mjc4"))(),
	[loadstring(base64decode("R2xpdGNoUnVzaA=="))()]      = loadstring(base64decode("cmJ4YXNzZXRpZDovLzczODU5MjczMTAyOTE5"))(),
	[loadstring(base64decode("R2xpdGNoQW1idXNo"))()]    = loadstring(base64decode("cmJ4YXNzZXRpZDovLzg4MzY5Njc4NDMzMzU5"))(),
	[loadstring(base64decode("U2FsbHlNb3Zpbmc="))()]     = loadstring(base64decode("cmJ4YXNzZXRpZDovLzEwODQwODg4MDcw"))(),
	[loadstring(base64decode("TW9udW1lbnRFbnRpdHk="))()]  = loadstring(base64decode("cmJ4YXNzZXRpZDovLzg4OTMzNTU2ODczMDE3"))(),
	[loadstring(base64decode("R3JvdW5kc2tlZXBlcg=="))()]   = loadstring(base64decode("cmJ4YXNzZXRpZDovLzExNDk5MTM4MDExNTU1Nw=="))()
}

local ItemNames = {
	[loadstring(base64decode("QWJyYWhhbUhhdA=="))()]        = loadstring(base64decode("SGF0"))(),
	[loadstring(base64decode("TGFyZ2VTY3Jldw=="))()]        = loadstring(base64decode("U2NyZXc="))(),
	[loadstring(base64decode("RGlua3lMYW1w"))()]         = loadstring(base64decode("TGFtcA=="))(),
	[loadstring(base64decode("Qm90dGxlQ3JhdGU="))()]       = loadstring(base64decode("MTgrIEJvdHRsZXM="))(),
	[loadstring(base64decode("R3dlZW5Tb2RhUGFjaw=="))()]     = loadstring(base64decode("R3dlZW4gU29kYSBQYWNr"))(),
	[loadstring(base64decode("QnJva2VuTW9uaXRvcg=="))()]     = loadstring(base64decode("QnJva2VuIE1vbml0b3I="))(),
	[loadstring(base64decode("SmVycnlDYW4="))()]          = loadstring(base64decode("SmVycnkgQ2Fu"))(),
 	[loadstring(base64decode("U2FsbHlUb3lPYnRhaW4="))()]    = loadstring(base64decode("U2FsbHkgVG95"))(),
	[loadstring(base64decode("TGVmdG92ZXJz"))()]         = loadstring(base64decode("THVuY2ggQm94"))(),
	[loadstring(base64decode("SG9uZXlQb3Q="))()]          = loadstring(base64decode("SG9uZXkgUG90"))(),
	[loadstring(base64decode("RmloRmxha2Vz"))()]         = loadstring(base64decode("RmloIEZvb2Q="))(),
	[loadstring(base64decode("U2VjcmV0Q0Q="))()]          = loadstring(base64decode("Q0QgRGlzYw=="))(),
	[loadstring(base64decode("UGl6emE="))()]             = loadstring(base64decode("UGl6emE="))(),
	[loadstring(base64decode("UGFwZXJQbGFuZVBpY2t1cA=="))()]  = loadstring(base64decode("UGFwZXIgUGxhbmU="))(),
	[loadstring(base64decode("TGlnaHRlcg=="))()]           = loadstring(base64decode("TGlnaHRlcg=="))(),
	[loadstring(base64decode("Rmxhc2hsaWdodA=="))()]        = loadstring(base64decode("Rmxhc2hsaWdodA=="))(),
	[loadstring(base64decode("TG9ja3BpY2s="))()]          = loadstring(base64decode("TG9ja3BpY2tz"))(),
	[loadstring(base64decode("Vml0YW1pbnM="))()]          = loadstring(base64decode("Vml0YW1pbnM="))(),
	[loadstring(base64decode("QmFuZGFnZQ=="))()]           = loadstring(base64decode("QmFuZGFnZQ=="))(),
	[loadstring(base64decode("U3RhclZpYWw="))()]          = loadstring(base64decode("U3RhcmxpZ2h0IFZpYWw="))(),
	[loadstring(base64decode("U3RhckJvdHRsZQ=="))()]        = loadstring(base64decode("U3RhcmxpZ2h0IEJvdHRsZQ=="))(),
	[loadstring(base64decode("U3Rhckp1Zw=="))()]           = loadstring(base64decode("U3RhcmxpZ2h0IEJhcnJlbA=="))(),
	[loadstring(base64decode("U2hha2VsaWdodA=="))()]        = loadstring(base64decode("R3VtbXkgRmxhc2hsaWdodA=="))(),
	[loadstring(base64decode("U3RyYXBsaWdodA=="))()]        = loadstring(base64decode("U3RyYXBsaWdodA=="))(),
	[loadstring(base64decode("QnVsa2xpZ2h0"))()]         = loadstring(base64decode("U3BvdGxpZ2h0"))(),
	[loadstring(base64decode("QmF0dGVyeQ=="))()]           = loadstring(base64decode("QmF0dGVyeQ=="))(),
	[loadstring(base64decode("Q2FuZGxl"))()]            = loadstring(base64decode("Q2FuZGxl"))(),
	[loadstring(base64decode("Q3J1Y2lmaXg="))()]          = loadstring(base64decode("Q3J1Y2lmaXg="))(),
	[loadstring(base64decode("Q3J1Y2lmaXhXYWxs"))()]      = loadstring(base64decode("Q3J1Y2lmaXg="))(),
	[loadstring(base64decode("R2xvd3N0aWNrcw=="))()]        = loadstring(base64decode("R2xvd3N0aWNr"))(),
	[loadstring(base64decode("U2tlbGV0b25LZXk="))()]       = loadstring(base64decode("U2tlbGV0b24gS2V5"))(),
	[loadstring(base64decode("Q2FuZHk="))()]             = loadstring(base64decode("Q2FuZHk="))(),
	[loadstring(base64decode("U2hpZWxkTWluaQ=="))()]        = loadstring(base64decode("TWluaSBTaGllbGQgUG90aW9u"))(),
	[loadstring(base64decode("U2hpZWxkQmln"))()]         = loadstring(base64decode("QmlnIFNoaWVsZCBQb3Rpb24="))(),
	[loadstring(base64decode("QmFuZGFnZVBhY2s="))()]       = loadstring(base64decode("QmFuZGFnZSBQYWNr"))(),
	[loadstring(base64decode("QmF0dGVyeVBhY2s="))()]       = loadstring(base64decode("QmF0dGVyeSBQYWNr"))(),
	[loadstring(base64decode("UmlmdENhbmRsZQ=="))()]        = loadstring(base64decode("TW9vbmxpZ2h0IENhbmRsZQ=="))(),
	[loadstring(base64decode("TGFzZXJQb2ludGVy"))()]      = loadstring(base64decode("TGFzZXIgUG9pbnRlcg=="))(),
	[loadstring(base64decode("SG9seUdyZW5hZGU="))()]       = loadstring(base64decode("SG9seSBIYW5kIEdyZW5hZGU="))(),
	[loadstring(base64decode("U2hlYXJz"))()]            = loadstring(base64decode("U2hlYXJz"))(),
	[loadstring(base64decode("U21vb3RoaWU="))()]          = loadstring(base64decode("U21vb3RoaWU="))(),
	[loadstring(base64decode("Q2hlZXNl"))()]            = loadstring(base64decode("Q2hlZXNl"))(),
	[loadstring(base64decode("QnJlYWQ="))()]             = loadstring(base64decode("QnJlYWQ="))(),
	[loadstring(base64decode("QWxhcm1DbG9jaw=="))()]        = loadstring(base64decode("QWxhcm0gQ2xvY2s="))(),
	[loadstring(base64decode("UmlmdFNtb290aGll"))()]      = loadstring(base64decode("TW9vbmxpZ2h0IFNtb290aGll"))(),
	[loadstring(base64decode("R3dlZW5Tb2Rh"))()]         = loadstring(base64decode("R3dlZW4gU29kYQ=="))(),
	[loadstring(base64decode("R2xpdGNoQ3ViZQ=="))()]        = loadstring(base64decode("R2xpdGNoIEZyYWdtZW50"))(),
	[loadstring(base64decode("U2Nhbm5lcg=="))()]           = loadstring(base64decode("VGFibGV0"))(),
	[loadstring(base64decode("Qm9tYg=="))()]              = loadstring(base64decode("Qm9tYg=="))(),
	[loadstring(base64decode("S25vY2tib21i"))()]         = loadstring(base64decode("S25vY2tib21i"))(),
	[loadstring(base64decode("TmFubmVy"))()]            = loadstring(base64decode("TmFubmVy"))(),
	[loadstring(base64decode("QmlnQm9tYg=="))()]           = loadstring(base64decode("QmlnIEJvbWI="))(),
	[loadstring(base64decode("U25ha2VCb3g="))()]          = loadstring(base64decode("SGlkaW5nIEJveA=="))(),
	[loadstring(base64decode("R29sZEd1bg=="))()]           = loadstring(base64decode("R29sZGVuIEd1bg=="))(),
	[loadstring(base64decode("U3RvcFNpZ24="))()]          = loadstring(base64decode("U3RvcCBTaWdu"))(),
	[loadstring(base64decode("VGlwSmFy"))()]            = loadstring(base64decode("VGlwIEphcg=="))(),
	[loadstring(base64decode("TGFudGVybg=="))()]           = loadstring(base64decode("TGFudGVybg=="))(),
	[loadstring(base64decode("SXJvbktleQ=="))()]           = loadstring(base64decode("SXJvbiBLZXk="))(),
	[loadstring(base64decode("TG90dXNQZXRhbA=="))()]        = loadstring(base64decode("TG90dXMgUGV0YWw="))(),
	[loadstring(base64decode("Q29tcGFzcw=="))()]           = loadstring(base64decode("Q29tcGFzcw=="))(),
	[loadstring(base64decode("TG90dXNQZXRhbFBpY2t1cA=="))()]  = loadstring(base64decode("TG90dXMgUGV0YWw="))(),
	[loadstring(base64decode("TGFudGVybkxpdEl0ZW0="))()]    = loadstring(base64decode("TGFudGVybg=="))(),
	[loadstring(base64decode("S2V5SXJvbg=="))()]           = loadstring(base64decode("SXJvbiBLZXk="))(),
	[loadstring(base64decode("SXJvbktleUZvckNyeXB0"))()]   = loadstring(base64decode("SXJvbiBLZXk="))(),
	[loadstring(base64decode("TG90dXNIb2xkZXI="))()]       = loadstring(base64decode("TG90dXMgUGV0YWw="))(),
	[loadstring(base64decode("TXVsdGl0b29s"))()]         = loadstring(base64decode("TXVsdGl0b29s"))(),
	[loadstring(base64decode("UmlmdEphcg=="))()]           = loadstring(base64decode("UmlmdCBKYXI="))(),
	[loadstring(base64decode("QWxvZVZlcmE="))()]          = loadstring(base64decode("QWxvZSBWZXJh"))(),
	[loadstring(base64decode("RG9udXQ="))()]             = loadstring(base64decode("RG9udXQ="))(),
	[loadstring(base64decode("TG90dXM="))()]             = loadstring(base64decode("TG90dXM="))(),
	[loadstring(base64decode("Qm94aW5nR2xvdmVz"))()]      = loadstring(base64decode("Qm94aW5nIEdsb3Zlcw=="))()
}

local CutsceneNames = {
    loadstring(base64decode("RmlndXJl"))(),
    loadstring(base64decode("RmlndXJlRW5k"))(),
    loadstring(base64decode("RmlndXJlSG90ZWxFbmQ="))(),
    loadstring(base64decode("RmlndXJlSG90ZWxGaXJl"))(),
    loadstring(base64decode("U2Vla0ludHJvRm9vbHM="))(),
    loadstring(base64decode("U2Vla0ludHJvSG90ZWw="))(),
    loadstring(base64decode("U2Vla0ludHJvTWluZXM="))(),
    loadstring(base64decode("U2Vla0ludHJvTWluZXMy"))(),
    loadstring(base64decode("U2VyZXdTZWVrRHJhaW4="))(),
    loadstring(base64decode("U2V3ZXJTZWVrTG93ZXI="))(),
    loadstring(base64decode("R3J1bWJsZU5lc3RFbmQ="))(),
    loadstring(base64decode("RXllc3RhbGtJbnRybw=="))(),
}

local Character
local Humanoid
local RootPart

local Collision
local CollisionClone
local CollisionPart
local CollisionPartClone

local Camera

local RemotesFolder   = Services.ReplicatedStorage:FindFirstChild(loadstring(base64decode("UmVtb3Rlc0ZvbGRlcg=="))())
local LiveModifiers   = Services.ReplicatedStorage:FindFirstChild(loadstring(base64decode("TGl2ZU1vZGlmaWVycw=="))())
local FloorReplicated = Services.ReplicatedStorage:FindFirstChild(loadstring(base64decode("Rmxvb3JSZXBsaWNhdGVk"))())
local CurrentRooms    = Services.Workspace:FindFirstChild(loadstring(base64decode("Q3VycmVudFJvb21z"))())
local Drops           = Services.Workspace:FindFirstChild(loadstring(base64decode("RHJvcHM="))())
local GameData        = Services.ReplicatedStorage:WaitForChild(loadstring(base64decode("R2FtZURhdGE="))())
local Floor           = GameData:WaitForChild(loadstring(base64decode("Rmxvb3I="))()).Value
local LatestRoom      = GameData:WaitForChild(loadstring(base64decode("TGF0ZXN0Um9vbQ=="))())
local FinishedLoadingRoom = GameData:FindFirstChild(loadstring(base64decode("RmluaXNoZWRMb2FkaW5nUm9vbQ=="))())
local RunService = game:GetService(loadstring(base64decode("UnVuU2VydmljZQ=="))())

if FinishedLoadingRoom then
	FinishedLoadingRoom:Destroy()
end

local function GetHiddenContainer()
	if Functions.CheckCompatability({loadstring(base64decode("Z2V0aHVp"))()}) then
		return IRT.Environment.gethui()
	end
	return Services.CoreGui
end

local NotificationLibrary = {
	LiveNotifications = 0,
	Notifications = 1
}

local Container = Instance.new(loadstring(base64decode("U2NyZWVuR3Vp"))())
Container.Name = IRT.ESPLibrary:GenerateRandomString()
Container.Parent = GetHiddenContainer()
Container.DisplayOrder = 32767
Container.ZIndexBehavior = Enum.ZIndexBehavior.Sibling

if not Library.Scheme then
	Library.Scheme = setmetatable({}, {
		__index = function(Self, Name)
			return Library[Name]
		end
	})
end

function NotificationLibrary:Notify(TitleText, Desc, Delay)
	task.spawn(function()
		local Notification = Instance.new(loadstring(base64decode("RnJhbWU="))())
		local Line = Instance.new(loadstring(base64decode("RnJhbWU="))())
		local Warning = Instance.new(loadstring(base64decode("SW1hZ2VMYWJlbA=="))())
		local UICorner = Instance.new(loadstring(base64decode("VUlDb3JuZXI="))())
		local UICorner2 = Instance.new(loadstring(base64decode("VUlDb3JuZXI="))())
		local Title = Instance.new(loadstring(base64decode("VGV4dExhYmVs"))())
		local Description = Instance.new(loadstring(base64decode("VGV4dExhYmVs"))())

		Notification.Name = loadstring(base64decode("Tm90aWZpY2F0aW9u"))()
		Notification.Parent = Container
		Notification.BackgroundColor3 = Library.Scheme.BackgroundColor
		Notification.BackgroundTransparency = 0.4
		Notification.BorderSizePixel = 0
		Notification.Position = UDim2.new(1, 5, 0, 60 + (60 * NotificationLibrary.LiveNotifications))
		Notification.Size = UDim2.new(0, 420, 0, 50)
		Notification:SetAttribute(loadstring(base64decode("SUQ="))(), NotificationLibrary.Notifications)
		Notification:SetAttribute(loadstring(base64decode("Q3VycmVudFBvc2l0aW9u"))(), Notification.Position)

		Line.Name = loadstring(base64decode("TGluZQ=="))()
		Line.Parent = Notification
		Line.BackgroundColor3 = Library.Scheme.AccentColor
		Line.BorderSizePixel = 0
		Line.Position = UDim2.new(0, 0, 1, -3)
		Line.Size = UDim2.new(0, 0, 0, 3)

		Warning.Name = loadstring(base64decode("V2FybmluZw=="))()
		Warning.Parent = Notification
		Warning.BackgroundTransparency = 1
		Warning.Position = UDim2.new(0, 10, 0, 5)
		Warning.Size = UDim2.new(0, 40, 0, 40)
		Warning.Image = loadstring(base64decode("cmJ4YXNzZXRpZDovLzM5NDQ2Njg4MjE="))()
		Warning.ImageColor3 = Library.Scheme.AccentColor
		Warning.ScaleType = Enum.ScaleType.Fit

		UICorner.CornerRadius = UDim.new(0, 20)
		UICorner.Parent = Warning

		UICorner2.CornerRadius = UDim.new(0, 4)
		UICorner2.Parent = Notification

		Title.Name = loadstring(base64decode("VGl0bGU="))()
		Title.Parent = Notification
		Title.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
		Title.BackgroundTransparency = 1
		Title.Position = UDim2.new(0, 60, 0.155, 0)
		Title.Size = UDim2.new(0, 205, 0, 15)
		Title.Text = TitleText or loadstring(base64decode("Li4u"))()
		Title.TextColor3 = Library.Scheme.FontColor
		Title.TextSize = 10
		Title.TextStrokeTransparency = 0.75
		Title.TextXAlignment = Enum.TextXAlignment.Left

		Description.Name = loadstring(base64decode("RGVzY3JpcHRpb24="))()
		Description.Parent = Notification
		Description.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
		Description.BackgroundTransparency = 1
		Description.Position = UDim2.new(0, 60, 0.483, 0)
		Description.Size = UDim2.new(0, 205, 0, 18)
		Description.Text = Desc or loadstring(base64decode("Li4u"))()
		Description.TextColor3 = Library.Scheme.FontColor
		Description.TextTransparency = 0.1
		Description.TextSize = 10
		Description.TextStrokeTransparency = 0.75
		Description.TextXAlignment = Enum.TextXAlignment.Left

		NotificationLibrary.LiveNotifications += 1
		NotificationLibrary.Notifications += 1

		Services.TweenService:Create(
			Notification,
			TweenInfo.new(1, Enum.EasingStyle.Exponential),
			{ Position = UDim2.new(1, -370, 0, Notification.Position.Y.Offset) }
		):Play()

		task.wait(0.25)
		if typeof(Delay) == loadstring(base64decode("SW5zdGFuY2U="))() then
			Delay.Destroying:Wait()
		else
			Services.TweenService:Create(
				Line,
				TweenInfo.new(Delay - 0.25, Enum.EasingStyle.Linear),
				{ Size = UDim2.new(0, 400, 0, 3) }
			):Play()
			task.wait(Delay - 0.25)
		end

		Notification:SetAttribute(loadstring(base64decode("RGVzdHJveWluZw=="))(), true)

		Services.TweenService:Create(
			Notification,
			TweenInfo.new(0.75, Enum.EasingStyle.Exponential, Enum.EasingDirection.In),
			{ Position = UDim2.new(1, 5, 0, Notification.Position.Y.Offset) }
		):Play()

		NotificationLibrary.LiveNotifications -= 1

		local NotifId = Notification:GetAttribute(loadstring(base64decode("SUQ="))())
		local NotifY = Notification:GetAttribute(loadstring(base64decode("Q3VycmVudFBvc2l0aW9u"))()).Y.Offset

		for _, Object in Container:GetChildren() do
			if Object.Name == loadstring(base64decode("Tm90aWZpY2F0aW9u"))()
				and Object:GetAttribute(loadstring(base64decode("SUQ="))())
				and Object:GetAttribute(loadstring(base64decode("SUQ="))()) > NotifId
				and Object:GetAttribute(loadstring(base64decode("RGVzdHJveWluZw=="))()) ~= true
				and Object.Position.Y.Offset ~= 60
			then
				local NewY = Object:GetAttribute(loadstring(base64decode("Q3VycmVudFBvc2l0aW9u"))()).Y.Offset - 60
				Object:SetAttribute(loadstring(base64decode("Q3VycmVudFBvc2l0aW9u"))(), UDim2.new(1, -450, 0, NewY))
				Services.TweenService:Create(
					Object,
					TweenInfo.new(1, Enum.EasingStyle.Exponential, Enum.EasingDirection.InOut),
					{ Position = UDim2.new(1, -370, 0, NewY) }
				):Play()
			end
		end

		task.wait(0.75)
		Notification:Destroy()
	end)
end

Globals.DoorsNotify = function(NotifyOptions)
	local function PlaySound(Parent, SoundId, Volume)
		local Sound = Instance.new(loadstring(base64decode("U291bmQ="))())
		Sound.SoundId = SoundId
		Sound.Volume = Volume or 1
		Sound.Parent = Parent
		task.spawn(function()
			task.wait(0.1)
			Sound:Play()
			Sound.Ended:Wait()
			Sound:Destroy()
		end)
	end

	local PlayerGui = LocalPlayer:WaitForChild(loadstring(base64decode("UGxheWVyR3Vp"))())
	local UIContainer = PlayerGui:FindFirstChild(loadstring(base64decode("R2xvYmFsVUk="))()) or PlayerGui:FindFirstChild(loadstring(base64decode("TWFpblVJ"))())
	if not UIContainer then return end

	local AchievementsHolder = UIContainer:FindFirstChild(loadstring(base64decode("QWNoaWV2ZW1lbnRzSG9sZGVy"))())
	if not AchievementsHolder then return end

	local Achievement = AchievementsHolder.Achievement:Clone()
	Achievement.Size = UDim2.new(0, 0, 0, 0)
	Achievement.Frame.Position = UDim2.new(1.1, 0, 0, 0)
	Achievement.Name = loadstring(base64decode("TGl2ZUFjaGlldmVtZW50"))()
	Achievement.Visible = true

	Achievement.Frame.TextLabel.Text = NotifyOptions.Style or loadstring(base64decode("Tk9USUZJQ0FUSU9O"))()
	Achievement.Frame.Details.Title.Text = NotifyOptions.Title or loadstring(base64decode("U2VtIFTDrXR1bG8="))()
	Achievement.Frame.Details.Desc.Text = NotifyOptions.Description or loadstring(base64decode("U2VtIERlc2NyacOnw6Nv"))()
	Achievement.Frame.Details.Reason.Text = NotifyOptions.Reason or loadstring(base64decode(""))()
	Achievement.Frame.ImageLabel.Image = (NotifyOptions.Image ~= loadstring(base64decode(""))() and NotifyOptions.Image) or loadstring(base64decode("cmJ4YXNzZXRpZDovLzYwMjM0MjY5MjM="))()

	local Color = NotifyOptions.Color or Color3.new(1, 1, 1)
	Achievement.Frame.TextLabel.TextColor3 = Color
	Achievement.Frame.UIStroke.Color = Color
	Achievement.Frame.Glow.ImageColor3 = Color
	Achievement.Parent = AchievementsHolder

	PlaySound(AchievementsHolder, loadstring(base64decode("cmJ4YXNzZXRpZDovLzEwNDY5OTM4OTg5"))(), 1)

	task.spawn(function()
		Achievement:TweenSize(UDim2.new(1, 0, 0.2, 0), loadstring(base64decode("SW4="))(), loadstring(base64decode("UXVhZA=="))(), 0.8, true)
		task.wait(0.8)
		Achievement.Frame:TweenPosition(UDim2.new(0, 0, 0, 0), loadstring(base64decode("T3V0"))(), loadstring(base64decode("UXVhZA=="))(), 0.5, true)
		Services.TweenService:Create(
			Achievement.Frame.Glow,
			TweenInfo.new(1, Enum.EasingStyle.Quad, Enum.EasingDirection.In),
			{ ImageTransparency = 1 }
		):Play()

		if typeof(NotifyOptions.Time) == loadstring(base64decode("SW5zdGFuY2U="))() then
			NotifyOptions.Time.Destroying:Wait()
		else
			task.wait(NotifyOptions.Time or 5)
		end

		Achievement.Frame:TweenPosition(UDim2.new(1.1, 0, 0, 0), loadstring(base64decode("SW4="))(), loadstring(base64decode("UXVhZA=="))(), 0.5, true)
		task.wait(0.5)
		Achievement:TweenSize(UDim2.new(1, 0, -0.1, 0), loadstring(base64decode("SW5PdXQ="))(), loadstring(base64decode("UXVhZA=="))(), 0.5, true)
		task.wait(0.5)
		Achievement:Destroy()
	end)
end

Globals.STX = loadstring(game:HttpGet(loadstring(base64decode("aHR0cHM6Ly9yYXcuZ2l0aHVidXNlcmNvbnRlbnQuY29tL2JvY2FqMTExMDA0L0FieXNhbGwvcmVmcy9oZWFkcy9tYWluL0NvbXBvbmVudHMvU1RYLmx1YXU="))()))()
Functions.Notify = function(Settings)
	local HiddenContainer = GetHiddenContainer()

	if not Settings.Body then
		Settings.Body = loadstring(base64decode("Li4u"))()
	end

	if not Options.NotifyStyle or Options.NotifyStyle.Value == loadstring(base64decode("SVJU"))() then
		local Sound = Instance.new(loadstring(base64decode("U291bmQ="))(), HiddenContainer)
		Sound.SoundId = loadstring(base64decode("cmJ4YXNzZXRpZDovLzg3ODQ4ODU0MzE="))()
		Sound.Volume = (Toggles.NotifyPlaySound and Toggles.NotifyPlaySound.Value and Options.NotifySoundVolume.Value) or (Toggles.NotifyPlaySound and 0 or 3)
		Sound.PlayOnRemove = true
		Sound:Destroy()
		NotificationLibrary:Notify(Settings.Title, Settings.Body, Settings.Time or 5)
	elseif Options.NotifyStyle.Value == loadstring(base64decode("RG9vcnM="))() then
		local IsEntity = false
		local EntityName = loadstring(base64decode(""))()
		for Index, Object in pairs(Entities) do
			if Object.NotifyMessage.Title == Settings.Title or Object.NotifyMessage.Body == Settings.Body then
				IsEntity = true
				EntityName = Index
			end
		end
		Globals.DoorsNotify({
			Title = loadstring(base64decode("SVJUIEh1Yg=="))(),
			Description = Settings.Title,
			Reason = Settings.Body,
			Style = IsEntity and loadstring(base64decode("V0FSTklORw=="))() or loadstring(base64decode("Tk9USUZJQ0FUSU9O"))(),
			Color = IsEntity and Color3.fromRGB(255, 0, 0) or Color3.fromRGB(255, 222, 189),
			Image = Settings.Image,
			Time = Settings.Time
		})
	elseif Options.NotifyStyle.Value == loadstring(base64decode("U1RY"))() then
		local Sound = Instance.new(loadstring(base64decode("U291bmQ="))(), HiddenContainer)
		Sound.SoundId = loadstring(base64decode("cmJ4YXNzZXRpZDovLzQ1OTA2NTczOTE="))()
		Sound.Volume = (Toggles.NotifyPlaySound and Toggles.NotifyPlaySound.Value and Options.NotifySoundVolume.Value) or (Toggles.NotifyPlaySound and 0 or 3)
		Sound.PlayOnRemove = true
		Sound:Destroy()

		if Settings.Image then
			Globals.STX:Notify(
				{Title = loadstring(base64decode("SVJUIEh1Yg=="))(), Description = Settings.Title .. loadstring(base64decode("XG4="))() .. Settings.Body},
				{OutlineColor = Library.Scheme.AccentColor,Time = Settings.Time or 5, Type = loadstring(base64decode("aW1hZ2U="))()},
				{Image = Settings.Image, ImageColor = Color3.fromRGB(255, 255, 255)}
			)
		else
			Globals.STX:Notify(
				{Title = loadstring(base64decode("SVJUIEh1Yg=="))(), Description = Settings.Title .. loadstring(base64decode("XG4="))() .. Settings.Body},
				{OutlineColor = Library.Scheme.AccentColor,Time = Settings.Time or 5, Type = loadstring(base64decode("ZGVmYXVsdA=="))()}
			)
		end
	else
		local Sound = Instance.new(loadstring(base64decode("U291bmQ="))(), HiddenContainer)
		Sound.SoundId = loadstring(base64decode("cmJ4YXNzZXRpZDovLzQ1OTA2NjI3NjY="))()
		Sound.Volume = (Toggles.NotifyPlaySound and Toggles.NotifyPlaySound.Value and Options.NotifySoundVolume.Value) or (Toggles.NotifyPlaySound and 0 or 3)
		Sound.PlayOnRemove = true
		Sound:Destroy()
		Library:OldNotify({ Title = Settings.Title, Description = Settings.Body, Time = Settings.Time })
	end
end

Functions.Caption = function(Text, PlaySound)
	if typeof(PlaySound) ~= loadstring(base64decode("Ym9vbGVhbg=="))() then
		PlaySound = true
	end
	local CaptionValue = Instance.new(loadstring(base64decode("TnVtYmVyVmFsdWU="))())
	local Caption = Globals.MainUI:WaitForChild(loadstring(base64decode("TWFpbkZyYW1l"))()):WaitForChild(loadstring(base64decode("Q2FwdGlvbg=="))()):Clone()
	local CaptionSound = Globals.MainUI:WaitForChild(loadstring(base64decode("SW5pdGlhdG9y"))()):WaitForChild(loadstring(base64decode("TWFpbl9HYW1l"))()):WaitForChild(loadstring(base64decode("UmVtaW5kZXI="))()):WaitForChild(loadstring(base64decode("Q2FwdGlvbg=="))())
	local CaptionSoundClone = CaptionSound:Clone()
	CaptionSoundClone.Parent = CaptionSound.Parent
	CaptionSoundClone.Volume = 0.1

	Caption.Destroying:Connect(function()
		CaptionValue:Destroy()
	end)

	for _, Child in Globals.MainUI:GetChildren() do
		if Child.Name == loadstring(base64decode("TGl2ZUNhcHRpb24="))() then
			Child:Destroy()
		end
	end

	Caption.Parent = Globals.MainUI
	Caption.Visible = true
	Caption.Name = loadstring(base64decode("TGl2ZUNhcHRpb24="))()
	Caption.Text = Text

	if PlaySound then
		CaptionSoundClone:Play()
	end

	Services.Debris:AddItem(CaptionSoundClone, 5)

	local HolderTween = Services.TweenService:Create(CaptionValue, TweenInfo.new(3), { Value = 100 })
	HolderTween:Play()
	HolderTween.Completed:Connect(function()
		CaptionValue:Destroy()
		Services.TweenService:Create(Caption, TweenInfo.new(4, Enum.EasingStyle.Linear), { TextTransparency = 1 }):Play()
		Services.TweenService:Create(Caption, TweenInfo.new(4, Enum.EasingStyle.Linear), { TextStrokeTransparency = 1 }):Play()
	end)
end

Functions.GetHasteTime = function()
	local TimeRemaining = FloorReplicated.DigitalTimer.Value
	local Minutes = math.floor(TimeRemaining / 60)
	local Seconds = TimeRemaining - (Minutes * 60)
	local MinutesText = Minutes < 10 and (loadstring(base64decode("MA=="))() .. tostring(Minutes)) or tostring(Minutes)
	local SecondsText = Seconds < 10 and (loadstring(base64decode("MA=="))() .. tostring(Seconds)) or tostring(Seconds)
	return MinutesText .. loadstring(base64decode("Og=="))() .. SecondsText
end

Library.OldNotify = Library.Notify
Library.Notify = function(Data, Body, Time)
	Functions.Notify({ Title = Body, Time = Time or 5 })
end

if not CurrentRooms or not LocalPlayer.Character or not CurrentRooms:FindFirstChildOfClass(loadstring(base64decode("TW9kZWw="))()) then
	Functions.Notify({ Title = loadstring(base64decode("V2FpdGluZyBmb3IgdGhlIGdhbWUgdG8gbG9hZC4uLg=="))() })
	while not CurrentRooms or not LocalPlayer.Character or not CurrentRooms:FindFirstChildOfClass(loadstring(base64decode("TW9kZWw="))()) do
		CurrentRooms = Services.Workspace:FindFirstChild(loadstring(base64decode("Q3VycmVudFJvb21z"))()) or CurrentRooms
		task.wait()
	end
	task.wait(4)
end
RemotesFolder = Services.ReplicatedStorage:FindFirstChild(loadstring(base64decode("RW50aXR5SW5mbw=="))())
	or Services.ReplicatedStorage:FindFirstChild(loadstring(base64decode("QnJpY2tz"))())
	or Services.ReplicatedStorage:FindFirstChild(loadstring(base64decode("UmVtb3Rlc0ZvbGRlcg=="))())
	or RemotesFolder
LiveModifiers = Services.ReplicatedStorage:FindFirstChild(loadstring(base64decode("TGl2ZU1vZGlmaWVycw=="))()) or LiveModifiers
FloorReplicated = Services.ReplicatedStorage:FindFirstChild(loadstring(base64decode("Rmxvb3JSZXBsaWNhdGVk"))()) or FloorReplicated
Drops = Services.Workspace:FindFirstChild(loadstring(base64decode("RHJvcHM="))()) or Drops
Floor = GameData:WaitForChild(loadstring(base64decode("Rmxvb3I="))()).Value

if not RemotesFolder then
	if Services.ReplicatedStorage:FindFirstChild(loadstring(base64decode("RW50aXR5SW5mbw=="))()) then
		RemotesFolder = Services.ReplicatedStorage:FindFirstChild(loadstring(base64decode("RW50aXR5SW5mbw=="))())
	elseif Services.ReplicatedStorage:FindFirstChild(loadstring(base64decode("QnJpY2tz"))()) then
		RemotesFolder = Services.ReplicatedStorage:FindFirstChild(loadstring(base64decode("QnJpY2tz"))())
	end
end

if Floor == loadstring(base64decode("SG90ZWw="))() and RemotesFolder and RemotesFolder.Name == loadstring(base64decode("QnJpY2tz"))() then
	Floor = loadstring(base64decode("T2xkSG90ZWw="))()
end

if not LiveModifiers then
	LiveModifiers = Instance.new(loadstring(base64decode("Rm9sZGVy"))())
end

if not FloorReplicated then
	FloorReplicated = Instance.new(loadstring(base64decode("Rm9sZGVy"))())
end

local FakeEvents = {
	Screech = Instance.new(loadstring(base64decode("UmVtb3RlRXZlbnQ="))()),
	Shade   = Instance.new(loadstring(base64decode("UmVtb3RlRXZlbnQ="))()),
	A90     = Instance.new(loadstring(base64decode("UmVtb3RlRXZlbnQ="))()),
	Surge   = Instance.new(loadstring(base64decode("UmVtb3RlRXZlbnQ="))()),
}

FakeEvents.Screech.Name  = loadstring(base64decode("U2NyZWVjaA=="))()
FakeEvents.Shade.Name    = loadstring(base64decode("U2hhZGVSZXN1bHQ="))()
FakeEvents.A90.Name      = loadstring(base64decode("QTkw"))()
FakeEvents.Surge.Name    = loadstring(base64decode("U3VyZ2VSZW1vdGU="))()

if RemotesFolder then
	FakeEvents.Screech_Real = RemotesFolder:WaitForChild(loadstring(base64decode("U2NyZWVjaA=="))())
	FakeEvents.Shade_Real   = RemotesFolder:WaitForChild(loadstring(base64decode("U2hhZGVSZXN1bHQ="))())
	FakeEvents.A90_Real     = RemotesFolder:FindFirstChild(loadstring(base64decode("QTkw"))())
	FakeEvents.Surge_Real   = RemotesFolder:FindFirstChild(loadstring(base64decode("U3VyZ2VSZW1vdGU="))())
else
	FakeEvents.Screech_Real = Instance.new(loadstring(base64decode("UmVtb3RlRXZlbnQ="))())
	FakeEvents.Shade_Real   = Instance.new(loadstring(base64decode("UmVtb3RlRXZlbnQ="))())
end

if RemotesFolder and RemotesFolder:FindFirstChild(loadstring(base64decode("Rm9vdHN0ZXBSZW1vdGVUaGF0V2VOZWVk"))()) then
    local RealRemote = RemotesFolder:FindFirstChild(loadstring(base64decode("Rm9vdHN0ZXBSZW1vdGVUaGF0V2VOZWVk"))())
    RealRemote:Destroy()

    local FakeRemote = Instance.new(loadstring(base64decode("UmVtb3RlRXZlbnQ="))(), RemotesFolder)
    FakeRemote.Name = loadstring(base64decode("Rm9vdHN0ZXBSZW1vdGVUaGF0V2VOZWVk"))()
end

Globals.FogInstances = {}
Globals.OldFog = Services.Lighting.FogEnd

for _, Object in Services.Lighting:GetChildren() do
	if Object:IsA(loadstring(base64decode("QXRtb3NwaGVyZQ=="))()) then
		Object:SetAttribute(loadstring(base64decode("RGVuc2l0eV9PbGQ="))(), Object.Density)

		local AtmoConnection = Object:GetPropertyChangedSignal(loadstring(base64decode("RGVuc2l0eQ=="))()):Connect(function()
			if Object.Density ~= 0 then
				Object:SetAttribute(loadstring(base64decode("RGVuc2l0eV9PbGQ="))(), Object.Density)
			end
			if Toggles.RemoveCameraFog.Value then
				Object.Density = 0
			end
		end)

		Object.Destroying:Once(function()
			AtmoConnection:Disconnect()
		end)

		table.insert(Connections, AtmoConnection)
		table.insert(Globals.FogInstances, Object)
	end
end

Globals.SeekNodesFolder = Instance.new(loadstring(base64decode("Rm9sZGVy"))(), Services.Workspace)
Globals.SeekNodesFolder.Name = IRT.ESPLibrary:GenerateRandomString()

Globals.RoomsNodesFolder = Instance.new(loadstring(base64decode("Rm9sZGVy"))(), Services.Workspace)
Globals.RoomsNodesFolder.Name = IRT.ESPLibrary:GenerateRandomString()

Functions.SendChat = function(Message)
	local Folder = Services.ReplicatedStorage:FindFirstChild(loadstring(base64decode("RGVmYXVsdENoYXRTeXN0ZW1FdmVudHM="))()) or Instance.new(loadstring(base64decode("Rm9sZGVy"))())
	local Event = Folder:FindFirstChild(loadstring(base64decode("U2F5TWVzc2FnZVJlcXVlc3Q="))()) or Instance.new(loadstring(base64decode("UmVtb3RlRXZlbnQ="))())
	Event:FireServer(Message, loadstring(base64decode("QWxs"))())
	local Channel = (Services.TextChatService:FindFirstChild(loadstring(base64decode("VGV4dENoYW5uZWxz"))()) and Services.TextChatService.TextChannels:FindFirstChild(loadstring(base64decode("UkJYR2VuZXJhbA=="))())) or Instance.new(loadstring(base64decode("VGV4dENoYW5uZWw="))())
	Channel:SendAsync(Message)
end

Functions.IsCrouching = function()
	if Floor == loadstring(base64decode("Rm9vbHM="))() or Floor == loadstring(base64decode("T2xkSG90ZWw="))() then
		return Character:GetAttribute(loadstring(base64decode("Q3JvdWNoaW5n"))())
	end
	return CollisionPart.CollisionGroup == loadstring(base64decode("UGxheWVyQ3JvdWNoaW5n"))()
end

Functions.GetInjuriesSpeed = function()
	return 0.075 * (Humanoid.MaxHealth - Humanoid.Health)
end

Functions.GetCurrentSpeed = function()
	local Speed = 15
	Speed += Character:GetAttribute(loadstring(base64decode("U3BlZWRCb29zdA=="))()) or 0
	Speed += Character:GetAttribute(loadstring(base64decode("U3BlZWRCb29zdEJlaGluZA=="))()) or 0
	Speed += Character:GetAttribute(loadstring(base64decode("U3BlZWRCb29zdEV4dHJh"))()) or 0
	Speed += (Floor == loadstring(base64decode("UGFydHk="))() and 10 or 0)
	Speed += (LiveModifiers:FindFirstChild(loadstring(base64decode("UGxheWVyRmFzdA=="))()) and 3 or 0)
	Speed += (LiveModifiers:FindFirstChild(loadstring(base64decode("UGxheWVyRmFzdGVy"))()) and 6 or 0)
	Speed += (LiveModifiers:FindFirstChild(loadstring(base64decode("UGxheWVyRmFzdGVzdA=="))()) and 20 or 0)
	Speed -= (LiveModifiers:FindFirstChild(loadstring(base64decode("UGxheWVyU2xvdw=="))()) and 3 or 0)
	Speed -= (LiveModifiers:FindFirstChild(loadstring(base64decode("UGxheWVyU2xvd0hlYWx0aA=="))()) and Functions.GetInjuriesSpeed() or 0)
	if Functions.IsCrouching() then
		if LiveModifiers:FindFirstChild(loadstring(base64decode("UGxheWVyQ3JvdWNoU2xvdw=="))()) then
			Speed -= 8
		elseif LiveModifiers:FindFirstChild(loadstring(base64decode("UGxheWVyU2xvdw=="))()) then
			Speed -= 8
		else
			Speed -= 5
		end
	end
	return Speed
end

Functions.GetMousePosition = function()
	if Library.IsMobile then
		return Vector2.new(Camera.ViewportSize.X / 2, Camera.ViewportSize.Y / 2)
	end
	local MouseLocation = Services.UserInputService:GetMouseLocation()
	return Vector2.new(MouseLocation.X, MouseLocation.Y)
end

Functions.FormatOxygen = function(Oxygen)
	return loadstring(base64decode("T3h5Z2VuOiA="))() .. (math.floor(Oxygen * 10) / 10) .. loadstring(base64decode("JQ=="))()
end

Functions.IsHidePersistent = function()
	return Floor == loadstring(base64decode("TWluZXM="))()
		or Floor == loadstring(base64decode("UmlwcGxl"))()
		or Floor == loadstring(base64decode("UGFydHk="))()
		or LiveModifiers:FindFirstChild(loadstring(base64decode("SGlkZUxldmVsMg=="))()) ~= nil
end

Functions.GetPlayerFromMouse = function(TargetPart, MaxDistance)
	local Closest
	local ClosestDistance = math.huge

	for _, Player in Services.Players:GetPlayers() do
		local Char = Player.Character
		if Char then
			local Target = Char:FindFirstChild(TargetPart)
			if Target then
				local Result = Camera:WorldToViewportPoint(Target.Position)
				local ScreenPos = Vector2.new(Result.X, Result.Y)
				local Distance = (Functions.GetMousePosition() - ScreenPos).Magnitude
				if Player.Name ~= LocalPlayer.Name and Distance < ClosestDistance and Distance < MaxDistance then
					Closest = Target
					ClosestDistance = Distance
				end
			end
		end
	end
	return Closest
end

local EntityDistances = {
	[loadstring(base64decode("UnVzaE1vdmluZw=="))()]    = 85,
	[loadstring(base64decode("U2NyaWJibGVz"))()]	  = 100,
	[loadstring(base64decode("QmFzaE1vdmluZw=="))()]    = 150,
	[loadstring(base64decode("RHJvbmVzU3RhbXBlZGU="))()] = 100,
	[loadstring(base64decode("QW1idXNoTW92aW5n"))()]  = 150,
	[loadstring(base64decode("QTYw"))()]           = 125,
	[loadstring(base64decode("QTEyMA=="))()]          = 85,
	[loadstring(base64decode("R2xpdGNoUnVzaA=="))()]    = 90,
	[loadstring(base64decode("R2xpdGNoQW1idXNo"))()]  = 175,
	[loadstring(base64decode("QmFja2Rvb3JSdXNo"))()]  = 85,
	[loadstring(base64decode("Q3VzdG9tRW50aXR5"))()]  = 85,
}

Functions.GetNearestEntity = function(CheckDisabled, List, UseRaycasting)
	local Nearest = { Distance = math.huge, Object = nil }

	for _, Entity in Objects.Entities do
		if not Entity or not Entity:IsA(loadstring(base64decode("TW9kZWw="))()) or not Entity:IsDescendantOf(Services.Workspace) then continue end
		if not EntityDistances[Entity.Name] or not Entity.PrimaryPart then continue end

		local EntityData = Entities[Entity.Name]
		if not EntityData then continue end
		if List and List[EntityData.Alias] then continue end

		local Distance = LocalPlayer:DistanceFromCharacter(Entity.PrimaryPart.Position)
		if Distance < EntityDistances[Entity.Name] and Distance < Nearest.Distance then
			if not CheckDisabled or Entity:GetAttribute(loadstring(base64decode("SW5hY3RpdmU="))()) ~= true then
				Nearest.Distance = Distance
				Nearest.Object = Entity
			end
		end
	end
	return Nearest.Object
end

Functions.GetNearestFigure = function()
	local Nearest = { Distance = math.huge, Object = nil }
	local FigureNames = { FigureRig = true, FigureRagdoll = true, Figure = true }

	for _, Object in Objects.Entities do
		if Object:IsA(loadstring(base64decode("TW9kZWw="))()) and Object.PrimaryPart and FigureNames[Object.Name] then
			local Distance = LocalPlayer:DistanceFromCharacter(Object.PrimaryPart.Position)
			if Distance < Nearest.Distance and Distance < 25 then
				Nearest.Distance = Distance
				Nearest.Object = Object
			end
		end
	end
	return Nearest.Object
end

Functions.GetNearestHidingSpot = function()
	local Nearest = { Distance = math.huge, Object = nil }
	local LastHideSpot = Character:FindFirstChild(loadstring(base64decode("TGFzdEhpZGVTcG90"))())

	local function IsHidingSpotName(Name)
		if typeof(Name) ~= loadstring(base64decode("c3RyaW5n"))() then return false end
		return string.find(string.lower(Name), loadstring(base64decode("aGlkaW5nc3BvdA=="))()) or string.find(string.lower(Name), loadstring(base64decode("aGlkaW5nX3Nwb3Q="))())
	end

	local function GetHidePrompt(Object)
	if not Object then return nil end

	local Prompt = Object:FindFirstChild(loadstring(base64decode("SGlkZVByb21wdA=="))()) or Object:FindFirstChild(loadstring(base64decode("SGlkaW5nUHJvbXB0"))())
	if Prompt then return Prompt end

	for _, Child in Object:GetDescendants() do
		if (Child:IsA(loadstring(base64decode("UHJveGltaXR5UHJvbXB0"))()) or Child:IsA(loadstring(base64decode("SW50ZXJhY3RQcm9tcHQ="))()))
			and (Child.Name == loadstring(base64decode("SGlkZVByb21wdA=="))() or Child.Name == loadstring(base64decode("SGlkaW5nUHJvbXB0"))() or IsHidingSpotName(Child.Name))
		then
			return Child
		end
	end

	if IsHidingSpotName(Object.Name) or IsHidingSpotName(Object.Parent and Object.Parent.Name) then
		return Object:FindFirstChild(loadstring(base64decode("SGlkZVByb21wdA=="))()) or Object:FindFirstChild(loadstring(base64decode("SGlkaW5nUHJvbXB0"))())
	end

	return nil
	end

	local function TryObject(Object)
		if not Object or not Object:IsDescendantOf(Services.Workspace) then return end
		if not Object.PrimaryPart and not Object:FindFirstChildOfClass(loadstring(base64decode("QmFzZVBhcnQ="))()) then return end
		local Prompt = GetHidePrompt(Object)
		if not Prompt then return end
		local PrimaryPart = Object.PrimaryPart or Object:FindFirstChildOfClass(loadstring(base64decode("QmFzZVBhcnQ="))())
		if not PrimaryPart then return end
		local Distance = LocalPlayer:DistanceFromCharacter(PrimaryPart.Position)
		if Distance < Prompt.MaxActivationDistance and Distance < Nearest.Distance then
			local Persistent = Functions.IsHidePersistent()
			if not Persistent or (LastHideSpot and LastHideSpot.Value ~= Object) or not LastHideSpot then
				Nearest.Distance = Distance
				Nearest.Object = Object
			end
		end
	end

	for _, Object in Objects.HidingSpots do
		TryObject(Object)
	end

	return Nearest.Object
end

Functions.GetNearestTurnNode = function()
	local Nearest = { Distance = math.huge, Object = nil }

	for _, Node in Objects.SeekNodes do
		local Distance = LocalPlayer:DistanceFromCharacter(Node.Position)
		if Distance < Options.AutoSteerMinecartTurnDistance.Value and Distance < Nearest.Distance then
			Nearest.Distance = Distance
			Nearest.Object = Node
		end
	end
	return Nearest.Object
end

Functions.GetNearestDuckBoard = function()
	local Nearest = { Distance = math.huge, Object = nil }

	for _, Board in Objects.SeekDuckBoards do
		if Board.PrimaryPart then
			local Distance = LocalPlayer:DistanceFromCharacter(Board.PrimaryPart.Position)
			if Distance < Options.AutoSteerMinecartDuckDistance.Value and Distance < Nearest.Distance then
				Nearest.Distance = Distance
				Nearest.Object = Board
			end
		end
	end
	return Nearest.Object
end

Functions.GetCurrentAnchor = function()
	local AnchorCode = Globals.MainUI.AnchorHintFrame.AnchorCode.Text
	for _, Anchor in Objects.Objectives do
		if Anchor.Name == loadstring(base64decode("TWluZXNBbmNob3I="))() and Anchor:FindFirstChild(loadstring(base64decode("U2lnbg=="))()) then
			if Anchor.Sign.TextLabel.Text == AnchorCode then
				return Anchor
			end
		end
	end
end

Functions.GetMinecart = function()
	return Camera:FindFirstChild(loadstring(base64decode("TWluZWNhcnRSaWc="))()) ~= nil
end

Functions.HasItem = function(Name, OnlyCharacter)
	if not OnlyCharacter and LocalPlayer.Backpack:FindFirstChild(Name) then
		return LocalPlayer.Backpack:FindFirstChild(Name)
	elseif Character:FindFirstChild(Name) then
		return Character:FindFirstChild(Name)
	end
end

Functions.GetFlyVelocity = function()
	if Humanoid.MoveDirection == Vector3.zero then
		return Humanoid.MoveDirection
	end
	local LookFlat = Vector3.new(Camera.CFrame.LookVector.X, 0, Camera.CFrame.LookVector.Z)
	local FlatFrame = CFrame.new(Camera.CFrame.Position, Camera.CFrame.Position + LookFlat)
	local Velocity = (Camera.CFrame * CFrame.new(FlatFrame:VectorToObjectSpace(Humanoid.MoveDirection))).Position - Camera.CFrame.Position
	if Velocity == Vector3.zero then
		return Velocity
	end
	return Velocity.Unit
end

Globals.PromptContainer = Instance.new(loadstring(base64decode("Rm9sZGVy"))())
Globals.PromptContainer.Name = loadstring(base64decode("UHJvbXB0Q29udGFpbmVy"))()
Globals.PromptContainer.Parent = GetHiddenContainer()

local ESPBlacklist = {}

Functions.AddESP = function(ESPOptions, RoomBased)
	local Object = ESPOptions.Object

	if table.find(ESPBlacklist, Object) then
		return
	end

	if RoomBased then
		local CurrentRoom = tonumber(LocalPlayer:GetAttribute(loadstring(base64decode("Q3VycmVudFJvb20="))()))
		local ObjectRoom = tonumber(Object:GetAttribute(loadstring(base64decode("UGFyZW50Um9vbQ=="))()))

		if ObjectRoom == CurrentRoom or (table.find(Objects.Doors, Object) and ObjectRoom == CurrentRoom + 1) then
			IRT.ESPLibrary:AddESP(ESPOptions)
		end

		local RoomConnection = LocalPlayer:GetAttributeChangedSignal(loadstring(base64decode("Q3VycmVudFJvb20="))()):Connect(function()
			if IRT.ESPLibrary.ColorTable[Object] then
				ESPOptions.Color = IRT.ESPLibrary.ColorTable[Object]
			end

			local NewCurrentRoom = tonumber(LocalPlayer:GetAttribute(loadstring(base64decode("Q3VycmVudFJvb20="))()))
			local ObjRoom = tonumber(Object:GetAttribute(loadstring(base64decode("UGFyZW50Um9vbQ=="))()))

			if ObjRoom == NewCurrentRoom or (table.find(Objects.Doors, Object) and ObjRoom == NewCurrentRoom + 1) then
				IRT.ESPLibrary:AddESP(ESPOptions)
			else
				IRT.ESPLibrary:RemoveESP(Object)
			end
		end)

		table.insert(Connections, RoomConnection)
		ESPConnections[Object] = RoomConnection

		Object.Destroying:Once(function()
			RoomConnection:Disconnect()
			if IRT then
				IRT.ESPLibrary:RemoveESP(Object)
			end
			local Pos = table.find(Connections, RoomConnection)
			if Pos then table.remove(Connections, Pos) end
		end)
	else
		IRT.ESPLibrary:AddESP(ESPOptions)
	end
end

Functions.RemoveESP = function(Object)
	local Conn = ESPConnections[Object]
	if Conn then
		Conn:Disconnect()
		ESPConnections[Object] = nil
		local Pos = table.find(Connections, Conn)
		if Pos then table.remove(Connections, Pos) end
	end
	IRT.ESPLibrary:RemoveESP(Object)
end

Functions.BlacklistESP = function(Object)
	table.insert(ESPBlacklist, Object)
end

Functions.GetDoorNumber = function(Object)
	local DoorNumber = tonumber(Object.Parent.Name) or tonumber(Object.Parent.Parent.Name)
	if DoorNumber then
		DoorNumber = DoorNumber + 1
	end
	if Floor == loadstring(base64decode("TWluZXM="))() then
		DoorNumber = DoorNumber + 100
	end
	if Floor == loadstring(base64decode("QmFja2Rvb3I="))() then
		DoorNumber = DoorNumber - 50
	end

	return tostring(DoorNumber)
end

Functions.GetLibraryCode = function()
	local Paper = Character:FindFirstChild(loadstring(base64decode("TGlicmFyeUhpbnRQYXBlcg=="))())
		or Character:FindFirstChild(loadstring(base64decode("TGlicmFyeUhpbnRQYXBlckhhcmQ="))())
		or LocalPlayer.Backpack:FindFirstChild(loadstring(base64decode("TGlicmFyeUhpbnRQYXBlcg=="))())
		or LocalPlayer.Backpack:FindFirstChild(loadstring(base64decode("TGlicmFyeUhpbnRQYXBlckhhcmQ="))())

	if Paper and Paper:FindFirstChild(loadstring(base64decode("VUk="))()) then
		local Code = {}
		local CodeLength = Floor == loadstring(base64decode("Rm9vbHM="))() and 10 or 5
		for I = 1, CodeLength do Code[I] = loadstring(base64decode("Xw=="))() end

		local HintChildren = LocalPlayer.PlayerGui.PermUI.Hints:GetChildren()
		local UIChildren = Paper.UI:GetChildren()

		for _, Hint in HintChildren do
			for _, UIChild in UIChildren do
				if Hint:IsA(loadstring(base64decode("SW1hZ2VMYWJlbA=="))()) and UIChild:IsA(loadstring(base64decode("SW1hZ2VMYWJlbA=="))())
					and Hint.ImageRectOffset == UIChild.ImageRectOffset
					and Code[tonumber(UIChild.Name)]
				then
					Code[tonumber(UIChild.Name)] = Hint.TextLabel.Text
				end
			end
		end
		return table.concat(Code)
	end
	return Floor == loadstring(base64decode("Rm9vbHM="))() and loadstring(base64decode("X19fX19fX19fXw=="))() or loadstring(base64decode("X19fX18="))()
end

Globals.UsedRandomCodes = {}
Functions.GetRandomCode = function()
    local CodeTemplate = Functions.GetLibraryCode()
    if not CodeTemplate then
        return nil
    end

    local NewCode
    local Tries = 0
    repeat
        NewCode = CodeTemplate:gsub(loadstring(base64decode("Xw=="))(), function()
            return tostring(math.random(0, 9))
        end)
        Tries = Tries + 1
    until not Globals.UsedRandomCodes[NewCode] or Tries >= 10

    Globals.UsedRandomCodes[NewCode] = true
    return NewCode
end





-- IRT.Interface.ApplyInfoTab — используется база (Game/Settings на Linoria)

local Tabs = {
Player = Window:AddTab(loadstring(base64decode("UGxheWVy"))(), loadstring(base64decode("aG91c2U="))()),
	Exploits = Window:AddTab(loadstring(base64decode("RXhwbG9pdHM="))(), loadstring(base64decode("c2hpZWxk"))()),
	Visuals = Window:AddTab(loadstring(base64decode("VmlzdWFscw=="))(), loadstring(base64decode("ZXll"))()),
	Floors = Window:AddTab(loadstring(base64decode("Rmxvb3Jz"))(), loadstring(base64decode("ZWFydGg="))()),


}


Groupboxes.General_Character = Tabs.Player:AddLeftGroupbox(loadstring(base64decode("Q2hhcmFjdGVy"))())
Groupboxes.General_Character:AddSlider(loadstring(base64decode("U3BlZWRCb29zdFNsaWRlcg=="))(), {
	Text = loadstring(base64decode("U3BlZWQgQm9vc3Q="))(), Min = 0, Max = 100, Default = 0, Rounding = 0, Compact = true
})
Groupboxes.General_Character:AddToggle(loadstring(base64decode("U3BlZWRCb29zdFRvZ2dsZQ=="))(), {
	Text = loadstring(base64decode("RW5hYmxlIFNwZWVkIEJvb3N0"))(), Default = false, Tooltip = loadstring(base64decode("SW5jcmVhc2VzIHlvdXIgd2Fsa3NwZWVkIGJ5IHRoZSBzcGVjaWZpZWQgYW1vdW50Lg=="))()
})
Groupboxes.General_Character:AddToggle(loadstring(base64decode("Rmx5VG9nZ2xl"))(), {
	Text = loadstring(base64decode("Rmx5"))(), Default = false, Tooltip = loadstring(base64decode("QWxsb3dzIHlvdSB0byBmcmVlbHkgZmx5IGFyb3VuZCB0aGUgbWFwLg=="))()
})
Toggles.FlyToggle:AddKeyPicker(loadstring(base64decode("Rmx5S2V5YmluZA=="))(), {
	Text = loadstring(base64decode("Rmx5"))(), Default = loadstring(base64decode("Rg=="))(), Mode = loadstring(base64decode("VG9nZ2xl"))(), SyncToggleState = true
})
Groupboxes.General_Character:AddSlider(loadstring(base64decode("Rmx5U3BlZWQ="))(), {
	Text = loadstring(base64decode("Rmx5IFNwZWVk"))(), Min = 0, Max = 115, Default = 20, Rounding = 0, Compact = true
})
Groupboxes.General_Character:AddDivider()
Groupboxes.General_Character:AddToggle(loadstring(base64decode("Tm9jbGlwVG9nZ2xl"))(), {
	Text = loadstring(base64decode("Tm9jbGlw"))(), Default = false, Tooltip = loadstring(base64decode("QWxsb3dzIHlvdXIgY2hhcmFjdGVyIHRvIHBhc3MgdGhyb3VnaCBzb2xpZCBvYmplY3RzLg=="))()
})
Groupboxes.General_Character:AddToggle(loadstring(base64decode("UmVtb3ZlQ2xvc2V0RGVsYXk="))(), {
	Text = loadstring(base64decode("UmVtb3ZlIENsb3NldCBEZWxheQ=="))(), Default = false,
	Tooltip = loadstring(base64decode("UmVtb3ZlcyB0aGUgc2hvcnQgd2luZG93IHdoZXJlIHlvdSBjYW4ndCBleGl0IG91dCBvZiBhIGNsb3NldCBhZnRlciB0aGUgYW5pbWF0aW9uIGZpbmlzaGVzLg=="))()
})
Groupboxes.General_Character:AddToggle(loadstring(base64decode("UmVtb3ZlQWNjZWxlcmF0aW9u"))(), {
	Text = loadstring(base64decode("UmVtb3ZlIEFjY2VsZXJhdGlvbg=="))(), Default = false, Tooltip = loadstring(base64decode("UHJldmVudHMgeW91ciBjaGFyYWN0ZXIgZnJvbSBzbGlkaW5nIHdoaWxlIG1vdmluZy4="))()
})

local CustomPhysics

Options.SpeedBoostSlider:OnChanged(function(Value)
	if RemotesFolder:FindFirstChild(loadstring(base64decode("Q3JvdWNo"))()) then
		RemotesFolder.Crouch:FireServer(Value and true or Functions.IsCrouching(), true)
	end
end)

Toggles.NoclipToggle:AddKeyPicker(loadstring(base64decode("Tm9jbGlwS2V5YmluZDI="))(), {
	Text = loadstring(base64decode("Tm9jbGlw"))(), Default = loadstring(base64decode("Tg=="))(), Mode = loadstring(base64decode("VG9nZ2xl"))(), SyncToggleState = true
})
Toggles.RemoveAcceleration:OnChanged(function(Value)
	for Index, Old in PartProperties do
		Index.CustomPhysicalProperties = Value and CustomPhysics or Old
	end
end)

Groupboxes.General_Character:AddDivider()
Groupboxes.General_Character:AddToggle(loadstring(base64decode("RW5hYmxlQ2hhcmFjdGVySnVtcA=="))(), {
	Text = loadstring(base64decode("RW5hYmxlIEp1bXBpbmc="))(), Default = false, Tooltip = loadstring(base64decode("QWxsb3dzIHlvdXIgY2hhcmFjdGVyIHRvIGp1bXAu"))()
})
Groupboxes.General_Character:AddToggle(loadstring(base64decode("RW5hYmxlQ2hhcmFjdGVyU2xpZGU="))(), {
	Text = loadstring(base64decode("RW5hYmxlIFNsaWRpbmc="))(), Default = false, Tooltip = loadstring(base64decode("QWxsb3dzIHlvdXIgY2hhcmFjdGVyIHRvIHNsaWRlLg=="))()
})
Groupboxes.General_Character:AddToggle(loadstring(base64decode("SW5maW5pdGVKdW1wcw=="))(), {
	Text = loadstring(base64decode("SW5maW5pdGUgSnVtcHM="))(), Default = false, Tooltip = loadstring(base64decode("QWxsb3dzIHlvdSB0byBqdW1wIHdoaWxlIGluIHRoZSBhaXIu"))()
})

local OldJump = false
local OldSlide = false

Toggles.SpeedBoostToggle:OnChanged(function(Value)
	if Humanoid then
		Humanoid.WalkSpeed = Functions.GetCurrentSpeed() + (Value and Options.SpeedBoostSlider.Value or 0)
	end
end)
Toggles.EnableCharacterJump:OnChanged(function(Value)
	if Character then
		Character:SetAttribute(loadstring(base64decode("Q2FuSnVtcA=="))(), Value and true or OldJump)
	end
end)
Toggles.EnableCharacterSlide:OnChanged(function(Value)
	if Character then
		Character:SetAttribute(loadstring(base64decode("Q2FuU2xpZGU="))(), Value and true or OldSlide)
	end
end)

Groupboxes.General_Self = Tabs.Player:AddLeftGroupbox(loadstring(base64decode("U2VsZg=="))())
Groupboxes.General_Self:AddToggle(loadstring(base64decode("RG9vclJlYWNoVG9nZ2xl"))(), {
	Text = loadstring(base64decode("RG9vciBSZWFjaA=="))(), Default = false, Tooltip = loadstring(base64decode("QWxsb3dzIHlvdSB0byBvcGVuIGRvb3JzIGZyb20gZnVydGhlciBhd2F5Lg=="))()
})
Groupboxes.General_Self:AddToggle(loadstring(base64decode("RGlzYWJsZUlkbGVLaWNr"))(), {
	Text = loadstring(base64decode("RGlzYWJsZSBJZGxlIEtpY2s="))(), Default = false, Tooltip = loadstring(base64decode("UHJldmVudHMgdGhlIGtpY2sgZnJvbSBiZWluZyBpZGxlIGZvciAyMCBtaW51dGVzLg=="))()
})
Toggles.DisableIdleKick:OnChanged(function(Value)
	if Functions.CheckCompatability({loadstring(base64decode("Z2V0Y29ubmVjdGlvbnM="))()}) then
		for _, Conn in IRT.Environment.getconnections(LocalPlayer.Idled) do
			if Value then Conn:Disable() else Conn:Enable() end
		end
	end
end)
LocalPlayer.Idled:Connect(function()
	if Toggles.DisableIdleKick.Value then
		Services.VirtualUser:CaptureController()
		Services.VirtualUser:ClickButton2(Vector2.new())
	end
end)

Groupboxes.General_Self:AddDivider()
Groupboxes.General_Self:AddSlider(loadstring(base64decode("UHJvbXB0UmVhY2hTbGlkZXI="))(), {
	Text = loadstring(base64decode("UHJvbXB0IFJlYWNoIE11bHRpcGxpZXI="))(), Min = 1, Max = 2, Default = 1, Rounding = 1, Compact = true
})
Groupboxes.General_Self:AddToggle(loadstring(base64decode("SW5zdGFudFByb21wdHM="))(), {
	Text = loadstring(base64decode("SW5zdGFudCBQcm9tcHRz"))(), Default = false, Tooltip = loadstring(base64decode("QWxsb3dzIHlvdSB0byB0cmlnZ2VyIGFsbCBwcm9tcHRzIGluc3RhbnRseS4="))()
})
Groupboxes.General_Self:AddToggle(loadstring(base64decode("UHJvbXB0Q2xpcA=="))(), {
	Text = loadstring(base64decode("UHJvbXB0IENsaXA="))(), Default = false, Tooltip = loadstring(base64decode("QWxsb3dzIHlvdSB0byBpbnRlcmFjdCB3aXRoIHByb21wdHMgdGhyb3VnaCB3YWxscy4="))()
})

Options.PromptReachSlider:OnChanged(function(Value)
	for _, Prompt in Objects.Prompts do
		Prompt.MaxActivationDistance = Prompt:GetAttribute(loadstring(base64decode("TWF4QWN0aXZhdGlvbkRpc3RhbmNlX09sZA=="))()) * Value
	end
end)
Toggles.InstantPrompts:OnChanged(function(Value)
	for _, Prompt in Objects.Prompts do
		Prompt.HoldDuration = Value and 0 or Prompt:GetAttribute(loadstring(base64decode("SG9sZER1cmF0aW9uX09sZA=="))())
	end
end)
Toggles.PromptClip:OnChanged(function(Value)
	for _, Prompt in Objects.Prompts do
		Prompt.RequiresLineOfSight = Value and false or Prompt:GetAttribute(loadstring(base64decode("UmVxdWlyZXNMaW5lT2ZTaWdodF9PbGQ="))())
	end
end)

Groupboxes.Self_Automation = Tabs.Player:AddRightGroupbox(loadstring(base64decode("QXV0b21hdGlvbg=="))())
Groupboxes.Self_Automation:AddToggle(loadstring(base64decode("QXV0b0JyZWFrZXJCb3g="))(), {
	Text = loadstring(base64decode("QXV0byBCcmVha2VyIEJveA=="))(), Default = false, Tooltip = loadstring(base64decode("QXV0b21hdGljYWxseSBzb2x2ZXMgdGhlIGJyZWFrZXIgYm94Lg=="))()
})
Groupboxes.Self_Automation:AddToggle(loadstring(base64decode("QXV0b1NvbHZlQW5jaG9ycw=="))(), {
	Text = loadstring(base64decode("QXV0byBTb2x2ZSBBbmNob3Jz"))(), Default = false,
	Tooltip = loadstring(base64decode("QXV0b21hdGljYWxseSBlbnRlcnMgdGhlIGNvcnJlY3QgY29kZSBpbnRvIGFuY2hvcnMgd2hlbiB5b3UgYXJlIG5lYXIgdGhlbS4="))()
})
Toggles.AutoBreakerBox:OnChanged(function(Value)
	if Value and CurrentRooms:FindFirstChild(loadstring(base64decode("RWxldmF0b3JCcmVha2Vy"))(), true) then
		if not Globals.BreakerBoxInteracted then
			if not Globals.BreakerBoxNotified then
				Functions.Notify({ Title = loadstring(base64decode("SW50ZXJhY3Qgd2l0aCB0aGUgYnJlYWtlciBib3gu"))(), Body = loadstring(base64decode("SXQgd2lsbCBiZSBhdXRvbWF0aWNhbGx5IHNvbHZlZC4="))() })
				Globals.BreakerBoxInteracted = true
			end
		else
			RemotesFolder.EBF:FireServer()
		end
	end
end)

Groupboxes.Self_Automation:AddToggle(loadstring(base64decode("QXV0b0hlYXJ0YmVhdE1pbmlnYW1l"))(), { Text = loadstring(base64decode("QXV0byBIZWFydGJlYXQgTWluaWdhbWU="))(), Default = false, Tooltip = loadstring(base64decode("UHJldmVudHMgdGhlICdGaWd1cmUnIG1pbmlnYW1lIGZyb20gZXZlciBmYWlsaW5nLg=="))(), Disabled = not Functions.CheckCompatability({loadstring(base64decode("aG9va21ldGFtZXRob2Q="))(), loadstring(base64decode("bmV3Y2Nsb3N1cmU="))(), loadstring(base64decode("Z2V0bmFtZWNhbGxtZXRob2Q="))()}), DisabledTooltip = Globals.IncompatibleMessage })
Groupboxes.Self_Automation:AddDivider()
Groupboxes.Self_Automation:AddToggle(loadstring(base64decode("QXV0b1VubG9ja1BhZGxvY2tUb2dnbGU="))(), {
	Text = loadstring(base64decode("QXV0byBVbmxvY2sgUGFkbG9jaw=="))(), Default = false, Tooltip = loadstring(base64decode("QXV0b21hdGljYWxseSBlbnRlcnMgdGhlIGNvZGUgaW50byB0aGUgbGlicmFyeSBwYWRsb2NrLg=="))()
})
Groupboxes.Self_Automation:AddSlider(loadstring(base64decode("QXV0b1VubG9ja1BhZGxvY2tTbGlkZXI="))(), {
	Text = loadstring(base64decode("VW5sb2NrIERpc3RhbmNl"))(), Min = 1, Max = 50, Default = 10, Rounding = 0, Compact = true
})
Groupboxes.Self_Automation:AddToggle(loadstring(base64decode("QXV0b0xpYnJhcnlHdWVzc0NvZGU="))(), {
	Text = loadstring(base64decode("R3Vlc3MgTGlicmFyeSBDb2Rl"))(), Default = false,
	Tooltip = loadstring(base64decode("QXR0ZW1wdHMgdG8gZ3Vlc3MgdGhlIGxpYnJhcnkgY29kZSwgYnV0IGNvbGxlY3Rpbmcgc29tZSBib29rcyBpcyBhbHNvIG5lY2Vzc2FyeS4="))()
})
Groupboxes.Self_Automation:AddDivider()
Groupboxes.Self_Automation:AddToggle(loadstring(base64decode("QXV0b0xpYnJhcnk="))(), {
	Text = loadstring(base64decode("QXV0byBMaWJyYXJ5"))(), Default = false,
	Tooltip = loadstring(base64decode("QXV0b21hdGljYWxseSBnZXRzIGJvb2tzIGFuZCBwYXBlci4="))()
})
Groupboxes.Self_Automation:AddToggle(loadstring(base64decode("U2tpcFNlZWtIb3RlbA=="))(), {
	Text = loadstring(base64decode("U2tpcCBTZWVrIChIb3RlbCk="))(),
	Default = false,
	Tooltip = loadstring(base64decode("U2tpcHMgdGhlIGVudGlyZSBTZWVrIHNlY3Rpb25zLg=="))(),
})
Groupboxes.Self_Automation:AddToggle(loadstring(base64decode("QXV0b0JyZWFrZXJSb29t"))(), {
	Text = loadstring(base64decode("QXV0byBCcmVha2VyIFJvb20="))(),
	Default = false,
	Tooltip = loadstring(base64decode("QXV0b21hdGljYWxseSBjb21wbGV0ZXMgdGhlIGJyZWFrZXIgc2VxdWVuY2UgaW4gSG90ZWwgUm9vbSAxMDAu"))(),
})
Groupboxes.Self_Automation:AddDivider()
Toggles.AutoHotel = Groupboxes.Self_Automation:AddToggle(loadstring(base64decode("QXV0b0hvdGVs"))(), {
	Text = loadstring(base64decode("QXV0byBIb3RlbA=="))(),
	Tooltip = loadstring(base64decode("QXV0b21hdGljYWxseSBwcm9ncmVzc2VzIHRocm91Z2ggdGhlIGhvdGVsIGZsb29yLg=="))(),
	Risky = Floor ~= loadstring(base64decode("QmFsbHo="))(),
	Default = false
})
Toggles.AutoHotelIgnoreEntities = Groupboxes.Self_Automation:AddToggle(loadstring(base64decode("QXV0b0hvdGVsSWdub3JlRW50aXRpZXM="))(), {
	Text = loadstring(base64decode("SWdub3JlIEVudGl0aWVz"))(),
	Tooltip = loadstring(base64decode("U2tpcCBhbGwgZW50aXR5IHdhaXRzIGFuZCBwYXVzZXMu"))(),
	Default = false
})
Groupboxes.Self_Automation:AddSlider(loadstring(base64decode("QXV0b0hvdGVsUm9vbVByb2Nlc3M="))(), {
	Text = loadstring(base64decode("Um9vbSBQcm9jZXNzIERlbGF5"))(),
	Default = 0.5,
	Min = 0,
	Max = 5,
	Rounding = 1,
	Compact = false
})
Groupboxes.Self_Automation:AddDivider()
Groupboxes.Self_Automation:AddToggle(loadstring(base64decode("QXV0b0ludGVyYWN0VG9nZ2xl"))(), {
	Text = loadstring(base64decode("QXV0byBJbnRlcmFjdA=="))(), Default = false, Tooltip = loadstring(base64decode("QXV0b21hdGljYWxseSB0cmlnZ2VycyBuZWFyYnkgcHJvbXB0cy4="))()
})
Toggles.AutoInteractToggle:AddKeyPicker(loadstring(base64decode("QXV0b0ludGVyYWN0S2V5YmluZDI="))(), {
    Text = loadstring(base64decode("QXV0byBJbnRlcmFjdA=="))(),
    Default = loadstring(base64decode("Ug=="))(),
    Mode = loadstring(base64decode("VG9nZ2xl"))(),
    SyncToggleState = true
})
Groupboxes.Self_Automation:AddDropdown(loadstring(base64decode("QXV0b0ludGVyYWN0SWdub3JlTGlzdA=="))(), {
	Text = loadstring(base64decode("SWdub3JlIExpc3Q="))(),
	Values = { loadstring(base64decode("R2xpdGNoIEZyYWdtZW50cw=="))(), loadstring(base64decode("SmVmZiBJdGVtcw=="))(), loadstring(base64decode("RHJvcHBlZCBJdGVtcw=="))(), loadstring(base64decode("Q3VycmVuY3k="))(), loadstring(base64decode("TWluZWNhcnRz"))(), loadstring(base64decode("TG9ja3M="))() },
	Default = { loadstring(base64decode("R2xpdGNoIEZyYWdtZW50cw=="))(), loadstring(base64decode("SmVmZiBJdGVtcw=="))(), loadstring(base64decode("RHJvcHBlZCBJdGVtcw=="))() },
	Multi = true, AllowNull = true
})
Groupboxes.Self_Automation:AddDivider()
Groupboxes.Self_Automation:AddToggle(loadstring(base64decode("QXV0b0Nsb3NldFRvZ2dsZQ=="))(), {
	Text = loadstring(base64decode("QXV0byBDbG9zZXQ="))(), Default = false,
	Tooltip = loadstring(base64decode("QXV0b21hdGljYWxseSBoaWRlcyBpbiBhIG5lYXJieSBjbG9zZXQgd2hlbiBhbiBlbnRpdHkgaXMgbmVhci4="))()
})
Toggles.AutoClosetToggle:AddKeyPicker(loadstring(base64decode("QXV0b0Nsb3NldEtleWJpbmQ="))(), {
	Text = loadstring(base64decode("QXV0byBDbG9zZXQ="))(), Default = loadstring(base64decode("UQ=="))(), Mode = loadstring(base64decode("VG9nZ2xl"))(), SyncToggleState = true
})
Groupboxes.Self_Automation:AddDropdown(loadstring(base64decode("QXV0b0Nsb3NldEVudGl0eUxpc3Q="))(), {
	Text = loadstring(base64decode("SWdub3JlIExpc3Q="))(),
	Values = { loadstring(base64decode("UnVzaA=="))(), loadstring(base64decode("QW1idXNo"))(), loadstring(base64decode("QmxpdHo="))(), loadstring(base64decode("RHJvbmVzU3RhbXBlZGU="))(), loadstring(base64decode("U2NyaWJibGVz"))(), loadstring(base64decode("QS02MA=="))(), loadstring(base64decode("QS0xMjA="))(), loadstring(base64decode("QVIweE1CVVNI"))(), loadstring(base64decode("Uk5JVVNIQ0c9PQ=="))() },
	Multi = true, AllowNull = true
})
Groupboxes.Self_Automation:AddToggle(loadstring(base64decode("U3BlY3RhdGVFbnRpdHlUb2dnbGU="))(), {
	Text = loadstring(base64decode("U3BlY3RhdGUgRW50aXR5"))(),
	Default = false,
	Tooltip = loadstring(base64decode("U3BlY3RhdGVzIHRoZSBlbnRpdHkgd2hpbGUgYXV0byBoaWRpbmcu"))()
})
Groupboxes.Self_Automation:AddDropdown(loadstring(base64decode("U3BlY2F0ZUVudGl0eU1vZGU="))(), {
	Values = {loadstring(base64decode("UGxheWVyIHRvIEVudGl0eQ=="))(), loadstring(base64decode("RW50aXR5IHRvIFBsYXllcg=="))()},
	Default = 1,
	AllowNull = true
})

Groupboxes.Self_Misc = Tabs.Player:AddRightGroupbox(loadstring(base64decode("TWlzY2VsbGFuZW91cw=="))())
Groupboxes.Self_Misc:AddButton({
	Text = loadstring(base64decode("UGxheSBBZ2Fpbg=="))(), Tooltip = loadstring(base64decode("TWFrZXMgeW91IGpvaW4gYSBuZXcgcnVuLCBjbGljayBhZ2FpbiB0byBjYW5jZWwu"))(), DoubleClick = true,
	Func = function() RemotesFolder.PlayAgain:FireServer() end
})
Groupboxes.Self_Misc:AddButton({
	Text = loadstring(base64decode("UmV0dXJuIHRvIExvYmJ5"))(), Tooltip = loadstring(base64decode("TWFrZXMgeW91IHRlbGVwb3J0IGJhY2sgdG8gdGhlIGxvYmJ5Lg=="))(), DoubleClick = true,
	Func = function() RemotesFolder.Lobby:FireServer() end
})
Groupboxes.Self_Misc:AddButton({
	Text = loadstring(base64decode("UmV2aXZl"))(),
	Tooltip = loadstring(base64decode("TWFrZXMgeW91IHJldml2ZSwgaWYgeW91IGhhdmUgYSByZXZpdmUgYW5kIGhhdmVuJ3QgYWxyZWFkeSByZXZpdmVkIGluIHRoaXMgcnVuLg=="))(),
	DoubleClick = true,
	Func = function() RemotesFolder.Revive:FireServer() end
})
Groupboxes.Self_Misc:AddButton({
	Text = loadstring(base64decode("UmVzZXQgQ2hhcmFjdGVy"))(),
	Tooltip = loadstring(base64decode("S2lsbHMgeW91ciBjaGFyYWN0ZXIgb24gdGhlIHNlcnZlci4gKHRha2VzIGFyb3VuZCAyMCBzZWNvbmRzIGlmIHJlcGxpY2F0ZXNpZ25hbCBpc24ndCBzdXBwb3J0ZWQp"))(),
	DoubleClick = true,
	Func = function()
		Globals.SelfKilled = true
		if Functions.CheckCompatability({loadstring(base64decode("cmVwbGljYXRlc2lnbmFs"))()}) then
			IRT.Environment.replicatesignal(LocalPlayer.Kill)
		else
			if RemotesFolder:FindFirstChild(loadstring(base64decode("VW5kZXJ3YXRlcg=="))()) then
				RemotesFolder.Underwater:FireServer(true)
			else
				Humanoid.Health = 0
			end
		end
	end
})


Tabs.Player:UpdateWarningBox({
	Visible = true,
	Title = loadstring(base64decode("UmlzayBXYXJuaW5n"))(),
	Text = loadstring(base64decode("RmVhdHVyZXMgaGlnaGxpZ2h0ZWQgaW4gcmVkIGFyZSByaXNreS4="))(),
})


Toggles.SkipSeekHotel:OnChanged(function(Value)
	if not Value then return end
	if Floor ~= loadstring(base64decode("SG90ZWw="))() then return end

	task.spawn(function()
		print(loadstring(base64decode("c3RhcnRlZA=="))())

		local currentRooms

		repeat
			if not Toggles.SkipSeekHotel.Value or Floor ~= loadstring(base64decode("SG90ZWw="))() then
				return
			end
			currentRooms = workspace:FindFirstChild(loadstring(base64decode("Q3VycmVudFJvb21z"))())
			task.wait()
		until currentRooms

		print(loadstring(base64decode("Z290IGN1cnJlbnRyb29tcw=="))())

		local lastTriggerRoom = nil

		while Toggles.SkipSeekHotel.Value and Floor == loadstring(base64decode("SG90ZWw="))() do
			local triggerRoom = nil

			print(loadstring(base64decode("d2FpdGluZyBmb3IgdHJpZ2dlcg=="))())

			repeat
				if not Toggles.SkipSeekHotel.Value or Floor ~= loadstring(base64decode("SG90ZWw="))() then
					return
				end

				currentRooms = workspace:FindFirstChild(loadstring(base64decode("Q3VycmVudFJvb21z"))())
				local currentRoomNum = tonumber(LocalPlayer:GetAttribute(loadstring(base64decode("Q3VycmVudFJvb20="))()))

				if currentRoomNum and currentRoomNum ~= lastTriggerRoom then
					local room = currentRooms and currentRooms:FindFirstChild(tostring(currentRoomNum))
					if room then
						local trigger = room:WaitForChild(loadstring(base64decode("VHJpZ2dlckV2ZW50Q29sbGlzaW9u"))(), 0.5)
						if trigger then
							triggerRoom = currentRoomNum
							print(loadstring(base64decode("Zm91bmQgdHJpZ2dlciBpbg=="))(), triggerRoom)
						end
					end
				end

				task.wait()
			until triggerRoom

			lastTriggerRoom = triggerRoom

			local roomNum = triggerRoom

			while Toggles.SkipSeekHotel.Value and Floor == loadstring(base64decode("SG90ZWw="))() do
				roomNum += 1
				print(loadstring(base64decode("bG9va2luZyBmb3Igcm9vbQ=="))(), roomNum)

				local room
				repeat
					if not Toggles.SkipSeekHotel.Value or Floor ~= loadstring(base64decode("SG90ZWw="))() then
						return
					end
					currentRooms = workspace:FindFirstChild(loadstring(base64decode("Q3VycmVudFJvb21z"))())
					room = currentRooms and currentRooms:FindFirstChild(tostring(roomNum))
					task.wait()
				until room

				print(loadstring(base64decode("Zm91bmQgcm9vbQ=="))(), roomNum)

				local hasSeekArm = false
				local assets = room:FindFirstChild(loadstring(base64decode("QXNzZXRz"))())
				if assets then
					for _, child in ipairs(assets:GetChildren()) do
						if child.Name == loadstring(base64decode("U2Vla19Bcm0="))() then
							hasSeekArm = true
							print(loadstring(base64decode("Zm91bmQgc2VlayBhcm0="))())
							break
						end
					end
				end

				local door
				repeat
					if not Toggles.SkipSeekHotel.Value or Floor ~= loadstring(base64decode("SG90ZWw="))() then
						return
					end
					door = room:FindFirstChild(loadstring(base64decode("RG9vcg=="))(), true)
					task.wait()
				until door

				print(loadstring(base64decode("Zm91bmQgZG9vciwgdGVsZXBvcnRpbmc="))())

				repeat
					if not Toggles.SkipSeekHotel.Value or Floor ~= loadstring(base64decode("SG90ZWw="))() then
						return
					end
					if Character then
						Character:PivotTo(door:GetPivot())
					end
					task.wait()
				until door:GetAttribute(loadstring(base64decode("T3BlbmVk"))()) == true

				print(loadstring(base64decode("ZG9vciBvcGVuZWQ="))())

				if hasSeekArm then
					if not Character then
						return
					end

					print(loadstring(base64decode("dm9pZGluZw=="))())

					local voidCFrame = Character:GetPivot() + Vector3.new(0, -2500, 0)

					task.wait(0.25)

					for _ = 1, 20 do
						Character:PivotTo(voidCFrame)
						task.wait()
					end

					task.wait(0.3)

					for _ = 1, 15 do
						Character:PivotTo(voidCFrame)
						task.wait()
					end

					task.wait(0.2)

					for _ = 1, 10 do
						Character:PivotTo(voidCFrame)
						task.wait()
					end

					print(loadstring(base64decode("ZG9uZSB2b2lkaW5n"))())
					break
				end
			end
		end
	end)
end)

Toggles.AutoLibrary:OnChanged(function(AutoLibraryEnabled)
	if AutoLibraryConnection then
		task.cancel(AutoLibraryConnection)
		AutoLibraryConnection = nil
	end

	if AutoLibraryRoomConnection then
		AutoLibraryRoomConnection:Disconnect()
		AutoLibraryRoomConnection = nil
	end

	if not AutoLibraryEnabled then
		return
	end

	AutoLibraryConnection = task.spawn(function()
		local AutoLibraryPlayers = game:GetService(loadstring(base64decode("UGxheWVycw=="))())
		local AutoLibraryLocalPlayer = AutoLibraryPlayers.LocalPlayer
		local AutoLibraryCharacter = AutoLibraryLocalPlayer.Character or AutoLibraryLocalPlayer.CharacterAdded:Wait()
		local AutoLibraryHumanoidRootPart = AutoLibraryCharacter:WaitForChild(loadstring(base64decode("SHVtYW5vaWRSb290UGFydA=="))())

		local AutoLibraryCurrentRooms = workspace:WaitForChild(loadstring(base64decode("Q3VycmVudFJvb21z"))())
		local AutoLibraryRoom50 = AutoLibraryCurrentRooms:WaitForChild(loadstring(base64decode("NTA="))())
		local AutoLibraryLiveHintBooks = {}
		local AutoLibraryHintPaperObtained = false

		local function AutoLibraryIsInRoom50(AutoLibraryObject)
			return AutoLibraryObject
				and AutoLibraryObject:IsDescendantOf(AutoLibraryRoom50)
				and AutoLibraryObject:IsDescendantOf(AutoLibraryCurrentRooms)
				and AutoLibraryObject:IsDescendantOf(workspace)
		end

		local function AutoLibraryIsActuallyInRoom50()
			return tonumber(AutoLibraryLocalPlayer:GetAttribute(loadstring(base64decode("Q3VycmVudFJvb20="))())) == 50
		end

		while AutoLibraryEnabled and not AutoLibraryIsActuallyInRoom50() do
			task.wait(0.05)
		end

		if not AutoLibraryEnabled then
			return
		end

		local function AutoLibraryHasHintPaper()
			AutoLibraryCharacter = AutoLibraryLocalPlayer.Character

			if not AutoLibraryCharacter then
				return false
			end

			local AutoLibraryBackpackPaper = AutoLibraryLocalPlayer.Backpack:FindFirstChild(loadstring(base64decode("TGlicmFyeUhpbnRQYXBlcg=="))(), true)
			local AutoLibraryCharacterPaper = AutoLibraryCharacter:FindFirstChild(loadstring(base64decode("TGlicmFyeUhpbnRQYXBlcg=="))(), true)

			return AutoLibraryBackpackPaper ~= nil or AutoLibraryCharacterPaper ~= nil
		end

		local function AutoLibraryGetObjectCFrame(AutoLibraryObject)
			if not AutoLibraryIsActuallyInRoom50() then
				return nil
			end

			if not AutoLibraryIsInRoom50(AutoLibraryObject) then
				return nil
			end

			if AutoLibraryObject:IsA(loadstring(base64decode("TW9kZWw="))()) then
				return AutoLibraryObject:GetPivot()
			elseif AutoLibraryObject:IsA(loadstring(base64decode("QmFzZVBhcnQ="))()) then
				return AutoLibraryObject.CFrame
			end

			local AutoLibraryObjectPart = AutoLibraryObject:FindFirstChildWhichIsA(loadstring(base64decode("QmFzZVBhcnQ="))(), true)

			if AutoLibraryObjectPart then
				return AutoLibraryObjectPart.CFrame
			end

			return nil
		end

		local function AutoLibraryFindBooks(AutoLibraryObject)
			if not AutoLibraryIsActuallyInRoom50() then
				return
			end

			if not AutoLibraryIsInRoom50(AutoLibraryObject) then
				return
			end

			if AutoLibraryObject.Name == loadstring(base64decode("TGl2ZUhpbnRCb29r"))() then
				if not table.find(AutoLibraryLiveHintBooks, AutoLibraryObject) then
					table.insert(AutoLibraryLiveHintBooks, AutoLibraryObject)
				end
			end

			for _, AutoLibraryDescendant in ipairs(AutoLibraryObject:GetDescendants()) do
				if AutoLibraryDescendant.Name == loadstring(base64decode("TGl2ZUhpbnRCb29r"))()
					and AutoLibraryIsInRoom50(AutoLibraryDescendant) then

					if not table.find(AutoLibraryLiveHintBooks, AutoLibraryDescendant) then
						table.insert(AutoLibraryLiveHintBooks, AutoLibraryDescendant)
					end
				end
			end
		end

		for _, AutoLibraryDescendant in ipairs(AutoLibraryRoom50:GetDescendants()) do
			if not AutoLibraryEnabled or not AutoLibraryIsActuallyInRoom50() then
				return
			end

			if AutoLibraryDescendant.Name == loadstring(base64decode("TGl2ZUhpbnRCb29r"))()
				and AutoLibraryIsInRoom50(AutoLibraryDescendant) then

				if not table.find(AutoLibraryLiveHintBooks, AutoLibraryDescendant) then
					table.insert(AutoLibraryLiveHintBooks, AutoLibraryDescendant)
				end
			end
		end

		AutoLibraryRoomConnection = AutoLibraryRoom50.DescendantAdded:Connect(function(AutoLibraryAddedObject)
			if not AutoLibraryEnabled then
				return
			end

			if not AutoLibraryIsActuallyInRoom50() then
				return
			end

			if not AutoLibraryIsInRoom50(AutoLibraryAddedObject) then
				return
			end

			AutoLibraryFindBooks(AutoLibraryAddedObject)
		end)

		while AutoLibraryEnabled
			and AutoLibraryIsActuallyInRoom50()
			and #AutoLibraryLiveHintBooks < 3 do

			for _, AutoLibraryDescendant in ipairs(AutoLibraryRoom50:GetDescendants()) do
				if not AutoLibraryEnabled or not AutoLibraryIsActuallyInRoom50() then
					return
				end

				if AutoLibraryDescendant.Name == loadstring(base64decode("TGl2ZUhpbnRCb29r"))()
					and AutoLibraryIsInRoom50(AutoLibraryDescendant)
					and not table.find(AutoLibraryLiveHintBooks, AutoLibraryDescendant) then

					table.insert(AutoLibraryLiveHintBooks, AutoLibraryDescendant)
				end
			end

			if #AutoLibraryLiveHintBooks >= 3 then
				break
			end

			task.wait(0.05)
		end

		while AutoLibraryEnabled
			and AutoLibraryIsActuallyInRoom50()
			and not AutoLibraryHintPaperObtained do

			if AutoLibraryHasHintPaper() then
				AutoLibraryHintPaperObtained = true
				break
			end

			for AutoLibraryIndex = #AutoLibraryLiveHintBooks, 1, -1 do
				if not AutoLibraryIsActuallyInRoom50() then
					return
				end

				local AutoLibraryLiveHintBook = AutoLibraryLiveHintBooks[AutoLibraryIndex]

				if not AutoLibraryIsInRoom50(AutoLibraryLiveHintBook) then
					table.remove(AutoLibraryLiveHintBooks, AutoLibraryIndex)
					continue
				end

				while AutoLibraryEnabled
					and AutoLibraryIsActuallyInRoom50()
					and not AutoLibraryHintPaperObtained
					and AutoLibraryLiveHintBook.Parent
					and AutoLibraryIsInRoom50(AutoLibraryLiveHintBook) do

					if AutoLibraryHasHintPaper() then
						AutoLibraryHintPaperObtained = true
						break
					end

					AutoLibraryCharacter = AutoLibraryLocalPlayer.Character or AutoLibraryLocalPlayer.CharacterAdded:Wait()
					AutoLibraryHumanoidRootPart = AutoLibraryCharacter:FindFirstChild(loadstring(base64decode("SHVtYW5vaWRSb290UGFydA=="))())

					if not AutoLibraryHumanoidRootPart then
						task.wait()
						continue
					end

					local AutoLibraryBookCFrame = AutoLibraryGetObjectCFrame(AutoLibraryLiveHintBook)

					if AutoLibraryBookCFrame
						and AutoLibraryIsActuallyInRoom50()
						and AutoLibraryIsInRoom50(AutoLibraryLiveHintBook) then

						AutoLibraryHumanoidRootPart.CFrame = AutoLibraryBookCFrame
					end

					for _, AutoLibraryPromptDescendant in ipairs(AutoLibraryLiveHintBook:GetDescendants()) do
						if AutoLibraryPromptDescendant:IsA(loadstring(base64decode("UHJveGltaXR5UHJvbXB0"))())
							and AutoLibraryIsInRoom50(AutoLibraryPromptDescendant)
							and AutoLibraryIsActuallyInRoom50() then

							fireproximityprompt(AutoLibraryPromptDescendant)
						end
					end

					task.wait(0.05)
				end

				if AutoLibraryHintPaperObtained then
					break
				end
			end

			if AutoLibraryHasHintPaper() then
				AutoLibraryHintPaperObtained = true
				break
			end

			local AutoLibraryHintPaper = AutoLibraryRoom50:FindFirstChild(loadstring(base64decode("TGlicmFyeUhpbnRQYXBlcg=="))(), true)

			if AutoLibraryHintPaper
				and AutoLibraryIsInRoom50(AutoLibraryHintPaper)
				and AutoLibraryIsActuallyInRoom50() then

				while AutoLibraryEnabled
					and AutoLibraryIsActuallyInRoom50()
					and not AutoLibraryHintPaperObtained
					and AutoLibraryHintPaper.Parent
					and AutoLibraryIsInRoom50(AutoLibraryHintPaper) do

					if AutoLibraryHasHintPaper() then
						AutoLibraryHintPaperObtained = true
						break
					end

					AutoLibraryCharacter = AutoLibraryLocalPlayer.Character or AutoLibraryLocalPlayer.CharacterAdded:Wait()
					AutoLibraryHumanoidRootPart = AutoLibraryCharacter:FindFirstChild(loadstring(base64decode("SHVtYW5vaWRSb290UGFydA=="))())

					if not AutoLibraryHumanoidRootPart then
						task.wait()
						continue
					end

					local AutoLibraryPaperCFrame = AutoLibraryGetObjectCFrame(AutoLibraryHintPaper)

					if AutoLibraryPaperCFrame
						and AutoLibraryIsActuallyInRoom50()
						and AutoLibraryIsInRoom50(AutoLibraryHintPaper) then

						AutoLibraryHumanoidRootPart.CFrame = AutoLibraryPaperCFrame * CFrame.new(0, 5, 0)
					end

					for _, AutoLibraryPromptDescendant in ipairs(AutoLibraryHintPaper:GetDescendants()) do
						if AutoLibraryPromptDescendant:IsA(loadstring(base64decode("UHJveGltaXR5UHJvbXB0"))())
							and AutoLibraryIsInRoom50(AutoLibraryPromptDescendant)
							and AutoLibraryIsActuallyInRoom50() then

							fireproximityprompt(AutoLibraryPromptDescendant)
						end
					end

					task.wait(0.05)
				end
			end

			task.wait(0.05)
		end
	end)
end)

Toggles.AutoBreakerRoom:OnChanged(function(AutoBreakerRoomEnabled)
	if AutoBreakerRoomConnection then
		task.cancel(AutoBreakerRoomConnection)
		AutoBreakerRoomConnection = nil
	end

	if AutoBreakerRoomRoomConnection then
		AutoBreakerRoomRoomConnection:Disconnect()
		AutoBreakerRoomRoomConnection = nil
	end

	if not AutoBreakerRoomEnabled then
		return
	end

	local AutoBreakerRoomGateFireTime = 5
	local AutoBreakerRoomWaitAfterLever = 5
	local AutoBreakerRoomBreakerSecondTime = 10
	local AutoBreakerRoomWaitBeforeWeb = 4
	local AutoBreakerRoomWebDuration = 20

	AutoBreakerRoomConnection = task.spawn(function()
		local AutoBreakerRoomPlayers = game:GetService(loadstring(base64decode("UGxheWVycw=="))())
		local AutoBreakerRoomCurrentRooms = workspace:WaitForChild(loadstring(base64decode("Q3VycmVudFJvb21z"))())
		local AutoBreakerRoom100 = AutoBreakerRoomCurrentRooms:WaitForChild(loadstring(base64decode("MTAw"))())

		local function AutoBreakerRoomIsActuallyInRoom100()
			return tonumber(AutoBreakerRoomPlayers.LocalPlayer:GetAttribute(loadstring(base64decode("Q3VycmVudFJvb20="))())) == 100
		end

		local function AutoBreakerRoomIsInRoom100(AutoBreakerRoomObject)
			return AutoBreakerRoomObject
				and AutoBreakerRoomObject.Parent
				and AutoBreakerRoomObject:IsDescendantOf(AutoBreakerRoom100)
				and AutoBreakerRoomObject:IsDescendantOf(AutoBreakerRoomCurrentRooms)
		end

		local function AutoBreakerRoomGetObjectCFrame(AutoBreakerRoomObject)
			if not AutoBreakerRoomIsActuallyInRoom100() or not AutoBreakerRoomIsInRoom100(AutoBreakerRoomObject) then
				return nil
			end

			if AutoBreakerRoomObject:IsA(loadstring(base64decode("TW9kZWw="))()) then
				return AutoBreakerRoomObject:GetPivot()
			elseif AutoBreakerRoomObject:IsA(loadstring(base64decode("QmFzZVBhcnQ="))()) then
				return AutoBreakerRoomObject.CFrame
			end

			local AutoBreakerRoomPart = AutoBreakerRoomObject:FindFirstChildWhichIsA(loadstring(base64decode("QmFzZVBhcnQ="))(), true)
			return AutoBreakerRoomPart and AutoBreakerRoomPart.CFrame
		end
		local function AutoBreakerRoomGetHRP()
			local AutoBreakerRoomCharacter = AutoBreakerRoomPlayers.LocalPlayer.Character
			return AutoBreakerRoomCharacter and AutoBreakerRoomCharacter:FindFirstChild(loadstring(base64decode("SHVtYW5vaWRSb290UGFydA=="))())
		end

		local function AutoBreakerRoomActivate(AutoBreakerRoomObject)
			if not AutoBreakerRoomObject then
				return
			end

			if AutoBreakerRoomObject:IsA(loadstring(base64decode("UHJveGltaXR5UHJvbXB0"))()) then
				fireproximityprompt(AutoBreakerRoomObject)
				return
			end

			for _, AutoBreakerRoomDescendant in ipairs(AutoBreakerRoomObject:GetDescendants()) do
				if AutoBreakerRoomDescendant:IsA(loadstring(base64decode("UHJveGltaXR5UHJvbXB0"))()) then
					fireproximityprompt(AutoBreakerRoomDescendant)
				end
			end
		end

		local function AutoBreakerRoomConstantTPAndActivate(AutoBreakerRoomTarget, AutoBreakerRoomDuration, AutoBreakerRoomInterval, AutoBreakerRoomOffset)
			AutoBreakerRoomInterval = AutoBreakerRoomInterval or 0.04
			AutoBreakerRoomOffset = AutoBreakerRoomOffset or CFrame.new()
			local AutoBreakerRoomEndTime = os.clock() + (AutoBreakerRoomDuration or 3)

			while AutoBreakerRoomEnabled
				and AutoBreakerRoomIsActuallyInRoom100()
				and AutoBreakerRoomIsInRoom100(AutoBreakerRoomTarget)
				and os.clock() < AutoBreakerRoomEndTime do

				local AutoBreakerRoomHRP = AutoBreakerRoomGetHRP()
				local AutoBreakerRoomCF = AutoBreakerRoomGetObjectCFrame(AutoBreakerRoomTarget)

				if AutoBreakerRoomHRP and AutoBreakerRoomCF then
					AutoBreakerRoomHRP.CFrame = AutoBreakerRoomCF * AutoBreakerRoomOffset
				end

				AutoBreakerRoomActivate(AutoBreakerRoomTarget)
				task.wait(AutoBreakerRoomInterval)
			end
		end

		while AutoBreakerRoomEnabled do
			while AutoBreakerRoomEnabled and not AutoBreakerRoomIsActuallyInRoom100() do
				task.wait(0.1)
			end

			if not AutoBreakerRoomEnabled then
				return
			end

			local AutoBreakerRoomPoles = {}

			while AutoBreakerRoomEnabled and AutoBreakerRoomIsActuallyInRoom100() do
				AutoBreakerRoomPoles = {}

				for _, AutoBreakerRoomDescendant in ipairs(AutoBreakerRoom100:GetDescendants()) do
					if AutoBreakerRoomDescendant.Name == loadstring(base64decode("TGl2ZUJyZWFrZXJQb2xlUGlja3Vw"))() and AutoBreakerRoomIsInRoom100(AutoBreakerRoomDescendant) then
						if not table.find(AutoBreakerRoomPoles, AutoBreakerRoomDescendant) then
							table.insert(AutoBreakerRoomPoles, AutoBreakerRoomDescendant)
						end
					end
				end

				if #AutoBreakerRoomPoles == 0 then
					break
				end

				for _, AutoBreakerRoomPole in ipairs(AutoBreakerRoomPoles) do
					if not AutoBreakerRoomEnabled or not AutoBreakerRoomIsActuallyInRoom100() then
						break
					end

					if AutoBreakerRoomIsInRoom100(AutoBreakerRoomPole) then
						AutoBreakerRoomConstantTPAndActivate(AutoBreakerRoomPole, 2.8, 0.03)
						task.wait(0.12)
					end
				end

				task.wait(0.05)
			end

			if not AutoBreakerRoomEnabled or not AutoBreakerRoomIsActuallyInRoom100() then
				continue
			end

			local AutoBreakerRoomIndustrialGate = AutoBreakerRoom100:FindFirstChild(loadstring(base64decode("SW5kdXN0cmlhbEdhdGU="))())
			local AutoBreakerRoomBox = AutoBreakerRoomIndustrialGate and AutoBreakerRoomIndustrialGate:FindFirstChild(loadstring(base64decode("Qm94"))())
			local AutoBreakerRoomLever = AutoBreakerRoomBox and AutoBreakerRoomBox:FindFirstChild(loadstring(base64decode("TGV2ZXI="))())
			local AutoBreakerRoomActivateEventPrompt = AutoBreakerRoomBox and AutoBreakerRoomBox:FindFirstChild(loadstring(base64decode("QWN0aXZhdGVFdmVudFByb21wdA=="))())

			if AutoBreakerRoomActivateEventPrompt and AutoBreakerRoomLever then
				local function AutoBreakerRoomGetLeverCFrame()
					if AutoBreakerRoomLever:IsA(loadstring(base64decode("TW9kZWw="))()) then
						return AutoBreakerRoomLever:GetPivot()
					elseif AutoBreakerRoomLever:IsA(loadstring(base64decode("QmFzZVBhcnQ="))()) then
						return AutoBreakerRoomLever.CFrame
					end
					local AutoBreakerRoomPart = AutoBreakerRoomLever:FindFirstChildWhichIsA(loadstring(base64decode("QmFzZVBhcnQ="))(), true)
					return AutoBreakerRoomPart and AutoBreakerRoomPart.CFrame
				end

				local AutoBreakerRoomInitialLeverCFrame = AutoBreakerRoomGetLeverCFrame()
				local AutoBreakerRoomLeverEndTime = os.clock() + 10

				while AutoBreakerRoomEnabled
					and AutoBreakerRoomIsActuallyInRoom100()
					and AutoBreakerRoomIsInRoom100(AutoBreakerRoomLever)
					and os.clock() < AutoBreakerRoomLeverEndTime do

					local AutoBreakerRoomCurrentLeverCFrame = AutoBreakerRoomGetLeverCFrame()

					if AutoBreakerRoomCurrentLeverCFrame and AutoBreakerRoomInitialLeverCFrame
						and AutoBreakerRoomCurrentLeverCFrame ~= AutoBreakerRoomInitialLeverCFrame then
						break
					end

					local AutoBreakerRoomHRP = AutoBreakerRoomGetHRP()
					local AutoBreakerRoomCF = AutoBreakerRoomGetObjectCFrame(AutoBreakerRoomBox)

					if AutoBreakerRoomHRP and AutoBreakerRoomCF then
						AutoBreakerRoomHRP.CFrame = AutoBreakerRoomCF
					end

					AutoBreakerRoomActivate(AutoBreakerRoomActivateEventPrompt)
					task.wait(0.04)
				end
			end

			if not AutoBreakerRoomEnabled or not AutoBreakerRoomIsActuallyInRoom100() then
				continue
			end

			task.wait(AutoBreakerRoomWaitAfterLever)

			if not AutoBreakerRoomEnabled or not AutoBreakerRoomIsActuallyInRoom100() then
				continue
			end

			local AutoBreakerRoomElevatorBreakerEmpty = AutoBreakerRoom100:FindFirstChild(loadstring(base64decode("RWxldmF0b3JCcmVha2VyRW1wdHk="))())
			if not AutoBreakerRoomElevatorBreakerEmpty then
				continue
			end

			local AutoBreakerRoomBreakerPrompt = AutoBreakerRoomElevatorBreakerEmpty:FindFirstChild(loadstring(base64decode("UHJvbXB0"))())
			if not AutoBreakerRoomBreakerPrompt then
				continue
			end

			local AutoBreakerRoomBreakerOffset = CFrame.new(0, -1.8, 0)

			while AutoBreakerRoomEnabled and AutoBreakerRoomIsActuallyInRoom100() do
				if AutoBreakerRoomElevatorBreakerEmpty:FindFirstChild(loadstring(base64decode("QnJlYWtlclN3aXRjaEluQm94"))()) then
					break
				end

				local AutoBreakerRoomHRP = AutoBreakerRoomGetHRP()
				local AutoBreakerRoomCF = AutoBreakerRoomGetObjectCFrame(AutoBreakerRoomElevatorBreakerEmpty)

				if AutoBreakerRoomHRP and AutoBreakerRoomCF then
					AutoBreakerRoomHRP.CFrame = AutoBreakerRoomCF * AutoBreakerRoomBreakerOffset
				end

				AutoBreakerRoomActivate(AutoBreakerRoomBreakerPrompt)
				task.wait(0.04)
			end

			if not AutoBreakerRoomEnabled or not AutoBreakerRoomIsActuallyInRoom100() then
				continue
			end

			task.wait(10)

			AutoBreakerRoomConstantTPAndActivate(
				AutoBreakerRoomElevatorBreakerEmpty,
				AutoBreakerRoomBreakerSecondTime,
				0.04,
				AutoBreakerRoomBreakerOffset
			)

			task.wait(AutoBreakerRoomWaitBeforeWeb)

			if not AutoBreakerRoomEnabled or not AutoBreakerRoomIsActuallyInRoom100() then
				continue
			end

			local AutoBreakerRoomElevatorCar = AutoBreakerRoom100:FindFirstChild(loadstring(base64decode("RWxldmF0b3JDYXI="))())
			local AutoBreakerRoomWeb = AutoBreakerRoomElevatorCar and AutoBreakerRoomElevatorCar:FindFirstChild(loadstring(base64decode("V2Vi"))(), true)

			if AutoBreakerRoomWeb then
				local AutoBreakerRoomEndTime = os.clock() + AutoBreakerRoomWebDuration

				while AutoBreakerRoomEnabled and AutoBreakerRoomIsActuallyInRoom100() and os.clock() < AutoBreakerRoomEndTime do
					local AutoBreakerRoomHRP = AutoBreakerRoomGetHRP()
					local AutoBreakerRoomCF = AutoBreakerRoomGetObjectCFrame(AutoBreakerRoomWeb)

					if AutoBreakerRoomHRP and AutoBreakerRoomCF then
						AutoBreakerRoomHRP.CFrame = AutoBreakerRoomCF
					end

					task.wait(0.04)
				end
			end

			while AutoBreakerRoomEnabled and AutoBreakerRoomIsActuallyInRoom100() do
				task.wait(0.5)
			end
		end
	end)
end)



local AutoHotelConnection
local AutoHotelLibraryConnection
local AutoHotelLibraryRoomConnection
local AutoHotelSeekConnection
local AutoHotelEntityPause = false
local AutoHotelRoomProcessTime = 0.5
local AutoHotelProcessedRooms = {}

local AutoHotelEntityNames = {
	[loadstring(base64decode("UnVzaE1vdmluZw=="))()] = true,
	[loadstring(base64decode("U2NyaWJibGVz"))()] = true,
	[loadstring(base64decode("QmFzaE1vdmluZw=="))()] = true,
	[loadstring(base64decode("RHJvbmVzU3RhbXBlZGU="))()] = true,
	[loadstring(base64decode("QW1idXNoTW92aW5n"))()] = true,
	[loadstring(base64decode("QTYw"))()] = true,
	[loadstring(base64decode("QTEyMA=="))()] = true,
	[loadstring(base64decode("R2xpdGNoUnVzaA=="))()] = true,
	[loadstring(base64decode("R2xpdGNoQW1idXNo"))()] = true,
	[loadstring(base64decode("QmFja2Rvb3JSdXNo"))()] = true,
	[loadstring(base64decode("Q3VzdG9tRW50aXR5"))()] = true,
}

local function AutoHotelIsEntityPresent()
	if Toggles.AutoHotelIgnoreEntities and Toggles.AutoHotelIgnoreEntities.Value then
		return false
	end
	for _, AutoHotelChild in ipairs(workspace:GetChildren()) do
		if AutoHotelEntityNames[AutoHotelChild.Name] then
			return true
		end
	end
	return false
end

local function AutoHotelWaitForEntities(AutoHotelSeconds)
	if Toggles.AutoHotelIgnoreEntities and Toggles.AutoHotelIgnoreEntities.Value then
		return
	end

	task.wait(AutoHotelSeconds or 5)

	while AutoHotelIsEntityPresent() do
		task.wait(0.15)
	end
end

local function AutoHotelGetNextClosedDoor()
	if not Character then return nil, nil end

	local AutoHotelGameData = game:GetService(loadstring(base64decode("UmVwbGljYXRlZFN0b3JhZ2U="))()):FindFirstChild(loadstring(base64decode("R2FtZURhdGE="))())
	if not AutoHotelGameData then return nil, nil end

	local AutoHotelLatestRoom = AutoHotelGameData:FindFirstChild(loadstring(base64decode("TGF0ZXN0Um9vbQ=="))())
	if not AutoHotelLatestRoom then return nil, nil end

	local AutoHotelStartRoom = AutoHotelLatestRoom.Value
	local AutoHotelBestDoor, AutoHotelBestNumber = nil, math.huge
	local AutoHotelCurrentRooms = workspace:FindFirstChild(loadstring(base64decode("Q3VycmVudFJvb21z"))())

	if AutoHotelCurrentRooms then
		for _, AutoHotelRoom in ipairs(AutoHotelCurrentRooms:GetChildren()) do
			local AutoHotelRoomNum = tonumber(AutoHotelRoom.Name)
			if AutoHotelRoomNum and AutoHotelRoomNum ~= 100 and AutoHotelRoomNum >= AutoHotelStartRoom and AutoHotelRoomNum < AutoHotelBestNumber then
				local AutoHotelDoor = AutoHotelRoom:FindFirstChild(loadstring(base64decode("RG9vcg=="))())
				if AutoHotelDoor and AutoHotelDoor:IsA(loadstring(base64decode("TW9kZWw="))()) then
					local AutoHotelOpenAttr = AutoHotelDoor:GetAttribute(loadstring(base64decode("T3Blbg=="))())
					if AutoHotelOpenAttr == false or AutoHotelOpenAttr == nil then
						AutoHotelBestNumber = AutoHotelRoomNum
						AutoHotelBestDoor = AutoHotelDoor
					end
				end
			end
		end
	end

	return AutoHotelBestDoor, AutoHotelBestNumber
end

local function AutoHotelFindKeyObtain(AutoHotelRoom)
	local AutoHotelFound = nil
	local function AutoHotelScan(AutoHotelParent)
		if AutoHotelFound then return end
		for _, AutoHotelChild in ipairs(AutoHotelParent:GetChildren()) do
			if AutoHotelChild.Name == loadstring(base64decode("S2V5T2J0YWlu"))() then
				AutoHotelFound = AutoHotelChild
				return
			end
			AutoHotelScan(AutoHotelChild)
			if AutoHotelFound then return end
		end
	end
	AutoHotelScan(AutoHotelRoom)
	return AutoHotelFound
end

local function AutoHotelHandleKey(AutoHotelRoomNum)
	local AutoHotelCurrentRooms = workspace:FindFirstChild(loadstring(base64decode("Q3VycmVudFJvb21z"))())
	if not AutoHotelCurrentRooms then return false end

	local AutoHotelRoom = AutoHotelCurrentRooms:FindFirstChild(tostring(AutoHotelRoomNum))
	if not AutoHotelRoom then return false end

	local AutoHotelDoor = AutoHotelRoom:FindFirstChild(loadstring(base64decode("RG9vcg=="))())
	if not AutoHotelDoor or not AutoHotelDoor:FindFirstChild(loadstring(base64decode("TG9jaw=="))()) then
		return false
	end

	local AutoHotelKeyObtain = AutoHotelFindKeyObtain(AutoHotelRoom)
	if not AutoHotelKeyObtain then return false end

	local AutoHotelStart = tick()
	while tick() - AutoHotelStart < 12 do
		if LocalPlayer.Backpack:FindFirstChild(loadstring(base64decode("S2V5"))()) or (Character and Character:FindFirstChild(loadstring(base64decode("S2V5"))())) then
			return true
		end

		if Character then
			Character:PivotTo(AutoHotelKeyObtain:GetPivot())
		end

		for _, AutoHotelDesc in ipairs(AutoHotelKeyObtain:GetDescendants()) do
			if AutoHotelDesc:IsA(loadstring(base64decode("UHJveGltaXR5UHJvbXB0"))()) then
				fireproximityprompt(AutoHotelDesc)
			end
		end

		task.wait(0.12)
	end
	return false
end

local function AutoHotelProcessRoom(AutoHotelRoomNum)
	if AutoHotelProcessedRooms[AutoHotelRoomNum] then
		return
	end
	task.wait(AutoHotelRoomProcessTime)
	AutoHotelProcessedRooms[AutoHotelRoomNum] = true
end

local function AutoHotelRunLibrary()
	local AutoHotelCurrentRooms = workspace:WaitForChild(loadstring(base64decode("Q3VycmVudFJvb21z"))())
	local AutoHotelRoom50 = AutoHotelCurrentRooms:WaitForChild(loadstring(base64decode("NTA="))())
	local AutoHotelLiveHintBooks = {}
	local AutoHotelHintPaperObtained = false

	local function AutoHotelIsInRoom50(AutoHotelObj)
		return AutoHotelObj and AutoHotelObj:IsDescendantOf(AutoHotelRoom50)
	end

	local function AutoHotelIsActuallyInRoom50()
		return tonumber(LocalPlayer:GetAttribute(loadstring(base64decode("Q3VycmVudFJvb20="))())) == 50
	end

	while Toggles.AutoHotel.Value and not AutoHotelIsActuallyInRoom50() do
		task.wait(0.1)
	end
	if not Toggles.AutoHotel.Value then return end

	AutoHotelWaitForEntities(5)

	local function AutoHotelHasHintPaper()
		local AutoHotelChar = LocalPlayer.Character
		if not AutoHotelChar then return false end
		return LocalPlayer.Backpack:FindFirstChild(loadstring(base64decode("TGlicmFyeUhpbnRQYXBlcg=="))(), true) or AutoHotelChar:FindFirstChild(loadstring(base64decode("TGlicmFyeUhpbnRQYXBlcg=="))(), true)
	end

	local function AutoHotelGetCFrame(AutoHotelObj)
		if not AutoHotelIsActuallyInRoom50() or not AutoHotelIsInRoom50(AutoHotelObj) then return nil end
		if AutoHotelObj:IsA(loadstring(base64decode("TW9kZWw="))()) then return AutoHotelObj:GetPivot() end
		if AutoHotelObj:IsA(loadstring(base64decode("QmFzZVBhcnQ="))()) then return AutoHotelObj.CFrame end
		local AutoHotelPart = AutoHotelObj:FindFirstChildWhichIsA(loadstring(base64decode("QmFzZVBhcnQ="))(), true)
		return AutoHotelPart and AutoHotelPart.CFrame
	end

	local function AutoHotelCollectBooks()
		for _, AutoHotelDesc in ipairs(AutoHotelRoom50:GetDescendants()) do
			if AutoHotelDesc.Name == loadstring(base64decode("TGl2ZUhpbnRCb29r"))() and AutoHotelIsInRoom50(AutoHotelDesc) and not table.find(AutoHotelLiveHintBooks, AutoHotelDesc) then
				table.insert(AutoHotelLiveHintBooks, AutoHotelDesc)
			end
		end
	end

	AutoHotelCollectBooks()

	AutoHotelLibraryRoomConnection = AutoHotelRoom50.DescendantAdded:Connect(function(AutoHotelAdded)
		if Toggles.AutoHotel.Value and AutoHotelIsActuallyInRoom50() and AutoHotelIsInRoom50(AutoHotelAdded) then
			if AutoHotelAdded.Name == loadstring(base64decode("TGl2ZUhpbnRCb29r"))() and not table.find(AutoHotelLiveHintBooks, AutoHotelAdded) then
				table.insert(AutoHotelLiveHintBooks, AutoHotelAdded)
			end
		end
	end)

	while Toggles.AutoHotel.Value and AutoHotelIsActuallyInRoom50() and #AutoHotelLiveHintBooks < 3 do
		AutoHotelCollectBooks()
		if #AutoHotelLiveHintBooks >= 3 then break end
		task.wait(0.1)
	end

	while Toggles.AutoHotel.Value and AutoHotelIsActuallyInRoom50() and not AutoHotelHintPaperObtained do
		if AutoHotelHasHintPaper() then
			AutoHotelHintPaperObtained = true
			break
		end

		for AutoHotelIndex = #AutoHotelLiveHintBooks, 1, -1 do
			local AutoHotelBook = AutoHotelLiveHintBooks[AutoHotelIndex]
			if not AutoHotelIsInRoom50(AutoHotelBook) then
				table.remove(AutoHotelLiveHintBooks, AutoHotelIndex)
				continue
			end

			while Toggles.AutoHotel.Value and AutoHotelIsActuallyInRoom50() and not AutoHotelHintPaperObtained and AutoHotelBook.Parent and AutoHotelIsInRoom50(AutoHotelBook) do
				if AutoHotelHasHintPaper() then
					AutoHotelHintPaperObtained = true
					break
				end

				local AutoHotelChar = LocalPlayer.Character or LocalPlayer.CharacterAdded:Wait()
				local AutoHotelHRP = AutoHotelChar:FindFirstChild(loadstring(base64decode("SHVtYW5vaWRSb290UGFydA=="))())
				if not AutoHotelHRP then
					task.wait()
					continue
				end

				local AutoHotelCF = AutoHotelGetCFrame(AutoHotelBook)
				if AutoHotelCF then
					AutoHotelHRP.CFrame = AutoHotelCF
				end

				for _, AutoHotelPrompt in ipairs(AutoHotelBook:GetDescendants()) do
					if AutoHotelPrompt:IsA(loadstring(base64decode("UHJveGltaXR5UHJvbXB0"))()) then
						fireproximityprompt(AutoHotelPrompt)
					end
				end
				task.wait(0.08)
			end
			if AutoHotelHintPaperObtained then break end
		end

		if AutoHotelHasHintPaper() then
			AutoHotelHintPaperObtained = true
			break
		end

		local AutoHotelPaper = AutoHotelRoom50:FindFirstChild(loadstring(base64decode("TGlicmFyeUhpbnRQYXBlcg=="))(), true)
		if AutoHotelPaper and AutoHotelIsInRoom50(AutoHotelPaper) then
			while Toggles.AutoHotel.Value and AutoHotelIsActuallyInRoom50() and not AutoHotelHintPaperObtained and AutoHotelPaper.Parent do
				if AutoHotelHasHintPaper() then
					AutoHotelHintPaperObtained = true
					break
				end

				local AutoHotelChar = LocalPlayer.Character or LocalPlayer.CharacterAdded:Wait()
				local AutoHotelHRP = AutoHotelChar:FindFirstChild(loadstring(base64decode("SHVtYW5vaWRSb290UGFydA=="))())
				if AutoHotelHRP then
					local AutoHotelCF = AutoHotelGetCFrame(AutoHotelPaper)
					if AutoHotelCF then
						AutoHotelHRP.CFrame = AutoHotelCF * CFrame.new(0, 5, 0)
					end
				end

				for _, AutoHotelPrompt in ipairs(AutoHotelPaper:GetDescendants()) do
					if AutoHotelPrompt:IsA(loadstring(base64decode("UHJveGltaXR5UHJvbXB0"))()) then
						fireproximityprompt(AutoHotelPrompt)
					end
				end
				task.wait(0.08)
			end
		end
		task.wait(0.1)
	end
end

local function AutoHotelHandleSeek()
	local AutoHotelLastTriggerRoom = nil

	while Toggles.AutoHotel.Value do
		local AutoHotelCurrentRooms = workspace:FindFirstChild(loadstring(base64decode("Q3VycmVudFJvb21z"))())
		if not AutoHotelCurrentRooms then
			task.wait(0.2)
			continue
		end

		local TriggerRoomNum = nil

		for _, Room in ipairs(AutoHotelCurrentRooms:GetChildren()) do
			local Num = tonumber(Room.Name)
			if Num and Num ~= AutoHotelLastTriggerRoom then
				local Trigger = Room:FindFirstChild(loadstring(base64decode("VHJpZ2dlckV2ZW50Q29sbGlzaW9u"))())
					or Room:FindFirstChild(loadstring(base64decode("VHJpZ2dlckV2ZW50Q29sbGlzaW9u"))(), true)

				if Trigger then
					TriggerRoomNum = Num
					break
				end
			end
		end

		if not TriggerRoomNum then
			task.wait(0.15)
			continue
		end

		AutoHotelLastTriggerRoom = TriggerRoomNum

		AutoHotelEntityPause = true
		AutoHotelWaitForEntities(10)
		AutoHotelEntityPause = false
	end
end

Toggles.AutoHotel:OnChanged(function(AutoHotelEnabled)
	if AutoHotelConnection then
		task.cancel(AutoHotelConnection)
		AutoHotelConnection = nil
	end
	if AutoHotelLibraryConnection then
		task.cancel(AutoHotelLibraryConnection)
		AutoHotelLibraryConnection = nil
	end
	if AutoHotelLibraryRoomConnection then
		AutoHotelLibraryRoomConnection:Disconnect()
		AutoHotelLibraryRoomConnection = nil
	end
	if AutoHotelSeekConnection then
		task.cancel(AutoHotelSeekConnection)
		AutoHotelSeekConnection = nil
	end

	AutoHotelEntityPause = false
	table.clear(AutoHotelProcessedRooms)

	if not AutoHotelEnabled then return end

	if Options.AutoHotelRoomProcess then
		AutoHotelRoomProcessTime = Options.AutoHotelRoomProcess.Value
		Options.AutoHotelRoomProcess:OnChanged(function(Value)
			AutoHotelRoomProcessTime = Value
		end)
	end

	local AutoHotelCurrentRooms = workspace:FindFirstChild(loadstring(base64decode("Q3VycmVudFJvb21z"))())
	if AutoHotelCurrentRooms then
		AutoHotelCurrentRooms.ChildAdded:Connect(function(AutoHotelChild)
			local AutoHotelNum = tonumber(AutoHotelChild.Name)
			if AutoHotelNum then
				AutoHotelProcessRoom(AutoHotelNum)
			end
		end)
	end

	AutoHotelSeekConnection = task.spawn(AutoHotelHandleSeek)

	task.spawn(function()
		while Toggles.AutoHotel.Value do
			if AutoHotelIsEntityPresent() then
				AutoHotelEntityPause = true
				while AutoHotelIsEntityPresent() and Toggles.AutoHotel.Value do
					task.wait(0.15)
				end
				AutoHotelEntityPause = false
			end
			task.wait(0.2)
		end
	end)

	AutoHotelConnection = task.spawn(function()
		while Toggles.AutoHotel.Value do
			if AutoHotelEntityPause then
				task.wait(0.1)
				continue
			end

			local AutoHotelDoor, AutoHotelRoomNum = AutoHotelGetNextClosedDoor()

			if AutoHotelDoor and AutoHotelRoomNum and Character then
				if AutoHotelRoomNum == 50 then
					if not AutoHotelLibraryConnection then
						AutoHotelLibraryConnection = task.spawn(function()
							AutoHotelRunLibrary()
							AutoHotelLibraryConnection = nil
						end)
					end
					task.wait(0.4)
				else
					AutoHotelProcessRoom(AutoHotelRoomNum)
					AutoHotelHandleKey(AutoHotelRoomNum)
					if Character and not AutoHotelEntityPause then
						Character:PivotTo(AutoHotelDoor:GetPivot() * CFrame.new(0, -1, 0))
					end
				end
			end
			task.wait(0.15)
		end
	end)
end)


Groupboxes.Debug = Tabs.Player:AddRightGroupbox(loadstring(base64decode("RGVidWc="))())
Groupboxes.Debug:AddButton({
	Text = loadstring(base64decode("TGFkZGVyIFNvZnRsb2NrIEZpeA=="))(),
	Tooltip = loadstring(base64decode("TGFkZGVyIFNvZnRsb2NrIEZpeC4="))(),
	Func = function()
   		LocalPlayer:SetAttribute(loadstring(base64decode("Q2xpbWJpbmc="))(), false)
	end
})
Groupboxes.Debug:AddButton({
	Text = loadstring(base64decode("R2V0IEN1cnJlbnQgRmxvb3I="))(),
	Tooltip = loadstring(base64decode("UHJpbnRzIHRoZSBjdXJyZW50IGZsb29yIHRvIHRoZSBjb25zb2xlLg=="))(),
	Func = function()
		print(loadstring(base64decode("Q3VycmVudCBGbG9vcjo="))(), GameData:WaitForChild(loadstring(base64decode("Rmxvb3I="))()).Value)
	end
})
Groupboxes.Debug:AddButton({
	Text = loadstring(base64decode("R2V0IEN1cnJlbnQgUm9vbQ=="))(),
	Tooltip = loadstring(base64decode("UHJpbnRzIHRoZSBjdXJyZW50IHJvb20gbnVtYmVyIHRvIHRoZSBjb25zb2xlLg=="))(),
	Func = function()
		print(loadstring(base64decode("Q3VycmVudCBSb29tOg=="))(), LocalPlayer:GetAttribute(loadstring(base64decode("Q3VycmVudFJvb20="))()))
	end
})
Groupboxes.Debug:AddButton({
	Text = loadstring(base64decode("Vm9pZA=="))(),
	Tooltip = loadstring(base64decode("VGVsZXBvcnRzIHlvdXIgY2hhcmFjdGVyIHRvIFkgLTEyMC4="))(),
	Func = function()
		if not Character then return end
		local Pivot = Character:GetPivot()
		-- Too lazy to loop this
		Character:PivotTo(Pivot + Vector3.new(0, -120 - Pivot.Position.Y, 0))
		Character:PivotTo(Pivot + Vector3.new(0, -120 - Pivot.Position.Y, 0))
		Character:PivotTo(Pivot + Vector3.new(0, -120 - Pivot.Position.Y, 0))
		Character:PivotTo(Pivot + Vector3.new(0, -120 - Pivot.Position.Y, 0))
		Character:PivotTo(Pivot + Vector3.new(0, -120 - Pivot.Position.Y, 0))
		Character:PivotTo(Pivot + Vector3.new(0, -120 - Pivot.Position.Y, 0))
		Character:PivotTo(Pivot + Vector3.new(0, -120 - Pivot.Position.Y, 0))
		Character:PivotTo(Pivot + Vector3.new(0, -120 - Pivot.Position.Y, 0))
		Character:PivotTo(Pivot + Vector3.new(0, -120 - Pivot.Position.Y, 0))
		Character:PivotTo(Pivot + Vector3.new(0, -120 - Pivot.Position.Y, 0))
		Character:PivotTo(Pivot + Vector3.new(0, -120 - Pivot.Position.Y, 0))
		Character:PivotTo(Pivot + Vector3.new(0, -120 - Pivot.Position.Y, 0))
		Character:PivotTo(Pivot + Vector3.new(0, -120 - Pivot.Position.Y, 0))
		Character:PivotTo(Pivot + Vector3.new(0, -120 - Pivot.Position.Y, 0))
		Character:PivotTo(Pivot + Vector3.new(0, -120 - Pivot.Position.Y, 0))
		Character:PivotTo(Pivot + Vector3.new(0, -120 - Pivot.Position.Y, 0))
		Character:PivotTo(Pivot + Vector3.new(0, -120 - Pivot.Position.Y, 0))
		Character:PivotTo(Pivot + Vector3.new(0, -120 - Pivot.Position.Y, 0))
		Character:PivotTo(Pivot + Vector3.new(0, -120 - Pivot.Position.Y, 0))
		Character:PivotTo(Pivot + Vector3.new(0, -120 - Pivot.Position.Y, 0))
		Character:PivotTo(Pivot + Vector3.new(0, -120 - Pivot.Position.Y, 0))
		Character:PivotTo(Pivot + Vector3.new(0, -120 - Pivot.Position.Y, 0))
	end
})
Groupboxes.Debug:AddButton({
	Text = loadstring(base64decode("RGVhdGg="))(),
	Tooltip = loadstring(base64decode("RGVhdGg="))(),
	Func = function()
		Globals.Deathing = true
		LocalPlayer.Character.Humanoid.Health = 0
	end
})
Groupboxes.Debug:AddButton({
	Text = loadstring(base64decode("RXhpdCBDbG9zZXQ="))(),
	Tooltip = loadstring(base64decode("RXhpdHMgdGhlIGN1cnJlbnQgY2xvc2V0Lg=="))(),
	Func = function()
		if RemotesFolder and RemotesFolder:FindFirstChild(loadstring(base64decode("Q2FtTG9jaw=="))()) then
			RemotesFolder.CamLock:FireServer()
		end
	end
})
local TpNextDoorConnection

local function getNextClosedDoor()
	if not Character then return nil end

	local GameData = game:GetService(loadstring(base64decode("UmVwbGljYXRlZFN0b3JhZ2U="))()):FindFirstChild(loadstring(base64decode("R2FtZURhdGE="))())
	if not GameData then return nil end

	local LatestRoom = GameData:FindFirstChild(loadstring(base64decode("TGF0ZXN0Um9vbQ=="))())
	if not LatestRoom then return nil end

	local startRoom = LatestRoom.Value
	local bestDoor = nil
	local bestNumber = math.huge

	for _, obj in ipairs(workspace:GetDescendants()) do
		if obj.Name == loadstring(base64decode("RG9vcg=="))() and obj:IsA(loadstring(base64decode("TW9kZWw="))()) then
			local openAttr = obj:GetAttribute(loadstring(base64decode("T3Blbg=="))())
			if openAttr == false or openAttr == nil then
				local roomModel = obj.Parent
				local roomNum = tonumber(roomModel and roomModel.Name)

				if roomNum and roomNum >= startRoom and roomNum < bestNumber then
					bestNumber = roomNum
					bestDoor = obj
				end
			end
		end
	end

	return bestDoor
end

Groupboxes.Debug:AddButton({
	Text = loadstring(base64decode("VHAgTmV4dCBEb29y"))(),
	Tooltip = loadstring(base64decode("VGVsZXBvcnRzIHlvdSB0byB0aGUgbmV4dCBzZXF1ZW50aWFsIHVub3BlbmVkIGRvb3Iu"))(),
	Func = function()
		local door = getNextClosedDoor()
		if door then
			Character:PivotTo(door:GetPivot() * CFrame.new(0, -1, 0))
		end
	end
})

Toggles.TpNextDoor = Groupboxes.Debug:AddToggle(loadstring(base64decode("VHBOZXh0RG9vcg=="))(), {
	Text = loadstring(base64decode("QXV0byBUcCBOZXh0IERvb3I="))(),
	Tooltip = loadstring(base64decode("Q29udGludW91c2x5IHRlbGVwb3J0cyB5b3UgdG8gdGhlIG5leHQgc2VxdWVudGlhbCB1bm9wZW5lZCBkb29yLg=="))(),
	Default = false
})

Toggles.TpNextDoor:OnChanged(function(TpNextDoorEnabled)
	if TpNextDoorConnection then
		task.cancel(TpNextDoorConnection)
		TpNextDoorConnection = nil
	end

	if not TpNextDoorEnabled then
		return
	end

	TpNextDoorConnection = task.spawn(function()
		while Toggles.TpNextDoor.Value do
			local door = getNextClosedDoor()
			if door and Character then
				Character:PivotTo(door:GetPivot() * CFrame.new(0, -1, 0))
			end
			task.wait(0.15)
		end
		TpNextDoorConnection = nil
	end)
end)


Groupboxes.Exploits_Bypass = Tabs.Exploits:AddLeftGroupbox(loadstring(base64decode("QnlwYXNzIC8gU29sdmU="))())

Groupboxes.Exploits_Bypass:AddToggle(loadstring(base64decode("QnlwYXNzR2lnZ2xl"))(),         { Text = loadstring(base64decode("QnlwYXNzIEdpZ2dsZQ=="))(),           Default = false, Tooltip = loadstring(base64decode("UHJldmVudHMgJ0dpZ2dsZScgZnJvbSBhdHRhY2tpbmcgeW91Lg=="))() })
Groupboxes.Exploits_Bypass:AddToggle(loadstring(base64decode("QnlwYXNzRHVwZQ=="))(),           { Text = loadstring(base64decode("QnlwYXNzIER1cGU="))(),             Default = false, Tooltip = loadstring(base64decode("UHJldmVudHMgeW91IGZyb20gb3BlbiAnRHVwZScgZmFrZSBkb29ycy4="))() })
Groupboxes.Exploits_Bypass:AddToggle(loadstring(base64decode("QnlwYXNzRXllcw=="))(),           { Text = loadstring(base64decode("QnlwYXNzIEV5ZXM="))(),             Default = false, Tooltip = loadstring(base64decode("UHJldmVudHMgJ0V5ZXMnIGZyb20gaHVydGluZyB5b3Uu"))() })
Groupboxes.Exploits_Bypass:AddToggle(loadstring(base64decode("QnlwYXNzTG9va21hbg=="))(),        { Text = loadstring(base64decode("QnlwYXNzIExvb2ttYW4="))(),          Default = false, Tooltip = loadstring(base64decode("UHJldmVudHMgJ0xvb2ttYW4nIGZyb20gaHVydGluZyB5b3Uu"))() })
Groupboxes.Exploits_Bypass:AddToggle(loadstring(base64decode("QnlwYXNzR2xvb21iYXRFZ2dz"))(),   { Text = loadstring(base64decode("QnlwYXNzIEdsb29tYmF0IEVnZ3M="))(),    Default = false, Tooltip = loadstring(base64decode("UHJldmVudHMgdGFraW5nIGRhbWFnZSBmcm9tIHN0ZXBwaW5nIG9uICdHbG9vbWJhdCcgZWdncy4="))() })
Groupboxes.Exploits_Bypass:AddToggle(loadstring(base64decode("QnlwYXNzU2Vla09ic3RydWN0aW9ucw=="))(), { Text = loadstring(base64decode("QnlwYXNzIFNlZWsgT2JzdHJ1Y3Rpb25z"))(), Default = false, Tooltip = loadstring(base64decode("UHJldmVudHMgb2JzdGFjbGVzIGluIHRoZSAnU2VlaycgY2hhc2UgZnJvbSBoYXJtaW5nIHlvdS4="))() })
Groupboxes.Exploits_Bypass:AddToggle(loadstring(base64decode("QnlwYXNzVmFjdXVt"))(),         { Text = loadstring(base64decode("QnlwYXNzIFZhY3V1bQ=="))(),           Default = false, Tooltip = loadstring(base64decode("UHJldmVudHMgeW91IGZyb20gZmFsbGluZyBpbnRvICdWYWN1dW0nIGZha2UgZG9vcnMu"))() })
Groupboxes.Exploits_Bypass:AddToggle(loadstring(base64decode("QnlwYXNzS2lsbGJyaWNrcw=="))(),     { Text = loadstring(base64decode("QnlwYXNzIEtpbGxicmlja3M="))(),       Default = false, Tooltip = loadstring(base64decode("UHJldmVudHMgJ0xhdmEnIGZyb20gaHVydGluZyB5b3Uu"))() })
Groupboxes.Exploits_Bypass:AddToggle(loadstring(base64decode("QnlwYXNzU2Vla2luZ1dhbGw="))(),    { Text = loadstring(base64decode("QnlwYXNzIFNlZWtpbmcgV2FsbA=="))(),     Default = false, Tooltip = loadstring(base64decode("UHJldmVudHMgJ1NjYXJ5V2FsbCcgZnJvbSBodXJ0aW5nIHlvdS4="))() })
Groupboxes.Exploits_Bypass:AddToggle(loadstring(base64decode("QnlwYXNzU25hcmU="))(),          { Text = loadstring(base64decode("QnlwYXNzIFNuYXJl"))(),            Default = false, Tooltip = loadstring(base64decode("UHJldmVudHMgJ1NuYXJlJyBmcm9tIHRyYXBwaW5nIHlvdS4="))() })
Groupboxes.Exploits_Bypass:AddToggle(loadstring(base64decode("QnlwYXNzQmFuYW5h"))(),         { Text = loadstring(base64decode("QnlwYXNzIEJhbmFuYQ=="))(),           Default = false, Tooltip = loadstring(base64decode("UHJldmVudHMgJ0JhbmFuYSBQZWVsJyBmcm9tIHNsaXBwaW5nIHlvdSB1cCAoc29tZXRpbWVzIGRvZXNuJ3Qgd29yayku"))() })
Groupboxes.Exploits_Bypass:AddToggle(loadstring(base64decode("QnlwYXNzSmVmZg=="))(),           { Text = loadstring(base64decode("QnlwYXNzIEplZmY="))(),             Default = false, Tooltip = loadstring(base64decode("UHJldmVudHMgJ0plZmYgdGhlIEtpbGxlcicgZnJvbSBzdGFiYmluZyB5b3UgKHNvbWV0aW1lcyBkb2Vzbid0IHdvcmspLg=="))() })
Groupboxes.Exploits_Bypass:AddDivider()
Groupboxes.Exploits_Bypass:AddToggle(loadstring(base64decode("QW50aUxhZw=="))(), {
	Text = loadstring(base64decode("QW50aSBMYWc="))(),
	Default = false,
	Tooltip = loadstring(base64decode("UmVwbGFjZXMgcm9vbSBtYXRlcmlhbHMgd2l0aCBQbGFzdGljIHRvIHJlZHVjZSBsYWcuIE9yaWdpbmFsIG1hdGVyaWFscyBhcmUgcmVzdG9yZWQgd2hlbiBkaXNhYmxlZC4gQWxzbyBhcHBsaWVzIHRvIHBhcnRzIGFkZGVkIHdoaWxlIGVuYWJsZWQu"))(),
	Callback = function(Value)
		if Value then
			for _, v in workspace.CurrentRooms:GetDescendants() do
				if v:IsA(loadstring(base64decode("QmFzZVBhcnQ="))()) then
					v:SetAttribute(loadstring(base64decode("TWF0"))(), v.Material)
					v.Material = loadstring(base64decode("UGxhc3RpYw=="))()
				end
			end
		else
			for _, v in workspace.CurrentRooms:GetDescendants() do
				if v:IsA(loadstring(base64decode("QmFzZVBhcnQ="))()) then
					if v:GetAttribute(loadstring(base64decode("TWF0"))()) then
						v.Material = v:GetAttribute(loadstring(base64decode("TWF0"))()) or loadstring(base64decode("UGxhc3RpYw=="))()
					end
				end
			end
		end
	end
})


Toggles.BypassGiggle:OnChanged(function(Value)
	for _, Object in Objects.Entities do
		if Object.Name == loadstring(base64decode("R2lnZ2xlQ2VpbGluZw=="))() then
			Object:WaitForChild(loadstring(base64decode("SGl0Ym94"))()).CanTouch = not Value
		end
	end
end)
Toggles.BypassDupe:OnChanged(function(Value)
	for _, Object in Objects.Entities do
		if Object.Name == loadstring(base64decode("RG9vckZha2U="))() or Object.Name == loadstring(base64decode("RmFrZURvb3I="))() then
			Object:WaitForChild(loadstring(base64decode("SGlkZGVu"))()).CanTouch = not Value
			if Object:FindFirstChild(loadstring(base64decode("TG9jaw=="))()) then
				Object.Lock.UnlockPrompt.Enabled = not Value
			end
		end
	end
end)
Toggles.BypassEyes:OnChanged(function(Value)
	if Value and Globals.IsEyes then
		if Floor == loadstring(base64decode("Rm9vbHM="))() or Floor == loadstring(base64decode("T2xkSG90ZWw="))() then
			RemotesFolder.MotorReplication:FireServer(0, (Globals.SpoofOffset == 200 and 65 or -65), 0, false)
		else
			RemotesFolder.MotorReplication:FireServer(-650)
		end
	end
end)
Toggles.BypassLookman:OnChanged(function(Value)
	if Value and Globals.IsLookman then
		if Floor == loadstring(base64decode("Rm9vbHM="))() or Floor == loadstring(base64decode("T2xkSG90ZWw="))() then
			RemotesFolder.MotorReplication:FireServer(0, (Globals.SpoofOffset == 200 and 65 or -65), 0, false)
		else
			RemotesFolder.MotorReplication:FireServer(-650)
		end
	end
end)
Toggles.BypassGloombatEggs:OnChanged(function(Value)
	for _, Object in Objects.Entities do
		for _, Part in Object:GetDescendants() do
			if Part:IsA(loadstring(base64decode("QmFzZVBhcnQ="))()) then
				Part.CanTouch = not Value
			end
		end
	end
end)
Toggles.BypassSeekObstructions:OnChanged(function(Value)
	for _, Object in Objects.SeekObstructions do
		Object.CanTouch = not Value
		if Object.Name == loadstring(base64decode("U2Vla0Zsb29kbGluZQ=="))() then
			Object.CanCollide = Value
		end
	end
	for _, Object in Objects.SeekBridges do
		Object.CanCollide = Value
		Object.Transparency = Value and 0 or 1
	end
end)
Toggles.BypassVacuum:OnChanged(function(Value)
	for _, Object in Objects.Entities do
		if Object.Name == loadstring(base64decode("U2lkZXJvb21TcGFjZQ=="))() then
			Object:WaitForChild(loadstring(base64decode("Q29sbGlzaW9u"))()).CanCollide = Value
			Object:WaitForChild(loadstring(base64decode("Q29sbGlzaW9u"))()).CanTouch = not Value
		end
	end
end)
Toggles.BypassKillbricks:OnChanged(function(Value)
	for _, Object in Objects.Obstructions do
		if Object.Name == loadstring(base64decode("TGF2YQ=="))() then Object.CanTouch = not Value end
	end
end)
Toggles.BypassSeekingWall:OnChanged(function(Value)
	for _, Object in Objects.Obstructions do
		if Object.Name == loadstring(base64decode("U2NhcnlXYWxs"))() then
			for _, Part in Object:GetDescendants() do
				if Part:IsA(loadstring(base64decode("QmFzZVBhcnQ="))()) then
					Part.CanTouch = not Value
					Part.CanCollide = not Value
				end
			end
		end
	end
end)
Toggles.BypassSnare:OnChanged(function(Value)
	for _, Object in Objects.Entities do
		if Object.Name == loadstring(base64decode("U25hcmU="))() then
			for _, Part in Object:GetDescendants() do
				if Part:IsA(loadstring(base64decode("QmFzZVBhcnQ="))()) then Part.CanTouch = not Value end
			end
		end
	end
end)
Toggles.BypassBanana:OnChanged(function(Value)
	for _, Object in Objects.Entities do
		if Object.Name == loadstring(base64decode("QmFuYW5hUGVlbA=="))() then Object.CanTouch = not Value end
	end
end)
Toggles.BypassJeff:OnChanged(function(Value)
	for _, Object in Objects.Entities do
		if Object.Name == loadstring(base64decode("SmVmZlRoZUtpbGxlcg=="))() then
			for _, Part in Object:GetDescendants() do
				if Part:IsA(loadstring(base64decode("QmFzZVBhcnQ="))()) then
					Part.CanCollide = not Value
					Part.CanTouch = not Value
				end
			end
			Object:WaitForChild(loadstring(base64decode("SHVtYW5vaWQ="))()).Health = 0
		end
	end
end)







-- Archives (перенесено во вкладку Floors)

Groupboxes.Archives_Misc = Tabs.Floors:AddRightGroupbox(loadstring(base64decode("QXJjaGl2ZXMgLSBFeHBsb2l0cyAvIEFudGk="))())
Groupboxes.Archives_Misc:AddToggle(loadstring(base64decode("QW50aVJhbnNvbQ=="))(), { Text = loadstring(base64decode("QW50aSBSYW5zb20="))(), Default = false, Tooltip = loadstring(base64decode("UHJldmVudHMgJ1JhbnNvbScgZnJvbSBhdHRhY2tpbmcgeW91Lg=="))() })
Groupboxes.Archives_Misc:AddToggle(loadstring(base64decode("QW50aUNsb3NldFRyYXNo"))(), { Text = loadstring(base64decode("QW50aSBDbG9zZXQgVHJhc2g="))(), Default = false, Tooltip = loadstring(base64decode("UHJldmVudHMgJ0Nsb3NldCBUcmFzaCcgZnJvbSBzcGF3bmluZy4="))() })
Groupboxes.Archives_Misc:AddToggle(loadstring(base64decode("Rm9yZ2V0TWVOb3RTb2x2ZXI="))(), { Text = loadstring(base64decode("Rm9yZ2V0IE1lIE5vdCBTa2lwcGVy"))(), Default = false, Tooltip = loadstring(base64decode("QXV0b21hdGljYWxseSBTa2lwcGVzIEZvcmdldCBNZSBOb3QgZG9vcnMu"))() })
Groupboxes.Archives_Misc:AddToggle(loadstring(base64decode("VGltZVNob3dlcg=="))(), { Text = loadstring(base64decode("VGltZSBTaG93ZXI="))(), Default = false, Tooltip = loadstring(base64decode("U2hvd3MgdGhlIEFyY2hpdmVzIGNsb2NrIHRpbWUu"))() })
Groupboxes.Archives_Misc:AddToggle(loadstring(base64decode("QnlwYXNzRHJvbmVzU3RhbXBlZGU="))(), { Text = loadstring(base64decode("U3RvcCBUaW1lL0FudGkgU3RhbXBlZGU="))(), Default = false, Tooltip = loadstring(base64decode("UHJldmVudHMgJ1RoZSBEcm9uZXMgU3RhbXBlZGUnIGZyb20gYXR0YWNraW5nIHlvdS4="))() })
Groupboxes.Archives_Misc:AddToggle(loadstring(base64decode("SG9uY2hvQ29ycmVjdEJveEVTUA=="))(), { Text = loadstring(base64decode("Q29ycmVjdCBCb3ggRVNQL0F1dG8gSW50ZXJhY3Q="))(), Default = false, Tooltip = loadstring(base64decode("RVNQIGNvcnJlY3QgQXJjaGl2ZXMgYm94ZXMgaW4gdGhlIEhvbmNobyBzZXF1ZW5jZSBhbmQgYXV0b21hdGljYWxseSBpbnRlcmFjdCB3aXRoIHRoZSBjb3JyZWN0IGRlcG9zaXQu"))() })

TimeShowerLabel = Instance.new(loadstring(base64decode("VGV4dExhYmVs"))())
TimeShowerLabel.Name = loadstring(base64decode("VGltZVNob3dlcg=="))()
TimeShowerLabel.AnchorPoint = Vector2.new(0, 1)
TimeShowerLabel.Position = UDim2.new(0, 12, 1, -12)
TimeShowerLabel.Size = UDim2.new(0, 180, 0, 32)
TimeShowerLabel.BackgroundTransparency = 1
TimeShowerLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
TimeShowerLabel.TextStrokeColor3 = Color3.fromRGB(0, 0, 0)
TimeShowerLabel.TextStrokeTransparency = 0.35
TimeShowerLabel.Font = Enum.Font.GothamBold
TimeShowerLabel.TextSize = 18
TimeShowerLabel.TextXAlignment = Enum.TextXAlignment.Left
TimeShowerLabel.Text = loadstring(base64decode("VGltZTogLS06LS0="))()
TimeShowerLabel.Visible = false
TimeShowerLabel.Parent = Container



local function GetArchivesClockLabel(Room)
	local Assets = Room and Room:FindFirstChild(loadstring(base64decode("QXNzZXRz"))(), true)
	local Clock = Assets and Assets:FindFirstChild(loadstring(base64decode("QXJjaGl2ZXNDbG9jaw=="))(), true)
	local Time = Clock and Clock:FindFirstChild(loadstring(base64decode("VGltZQ=="))(), true)
	local TextLabel = Time and Time:FindFirstChild(loadstring(base64decode("VGV4dExhYmVs"))())
	return (TextLabel and TextLabel:IsA(loadstring(base64decode("VGV4dExhYmVs"))())) and TextLabel or nil
end

local function ResolveClockLabel()
	if TimeShowerSourceLabel and TimeShowerSourceLabel.Parent and TimeShowerSourceLabel:IsDescendantOf(game) then
		return TimeShowerSourceLabel
	end
	local currentRooms = workspace:FindFirstChild(loadstring(base64decode("Q3VycmVudFJvb21z"))())
	if not currentRooms then return nil end
	local rooms = {}
	for _, room in ipairs(currentRooms:GetChildren()) do
		local num = tonumber(room.Name)
		if num then
			rooms[#rooms + 1] = { room = room, num = num }
		end
	end
	table.sort(rooms, function(a, b) return a.num > b.num end)
	for i = 1, math.min(6, #rooms) do
		local label = GetArchivesClockLabel(rooms[i].room)
		if label then
			TimeShowerSourceLabel = label
			return label
		end
	end
	return nil
end

local function ResolveClockRemote()
	local label = ResolveClockLabel()
	if not label then return nil end
	local clock = label:FindFirstAncestor(loadstring(base64decode("QXJjaGl2ZXNDbG9jaw=="))())
	if not clock then return nil end
	local remote = clock:FindFirstChild(loadstring(base64decode("TG9va2VkQXRSZW1vdGU="))(), true)
	return (remote and remote:IsA(loadstring(base64decode("UmVtb3RlRXZlbnQ="))())) and remote or nil
end

task.spawn(function()
	local lastCheckedRoomCount = 0
	while game:IsLoaded() do
		local currentRooms = workspace:FindFirstChild(loadstring(base64decode("Q3VycmVudFJvb21z"))())
		if currentRooms then
			local roomCount = 0
			for _, child in ipairs(currentRooms:GetChildren()) do
				if tonumber(child.Name) then
					roomCount += 1
				end
			end
			if roomCount > 0 and (lastCheckedRoomCount == 0 or roomCount - lastCheckedRoomCount >= 10) then
				ResolveClockLabel()
				lastCheckedRoomCount = roomCount
			end
		end
		task.wait(0.5)
	end
end)

local function StopTimeShower()
	TimeShowerToken += 1
	if TimeShowerConnection then
		TimeShowerConnection:Disconnect()
		TimeShowerConnection = nil
	end
	if TimeShowerLabel then
		TimeShowerLabel.Visible = false
		TimeShowerLabel.Text = loadstring(base64decode("VGltZTogLS06LS0="))()
	end
end

Toggles.TimeShower:OnChanged(function(Value)
	StopTimeShower()
	if not Value then return end
	local Token = TimeShowerToken
	TimeShowerLabel.Visible = true
	TimeShowerConnection = Services.RunService.Heartbeat:Connect(function()
		if Token ~= TimeShowerToken then return end
		local TextLabel = ResolveClockLabel()
		TimeShowerLabel.Text = TextLabel and (loadstring(base64decode("VGltZTog"))() .. TextLabel.Text) or loadstring(base64decode("VGltZTogLS06LS0="))()
	end)
end)
Toggles.BypassDronesStampede:OnChanged(function(enabled)
	if BypassDronesStampedeConnection then
		task.cancel(BypassDronesStampedeConnection)
		BypassDronesStampedeConnection = nil
	end
	if not enabled then return end
	BypassDronesStampedeConnection = task.spawn(function()
		while Toggles.BypassDronesStampede.Value do
			local remote = ResolveClockRemote()
			if remote then
				remote:FireServer()
				task.wait(0.5)
			else
				task.wait(0.25)
			end
		end
	end)
end)

local function ClearHonchoESP()
	if HonchoCorrectBoxConnection then
		HonchoCorrectBoxConnection:Disconnect()
		HonchoCorrectBoxConnection = nil
	end
	if HonchoAutoDepositConnection then
		HonchoAutoDepositConnection:Disconnect()
		HonchoAutoDepositConnection = nil
	end
	for _, Object in pairs(HonchoESPObjects) do
		if Object and Object.Parent then
			Functions.RemoveESP(Object)
		end
	end
	table.clear(HonchoESPObjects)
	table.clear(HonchoProcessedRooms)
	table.clear(HonchoDepositCache)
end

Toggles.HonchoCorrectBoxESP:OnChanged(function(Value)
	ClearHonchoESP()
	if not Value then return end
	local CurrentRooms = workspace:FindFirstChild(loadstring(base64decode("Q3VycmVudFJvb21z"))())
	if not CurrentRooms then return end

	local function GetESPColor()
		return (Options.ObjectiveESPColor and Options.ObjectiveESPColor.Value) or Color3.fromRGB(0, 255, 0)
	end

	local function AddHonchoESP(Object, Text)
		Functions.AddESP({ Object = Object, Text = Text, Color = GetESPColor() }, true)
		HonchoESPObjects[#HonchoESPObjects + 1] = Object
		Object.Destroying:Once(function()
			Functions.RemoveESP(Object)
			local pos = table.find(HonchoESPObjects, Object)
			if pos then table.remove(HonchoESPObjects, pos) end
		end)
	end

	local function ProcessHonchoRoom(Room)
		if not tonumber(Room.Name) or not Room.Parent or HonchoProcessedRooms[Room] then return end
		HonchoProcessedRooms[Room] = true
		task.wait(3)
		if not Toggles.HonchoCorrectBoxESP.Value or not Room.Parent then
			HonchoProcessedRooms[Room] = nil
			return
		end
		local HonchoRoom = Room:FindFirstChild(loadstring(base64decode("QXJjaGl2ZXNIb25jaG9Sb29t"))(), true)
		if not HonchoRoom then
			HonchoProcessedRooms[Room] = nil
			return
		end
		local BoxIDs = {}
		local RoomNumber = tonumber(Room.Name)
		for _, Desc in ipairs(Room:GetDescendants()) do
			local name = Desc.Name
			if name == loadstring(base64decode("QXJjaGl2ZXNQYWNrYWdlRGVwb3NpdA=="))() or name:match(loadstring(base64decode("XkFyY2hpdmVzUGFja2FnZURlcG9zaXQ="))()) then
				local id = Desc:GetAttribute(loadstring(base64decode("Qm94SUQ="))())
				if id ~= nil then
					local idStr = tostring(id)
					BoxIDs[idStr] = true
					HonchoDepositCache[idStr] = Desc
					AddHonchoESP(Desc, loadstring(base64decode("RGVwb3NpdCAo"))() .. idStr .. loadstring(base64decode("KQ=="))())
					Desc.Destroying:Once(function()
						if HonchoDepositCache[idStr] == Desc then
							HonchoDepositCache[idStr] = nil
						end
					end)
				end
			end
		end
		if not next(BoxIDs) then
			HonchoProcessedRooms[Room] = nil
			return
		end
		for _, Child in ipairs(HonchoRoom:GetDescendants()) do
			if Child.Name == loadstring(base64decode("QXJjaGl2ZXNTdG9yYWdlQm94"))() then
				local ToolBoxID = Child:GetAttribute(loadstring(base64decode("VG9vbF9Cb3hJRA=="))())
				if ToolBoxID ~= nil and BoxIDs[tostring(ToolBoxID)] then
					if not Child:GetAttribute(loadstring(base64decode("UGFyZW50Um9vbQ=="))()) then
						Child:SetAttribute(loadstring(base64decode("UGFyZW50Um9vbQ=="))(), RoomNumber)
					end
					Child.Name = loadstring(base64decode("QXJjaGl2ZXNTdG9yYWdlQm94Q29ycmVjdA=="))()
					AddHonchoESP(Child, loadstring(base64decode("Q29ycmVjdCBCb3ggKA=="))() .. tostring(ToolBoxID) .. loadstring(base64decode("KQ=="))())
				end
			end
		end
	end

	for _, Room in ipairs(CurrentRooms:GetChildren()) do
		task.spawn(ProcessHonchoRoom, Room)
	end

	HonchoCorrectBoxConnection = CurrentRooms.ChildAdded:Connect(function(Room)
		task.spawn(ProcessHonchoRoom, Room)
	end)

	local lastCheck = 0
	HonchoAutoDepositConnection = game:GetService(loadstring(base64decode("UnVuU2VydmljZQ=="))()).Heartbeat:Connect(function()
		if not Toggles.HonchoCorrectBoxESP.Value then return end
		local now = os.clock()
		if now - lastCheck < 0.1 then return end
		lastCheck = now
		local Character = LocalPlayer and LocalPlayer.Character
		local HumanoidRootPart = Character and Character:FindFirstChild(loadstring(base64decode("SHVtYW5vaWRSb290UGFydA=="))())
		if not Character or not HumanoidRootPart then return end
		local BoxCandidates = {}
		for _, Object in ipairs(Character:GetChildren()) do
			if (Object:IsA(loadstring(base64decode("VG9vbA=="))()) or Object:IsA(loadstring(base64decode("TW9kZWw="))())) and (Object.Name == loadstring(base64decode("QXJjaGl2ZXNTdG9yYWdlQm94"))() or Object.Name == loadstring(base64decode("QXJjaGl2ZXNTdG9yYWdlQm94Q29ycmVjdA=="))()) then
				BoxCandidates[#BoxCandidates + 1] = Object
			end
		end
		local Drops = workspace:FindFirstChild(loadstring(base64decode("RHJvcHM="))())
		if Drops then
			for _, Object in ipairs(Drops:GetChildren()) do
				if Object.Name == loadstring(base64decode("QXJjaGl2ZXNTdG9yYWdlQm94"))() or Object.Name == loadstring(base64decode("QXJjaGl2ZXNTdG9yYWdlQm94Q29ycmVjdA=="))() then
					BoxCandidates[#BoxCandidates + 1] = Object
				end
			end
		end
		for _, Box in ipairs(BoxCandidates) do
			if not (Box and Box.Parent) then continue end
			local BoxID = Box:GetAttribute(loadstring(base64decode("VG9vbF9Cb3hJRA=="))()) or Box:GetAttribute(loadstring(base64decode("Qm94SUQ="))())
			if BoxID == nil then continue end
			local Deposit = HonchoDepositCache[tostring(BoxID)]
			if not Deposit or not Deposit.Parent then continue end
			if Box.Parent == Drops and not Box:GetAttribute(loadstring(base64decode("SG9uY2hvQ29ycmVjdEVTUA=="))()) then
				Box:SetAttribute(loadstring(base64decode("SG9uY2hvQ29ycmVjdEVTUA=="))(), true)
				AddHonchoESP(Box, loadstring(base64decode("Q29ycmVjdCBCb3ggKA=="))() .. tostring(BoxID) .. loadstring(base64decode("KQ=="))())
			end
			if Box.Parent == Character then
				local DepositPart = Deposit:IsA(loadstring(base64decode("QmFzZVBhcnQ="))()) and Deposit or Deposit:FindFirstChildWhichIsA(loadstring(base64decode("QmFzZVBhcnQ="))(), true)
				if DepositPart and (HumanoidRootPart.Position - DepositPart.Position).Magnitude <= 10 then
					local Prompt = Deposit:FindFirstChildWhichIsA(loadstring(base64decode("UHJveGltaXR5UHJvbXB0"))(), true)
					if Prompt then
						fireproximityprompt(Prompt)
					end
				end
			end
		end
	end)
end)


Groupboxes.Archives_Bypasses = Tabs.Floors:AddLeftGroupbox(loadstring(base64decode("QXJjaGl2ZXMgLSBCeXBhc3Nlcw=="))())
Groupboxes.Archives_Bypasses:AddToggle(loadstring(base64decode("QnlwYXNzV2F0ZXI="))(), { Text = loadstring(base64decode("QnlwYXNzIEVsZWN0cmljIFdhdGVy"))(), Default = false, Tooltip = loadstring(base64decode("UHJldmVudHMgZWxlY3RyaWMgd2F0ZXIgZnJvbSBodXJ0aW5nIHlvdS4="))() })
Groupboxes.Archives_Bypasses:AddToggle(loadstring(base64decode("QnlwYXNzQWxtYQ=="))(), { Text = loadstring(base64decode("QnlwYXNzIEFsbWE="))(), Default = false, Tooltip = loadstring(base64decode("UHJldmVudHMgJ0FsbWEnIGZyb20gc3Bhd25pbmcu"))() })
Groupboxes.Archives_Bypasses:AddToggle(loadstring(base64decode("QnlwYXNzRHJvbmVz"))(), { Text = loadstring(base64decode("QnlwYXNzIERyb25lcw=="))(), Default = false, Tooltip = loadstring(base64decode("UHJldmVudHMgJ0Ryb25lcycgZnJvbSBhdHRhY2tpbmcgeW91Lg=="))() })
Groupboxes.Archives_Bypasses:AddToggle(loadstring(base64decode("QW50aVNjcmliYmxlcw=="))(), { Text = loadstring(base64decode("QnlwYXNzIFNjcmliYmxlcw=="))(), Default = false, Tooltip = loadstring(base64decode("UHJldmVudHMgJ1NjcmliYmxlcycgZnJvbSBhdHRhY2tpbmcgeW91Lg=="))() })

Groupboxes.Archives_Experimental = Tabs.Floors:AddLeftGroupbox(loadstring(base64decode("QXJjaGl2ZXMgLSBFeHBlcmltZW50YWw="))())

Toggles.AntiClosetTrash:OnChanged(function(Value)
	if AntiClosetTrash_Connection then
		AntiClosetTrash_Connection:Disconnect()
		AntiClosetTrash_Connection = nil
	end
	if not Value then return end
	AntiClosetTrash_Connection = workspace.ChildAdded:Connect(function(Child)
		if not Toggles.AntiClosetTrash.Value then return end
		local Name = Child.Name
		if Name:sub(1, 6) == loadstring(base64decode("QmluZGVy"))() or Name:sub(1, 4) == loadstring(base64decode("U2hvZQ=="))() or Name:sub(1, 5) == loadstring(base64decode("U2hlbGY="))() then
			Child:Destroy()
		end
	end)
end)

Toggles.AntiRansom:OnChanged(function(Value)
	if AntiRansom_Connection then
		AntiRansom_Connection:Disconnect()
		AntiRansom_Connection = nil
	end
	if not Value then return end
	AntiRansom_Connection = workspace.ChildAdded:Connect(function(Child)
		if Child.Name == loadstring(base64decode("UmFuc29t"))() and Toggles.AntiRansom.Value then
			Child:Destroy()
			print(loadstring(base64decode("UmFuc29tIGdvbmUgaGVoZWhlaGVoZWhlaGVoZQ=="))())
		end
	end)
end)

Toggles.ForgetMeNotSolver:OnChanged(function(Value)
	if ForgetMeNotConnection then
		ForgetMeNotConnection:Disconnect()
		ForgetMeNotConnection = nil
	end
	ForgetMeNotRunning = false
	table.clear(ForgetMeNotProcessing)
	table.clear(ForgetMeNotNotified)
	if not Value then return end
	ForgetMeNotRunning = true

	local function GetCharacter()
		return game.Players.LocalPlayer.Character or game.Players.LocalPlayer.CharacterAdded:Wait()
	end

	local function GetNextRoom(Number)
		while ForgetMeNotRunning do
			for RoomNumber = Number + 1, Number + 5 do
				local NextRoom = workspace.CurrentRooms:FindFirstChild(tostring(RoomNumber))
				if NextRoom then return NextRoom end
			end
			task.wait(0.1)
		end
		return nil
	end

	local function FireLookAts(Room)
		for i = 1, 6 do
			local Obj = Room:FindFirstChild(tostring(i))
			if Obj then
				local LookAt = Obj:FindFirstChild(loadstring(base64decode("TG9va0F0"))())
				if LookAt then
					pcall(function() LookAt:FireServer() end)
				end
			end
		end
	end

	local function VoidCharacter()
		local Character = GetCharacter()
		if not Character then return end

		local voidCF = CFrame.new(0, -120, 0)
		local start = tick()
		while ForgetMeNotRunning and tick() - start < 2 do
			Character:PivotTo(voidCF)
			task.wait(0.1)
		end
	end

	local function Run(Room)
		local RoomNumber = tonumber(Room.Name)
		if not RoomNumber or not ForgetMeNotRunning or ForgetMeNotProcessing[RoomNumber] then return end

		if not Room:FindFirstChild(loadstring(base64decode("Rm9yZ2V0TWVOb3RWaW5lRG9vcnM="))(), true) then
			return
		end

		ForgetMeNotProcessing[RoomNumber] = true

		while ForgetMeNotRunning and Room.Parent do
			FireLookAts(Room)

			local NextRoom = GetNextRoom(RoomNumber)
			if not NextRoom then
				task.wait(0.4)
				continue
			end

			local Door = NextRoom:FindFirstChild(loadstring(base64decode("RG9vcg=="))())

			if not Door then
				local Character = GetCharacter()
				if Character then
					local Target = NextRoom:FindFirstChildWhichIsA(loadstring(base64decode("QmFzZVBhcnQ="))()) or NextRoom
					if Target:IsA(loadstring(base64decode("QmFzZVBhcnQ="))()) then
						Character:PivotTo(Target.CFrame + Vector3.new(0, 3, 0))
					elseif Target:IsA(loadstring(base64decode("TW9kZWw="))()) then
						Character:PivotTo(Target:GetPivot() + Vector3.new(0, 3, 0))
					else
						Character:PivotTo(CFrame.new(NextRoom:GetPivot().Position + Vector3.new(0, 5, 0)))
					end
				end
				break
			end

			if Door:GetAttribute(loadstring(base64decode("T3BlbmVk"))()) == true then
				VoidCharacter()
				break
			end

			local Hidden = Door:FindFirstChild(loadstring(base64decode("SGlkZGVu"))()) or Door:WaitForChild(loadstring(base64decode("SGlkZGVu"))(), 2)
			if not Hidden then
				task.wait(0.3)
				continue
			end

			while ForgetMeNotRunning and Room.Parent and NextRoom.Parent and Door.Parent and Door:GetAttribute(loadstring(base64decode("T3BlbmVk"))()) ~= true do
				local Character = GetCharacter()
				if Character then
					if Hidden:IsA(loadstring(base64decode("QmFzZVBhcnQ="))()) then
						Character:PivotTo(Hidden.CFrame)
					elseif Hidden:IsA(loadstring(base64decode("TW9kZWw="))()) then
						Character:PivotTo(Hidden:GetPivot())
					end
				end
				pcall(function() Door.ClientOpen:Fire() end)
				pcall(function() Door.ClientOpen:FireServer() end)
				task.wait()
			end

			if ForgetMeNotRunning and Door.Parent and Door:GetAttribute(loadstring(base64decode("T3BlbmVk"))()) == true then
				VoidCharacter()
			end

			break
		end

		ForgetMeNotProcessing[RoomNumber] = nil
	end

	local function CheckRooms()
		local LatestRoomNumber = tonumber(LatestRoom.Value) or 0
		local FirstRoomNumber = math.max(0, LatestRoomNumber - 3)
		for RoomNumber = FirstRoomNumber, LatestRoomNumber do
			if not ForgetMeNotRunning then return end
			local Room = workspace.CurrentRooms:FindFirstChild(tostring(RoomNumber))
			if Room and not ForgetMeNotProcessing[RoomNumber] then
				task.spawn(Run, Room)
			end
		end
	end

	ForgetMeNotConnection = workspace.CurrentRooms.ChildAdded:Connect(function(Room)
		if not tonumber(Room.Name) then return end
		task.spawn(function()
			task.wait(1)
			if ForgetMeNotRunning and Room.Parent then
				task.spawn(Run, Room)
			end
		end)
	end)

	task.spawn(function()
		while ForgetMeNotRunning do
			CheckRooms()
			task.wait(1)
		end
	end)

	CheckRooms()
end)

Toggles.BypassWater:OnChanged(function(Value)
	Functions.Notify({ Title = loadstring(base64decode("UG9zaXRpb25TcG9vZiBXaWxsIEJyZWFrIFRoaXMhLg=="))() })

	if WaterBypassConnection then
		WaterBypassConnection:Disconnect()
		WaterBypassConnection = nil
	end

	if not Value then
		for _, WaterBypassPart in pairs(WaterParts) do
			if WaterBypassPart then
				WaterBypassPart:Destroy()
			end
		end
		table.clear(WaterParts)
		return
	end

	local CurrentRooms = workspace.CurrentRooms

	local function ProcessWaterBypassRoom(WaterBypassRoom)
		if not tonumber(WaterBypassRoom.Name) then return end

		task.wait(3)

		local WaterBypassWater = WaterBypassRoom:FindFirstChild(loadstring(base64decode("V2F0ZXI="))())
		if not WaterBypassWater or WaterParts[WaterBypassWater] then return end

		local WaterBypassPart = Instance.new(loadstring(base64decode("UGFydA=="))())
		WaterBypassPart.Name = loadstring(base64decode("V2F0ZXJCeXBhc3M="))()
		WaterBypassPart.Anchored = true
		WaterBypassPart.CanCollide = true
		WaterBypassPart.CanTouch = false
		WaterBypassPart.CanQuery = false
		WaterBypassPart.Transparency = 0.25
		WaterBypassPart.Color = Color3.fromRGB(0, 150, 255)
		WaterBypassPart.Material = Enum.Material.ForceField

		local WaterBypassSize, WaterBypassCFrame
		if WaterBypassWater:IsA(loadstring(base64decode("QmFzZVBhcnQ="))()) then
			WaterBypassSize = WaterBypassWater.Size
			WaterBypassCFrame = WaterBypassWater.CFrame
		elseif WaterBypassWater:IsA(loadstring(base64decode("TW9kZWw="))()) then
			WaterBypassCFrame, WaterBypassSize = WaterBypassWater:GetBoundingBox()
		else
			WaterBypassSize = Vector3.new(10, 1.5, 10)
			WaterBypassCFrame = WaterBypassWater:GetPivot()
		end

		WaterBypassPart.Size = WaterBypassSize + Vector3.new(0, 0.5, 0)
		WaterBypassPart.CFrame = WaterBypassCFrame * CFrame.new(0, 0.25, 0)

		if WaterBypassPart.Size.Y > 3 then
			WaterBypassPart:Destroy()
			Functions.Notify({ Title = loadstring(base64decode("V2F0ZXIgQnlwYXNzIHJlbW92ZWQ6IFNvZnRsb2NrLg=="))() })
			return
		end

		WaterBypassPart.Parent = WaterBypassRoom
		WaterParts[WaterBypassWater] = WaterBypassPart
	end

	local WaterBypassLatestRoomNumber = tonumber(LatestRoom.Value) or 0
	for WaterBypassRoomNumber = math.max(0, WaterBypassLatestRoomNumber - 4), WaterBypassLatestRoomNumber do
		local WaterBypassRoom = CurrentRooms:FindFirstChild(tostring(WaterBypassRoomNumber))
		if WaterBypassRoom then
			task.spawn(ProcessWaterBypassRoom, WaterBypassRoom)
		end
	end

	WaterBypassConnection = CurrentRooms.ChildAdded:Connect(function(WaterBypassRoom)
		task.spawn(ProcessWaterBypassRoom, WaterBypassRoom)
	end)
end)

Toggles.BypassAlma:OnChanged(function(Value)
	if AlmaConnection then
		AlmaConnection:Disconnect()
		AlmaConnection = nil
	end
	if Value then
		for _, child in ipairs(workspace:GetChildren()) do
			if child.Name == loadstring(base64decode("QWxtYQ=="))() then child:Destroy() end
		end
		AlmaConnection = workspace.ChildAdded:Connect(function(child)
			if child.Name == loadstring(base64decode("QWxtYQ=="))() then child:Destroy() end
		end)
	end
end)

Toggles.AntiScribbles:OnChanged(function(Value)
	if AntiScribbles_Connection then
		AntiScribbles_Connection:Disconnect()
		AntiScribbles_Connection = nil
	end
	if not Value then return end
	AntiScribbles_Connection = workspace.ChildAdded:Connect(function(Child)
		if Child.Name == loadstring(base64decode("U2NyaWJibGVz"))() and Toggles.AntiScribbles.Value then
			local ExploitSribbleWarning = Child:FindFirstChild(loadstring(base64decode("SWZZb3VyZUV4cGxvaXRpbmdEZWxldGVUaGlz"))())
			if ExploitSribbleWarning then ExploitSribbleWarning:Destroy() end
		end
	end)
end)

Toggles.BypassDrones:OnChanged(function(Value)
	local RS = game:GetService(loadstring(base64decode("UmVwbGljYXRlZFN0b3JhZ2U="))())
	local function ProcessDrones(drones)
		local WalkedInto = drones:FindFirstChild(loadstring(base64decode("V2Fsa2VkSW50bw=="))()) or drones:WaitForChild(loadstring(base64decode("V2Fsa2VkSW50bw=="))(), 3)
		if WalkedInto and not DroneWalkedIntoParents[WalkedInto] then
			DroneWalkedIntoParents[WalkedInto] = drones
			WalkedInto.Parent = RS
		end
	end
	if Value then
		for _, child in ipairs(workspace:GetChildren()) do
			if child.Name == loadstring(base64decode("RHJvbmVz"))() then ProcessDrones(child) end
		end
		if DroneConnection then DroneConnection:Disconnect() end
		DroneConnection = workspace.ChildAdded:Connect(function(child)
			if child.Name == loadstring(base64decode("RHJvbmVz"))() then ProcessDrones(child) end
		end)
	else
		for WalkedInto, originalParent in pairs(DroneWalkedIntoParents) do
			if WalkedInto and WalkedInto.Parent and originalParent and originalParent.Parent then
				WalkedInto.Parent = originalParent
			end
		end
		table.clear(DroneWalkedIntoParents)
		if DroneConnection then
			DroneConnection:Disconnect()
			DroneConnection = nil
		end
	end
end)

Groupboxes.Stairwell_Misc = Tabs.Floors:AddLeftGroupbox(loadstring(base64decode("U3RhaXJ3ZWxsIC0gRXhwbG9pdHMgLyBBbnRpIC8gTWlzYw=="))())



Groupboxes.Stairwell_Misc:AddDivider()
Groupboxes.Stairwell_Misc:AddToggle(loadstring(base64decode("QnlwYXNzTm9pc2U="))(), { Text = loadstring(base64decode("Tm9pc2UgVHYgQnJlYWtlcg=="))(), Default = false, Tooltip = loadstring(base64decode("QnJlYWtzIHRoZSB0diBvZiBub2lzZSB3aGlsZSBob2xkaW5nIGl0Lg=="))() })


Groupboxes.Stairwell_Misc:AddToggle(loadstring(base64decode("RHJvcHBlZEl0ZW1WYWx1ZQ=="))(), { Text = loadstring(base64decode("SXRlbSBOdW1iZXI="))(), Default = false, Tooltip = loadstring(base64decode("U2hvd3MgdGhlIG51bWJlciBvZiBkcm9wcGVkIGl0ZW1zLg=="))() })

Groupboxes.Stairwell_Misc:AddToggle(loadstring(base64decode("S2lsbEFsbFdpdGhDYXJ0"))(), {
	Text = loadstring(base64decode("S2lsbCBBbGwgKFJlcXVpcmVzIOKJpTEgQ2FydCk="))(),
	Default = false,
})
Groupboxes.Stairwell_Misc:AddToggle(loadstring(base64decode("RmxpbmdDcmVhaw=="))(), {
	Text = loadstring(base64decode("QnVnIE91dCBDcmVhayAoUmVxdWlyZXMg4omlNSBDYXJ0KQ=="))(),
	Default = false,
	ToolTip = loadstring(base64decode("RE9OVCBUT1VDSCBUSEUgQ0FSVFMgVVJTRUxGLCBVIFdJTEwgRElF"))()
})
Groupboxes.Stairwell_Misc:AddToggle(loadstring(base64decode("Q3JlYWtBZ2dyZXNzaW9uTWV0ZXI="))(), {
    Text = loadstring(base64decode("Q3JlYWsgQWdncmVzc2lvbiBNZXRlcg=="))(),
    Default = false,
    Tooltip = loadstring(base64decode("U2hvd3MgQ3JlYWsncyBhZ2dyZXNzaW9uIGFib3ZlIGl0cyBoZWFkLg=="))()
})

local CreakAggressionMetersTable = {}
local CreakAggressionCamera = Workspace.CurrentCamera
local CreakAggressionChildAddedConnection = nil

local function CleanupCreakAggressionMeter(CreakModel)
    local CreakMeterData = CreakAggressionMetersTable[CreakModel]
    if not CreakMeterData then return end

    CreakAggressionMetersTable[CreakModel] = nil

    if CreakMeterData.RenderConnection then
        CreakMeterData.RenderConnection:Disconnect()
    end
    if CreakMeterData.DestroyConnection then
        CreakMeterData.DestroyConnection:Disconnect()
    end

    for _, CreakDrawingObject in ipairs(CreakMeterData.Drawings) do
        pcall(function() CreakDrawingObject:Remove() end)
    end
end

local function GetCreakAggressionValue(CreakModel)
    local CreakAnimator = CreakModel:FindFirstChildOfClass(loadstring(base64decode("QW5pbWF0b3I="))())
        or (CreakModel:FindFirstChild(loadstring(base64decode("QW5pbWF0aW9uQ29udHJvbGxlcg=="))()) and CreakModel.AnimationController:FindFirstChildOfClass(loadstring(base64decode("QW5pbWF0b3I="))()))
        or CreakModel:FindFirstChildOfClass(loadstring(base64decode("QW5pbWF0aW9uQ29udHJvbGxlcg=="))())

    if not CreakAnimator then return nil end

    for _, CreakAnimationTrack in ipairs(CreakAnimator:GetPlayingAnimationTracks()) do
        if CreakAnimationTrack.Name == loadstring(base64decode("Q3JlYWtHcmFwaA=="))() or (CreakAnimationTrack.Animation and CreakAnimationTrack.Animation.Name == loadstring(base64decode("Q3JlYWtHcmFwaA=="))()) then
            local CreakSuccess, CreakAggressionValue = pcall(CreakAnimationTrack.GetParameter, CreakAnimationTrack, loadstring(base64decode("QWdncmVzc2lvbg=="))())
            if CreakSuccess and typeof(CreakAggressionValue) == loadstring(base64decode("bnVtYmVy"))() then
                return math.clamp(CreakAggressionValue, 0, 1)
            end
        end
    end
    return nil
end

local function CreateCreakAggressionDrawings()
    local CreakDrawingList = {}

    local function CreateCreakDrawing(CreakDrawingType)
        local CreakNewDrawing = Drawing.new(CreakDrawingType)
        table.insert(CreakDrawingList, CreakNewDrawing)
        return CreakNewDrawing
    end

    local CreakTitleText = CreateCreakDrawing(loadstring(base64decode("VGV4dA=="))())
    CreakTitleText.Text = loadstring(base64decode("QWdncmVzc2lvbiAtLSU="))()
    CreakTitleText.Size = 16
    CreakTitleText.Font = Drawing.Fonts.Plex
    CreakTitleText.Color = Color3.fromRGB(255, 255, 255)
    CreakTitleText.Center = true
    CreakTitleText.Outline = true
    CreakTitleText.Visible = false

    local CreakBarBackground = CreateCreakDrawing(loadstring(base64decode("U3F1YXJl"))())
    CreakBarBackground.Size = Vector2.new(112, 6)
    CreakBarBackground.Filled = true
    CreakBarBackground.Color = Color3.fromRGB(58, 58, 64)
    CreakBarBackground.Transparency = 0.15
    CreakBarBackground.Visible = false

    local CreakBarFill = CreateCreakDrawing(loadstring(base64decode("U3F1YXJl"))())
    CreakBarFill.Size = Vector2.new(0, 6)
    CreakBarFill.Filled = true
    CreakBarFill.Visible = false

    return {
        Drawings = CreakDrawingList,
        TitleText = CreakTitleText,
        BarBackground = CreakBarBackground,
        BarFill = CreakBarFill
    }
end

local function AddCreakAggressionMeter(CreakModel)
    if not Toggles.CreakAggressionMeter.Value or CreakModel.Name ~= loadstring(base64decode("Q3JlYWs="))() or CreakAggressionMetersTable[CreakModel] then
        return
    end

    local CreakHeadPart = CreakModel:FindFirstChild(loadstring(base64decode("SGVhZA=="))())
    if not CreakHeadPart or not CreakHeadPart:IsA(loadstring(base64decode("QmFzZVBhcnQ="))()) then return end

    local CreakMeterData = CreateCreakAggressionDrawings()
    CreakAggressionMetersTable[CreakModel] = CreakMeterData

    CreakMeterData.RenderConnection = RunService.RenderStepped:Connect(function()
        if not Toggles.CreakAggressionMeter.Value or not CreakModel.Parent or not CreakHeadPart.Parent then
            CleanupCreakAggressionMeter(CreakModel)
            return
        end

        if not CreakAggressionCamera or not CreakAggressionCamera.Parent then
            CreakAggressionCamera = Workspace.CurrentCamera
            if not CreakAggressionCamera then return end
        end

        local CreakScreenPosition, CreakIsOnScreen = CreakAggressionCamera:WorldToViewportPoint(CreakHeadPart.Position + Vector3.new(0, 1.85, 0))
        if not (CreakIsOnScreen and CreakScreenPosition.Z > 0) then
            CreakMeterData.TitleText.Visible = false
            CreakMeterData.BarBackground.Visible = false
            CreakMeterData.BarFill.Visible = false
            return
        end

        CreakMeterData.TitleText.Position = Vector2.new(CreakScreenPosition.X, CreakScreenPosition.Y - 28)
        CreakMeterData.BarBackground.Position = Vector2.new(CreakScreenPosition.X - 56, CreakScreenPosition.Y - 6)
        CreakMeterData.BarFill.Position = CreakMeterData.BarBackground.Position

        local CreakAggressionValue = GetCreakAggressionValue(CreakModel)

        if not CreakAggressionValue then
            CreakMeterData.TitleText.Text = loadstring(base64decode("QWdncmVzc2lvbiAtLSU="))()
            CreakMeterData.TitleText.Color = Color3.fromRGB(200, 200, 200)
            CreakMeterData.BarFill.Size = Vector2.new(0, 6)
            CreakMeterData.TitleText.Visible = true
            CreakMeterData.BarBackground.Visible = true
            CreakMeterData.BarFill.Visible = false
            return
        end

        CreakMeterData.TitleText.Text = loadstring(base64decode("QWdncmVzc2lvbiA="))() .. math.floor(CreakAggressionValue * 100 + 0.5) .. loadstring(base64decode("JQ=="))()
        CreakMeterData.TitleText.Color = Color3.fromRGB(255, 255, 255)
        CreakMeterData.BarFill.Size = Vector2.new(112 * CreakAggressionValue, 6)
        CreakMeterData.BarFill.Color = Color3.fromRGB(70, 220, 100):Lerp(Color3.fromRGB(255, 55, 55), CreakAggressionValue)
        CreakMeterData.TitleText.Visible = true
        CreakMeterData.BarBackground.Visible = true
        CreakMeterData.BarFill.Visible = true
    end)

    CreakMeterData.DestroyConnection = CreakModel.Destroying:Connect(function()
        CleanupCreakAggressionMeter(CreakModel)
    end)
end

local function StartCreakAggressionListener()
    if CreakAggressionChildAddedConnection then return end

    local CreakLiveEntitiesFolder = Workspace:FindFirstChild(loadstring(base64decode("TGl2ZUVudGl0aWVz"))())
    if not CreakLiveEntitiesFolder then return end

    CreakAggressionChildAddedConnection = CreakLiveEntitiesFolder.ChildAdded:Connect(function(CreakNewChild)
        if CreakNewChild.Name == loadstring(base64decode("Q3JlYWs="))() then
            AddCreakAggressionMeter(CreakNewChild)
        end
    end)
end

local function StopCreakAggressionListener()
    if CreakAggressionChildAddedConnection then
        CreakAggressionChildAddedConnection:Disconnect()
        CreakAggressionChildAddedConnection = nil
    end
end

Toggles.CreakAggressionMeter:OnChanged(function(CreakToggleEnabled)
    if CreakToggleEnabled then
        for _, CreakEntityModel in ipairs(Objects.Entities or {}) do
            AddCreakAggressionMeter(CreakEntityModel)
        end

        local CreakLiveEntitiesFolder = Workspace:FindFirstChild(loadstring(base64decode("TGl2ZUVudGl0aWVz"))())
        local CreakExistingModel = CreakLiveEntitiesFolder and CreakLiveEntitiesFolder:FindFirstChild(loadstring(base64decode("Q3JlYWs="))())
        if CreakExistingModel then
            AddCreakAggressionMeter(CreakExistingModel)
        end

        StartCreakAggressionListener()
    else
        StopCreakAggressionListener()

        for CreakEntityModel in pairs(CreakAggressionMetersTable) do
            CleanupCreakAggressionMeter(CreakEntityModel)
        end
    end
end)

Toggles.KillAllWithCart:OnChanged(function(KillAllWithCartState)
	if not KillAllWithCartState then return end

	local KillAllWithCartIndex = 1

	task.spawn(function()
		while Toggles.KillAllWithCart.Value do
			local KillAllWithCartCarts = {}
			for _, KillAllWithCartModel in ipairs(workspace.Misc:GetChildren()) do
				if KillAllWithCartModel.Name == loadstring(base64decode("U2hvcHBpbmdDYXJ0"))() and KillAllWithCartModel:IsA(loadstring(base64decode("TW9kZWw="))()) then
					KillAllWithCartCarts[#KillAllWithCartCarts + 1] = KillAllWithCartModel
				end
			end

			local KillAllWithCartAlivePlayers = {}
			for _, KillAllWithCartPlayer in ipairs(game.Players:GetPlayers()) do
				if KillAllWithCartPlayer ~= game.Players.LocalPlayer and KillAllWithCartPlayer.Character then
					local KillAllWithCartHumanoid = KillAllWithCartPlayer.Character:FindFirstChildOfClass(loadstring(base64decode("SHVtYW5vaWQ="))())
					if KillAllWithCartHumanoid and KillAllWithCartHumanoid.Health > 0 then
						KillAllWithCartAlivePlayers[#KillAllWithCartAlivePlayers + 1] = KillAllWithCartPlayer
					end
				end
			end

			if #KillAllWithCartCarts > 0 and #KillAllWithCartAlivePlayers > 0 then
				if KillAllWithCartIndex > #KillAllWithCartAlivePlayers then
					KillAllWithCartIndex = 1
				end
				local KillAllWithCartTarget = KillAllWithCartAlivePlayers[KillAllWithCartIndex]
				local KillAllWithCartTargetCFrame = KillAllWithCartTarget.Character:GetPivot()
				for KillAllWithCartCartIndex = 1, #KillAllWithCartCarts do
					KillAllWithCartCarts[KillAllWithCartCartIndex]:PivotTo(KillAllWithCartTargetCFrame)
				end
				KillAllWithCartIndex = KillAllWithCartIndex + 1
			end
			task.wait(0.10)
		end
	end)
end)

Toggles.FlingCreak:OnChanged(function(FlingCreakState)
	if not FlingCreakState then return end

	task.spawn(function()
		while Toggles.FlingCreak.Value do
			local creak = workspace:FindFirstChild(loadstring(base64decode("TGl2ZUVudGl0aWVz"))()) and workspace.LiveEntities:FindFirstChild(loadstring(base64decode("Q3JlYWs="))())
			if creak then
				local targetCFrame = creak:GetPivot()
				for _, model in ipairs(workspace.Misc:GetChildren()) do
					if model.Name == loadstring(base64decode("U2hvcHBpbmdDYXJ0"))() and model:IsA(loadstring(base64decode("TW9kZWw="))()) then
						model:PivotTo(targetCFrame)
					end
				end
			end
			task.wait(0.10)
		end
	end)
end)




Groupboxes.Stairwell_Misc:AddDivider()


Groupboxes.Stairwell_Misc:AddToggle(loadstring(base64decode("RGlzYWJsZVN0YWlyd2VsbENydXNoZXJDb2xsaXNpb24="))(), {
	Text = loadstring(base64decode("RGlzYWJsZSBDcnVzaGVycw=="))(),
	Default = false,
})
Groupboxes.Stairwell_Misc:AddToggle(loadstring(base64decode("RGVsZXRlU3RhaXJ3ZWxsQ3J1c2hlckV4Y2VwdEJhc2ljV2FsbA=="))(), {
	Text = loadstring(base64decode("RGVsZXRlIENydXNoZXJz"))(),
	Default = false,
})
Groupboxes.Stairwell_Misc:AddToggle(loadstring(base64decode("TWVsZFJlbW92ZXI="))(), {
	Text = loadstring(base64decode("UmVtb3ZlIE1lbGQ="))(),
	Default = false,
})

Groupboxes.Stairwell_Misc:AddToggle(loadstring(base64decode("U3RhaXJ3ZWxsTGFuZGluZ1NwYW0="))(), {
	Text = loadstring(base64decode("VFAgdG8gdHJhc2ggYW5kIGRyb3AgdHJhc2gu"))(),
	Tooltip = loadstring(base64decode("Q29tYmluZSB3aXRoIG9yYml0LCBvciBicmluZyBhbGwgZHJvcHBlZCBpdGVtcy4="))(),
	Default = false,
})

Toggles.DisableStairwellCrusherCollision:OnChanged(function(DisableStairwellCrusherCollisionState)
	if not DisableStairwellCrusherCollisionState then return end

	task.spawn(function()
		while Toggles.DisableStairwellCrusherCollision.Value do
			for _, DisableStairwellCrusherRoom in ipairs(workspace.CurrentRooms:GetChildren()) do
				local DisableStairwellCrusherAssets = DisableStairwellCrusherRoom:FindFirstChild(loadstring(base64decode("QXNzZXRz"))())
				if DisableStairwellCrusherAssets then
					for _, DisableStairwellCrusherContainer in ipairs(DisableStairwellCrusherAssets:GetChildren()) do
						if DisableStairwellCrusherContainer.Name == loadstring(base64decode("U3RhaXJ3ZWxsQ3J1c2hlckNvbnRhaW5lcjE="))() then
							for _, DisableStairwellCrusherDescendant in ipairs(DisableStairwellCrusherContainer:GetDescendants()) do
								if DisableStairwellCrusherDescendant:IsA(loadstring(base64decode("QmFzZVBhcnQ="))()) and DisableStairwellCrusherDescendant.CanCollide then
									local DisableStairwellCrusherUnderBasicWall = false
									local DisableStairwellCrusherParent = DisableStairwellCrusherDescendant.Parent
									while DisableStairwellCrusherParent and DisableStairwellCrusherParent ~= DisableStairwellCrusherContainer do
										if DisableStairwellCrusherParent.Name == loadstring(base64decode("QmFzaWNXYWxs"))() then
											DisableStairwellCrusherUnderBasicWall = true
											break
										end
										DisableStairwellCrusherParent = DisableStairwellCrusherParent.Parent
									end
									if not DisableStairwellCrusherUnderBasicWall then
										DisableStairwellCrusherDescendant.CanCollide = false
									end
								end
							end
						end

						local DisableStairwellCrusher = DisableStairwellCrusherContainer:FindFirstChild(loadstring(base64decode("U3RhaXJ3ZWxsQ3J1c2hlcg=="))())
						if DisableStairwellCrusher then
							local DisableStairwellCrusherOuterTrigger = DisableStairwellCrusher:FindFirstChild(loadstring(base64decode("T3V0ZXJUcmlnZ2Vy"))())
							local DisableStairwellCrusherCoreTrigger = DisableStairwellCrusher:FindFirstChild(loadstring(base64decode("Q29yZVRyaWdnZXI="))())
							if DisableStairwellCrusherOuterTrigger then
								DisableStairwellCrusherOuterTrigger:Destroy()
							end
							if DisableStairwellCrusherCoreTrigger then
								DisableStairwellCrusherCoreTrigger:Destroy()
							end
						end
					end
				end
			end
			task.wait(0.5)
		end
	end)
end)
Toggles.DeleteStairwellCrusherExceptBasicWall:OnChanged(function(DeleteStairwellCrusherExceptBasicWallState)
	if not DeleteStairwellCrusherExceptBasicWallState then return end

	task.spawn(function()
		while Toggles.DeleteStairwellCrusherExceptBasicWall.Value do
			for _, DeleteStairwellCrusherRoom in ipairs(workspace.CurrentRooms:GetChildren()) do
				local DeleteStairwellCrusherAssets = DeleteStairwellCrusherRoom:FindFirstChild(loadstring(base64decode("QXNzZXRz"))())
				if DeleteStairwellCrusherAssets then
					for _, DeleteStairwellCrusherContainer in ipairs(DeleteStairwellCrusherAssets:GetChildren()) do
						if DeleteStairwellCrusherContainer.Name == loadstring(base64decode("U3RhaXJ3ZWxsQ3J1c2hlckNvbnRhaW5lcjE="))() then
							local DeleteStairwellCrusherToDestroy = {}
							for _, DeleteStairwellCrusherDescendant in ipairs(DeleteStairwellCrusherContainer:GetDescendants()) do
								local DeleteStairwellCrusherUnderBasicWall = false
								local DeleteStairwellCrusherParent = DeleteStairwellCrusherDescendant.Parent
								while DeleteStairwellCrusherParent and DeleteStairwellCrusherParent ~= DeleteStairwellCrusherContainer do
									if DeleteStairwellCrusherParent.Name == loadstring(base64decode("QmFzaWNXYWxs"))() then
										DeleteStairwellCrusherUnderBasicWall = true
										break
									end
									DeleteStairwellCrusherParent = DeleteStairwellCrusherParent.Parent
								end
								if not DeleteStairwellCrusherUnderBasicWall and DeleteStairwellCrusherDescendant.Name ~= loadstring(base64decode("QmFzaWNXYWxs"))() then
									DeleteStairwellCrusherToDestroy[#DeleteStairwellCrusherToDestroy + 1] = DeleteStairwellCrusherDescendant
								end
							end
							for _, DeleteStairwellCrusherInstance in ipairs(DeleteStairwellCrusherToDestroy) do
								if DeleteStairwellCrusherInstance and DeleteStairwellCrusherInstance.Parent then
									DeleteStairwellCrusherInstance:Destroy()
								end
							end
						end
					end
				end
			end
			task.wait(0.5)
		end
	end)
end)

Toggles.MeldRemover:OnChanged(function(State)
	if not State then return end
	task.spawn(function()
		while Toggles.MeldRemover.Value do
			for _, room in pairs(workspace.CurrentRooms:GetChildren()) do
				for _, folderName in ipairs({loadstring(base64decode("QXNzZXRz"))(), loadstring(base64decode("UGFydHM="))()}) do
					local folder = room:FindFirstChild(folderName)
					if folder then
						for _, child in ipairs(folder:GetChildren()) do
							if child.Name == loadstring(base64decode("TWVsZFdhbGw="))()
								or child.Name == loadstring(base64decode("Qm9sZWFoZ2h0aDI5dGRnZmh5MnRodXkyaHR1dTI1OXVoaDN1"))() -- no qeustions asked
							then
								child:Destroy()
							end
						end
					end
				end
				for _, name in ipairs({loadstring(base64decode("TWVsZERhdGE="))(), loadstring(base64decode("TWVsZFBhZHM="))(), loadstring(base64decode("TWVsZHZpZXc="))(), loadstring(base64decode("TWVsZA=="))()}) do
					local obj = room:FindFirstChild(name)
					if obj and obj:IsA(loadstring(base64decode("Rm9sZGVy"))()) then
						obj:Destroy()
					end
				end
			end
			task.wait(0.5)
		end
	end)
end)




local StairwellLandingToken = 0

Toggles.StairwellLandingSpam:OnChanged(function(Value)
	StairwellLandingToken += 1

	if not Value then
		return
	end

	local CurrentToken = StairwellLandingToken

	task.spawn(function()
		local CurrentRooms = workspace.CurrentRooms
		local LocalPlayer = Services.Players.LocalPlayer

		while Toggles.StairwellLandingSpam.Value and CurrentToken == StairwellLandingToken do
			local StairwellModels = {}

			for _, Room in ipairs(CurrentRooms:GetChildren()) do
				local StairwellLandingLogic = Room:FindFirstChild(loadstring(base64decode("U3RhaXJ3ZWxsTGFuZGluZ0xvZ2lj"))())

				if StairwellLandingLogic then
					for _, Model in ipairs(StairwellLandingLogic:GetChildren()) do
						if Model:IsA(loadstring(base64decode("TW9kZWw="))()) then
							local Prompts = {}

							for _, Object in ipairs(Model:GetDescendants()) do
								if Object:IsA(loadstring(base64decode("UHJveGltaXR5UHJvbXB0"))()) then
									Prompts[#Prompts + 1] = Object
								end
							end

							if #Prompts > 0 then
								StairwellModels[#StairwellModels + 1] = {
									Model = Model,
									Prompts = Prompts,
								}
							end
						end
					end
				end
			end

			table.sort(StairwellModels, function(First, Second)
				local FirstRoom = First.Model.Parent and First.Model.Parent.Parent
				local SecondRoom = Second.Model.Parent and Second.Model.Parent.Parent

				return (tonumber(FirstRoom and FirstRoom.Name) or math.huge) <
					(tonumber(SecondRoom and SecondRoom.Name) or math.huge)
			end)

			for _, Data in ipairs(StairwellModels) do
				if not Toggles.StairwellLandingSpam.Value or CurrentToken ~= StairwellLandingToken then
					break
				end

				local Model = Data.Model

				while Model.Parent
					and Model:IsDescendantOf(workspace)
					and Toggles.StairwellLandingSpam.Value
					and CurrentToken == StairwellLandingToken do

					local Character = LocalPlayer.Character
					local HumanoidRootPart = Character and Character:FindFirstChild(loadstring(base64decode("SHVtYW5vaWRSb290UGFydA=="))())

					if HumanoidRootPart then
						HumanoidRootPart.CFrame = Model:GetPivot() + Vector3.new(0, 5, 0)

						for Index = 1, #Data.Prompts do
							local Prompt = Data.Prompts[Index]

							if Prompt.Parent and Prompt.Enabled and fireproximityprompt then
								fireproximityprompt(Prompt)
							end
						end

						if keypress and keyrelease then
							keypress(0x58)
							task.wait(0.03)
							keyrelease(0x58)
						elseif IRT
							and IRT.Environment
							and IRT.Environment.keypress
							and IRT.Environment.keyrelease then

							IRT.Environment.keypress(0x58)
							task.wait(0.03)
							IRT.Environment.keyrelease(0x58)
						end
					end

					Services.RunService.Heartbeat:Wait()
				end
			end

			Services.RunService.Heartbeat:Wait()
		end
	end)
end)


Groupboxes.Stairwell_Misc:AddDivider()

Groupboxes.Stairwell_Misc:AddButton(loadstring(base64decode("VFAgU2hvcHBpbmcgQ2FydHMgVG8gUGxheWVy"))(), function()
	local ShoppingCartTargetName = Options.ShoppingCartTarget.Value
	local ShoppingCartTargetPlayer = game.Players:FindFirstChild(ShoppingCartTargetName)
	if not ShoppingCartTargetPlayer or not ShoppingCartTargetPlayer.Character then return end
	local ShoppingCartTargetCFrame = ShoppingCartTargetPlayer.Character:GetPivot()
	for _, ShoppingCartModel in ipairs(workspace.Misc:GetChildren()) do
		if ShoppingCartModel.Name == loadstring(base64decode("U2hvcHBpbmdDYXJ0"))() and ShoppingCartModel:IsA(loadstring(base64decode("TW9kZWw="))()) then
			ShoppingCartModel:PivotTo(ShoppingCartTargetCFrame)
		end
	end
end)

Groupboxes.Stairwell_Misc:AddDropdown(loadstring(base64decode("U2hvcHBpbmdDYXJ0VGFyZ2V0"))(), {
	Text = loadstring(base64decode("U2hvcHBpbmcgQ2FydCBUYXJnZXQ="))(),
	Values = (function()
		local ShoppingCartPlayerNames = {}
		for _, ShoppingCartPlayer in ipairs(game.Players:GetPlayers()) do
			ShoppingCartPlayerNames[#ShoppingCartPlayerNames + 1] = ShoppingCartPlayer.Name
		end
		return ShoppingCartPlayerNames
	end)(),
	Default = game.Players.LocalPlayer.Name,
})

Groupboxes.Stairwell_Misc:AddButton(loadstring(base64decode("UmVmcmVzaCBQbGF5ZXJz"))(), function()
	local ShoppingCartPlayerNames = {}
	for _, ShoppingCartPlayer in ipairs(game.Players:GetPlayers()) do
		ShoppingCartPlayerNames[#ShoppingCartPlayerNames + 1] = ShoppingCartPlayer.Name
	end
	Options.ShoppingCartTarget:SetValues(ShoppingCartPlayerNames)
end)

Groupboxes.Stairwell_Experimental = Tabs.Floors:AddRightGroupbox(loadstring(base64decode("U3RhaXJ3ZWxsIC0gRXhwZXJpbWVudGFs"))())


local function TPDropsToNearestGrinder()
    local TPDropsToNearestGrinderDropsFolder =
        workspace:FindFirstChild(loadstring(base64decode("RHJvcHM="))())

    local TPDropsToNearestGrinderRootPart =
        Character and Character:FindFirstChild(loadstring(base64decode("SHVtYW5vaWRSb290UGFydA=="))())

    if not TPDropsToNearestGrinderDropsFolder
        or not TPDropsToNearestGrinderRootPart
        or not CurrentRooms then
        return
    end

    local TPDropsToNearestGrinderPlayerPosition =
        TPDropsToNearestGrinderRootPart.Position

    local TPDropsToNearestGrinderNearestGrinder = nil
    local TPDropsToNearestGrinderNearestDistance = math.huge

    for _, TPDropsToNearestGrinderRoom in
        ipairs(CurrentRooms:GetChildren()) do

        local TPDropsToNearestGrinderScrapper =
            TPDropsToNearestGrinderRoom:FindFirstChild(
                loadstring(base64decode("U3RhaXJ3ZWxsU2NyYXBwZXI="))(),
                true
            )

        if TPDropsToNearestGrinderScrapper then
            for _, TPDropsToNearestGrinderObject in
                ipairs(TPDropsToNearestGrinderScrapper:GetDescendants()) do

                if TPDropsToNearestGrinderObject.Name == loadstring(base64decode("R3JpbmRlcjE="))()
                    and (
                        TPDropsToNearestGrinderObject:IsA(loadstring(base64decode("TW9kZWw="))())
                        or TPDropsToNearestGrinderObject:IsA(loadstring(base64decode("QmFzZVBhcnQ="))())
                    ) then

                    local TPDropsToNearestGrinderPosition =
                        TPDropsToNearestGrinderObject:GetPivot().Position

                    local TPDropsToNearestGrinderDistance =
                        (
                            TPDropsToNearestGrinderPlayerPosition
                            - TPDropsToNearestGrinderPosition
                        ).Magnitude

                    if TPDropsToNearestGrinderDistance
                        < TPDropsToNearestGrinderNearestDistance then

                        TPDropsToNearestGrinderNearestDistance =
                            TPDropsToNearestGrinderDistance

                        TPDropsToNearestGrinderNearestGrinder =
                            TPDropsToNearestGrinderObject
                    end
                end
            end
        end
    end

    if not TPDropsToNearestGrinderNearestGrinder then
        return
    end

    local TPDropsToNearestGrinderCFrame =
        TPDropsToNearestGrinderNearestGrinder:GetPivot()

    for _, TPDropsToNearestGrinderDropItem in
        ipairs(TPDropsToNearestGrinderDropsFolder:GetChildren()) do

        if TPDropsToNearestGrinderDropItem:IsA(loadstring(base64decode("TW9kZWw="))())
            or TPDropsToNearestGrinderDropItem:IsA(loadstring(base64decode("QmFzZVBhcnQ="))()) then

            TPDropsToNearestGrinderDropItem:PivotTo(
                TPDropsToNearestGrinderCFrame
            )
        end
    end
end

Groupboxes.Stairwell_Experimental:AddButton({
    Text = loadstring(base64decode("VFAgQWxsIERyb3BzIHRvIE5lYXJlc3QgR3JpbmRlcg=="))(),
    Func = TPDropsToNearestGrinder,
    DoubleClick = false,
    Tooltip = loadstring(base64decode("VGVsZXBvcnRzIGV2ZXJ5IGRyb3BwZWQgaXRlbSB0byB0aGUgZ3JpbmRlciBjbG9zZXN0IHRvIHlvdQ=="))(),
})

local function BringDroppedItems()
	local workspaceDropsFolder = workspace:FindFirstChild(loadstring(base64decode("RHJvcHM="))())
	if LocalPlayer and LocalPlayer.Character then
		local playerHumanoidRootPart = LocalPlayer.Character:FindFirstChild(loadstring(base64decode("SHVtYW5vaWRSb290UGFydA=="))())
		if playerHumanoidRootPart and workspaceDropsFolder then
			for _, itemToBring in ipairs(workspaceDropsFolder:GetChildren()) do
				if itemToBring:IsA(loadstring(base64decode("TW9kZWw="))()) then
					itemToBring:PivotTo(playerHumanoidRootPart.CFrame)
				elseif itemToBring:IsA(loadstring(base64decode("QmFzZVBhcnQ="))()) then
					itemToBring.CFrame = playerHumanoidRootPart.CFrame
				end
			end
		end
	end
end

Groupboxes.Stairwell_Experimental:AddButton({
	Text = loadstring(base64decode("QnJpbmcgRHJvcHBlZCBJdGVtcw=="))(),
	Func = function() BringDroppedItems() end,
	DoubleClick = false,
	Tooltip = loadstring(base64decode("QnJpbmdzIGFsbCBkcm9wcGVkIGl0ZW1zLg=="))()
})

Groupboxes.Stairwell_Experimental:AddToggle(loadstring(base64decode("RW5hYmxlRHJvcHBlZEl0ZW1zSW50ZXJ2YWw="))(), {
	Text = loadstring(base64decode("RW5hYmxlIEludGVydmFs"))(),
	Default = false,
	Tooltip = loadstring(base64decode("QXV0b21hdGljYWxseSBicmluZ3MgZHJvcHBlZCBpdGVtcyBhdCB0aGUgc2VsZWN0ZWQgaW50ZXJ2YWwu"))()
})

Groupboxes.Stairwell_Experimental:AddSlider(loadstring(base64decode("RHJvcHBlZEl0ZW1zSW50ZXJ2YWw="))(), {
	Text = loadstring(base64decode("SW50ZXJ2YWw="))(),
	Default = 1,
	Min = 0,
	Max = 60,
	Rounding = 1,
	Compact = false,
	Tooltip = loadstring(base64decode("SG93IG9mdGVuIGRyb3BwZWQgaXRlbXMgYXJlIGJyb3VnaHQu"))()
})

Toggles.EnableDroppedItemsInterval:OnChanged(function(enabled)
	if enabled then
		if droppedItemsIntervalRunning then return end
		droppedItemsIntervalRunning = true
		task.spawn(function()
			while Toggles.EnableDroppedItemsInterval.Value do
				BringDroppedItems()
				local interval = Options.DroppedItemsInterval.Value
				if interval <= 0 then
					task.wait()
				else
					task.wait(interval)
				end
			end
			droppedItemsIntervalRunning = false
		end)
	end
end)

Groupboxes.Stairwell_Experimental:AddDivider()

Groupboxes.Stairwell_Experimental:AddToggle(loadstring(base64decode("T3JiaXREcm9wcGVkSXRlbXM="))(), {
	Text = loadstring(base64decode("T3JiaXQgRHJvcHBlZCBJdGVtcw=="))(),
	Default = false,
	Tooltip = loadstring(base64decode("T3JiaXRzIGRyb3BwZWQgaXRlbXMgYXJvdW5kIHlvdS4gVGVsZXBvcnRzIHRoZW0gdG8geW91IGV2ZXJ5IDEwcyB0byBwcmV2ZW50IGRlc3Bhd24u"))()
})

Groupboxes.Stairwell_Experimental:AddSlider(loadstring(base64decode("T3JiaXREcm9wcGVkSXRlbXNIZWlnaHQ="))(), {
	Text = loadstring(base64decode("SGVpZ2h0"))(),
	Default = 2,
	Min = -20,
	Max = 20,
	Rounding = 1,
	Compact = false,
	Tooltip = loadstring(base64decode("VGhlIGhlaWdodCBvZiB0aGUgb3JiaXQu"))()
})

Groupboxes.Stairwell_Experimental:AddSlider(loadstring(base64decode("T3JiaXREcm9wcGVkSXRlbXNEaXN0YW5jZQ=="))(), {
	Text = loadstring(base64decode("RGlzdGFuY2U="))(),
	Default = 5,
	Min = 0,
	Max = 50,
	Rounding = 1,
	Compact = false,
	Tooltip = loadstring(base64decode("VGhlIGRpc3RhbmNlIG9mIHRoZSBvcmJpdC4="))()
})

Groupboxes.Stairwell_Experimental:AddSlider(loadstring(base64decode("T3JiaXREcm9wcGVkSXRlbXNTcGVlZA=="))(), {
	Text = loadstring(base64decode("U3BlZWQ="))(),
	Default = 2,
	Min = 0,
	Max = 20,
	Rounding = 1,
	Compact = false,
	Tooltip = loadstring(base64decode("VGhlIHNwZWVkIG9mIHRoZSBvcmJpdC4="))()
})

Toggles.OrbitDroppedItems:OnChanged(function(OrbitDroppedItemsEnabled)
	if OrbitDroppedItemsConnection then
		OrbitDroppedItemsConnection:Disconnect()
		OrbitDroppedItemsConnection = nil
	end
	if not OrbitDroppedItemsEnabled then return end
	OrbitDroppedItemsAngle = 0
	OrbitDroppedItemsLastTeleport = tick()
	OrbitDroppedItemsPauseUntil = 0
	OrbitDroppedItemsConnection = RunService.Heartbeat:Connect(function(OrbitDroppedItemsDeltaTime)
		if not LocalPlayer or not LocalPlayer.Character then return end
		local OrbitDroppedItemsHumanoidRootPart = LocalPlayer.Character:FindFirstChild(loadstring(base64decode("SHVtYW5vaWRSb290UGFydA=="))())
		local OrbitDroppedItemsDropsFolder = workspace:FindFirstChild(loadstring(base64decode("RHJvcHM="))())
		if not OrbitDroppedItemsHumanoidRootPart or not OrbitDroppedItemsDropsFolder then return end
		local OrbitDroppedItemsHeightValue = Options.OrbitDroppedItemsHeight.Value
		local OrbitDroppedItemsDistanceValue = Options.OrbitDroppedItemsDistance.Value
		local OrbitDroppedItemsSpeedValue = Options.OrbitDroppedItemsSpeed.Value
		local OrbitDroppedItemsCurrentTime = tick()
		local OrbitDroppedItemsList = {}
		for _, OrbitDroppedItemsObject in ipairs(OrbitDroppedItemsDropsFolder:GetChildren()) do
			if OrbitDroppedItemsObject:IsA(loadstring(base64decode("TW9kZWw="))()) or OrbitDroppedItemsObject:IsA(loadstring(base64decode("QmFzZVBhcnQ="))()) then
				OrbitDroppedItemsList[#OrbitDroppedItemsList + 1] = OrbitDroppedItemsObject
			end
		end
		local OrbitDroppedItemsCount = #OrbitDroppedItemsList
		if OrbitDroppedItemsCount == 0 then return end
		if OrbitDroppedItemsCurrentTime - OrbitDroppedItemsLastTeleport >= 10 then
			OrbitDroppedItemsLastTeleport = OrbitDroppedItemsCurrentTime
			OrbitDroppedItemsPauseUntil = OrbitDroppedItemsCurrentTime + 2
			local OrbitDroppedItemsCenterPosition = OrbitDroppedItemsHumanoidRootPart.Position
			for _, OrbitDroppedItemsObject in ipairs(OrbitDroppedItemsList) do
				if OrbitDroppedItemsObject:IsA(loadstring(base64decode("TW9kZWw="))()) then
					OrbitDroppedItemsObject:PivotTo(CFrame.new(OrbitDroppedItemsCenterPosition))
				else
					OrbitDroppedItemsObject.CFrame = CFrame.new(OrbitDroppedItemsCenterPosition)
				end
			end
		end
		if OrbitDroppedItemsCurrentTime < OrbitDroppedItemsPauseUntil then return end
		OrbitDroppedItemsAngle += OrbitDroppedItemsDeltaTime * OrbitDroppedItemsSpeedValue
		for OrbitDroppedItemsIndex, OrbitDroppedItemsObject in ipairs(OrbitDroppedItemsList) do
			local OrbitDroppedItemsObjectAngle = OrbitDroppedItemsAngle + ((OrbitDroppedItemsIndex - 1) / OrbitDroppedItemsCount) * math.pi * 2
			local OrbitDroppedItemsOffset = Vector3.new(
				math.cos(OrbitDroppedItemsObjectAngle) * OrbitDroppedItemsDistanceValue,
				OrbitDroppedItemsHeightValue,
				math.sin(OrbitDroppedItemsObjectAngle) * OrbitDroppedItemsDistanceValue
			)
			local OrbitDroppedItemsPosition = OrbitDroppedItemsHumanoidRootPart.Position + OrbitDroppedItemsOffset
			if OrbitDroppedItemsObject:IsA(loadstring(base64decode("TW9kZWw="))()) then
				OrbitDroppedItemsObject:PivotTo(CFrame.new(OrbitDroppedItemsPosition))
			else
				OrbitDroppedItemsObject.CFrame = CFrame.new(OrbitDroppedItemsPosition)
			end
		end
	end)
end)


Toggles.BypassNoise:OnChanged(function(value)
	for i = #Connections, 1, -1 do
		local existingConnection = Connections[i]
		if existingConnection and existingConnection.Disconnect then
			existingConnection:Disconnect()
		end
		table.remove(Connections, i)
	end

	if not value then return end

	local function checkBypassNoiseTvStand(targetTvStand)
		if not targetTvStand:IsA(loadstring(base64decode("TW9kZWw="))()) then return end
		if targetTvStand.Name ~= loadstring(base64decode("VFZfU3RhbmQ="))() then return end

		local tvStandCurrentCFrame = targetTvStand:GetPivot()

		if tvStandCurrentCFrame.Position.Y > -119 then
			targetTvStand:PivotTo(CFrame.new(
				tvStandCurrentCFrame.Position.X,
				-120,
				tvStandCurrentCFrame.Position.Z
			))
		end
	end

	local bypassNoiseMiscFolder = workspace:FindFirstChild(loadstring(base64decode("TWlzYw=="))())
	if not bypassNoiseMiscFolder then return end

	local bypassNoiseMiscChildAddedConnection = bypassNoiseMiscFolder.ChildAdded:Connect(function(bypassNoiseNewChild)
		checkBypassNoiseTvStand(bypassNoiseNewChild)
	end)

	Connections[#Connections + 1] = bypassNoiseMiscChildAddedConnection

	for _, bypassNoiseMiscChild in ipairs(bypassNoiseMiscFolder:GetChildren()) do
		checkBypassNoiseTvStand(bypassNoiseMiscChild)
	end
end)

Toggles.DroppedItemValue:OnChanged(function(DroppedItemValue)
	local DroppedItemValueScreenGui = game:GetService(loadstring(base64decode("Q29yZUd1aQ=="))()):FindFirstChild(loadstring(base64decode("RHJvcHNDb2luQ291bnRlcg=="))())
	if not DroppedItemValue then
		if DroppedItemValueScreenGui then DroppedItemValueScreenGui:Destroy() end
		return
	end
	local DroppedItemValueWorkspaceDrops = workspace:WaitForChild(loadstring(base64decode("RHJvcHM="))())
	if DroppedItemValueScreenGui then DroppedItemValueScreenGui:Destroy() end
	DroppedItemValueScreenGui = Instance.new(loadstring(base64decode("U2NyZWVuR3Vp"))())
	DroppedItemValueScreenGui.Name = loadstring(base64decode("RHJvcHNDb2luQ291bnRlcg=="))()
	DroppedItemValueScreenGui.ResetOnSpawn = false
	DroppedItemValueScreenGui.Parent = game:GetService(loadstring(base64decode("Q29yZUd1aQ=="))())
	local DroppedItemValueCoinText = Instance.new(loadstring(base64decode("VGV4dExhYmVs"))())
	DroppedItemValueCoinText.Name = loadstring(base64decode("Q29pblRleHQ="))()
	DroppedItemValueCoinText.AnchorPoint = Vector2.new(0.5, 0)
	DroppedItemValueCoinText.Position = UDim2.new(0.5, 0, 0.02, 0)
	DroppedItemValueCoinText.Size = UDim2.new(0, 250, 0, 40)
	DroppedItemValueCoinText.BackgroundTransparency = 1
	DroppedItemValueCoinText.Text = loadstring(base64decode("SXRlbXM6IDA="))()
	DroppedItemValueCoinText.TextSize = 24
	DroppedItemValueCoinText.Font = Enum.Font.GothamBold
	DroppedItemValueCoinText.TextColor3 = Color3.fromRGB(255, 255, 255)
	DroppedItemValueCoinText.TextStrokeTransparency = 0.5
	DroppedItemValueCoinText.Parent = DroppedItemValueScreenGui
	local DroppedItemValueCountedDrops = {}
	task.spawn(function()
		while Toggles.DroppedItemValue.Value do
			for _, DroppedItemValueDrop in ipairs(DroppedItemValueWorkspaceDrops:GetChildren()) do
				if DroppedItemValueDrop:IsA(loadstring(base64decode("TW9kZWw="))()) and not DroppedItemValueCountedDrops[DroppedItemValueDrop] then
					DroppedItemValueDrop:SetAttribute(loadstring(base64decode("Q29pbnNDaGVja2Vk"))(), true)
					DroppedItemValueCountedDrops[DroppedItemValueDrop] = true
				end
			end
			for DroppedItemValueDrop in pairs(DroppedItemValueCountedDrops) do
				if not DroppedItemValueDrop.Parent or DroppedItemValueDrop.Parent ~= DroppedItemValueWorkspaceDrops then
					DroppedItemValueCountedDrops[DroppedItemValueDrop] = nil
				end
			end
			local DroppedItemValueTotalItems = 0
			for DroppedItemValueDrop in pairs(DroppedItemValueCountedDrops) do
				if DroppedItemValueDrop.Parent == DroppedItemValueWorkspaceDrops then
					DroppedItemValueTotalItems += 1
				end
			end
			DroppedItemValueCoinText.Text = loadstring(base64decode("SXRlbXM6IA=="))() .. DroppedItemValueTotalItems
			task.wait(1)
		end
		if DroppedItemValueScreenGui and DroppedItemValueScreenGui.Parent then
			DroppedItemValueScreenGui:Destroy()
		end
	end)
end)

-- hi

Groupboxes.Exploits_BypassRight = Tabs.Exploits:AddRightGroupbox(loadstring(base64decode("QnlwYXNz"))())
Groupboxes.Exploits_BypassRight:AddToggle(loadstring(base64decode("RGlzYWJsZUFudGljaGVhdA=="))(), {
	Text = loadstring(base64decode("QW50aWNoZWF0IEJ5cGFzcw=="))(), Default = false,
	Tooltip = loadstring(base64decode("Q29tcGxldGVseSBkaXNhYmxlcyB0aGUgYW50aWNoZWF0LCBhZnRlciBpbnRlcmFjdGluZyB3aXRoIGEgbGFkZGVyLg=="))()
})
Groupboxes.Exploits_BypassRight:AddToggle(loadstring(base64decode("VmVsb2NpdHlNYW5pcHVsYXRpb25Ub2dnbGU="))(), {
	Text = loadstring(base64decode("VmVsb2NpdHkgTWFuaXB1bGF0aW9u"))(), Default = false,
	Tooltip = loadstring(base64decode("TW92ZXMgeW91ciBjaGFyYWN0ZXIgZm9yd2FyZCBzbG93bHksIG1pdGlnYXRpbmcgdGhlIGdhbWUncyBhbnRpLW5vY2xpcC4="))()
})
Toggles.DisableAnticheat:OnChanged(function(Value)
	if Globals.AnticheatDisabled == true and not Value then
		RemotesFolder.ClimbLadder:FireServer()
		Globals.AnticheatDisabled = false
	end
end)
Toggles.VelocityManipulationToggle:AddKeyPicker(loadstring(base64decode("VmVsb2NpdHlNYW5pcHVsYXRpb25LZXliaW5k"))(), {
	Text = loadstring(base64decode("VmVsb2NpdHkgTWFuaXB1bGF0aW9u"))(), Default = loadstring(base64decode("Vg=="))(),
	Mode = Library.IsMobile and loadstring(base64decode("VG9nZ2xl"))() or loadstring(base64decode("SG9sZA=="))(), SyncToggleState = true
})
Groupboxes.Exploits_BypassRight:AddDropdown(loadstring(base64decode("VmVsb2NpdHlNYW5pcHVsYXRpb25Nb2Rl"))(), {
	Values = {loadstring(base64decode("VmVsb2NpdHk="))(), loadstring(base64decode("UGl2b3Q="))()}, Text = loadstring(base64decode("TWFuaXB1bGF0aW9uIE1ldGhvZA=="))(),
	Default = 1,
})

Groupboxes.Exploits_BypassRight:AddDivider()
Groupboxes.Exploits_BypassRight:AddToggle(loadstring(base64decode("SW5maW5pdGVJdGVtc1RvZ2dsZQ=="))(), {
	Text = loadstring(base64decode("SW5maW5pdGUgSXRlbXM="))(), Default = false,
	Tooltip = loadstring(base64decode("QWxsb3dzIGNlcnRhaW4gaXRlbXMgdG8gYmUgdXNlZCB3aXRob3V0IGRyYWluaW5nIHRoZWlyIHVzZXMu"))(),
	Disabled = not Functions.CheckCompatability({loadstring(base64decode("ZmlyZXByb3hpbWl0eXByb21wdA=="))()}),
	DisabledTooltip = Globals.IncompatibleMessage
})
Groupboxes.Exploits_BypassRight:AddDropdown(loadstring(base64decode("SW5maW5pdGVJdGVtc0xpc3Q="))(), {
	Text = loadstring(base64decode("SXRlbSBMaXN0"))(),
	Values = { loadstring(base64decode("TG9ja3BpY2tz"))(), loadstring(base64decode("U2tlbGV0b24gS2V5"))(), loadstring(base64decode("U2hlYXJz"))(), loadstring(base64decode("TXVsdGl0b29s"))() },
	Multi = true, AllowNull = true,
	Disabled = not Functions.CheckCompatability({loadstring(base64decode("ZmlyZXByb3hpbWl0eXByb21wdA=="))()}),
	DisabledTooltip = Globals.IncompatibleMessage
})

Groupboxes.Exploits_BypassRight:AddToggle(loadstring(base64decode("SW5mQ3J1Y2lmaXg="))(), {
	Text = loadstring(base64decode("SW5maW5pdGUgQ3J1Y2lmaXg="))(),
	Default = false,
	Tooltip = loadstring(base64decode("Umlza3khIFlvdSBjYW4gZGllIG9yIGxvc2UgdGhlIENydWNpZml4LiBSZWNvbW1lbmRlZCB0byBoYXZlIGxvdyBwaW5nIGFuZCBzdGFibGUgZnBzLg=="))(),
	Risky = Floor ~= loadstring(base64decode("QmFsbHo="))(),
})


local InfCrucifixDropTable = {
	RushMoving   = 54,
	AmbushMoving = 67,
	A60          = 70,
	GlitchRush   = 120,
	GlitchAmbush = 155,
	A120         = 75,

}



Toggles.InfCrucifix:OnChanged(function(Value)
	print(loadstring(base64decode("aSBhbGxpdmU="))())
	local InfCrucifixRaycastParams = RaycastParams.new()
	InfCrucifixRaycastParams.FilterType = Enum.RaycastFilterType.Blacklist

	local InfCrucifixConnection
	InfCrucifixConnection = RunService.RenderStepped:Connect(function()
		if not Toggles.InfCrucifix.Value then
			if InfCrucifixConnection then
				InfCrucifixConnection:Disconnect()
			end
			return
		end

		local InfCrucifixCharacter = game.Players.LocalPlayer
		if not InfCrucifixCharacter then
			return
		end

		local InfCrucifixCollision = InfCrucifixCharacter:FindFirstChild(loadstring(base64decode("Q29sbGlzaW9uUGFydA=="))())
		if not InfCrucifixCollision then
			return
		end

		InfCrucifixRaycastParams.FilterDescendantsInstances = {InfCrucifixCharacter}

		for _, InfCrucifixEntity in ipairs(Workspace:GetChildren()) do
			local InfCrucifixMaxDistance = InfCrucifixDropTable[InfCrucifixEntity.Name]
			if not InfCrucifixMaxDistance or not InfCrucifixEntity.PrimaryPart then
				continue
			end

			InfCrucifixEntity.PrimaryPart.CanCollide = true
			InfCrucifixEntity.PrimaryPart.CanQuery = true

			local InfCrucifixOrigin = InfCrucifixCollision.Position
			local InfCrucifixDirection = InfCrucifixEntity.PrimaryPart.Position - InfCrucifixOrigin
			local InfCrucifixRayResult = Workspace:Raycast(InfCrucifixOrigin, InfCrucifixDirection, InfCrucifixRaycastParams)

			if not InfCrucifixRayResult or not InfCrucifixRayResult.Instance:IsDescendantOf(InfCrucifixEntity) then
				continue
			end

			local InfCrucifixDistance = (InfCrucifixCollision.Position - InfCrucifixEntity.PrimaryPart.Position).Magnitude
			if InfCrucifixDistance >= InfCrucifixMaxDistance then
				continue
			end

			local InfCrucifixTool = InfCrucifixCharacter:FindFirstChildOfClass(loadstring(base64decode("VG9vbA=="))())
			if not InfCrucifixTool or InfCrucifixTool.Name ~= loadstring(base64decode("Q3J1Y2lmaXg="))() then
				continue
			end

			task.spawn(function()
				ReplicatedStorage.RemotesFolder.DropItem:FireServer(InfCrucifixTool)
				task.wait(0.54)
				print(loadstring(base64decode("aGk="))())
				local InfCrucifixDrops = Workspace:FindFirstChild(loadstring(base64decode("RHJvcHM="))())
				if not InfCrucifixDrops then
					return
				end

				local InfCrucifixDropped = InfCrucifixDrops:FindFirstChild(loadstring(base64decode("Q3J1Y2lmaXg="))())
				if not InfCrucifixDropped then
					return
				end

				local InfCrucifixPrompt = InfCrucifixDropped:FindFirstChildOfClass(loadstring(base64decode("UHJveGltaXR5UHJvbXB0"))())
				if InfCrucifixPrompt then
					fireproximityprompt(InfCrucifixPrompt)
				end
			end)
			print (loadstring(base64decode("aGk="))())
			task.wait(0.6)
		end
	end)
end)


Groupboxes.Exploits_BypassRight:AddDivider()
Groupboxes.Exploits_BypassRight:AddToggle(loadstring(base64decode("UG9zaXRpb25TcG9vZg=="))(), {
	Text = loadstring(base64decode("R29kIE1vZGU="))(), Default = false,
	Tooltip = loadstring(base64decode("TWFrZXMgeW91ciBjaGFyYWN0ZXIgYXBwZWFyIHVuZGVyZ3JvdW5kIG9uIHRoZSBzZXJ2ZXIsIHByb3RlY3RpbmcgeW91IGZyb20gcnVzaC1saWtlIGVudGl0aWVzLg=="))()
})
Groupboxes.Exploits_BypassRight:AddToggle(loadstring(base64decode("Q3JvdWNoU3Bvb2Y="))(), {
	Text = loadstring(base64decode("Q3JvdWNoIFNwb29m"))(), Default = false, Tooltip = loadstring(base64decode("TWFrZXMgdGhlIGdhbWUgdGhpbmsgeW91IGFyZSBhbHdheXMgY3JvdWNoaW5nLg=="))()
})
Toggles.PositionSpoof:OnChanged(function(Value)
	if Floor ~= loadstring(base64decode("Rm9vbHM="))() and Floor ~= loadstring(base64decode("T2xkSG90ZWw="))() then
		if Value then
			RootPart.CFrame = RootPart.CFrame * CFrame.new(0, -2.346, 0)
			Humanoid.HipHeight = 0.05
			RemotesFolder.Crouch:FireServer(true, true)
		else
			RootPart.CFrame = RootPart.CFrame * CFrame.new(0, 2.346, 0)
			Humanoid.HipHeight = 2.396
		end
	end
end)
Toggles.PositionSpoof:AddKeyPicker(loadstring(base64decode("UG9zaXRpb25TcG9vZg=="))(), {
	Text = loadstring(base64decode("R29kIE1vZGU="))(), Default = loadstring(base64decode("Qg=="))(), Mode = loadstring(base64decode("VG9nZ2xl"))(), SyncToggleState = true
})
Toggles.CrouchSpoof:OnChanged(function(Value)
	if RemotesFolder:FindFirstChild(loadstring(base64decode("Q3JvdWNo"))()) then
		RemotesFolder.Crouch:FireServer(Value and true or Functions.IsCrouching(), true)
	end
end)

Groupboxes.Exploits_Remove = Tabs.Exploits:AddRightGroupbox(loadstring(base64decode("UmVtb3Zl"))())
Groupboxes.Exploits_Remove:AddToggle(loadstring(base64decode("UmVtb3ZlU2NyZWVjaA=="))(), { Text = loadstring(base64decode("UmVtb3ZlIFNjcmVlY2g="))(),  Default = false, Tooltip = loadstring(base64decode("UHJldmVudHMgJ1NjcmVlY2gnIGZyb20gc3Bhd25pbmcu"))() })
Groupboxes.Exploits_Remove:AddToggle(loadstring(base64decode("UmVtb3ZlSGFsdA=="))(),    { Text = loadstring(base64decode("UmVtb3ZlIEhhbHQ="))(),     Default = false, Tooltip = loadstring(base64decode("UHJldmVudHMgJ0hhbHQnIGZyb20gc3Bhd25pbmcu"))() })
Groupboxes.Exploits_Remove:AddToggle(loadstring(base64decode("UmVtb3ZlQTkw"))(),     { Text = loadstring(base64decode("UmVtb3ZlIEEtOTA="))(),     Default = false, Tooltip = loadstring(base64decode("UHJldmVudHMgJ0EtOTAnIGZyb20gc3Bhd25pbmcu"))() })
Groupboxes.Exploits_Remove:AddToggle(loadstring(base64decode("UmVtb3ZlRHJlYWQ="))(),   { Text = loadstring(base64decode("UmVtb3ZlIERyZWFk"))(),    Default = false, Tooltip = loadstring(base64decode("UHJldmVudHMgJ0RyZWFkJyBmcm9tIHNwYXduaW5nLg=="))() })
Groupboxes.Exploits_Remove:AddToggle(loadstring(base64decode("UmVtb3ZlU3VyZ2U="))(), { Text = loadstring(base64decode("UmVtb3ZlIFN1cmdl"))(), Default = false, Tooltip = loadstring(base64decode("UHJldmVudHMgJ1N1cmdlJyBmcm9tIHNwYXduaW5nLg=="))()})
Groupboxes.Exploits_Remove:AddDivider()
Groupboxes.Exploits_Remove:AddToggle(loadstring(base64decode("Tm9TY3JlZWNoRGFtYWdl"))(), { Text = loadstring(base64decode("Tm8gU2NyZWVjaCBEYW1hZ2U="))(), Default = false, Tooltip = loadstring(base64decode("UHJldmVudHMgJ1NjcmVlY2gnIGZyb20gaHVydGluZyB5b3Uu"))() })
Groupboxes.Exploits_Remove:AddToggle(loadstring(base64decode("Tm9IYWx0RGFtYWdl"))(),    { Text = loadstring(base64decode("Tm8gSGFsdCBEYW1hZ2U="))(),    Default = false, Tooltip = loadstring(base64decode("UHJldmVudHMgJ0hhbHQnIGZyb20gaHVydGluZyB5b3Uu"))() })
Groupboxes.Exploits_Remove:AddToggle(loadstring(base64decode("Tm9BOTBEYW1hZ2U="))(),     { Text = loadstring(base64decode("Tm8gQS05MCBEYW1hZ2U="))(),    Default = false, Tooltip = loadstring(base64decode("UHJldmVudHMgJ0EtOTAnIGZyb20gaHVydGluZyB5b3Uu"))() })
Groupboxes.Exploits_Remove:AddToggle(loadstring(base64decode("Tm9TdXJnZURhbWFnZQ=="))(),   { Text = loadstring(base64decode("Tm8gU3VyZ2UgRGFtYWdl"))(),   Default = false, Tooltip = loadstring(base64decode("UHJldmVudHMgJ1N1cmdlJyBmcm9tIGh1cnRpbmcgeW91Lg=="))() })

Toggles.NoScreechDamage:OnChanged(function(Value)
	if Value then
		FakeEvents.Screech.Parent = RemotesFolder
		FakeEvents.Screech_Real.Parent = nil
	else
		FakeEvents.Screech_Real.Parent = RemotesFolder
		FakeEvents.Screech.Parent = nil
	end
end)
Toggles.NoHaltDamage:OnChanged(function(Value)
	if Value then
		FakeEvents.Shade.Parent = RemotesFolder
		FakeEvents.Shade_Real.Parent = nil
	else
		FakeEvents.Shade_Real.Parent = RemotesFolder
		FakeEvents.Shade.Parent = nil
	end
end)
Toggles.NoA90Damage:OnChanged(function(Value)
	if RemotesFolder:FindFirstChild(loadstring(base64decode("QTkw"))()) then
		if Value then
			FakeEvents.A90.Parent = RemotesFolder
			FakeEvents.A90_Real.Parent = nil
		else
			FakeEvents.A90_Real.Parent = RemotesFolder
			FakeEvents.A90.Parent = nil
		end
	end
end)
Toggles.NoSurgeDamage:OnChanged(function(Value)
	if RemotesFolder:FindFirstChild(loadstring(base64decode("U3VyZ2VSZW1vdGU="))()) then
		if Value then
			FakeEvents.Surge.Parent = RemotesFolder
			FakeEvents.Surge_Real.Parent = nil
		else
			FakeEvents.Surge_Real.Parent = RemotesFolder
			FakeEvents.Surge.Parent = nil
		end
	end
end)

local Modules = {}

Toggles.RemoveScreech:OnChanged(function(Value)
	if Value then
		task.spawn(function()
			while Toggles.RemoveScreech.Value do
				local Camera = workspace:FindFirstChild(loadstring(base64decode("Q2FtZXJh"))())

				if Camera then
					local Screech = Camera:FindFirstChild(loadstring(base64decode("U2NyZWVjaA=="))())

					if Screech then
						Screech:Destroy()
					end
				end

				task.wait()
			end
		end)
	end
end)
Toggles.RemoveHalt:OnChanged(function(Value)
	Modules.Shade.Name = Value and loadstring(base64decode("U2hhZGVfRGlzYWJsZWQ="))() or loadstring(base64decode("U2hhZGU="))()
end)
Toggles.RemoveA90:OnChanged(function(Value)
	if Modules.A90 then
		Modules.A90.Name = Value and loadstring(base64decode("QTkwX0Rpc2FibGVk"))() or loadstring(base64decode("QTkw"))()
	end
end)
Toggles.RemoveDread:OnChanged(function(Value)
	if Modules.Dread then
		Modules.Dread.Name = Value and loadstring(base64decode("RHJlYWRfRGlzYWJsZWQ="))() or loadstring(base64decode("RHJlYWQ="))()
	end
end)
Toggles.RemoveSurge:OnChanged(function(Value)
	if Globals.SurgeFrame then
		Globals.SurgeFrame.Name = (Value and loadstring(base64decode("U3VyZ2VWaWduZXR0ZV9EaXNhYmxlZA=="))() or loadstring(base64decode("U3VyZ2VWaWduZXR0ZQ=="))())
	end
end)

Groupboxes.Exploits_Audio = Tabs.Exploits:AddLeftGroupbox(loadstring(base64decode("QXVkaW8="))())
Globals.JamMuffle = Services.SoundService:WaitForChild(loadstring(base64decode("TWFpbg=="))()):FindFirstChild(loadstring(base64decode("SmFtbWluZw=="))()) or Instance.new(loadstring(base64decode("RXF1YWxpemVyU291bmRFZmZlY3Q="))())

Groupboxes.Exploits_Audio:AddToggle(loadstring(base64decode("UmVtb3ZlRm9vdHN0ZXBTb3VuZHM="))(),    { Text = loadstring(base64decode("UmVtb3ZlIEZvb3RzdGVwIFNvdW5kcw=="))(),    Default = false, Tooltip = loadstring(base64decode("UmVtb3ZlcyB0aGUgc291bmRzIHdoZW4gd2Fsa2luZy4="))() })
Groupboxes.Exploits_Audio:AddToggle(loadstring(base64decode("UmVtb3ZlSmFtbWluTXVzaWM="))(),       { Text = loadstring(base64decode("UmVtb3ZlIEphbW1pbiBNdXNpYw=="))(),       Default = false, Tooltip = loadstring(base64decode("UmVtb3ZlcyB0aGUgbXVzaWMgYW5kIG11ZmZsZSBlZmZlY3QgZnJvbSB0aGUgJ0phbW1pbicgbW9kaWZpZXIu"))() })
Groupboxes.Exploits_Audio:AddToggle(loadstring(base64decode("UmVtb3ZlSW50ZXJhY3RpbmdTb3VuZHM="))(), { Text = loadstring(base64decode("UmVtb3ZlIEludGVyYWN0aW5nIFNvdW5kcw=="))(), Default = false, Tooltip = loadstring(base64decode("UmVtb3ZlcyB0aGUgc291bmRzIHdoZW4gaW50ZXJhY3Rpbmcgd2l0aCBwcm94aW1pdHkgcHJvbXB0cy4="))() })

Toggles.RemoveJamminMusic:OnChanged(function(Value)
	local Jam = Globals.MainUI.Initiator.Main_Game.Health:FindFirstChild(loadstring(base64decode("SmFt"))())
	if Jam then
		Jam.Volume = Value and 0 or 0.45
		Globals.JamMuffle.Enabled = LiveModifiers:FindFirstChild(loadstring(base64decode("SmFtbWlu"))()) and not Value or false
	end
end)
Toggles.RemoveInteractingSounds:OnChanged(function(Value)
	local PS = Globals.MainUI.Initiator.Main_Game.PromptService
	PS.Triggered.Volume   = Value and 0 or 0.04
	PS.Holding.Volume     = Value and 0 or 0.1
	PS.Notification.Volume = Value and 0 or 0.03
	Globals.MainUI.Initiator.Main_Game.Reminder.Caption.Volume = Value and 0 or 0.1
end)

Groupboxes.Visuals_LeftTab = Tabs.Visuals:AddLeftTabbox(loadstring(base64decode("Q2FtZXJhIC8gRWZmZWN0cw=="))())
Groupboxes.Visuals_Camera = Groupboxes.Visuals_LeftTab:AddTab(loadstring(base64decode("Q2FtZXJh"))())
Groupboxes.Visuals_Camera:AddToggle(loadstring(base64decode("QW1iaWVudFRvZ2dsZQ=="))(), { Text = loadstring(base64decode("QW1iaWVudA=="))(), Default = false, Tooltip = loadstring(base64decode("Q2hhbmdlcyB0aGUgbGlnaHRpbmcgY29sb3IgdG8gdGhlIHNwZWNpZmllZCB2YWx1ZS4="))() })
Groupboxes.Visuals_Camera:AddSlider(loadstring(base64decode("RmllbGRPZlZpZXc="))(), { Text = loadstring(base64decode("RmllbGQgb2YgVmlldw=="))(), Min = 1, Max = 120, Default = 70, Rounding = 0 })
Groupboxes.Visuals_Camera:AddToggle(loadstring(base64decode("Rk9WVG9nZ2xl"))(), {    Text = loadstring(base64decode("Q3VzdG9tIEZPVg=="))(),    Default = false,    Tooltip = loadstring(base64decode("T25seSBhcHBsaWVzIHRoZSBGaWVsZCBvZiBWaWV3IHNsaWRlciB3aGVuIGVuYWJsZWQu"))() })
Toggles.FOVToggle:AddKeyPicker(loadstring(base64decode("Rm92VG9nZ2xl"))(), {Text = loadstring(base64decode("Q3VzdG9tIEZvdg=="))(), Default = loadstring(base64decode("Tw=="))(), Mode = loadstring(base64decode("VG9nZ2xl"))(), SyncToggleState = true})
Groupboxes.Visuals_Camera:AddDivider()
Groupboxes.Visuals_Camera:AddToggle(loadstring(base64decode("UmVtb3ZlQ2FtZXJhU2hha2U="))(), {
	Text = loadstring(base64decode("UmVtb3ZlIENhbWVyYSBTaGFrZQ=="))(), Default = false, Tooltip = loadstring(base64decode("UHJldmVudHMgdGhlIGNhbWVyYSBmcm9tIHNoYWtpbmcu"))(),
	Disabled = not Functions.CheckCompatability({loadstring(base64decode("cmVxdWlyZQ=="))()}), DisabledTooltip = Globals.IncompatibleMessage
})
Groupboxes.Visuals_Camera:AddToggle(loadstring(base64decode("UmVtb3ZlQ2FtZXJhQm9iYmluZw=="))(), {
	Text = loadstring(base64decode("UmVtb3ZlIENhbWVyYSBCb2JiaW5n"))(), Default = false, Tooltip = loadstring(base64decode("UHJldmVudHMgdGhlIGNhbWVyYSBmcm9tIGJvYmJpbmcgd2hlbiBtb3Zpbmcu"))(),
	Disabled = not Functions.CheckCompatability({loadstring(base64decode("cmVxdWlyZQ=="))()}), DisabledTooltip = Globals.IncompatibleMessage
})
Groupboxes.Visuals_Camera:AddToggle(loadstring(base64decode("UmVtb3ZlQ3V0c2NlbmVz"))(), { Text = loadstring(base64decode("UmVtb3ZlIEN1dHNjZW5lcw=="))(), Default = false, Tooltip = loadstring(base64decode("UmVtb3ZlcyBhbGwgbm9uLW5lY2Vzc2FyeSBjdXRzY2VuZXMu"))() })
Groupboxes.Visuals_Camera:AddToggle(loadstring(base64decode("UmVtb3ZlQ2FtZXJhRm9n"))(), { Text = loadstring(base64decode("UmVtb3ZlIEZvZw=="))(), Default = false, Tooltip = loadstring(base64decode("UmVtb3ZlcyBhbGwgZm9nIGVmZmVjdHMgZnJvbSB0aGUgY2FtZXJhLg=="))() })
Groupboxes.Visuals_Camera:AddDivider()
Groupboxes.Visuals_Camera:AddToggle(loadstring(base64decode("VGhpcmRQZXJzb25Ub2dnbGU="))(), { Text = loadstring(base64decode("VGhpcmQgUGVyc29u"))(), Default = false, Tooltip = loadstring(base64decode("Wm9vbXMgb3V0IHlvdXIgY2FtZXJhLCBhbGxvd2luZyB5b3UgdG8gc2VlIHlvdXIgY2hhcmFjdGVyIGZyb20gYmVoaW5kLg=="))() })
Toggles.ThirdPersonToggle:AddKeyPicker(loadstring(base64decode("VGhpcmRQZXJzb25LZXliaW5k"))(), { Text = loadstring(base64decode("VGhpcmQgUGVyc29u"))(), Default = loadstring(base64decode("VA=="))(), Mode = loadstring(base64decode("VG9nZ2xl"))(), SyncToggleState = true })
Groupboxes.Visuals_Camera:AddSlider(loadstring(base64decode("VGhpcmRQZXJzb25PZmZzZXRY"))(), { Text = loadstring(base64decode("WCBPZmZzZXQ="))(), Min = -10, Max = 10, Default = 1.5, Rounding = 1, Compact = true })
Groupboxes.Visuals_Camera:AddSlider(loadstring(base64decode("VGhpcmRQZXJzb25PZmZzZXRZ"))(), { Text = loadstring(base64decode("WSBPZmZzZXQ="))(), Min = -10, Max = 10, Default = 1,   Rounding = 1, Compact = true })
Groupboxes.Visuals_Camera:AddSlider(loadstring(base64decode("VGhpcmRQZXJzb25PZmZzZXRa"))(), { Text = loadstring(base64decode("WiBPZmZzZXQ="))(), Min = -10, Max = 10, Default = 5,   Rounding = 1, Compact = true })
Groupboxes.Visuals_Camera:AddToggle(loadstring(base64decode("VGhpcmRQZXJzb25XYWxsQ2hlY2s="))(), { Text = loadstring(base64decode("V2FsbCBDaGVjaw=="))(), Default = false, Tooltip = loadstring(base64decode("UHJldmVudHMgdGhpcmQgcGVyc29uIGZyb20gZ29pbmcgdGhyb3VnaCB3YWxscy4="))() })
Groupboxes.Visuals_Camera:AddDivider()
Groupboxes.Visuals_Camera:AddToggle(loadstring(base64decode("Vmlld21vZGVsT2Zmc2V0VG9nZ2xl"))(), {
	Text = loadstring(base64decode("Vmlld21vZGVsIE9mZnNldA=="))(), Default = false, Tooltip = loadstring(base64decode("Q2hhbmdlcyB0aGUgb2Zmc2V0IG9mIHlvdXIgdmlld21vZGVsIHdoaWxlIGhvbGRpbmcgYW4gaXRlbS4="))(),
	Disabled = not Functions.CheckCompatability({loadstring(base64decode("cmVxdWlyZQ=="))()}), DisabledTooltip = Globals.IncompatibleMessage
})
Groupboxes.Visuals_Camera:AddSlider(loadstring(base64decode("Vmlld21vZGVsT2Zmc2V0WA=="))(), { Text = loadstring(base64decode("WCBPZmZzZXQ="))(), Min = -10, Max = 10, Default = 0, Rounding = 1, Compact = true, Disabled = not Functions.CheckCompatability({loadstring(base64decode("cmVxdWlyZQ=="))()}), DisabledTooltip = Globals.IncompatibleMessage })
Groupboxes.Visuals_Camera:AddSlider(loadstring(base64decode("Vmlld21vZGVsT2Zmc2V0WQ=="))(), { Text = loadstring(base64decode("WSBPZmZzZXQ="))(), Min = -10, Max = 10, Default = 0, Rounding = 1, Compact = true, Disabled = not Functions.CheckCompatability({loadstring(base64decode("cmVxdWlyZQ=="))()}), DisabledTooltip = Globals.IncompatibleMessage })
Groupboxes.Visuals_Camera:AddSlider(loadstring(base64decode("Vmlld21vZGVsT2Zmc2V0Wg=="))(), { Text = loadstring(base64decode("WiBPZmZzZXQ="))(), Min = -10, Max = 10, Default = 0, Rounding = 1, Compact = true, Disabled = not Functions.CheckCompatability({loadstring(base64decode("cmVxdWlyZQ=="))()}), DisabledTooltip = Globals.IncompatibleMessage })

Toggles.AmbientToggle:AddColorPicker(loadstring(base64decode("QW1iaWVudENvbG9y"))(), { Text = loadstring(base64decode("QW1iaWVudA=="))(), Default = Color3.fromRGB(255, 255, 255), Transparency = 0 })
Toggles.AmbientToggle:OnChanged(function(Value)
	local OldAmbient = CurrentRooms:FindFirstChild(tostring(LocalPlayer:GetAttribute(loadstring(base64decode("Q3VycmVudFJvb20="))()))):GetAttribute(loadstring(base64decode("QW1iaWVudA=="))())
	Services.TweenService:Create(Services.Lighting, TweenInfo.new(0.2, Enum.EasingStyle.Exponential), {
		Ambient = Value and Options.AmbientColor.Value or OldAmbient
	}):Play()
end)

local Main_Game
local ClientModules

Toggles.RemoveCameraBobbing:OnChanged(function(Value)
	if Main_Game then Main_Game.spring.Speed = Value and 9e9 or 8 end
end)
Toggles.RemoveCameraFog:OnChanged(function(Value)
	Services.Lighting.FogEnd = Value and 10000000 or Globals.OldFog
	for _, Object in Globals.FogInstances do
		Object.Density = Value and 0 or Object:GetAttribute(loadstring(base64decode("RGVuc2l0eV9PbGQ="))())
	end
end)
Toggles.RemoveCutscenes:OnChanged(function(Value)
    local Cutscenes = Globals.MainUI.Initiator.Main_Game.RemoteListener.Cutscenes
    for _, Object in pairs(Cutscenes:GetChildren()) do
        if table.find(CutsceneNames, Object.Name) and Object:IsA(loadstring(base64decode("TW9kdWxlU2NyaXB0"))()) or table.find(CutsceneNames, Object:GetAttribute(loadstring(base64decode("T3JpZ2luYWxOYW1l"))())) and Object:IsA(loadstring(base64decode("TW9kdWxlU2NyaXB0"))()) then
            Object.Name = (Value and Object.Name .. loadstring(base64decode("X0Rpc2FibGVk"))() or Object:GetAttribute(loadstring(base64decode("T3JpZ2luYWxOYW1l"))()))
        end
    end
    for _, Object in pairs(FloorReplicated:GetChildren()) do
        if table.find(CutsceneNames, Object.Name) and Object:IsA(loadstring(base64decode("TW9kdWxlU2NyaXB0"))()) or table.find(CutsceneNames, Object:GetAttribute(loadstring(base64decode("T3JpZ2luYWxOYW1l"))())) and Object:IsA(loadstring(base64decode("TW9kdWxlU2NyaXB0"))()) then
            Object.Name = (Value and Object.Name .. loadstring(base64decode("X0Rpc2FibGVk"))() or Object:GetAttribute(loadstring(base64decode("T3JpZ2luYWxOYW1l"))()))
        end
    end
end)

Groupboxes.Visuals_Effects = Groupboxes.Visuals_LeftTab:AddTab(loadstring(base64decode("RWZmZWN0cw=="))())
Groupboxes.Visuals_Effects:AddToggle(loadstring(base64decode("VHJhbnNwYXJlbnRIaWRpbmdTcG90c1RvZ2dsZQ=="))(), { Text = loadstring(base64decode("VHJhbnNwYXJlbnQgSGlkaW5nIFNwb3Rz"))(), Default = false, Tooltip = loadstring(base64decode("TWFrZXMgYSBoaWRpbmcgc3BvdCB0cmFuc3BhcmVudCB3aGVuIHlvdSBlbnRlciBpdC4="))() })
Groupboxes.Visuals_Effects:AddSlider(loadstring(base64decode("VHJhbnNwYXJlbnRIaWRpbmdTcG90c1NsaWRlcg=="))(), { Text = loadstring(base64decode("VHJhbnNwYXJlbmN5"))(), Min = 0, Max = 1, Default = 0.5, Rounding = 2, Compact = true })

local function ApplyHidingTransparency(Value, SliderValue)
	for _, Object in Objects.HidingSpots do
		local IsHiding = false
		for _, Child in Object:GetDescendants() do
			if Child.Name == loadstring(base64decode("SGlkZGVuUGxheWVy"))() and Child.Value == Character then
				IsHiding = true
				break
			end
		end
		for _, Part in Object:GetDescendants() do
			if Part:IsA(loadstring(base64decode("QmFzZVBhcnQ="))()) and Part:GetAttribute(loadstring(base64decode("VHJhbnNwYXJlbmN5X09sZA=="))()) then
				Services.TweenService:Create(Part, TweenInfo.new(0.25, Enum.EasingStyle.Linear), {
					Transparency = (Value and IsHiding) and SliderValue or Part:GetAttribute(loadstring(base64decode("VHJhbnNwYXJlbmN5X09sZA=="))())
				}):Play()
			end
		end
	end
end

Toggles.TransparentHidingSpotsToggle:OnChanged(function(Value)
	ApplyHidingTransparency(Value, Options.TransparentHidingSpotsSlider.Value)
end)
Options.TransparentHidingSpotsSlider:OnChanged(function(Value)
	ApplyHidingTransparency(Toggles.TransparentHidingSpotsToggle.Value, Value)
end)

Groupboxes.Visuals_Effects:AddDivider()
Groupboxes.Visuals_Effects:AddToggle(loadstring(base64decode("RGlzYWJsZUdsaXRjaEp1bXBzY2FyZQ=="))(),   { Text = loadstring(base64decode("RGlzYWJsZSBHbGl0Y2ggSnVtcHNjYXJl"))(),   Default = false, Tooltip = loadstring(base64decode("RGlzYWJsZXMgdGhlIGp1bXBzY2FyZSBmcm9tICdHbGl0Y2gn"))() })
Groupboxes.Visuals_Effects:AddToggle(loadstring(base64decode("RGlzYWJsZVRpbW90aHlKdW1wc2NhcmU="))(),  { Text = loadstring(base64decode("RGlzYWJsZSBUaW1vdGh5IEp1bXBzY2FyZQ=="))(),  Default = false, Tooltip = loadstring(base64decode("RGlzYWJsZXMgdGhlIGp1bXBzY2FyZSBmcm9tICdUaW1vdGh5Jw=="))() })
Groupboxes.Visuals_Effects:AddToggle(loadstring(base64decode("RGlzYWJsZVZvaWRKdW1wc2NhcmU="))(),     { Text = loadstring(base64decode("RGlzYWJsZSBWb2lkIEp1bXBzY2FyZQ=="))(),     Default = false, Tooltip = loadstring(base64decode("RGlzYWJsZXMgdGhlIGp1bXBzY2FyZSBmcm9tICdWb2lkJw=="))() })
Groupboxes.Visuals_Effects:AddDivider()
Groupboxes.Visuals_Effects:AddToggle(loadstring(base64decode("RGlzYWJsZUhpZGVWaWduZXR0ZQ=="))(),      { Text = loadstring(base64decode("RGlzYWJsZSBIaWRlIFZpZ25ldHRl"))(),      Default = false, Tooltip = loadstring(base64decode("RGlzYWJsZXMgdGhlIGhpZGluZyBzY3JlZW4gZWZmZWN0Lg=="))() })
Groupboxes.Visuals_Effects:AddToggle(loadstring(base64decode("RGlzYWJsZUZpcmVkYW1wRWZmZWN0"))(),    { Text = loadstring(base64decode("RGlzYWJsZSBGaXJlZGFtcCBFZmZlY3Q="))(),    Default = false, Tooltip = loadstring(base64decode("RGlzYWJsZXMgdGhlIGZpcmVkYW1wIHNjcmVlbiBlZmZlY3Qu"))() })
Groupboxes.Visuals_Effects:AddToggle(loadstring(base64decode("RGlzYWJsZUVudGl0eUp1bXBzY2FyZXM="))(),  { Text = loadstring(base64decode("RGlzYWJsZSBFbnRpdHkgSnVtcHNjYXJlcw=="))(),  Default = false, Tooltip = loadstring(base64decode("RGlzYWJsZXMganVtcHNjYXJlcyBmcm9tIGVudGl0aWVzIGxpa2UgUnVzaCBhbmQgQW1idXNoLg=="))() })

Toggles.DisableGlitchJumpscare:OnChanged(function(Value)
	Modules.Glitch.Name = Value and loadstring(base64decode("R2xpdGNoX0Rpc2FibGVk"))() or loadstring(base64decode("R2xpdGNo"))()
end)
Toggles.DisableTimothyJumpscare:OnChanged(function(Value)
	Modules.SpiderJumpscare.Name = Value and loadstring(base64decode("U3BpZGVySnVtcHNjYXJlX0Rpc2FibGVk"))() or loadstring(base64decode("U3BpZGVySnVtcHNjYXJl"))()
end)
Toggles.DisableVoidJumpscare:OnChanged(function(Value)
	if Modules.Void then Modules.Void.Name = Value and loadstring(base64decode("Vm9pZF9EaXNhYmxlZA=="))() or loadstring(base64decode("Vm9pZA=="))() end
end)
Toggles.DisableHideVignette:OnChanged(function(Value)
	local Vignette = Globals.MainUI:FindFirstChild(loadstring(base64decode("SGlkZVZpZ25ldHRl"))()) or Globals.MainUI.MainFrame:FindFirstChild(loadstring(base64decode("SGlkZVZpZ25ldHRl"))())
	if Vignette then Vignette.Image = Value and loadstring(base64decode("RGlzYWJsZWQ="))() or loadstring(base64decode("cmJ4YXNzZXRpZDovLzYxMDAwNzYzMjA="))() end
end)
Toggles.DisableFiredampEffect:OnChanged(function(Value)
	for _, Object in CurrentRooms:GetChildren() do
		if Value then
			Object:SetAttribute(loadstring(base64decode("RmlyZWRhbXA="))(), false)
			for _, FiredampObj in Camera:GetChildren() do
				if FiredampObj.Name == loadstring(base64decode("TGl2ZUZpcmVkYW1w"))() then FiredampObj:Destroy() end
			end
		else
			Object:SetAttribute(loadstring(base64decode("RmlyZWRhbXA="))(), Object:GetAttribute(loadstring(base64decode("RmlyZWRhbXBfT2xk"))()))
		end
	end
	local Old = LocalPlayer:GetAttribute(loadstring(base64decode("Q3VycmVudFJvb20="))())
	LocalPlayer:SetAttribute(loadstring(base64decode("Q3VycmVudFJvb20="))(), 0)
	task.wait()
	LocalPlayer:SetAttribute(loadstring(base64decode("Q3VycmVudFJvb20="))(), Old)
end)
Toggles.DisableEntityJumpscares:OnChanged(function(Value)
	local Jumpscares = Globals.MainUI.Initiator.Main_Game.RemoteListener:FindFirstChild(loadstring(base64decode("SnVtcHNjYXJlcw=="))())
		or Globals.MainUI.Initiator.Main_Game.RemoteListener:FindFirstChild(loadstring(base64decode("SnVtcHNjYXJlc19EaXNhYmxlZA=="))())
	if Jumpscares then
		Jumpscares.Name = Value and loadstring(base64decode("SnVtcHNjYXJlc19EaXNhYmxlZA=="))() or loadstring(base64decode("SnVtcHNjYXJlcw=="))()
		for _, Object in Objects.JumpscareModules do
			Object.Name = Value and (Object:GetAttribute(loadstring(base64decode("T3JpZ2luYWxOYW1l"))()) .. loadstring(base64decode("X0Rpc2FibGVk"))()) or Object:GetAttribute(loadstring(base64decode("T3JpZ2luYWxOYW1l"))())
		end
	end
end)

Groupboxes.Visuals_RightTab     = Tabs.Visuals:AddRightTabbox(loadstring(base64decode("RW50aXRpZXMgLyBTZXR0aW5ncyAvIEVudGl0eSBOb2Rlcw=="))())
Groupboxes.Visuals_Entities     = Groupboxes.Visuals_RightTab:AddTab(loadstring(base64decode("RW50aXRpZXM="))())
Groupboxes.Visuals_EntitySettings = Groupboxes.Visuals_RightTab:AddTab(loadstring(base64decode("U2V0dGluZ3M="))())

Groupboxes.Visuals_Entities:AddButton({
	Text = loadstring(base64decode("QWxs"))(),
	Tooltip = loadstring(base64decode("U2VsZWN0cyBldmVyeSBlbnRpdHkgaW4gdGhlIEVudGl0eSBMaXN0IChFU1AgYW5kIG5vdGlmaWNhdGlvbnMpIGFuZCBlbmFibGVzIE5vdGlmeSBFbnRpdGllcy4="))(),
	Func = function()
		local Dropdown = Options.EntityList
		if Dropdown then
			local AllValues = {}
			for _, Value in ipairs(Dropdown.Values or {}) do
				table.insert(AllValues, Value)
			end
			pcall(function() Dropdown:SetValue(AllValues) end)
			if not (type(Dropdown.Value) == loadstring(base64decode("dGFibGU="))() and next(Dropdown.Value)) then
				local Parsed = {}
				for _, Value in ipairs(Dropdown.Values or {}) do
					Parsed[Value] = true
				end
				pcall(function() Dropdown:SetValue(Parsed) end)
			end
		end
		local Toggle = Toggles.NotifyEntities
		if Toggle then pcall(function() Toggle:SetValue(true) end) end
		Library:Notify(loadstring(base64decode("RW50aXR5IExpc3Q6IGFsbCBzZWxlY3RlZA=="))(), 3)
	end
})

Groupboxes.Visuals_Entities:AddDropdown(loadstring(base64decode("RW50aXR5TGlzdA=="))(), {
	Text = loadstring(base64decode("RW50aXR5IExpc3Q="))(),
	Values = { loadstring(base64decode("UnVzaA=="))(),loadstring(base64decode("QmFzaA=="))(),loadstring(base64decode("U2NyaWJibGVz"))(),loadstring(base64decode("VGVsbGVy"))(),loadstring(base64decode("RHJvbmVzU3RhbXBlZGU="))(),loadstring(base64decode("Q3JlYWs="))(),loadstring(base64decode("Tm9pc2U="))(),loadstring(base64decode("Tm9pc2VfVFY="))(),loadstring(base64decode("QmFsbHM="))(),loadstring(base64decode("UG9ydHJhaXQ="))(),loadstring(base64decode("QW1idXNo"))(),loadstring(base64decode("RXllcw=="))(),loadstring(base64decode("SGFsdA=="))(),loadstring(base64decode("QmxpdHo="))(),loadstring(base64decode("TG9va21hbg=="))(),loadstring(base64decode("R2xvb21iYXQgU3dhcm0="))(),loadstring(base64decode("QS02MA=="))(),loadstring(base64decode("QS0xMjA="))(),loadstring(base64decode("U2FsbHk="))(),loadstring(base64decode("SmVmZiB0aGUgS2lsbGVy"))(),loadstring(base64decode("R3JvdW5kc2tlZXBlcg=="))(),loadstring(base64decode("TW9udW1lbnQ="))(),loadstring(base64decode("QVIweE1CVVNI"))(),loadstring(base64decode("Uk5JVVNIQ0c9PQ=="))() },
	Multi = true, AllowNull = true
})
Groupboxes.Visuals_Entities:AddToggle(loadstring(base64decode("Tm90aWZ5RW50aXRpZXM="))(),    { Text = loadstring(base64decode("Tm90aWZ5IEVudGl0aWVz"))(),    Default = false, Tooltip = loadstring(base64decode("U2VuZHMgYSBub3RpZmljYXRpb24gd2hlbiBhbiBlbnRpdHkgc3Bhd25zLg=="))() })
Groupboxes.Visuals_Entities:AddDivider()
Groupboxes.Visuals_Entities:AddToggle(loadstring(base64decode("U2hvd0VudGl0eVBhdGg="))(), {
    Text = loadstring(base64decode("U2hvdyBFbnRpdHkgUGF0aA=="))(),
    Default = false,
    Tooltip = loadstring(base64decode("U2hvd3MgdGhlIHBhdGggb2YgZW50aXR5cy4="))()
})


-- i dont wanna hear it okay? i was sick okay let me be okay fuck u okay




Groupboxes.Visuals_Entities:AddToggle(loadstring(base64decode("U2hvd0VudGl0eVBhdGg="))(), {
    Text = loadstring(base64decode("U2hvdyBFbnRpdHkgUGF0aA=="))(),
    Default = false,
    Tooltip = loadstring(base64decode("U2hvd3MgdGhlIHBhdGggb2YgZW50aXR5cy4="))()
})

Groupboxes.Visuals_Entities:AddSlider(loadstring(base64decode("U2hvd0VudGl0eVBhdGhOb2RlVHJhbnNwYXJlbmN5"))(), {
    Text = loadstring(base64decode("Tm9kZSBUcmFuc3BhcmVuY3k="))(),
    Default = 0,
    Min = 0,
    Max = 1,
    Rounding = 2,
    Compact = false,
    Tooltip = loadstring(base64decode("VHJhbnNwYXJlbmN5IG9mIHRoZSBwYXRoIG5vZGVzIHdoZW4gc2hvd24="))()
})

Groupboxes.Visuals_Entities:AddSlider(loadstring(base64decode("U2hvd0VudGl0eVBhdGhMaW5lVHJhbnNwYXJlbmN5"))(), {
    Text = loadstring(base64decode("TGluZSBUcmFuc3BhcmVuY3k="))(),
    Default = 0.15,
    Min = 0,
    Max = 1,
    Rounding = 2,
    Compact = false,
    Tooltip = loadstring(base64decode("VHJhbnNwYXJlbmN5IG9mIHRoZSBwYXRoIGxpbmVz"))()
})

Groupboxes.Visuals_Entities:AddSlider(loadstring(base64decode("U2hvd0VudGl0eVBhdGhMaW5lVGhpY2tuZXNz"))(), {
    Text = loadstring(base64decode("TGluZSBUaGlja25lc3M="))(),
    Default = 0.3,
    Min = 0.08,
    Max = 1.2,
    Rounding = 2
})

local ShowEntityPathLines = {}

local function ShowEntityPathClearAllLines()
    for _, ShowEntityPathRoomLines in pairs(ShowEntityPathLines) do
        for _, ShowEntityPathLine in ipairs(ShowEntityPathRoomLines) do
            if ShowEntityPathLine and ShowEntityPathLine.Parent then
                ShowEntityPathLine:Destroy()
            end
        end
    end
    table.clear(ShowEntityPathLines)
end

local function ShowEntityPathCreateLine(ShowEntityPathPoint1, ShowEntityPathPoint2, ShowEntityPathTransparency, ShowEntityPathThickness, ShowEntityPathParent)
    local ShowEntityPathDistance = (ShowEntityPathPoint1 - ShowEntityPathPoint2).Magnitude
    if ShowEntityPathDistance < 0.05 then
        return nil
    end

    local ShowEntityPathLinePart = Instance.new(loadstring(base64decode("UGFydA=="))())
    ShowEntityPathLinePart.Name = loadstring(base64decode("UGF0aExpbmU="))()
    ShowEntityPathLinePart.Anchored = true
    ShowEntityPathLinePart.CanCollide = false
    ShowEntityPathLinePart.CanQuery = false
    ShowEntityPathLinePart.CanTouch = false
    ShowEntityPathLinePart.CastShadow = false
    ShowEntityPathLinePart.Material = Enum.Material.ForceField
    ShowEntityPathLinePart.Color = Color3.fromRGB(0, 255, 210)
    ShowEntityPathLinePart.Transparency = ShowEntityPathTransparency
    ShowEntityPathLinePart.Size = Vector3.new(ShowEntityPathThickness, ShowEntityPathThickness, ShowEntityPathDistance)
    ShowEntityPathLinePart.CFrame = CFrame.lookAt(ShowEntityPathPoint1, ShowEntityPathPoint2) * CFrame.new(0, 0, -ShowEntityPathDistance / 2)
    ShowEntityPathLinePart.Parent = ShowEntityPathParent
    return ShowEntityPathLinePart
end

local function ShowEntityPathGetSortedNodes(ShowEntityPathNodes)
    local ShowEntityPathSortedNodes = {}
    for _, ShowEntityPathNode in ipairs(ShowEntityPathNodes:GetChildren()) do
        if ShowEntityPathNode:IsA(loadstring(base64decode("QmFzZVBhcnQ="))()) then
            local ShowEntityPathNodeNumber = tonumber(ShowEntityPathNode.Name)
            if ShowEntityPathNodeNumber then
                table.insert(ShowEntityPathSortedNodes, {
                    Part = ShowEntityPathNode,
                    Number = ShowEntityPathNodeNumber
                })
            end
        end
    end
    table.sort(ShowEntityPathSortedNodes, function(a, b)
        return a.Number < b.Number
    end)
    return ShowEntityPathSortedNodes
end

local function ShowEntityPathSetNodeTransparency(ShowEntityPathTransparency)
    for _, ShowEntityPathRoom in ipairs(workspace.CurrentRooms:GetChildren()) do
        local ShowEntityPathNodes = ShowEntityPathRoom:FindFirstChild(loadstring(base64decode("UGF0aGZpbmROb2Rlcw=="))())
        if ShowEntityPathNodes then
            for _, ShowEntityPathNode in ipairs(ShowEntityPathNodes:GetChildren()) do
                if ShowEntityPathNode:IsA(loadstring(base64decode("QmFzZVBhcnQ="))()) then
                    ShowEntityPathNode.Transparency = ShowEntityPathTransparency
                end
            end
        end
    end
end

local function ShowEntityPathSetLineTransparency(ShowEntityPathTransparency)
    for _, ShowEntityPathRoomLines in pairs(ShowEntityPathLines) do
        for _, ShowEntityPathLine in ipairs(ShowEntityPathRoomLines) do
            if ShowEntityPathLine and ShowEntityPathLine.Parent then
                ShowEntityPathLine.Transparency = ShowEntityPathTransparency
            end
        end
    end
end

local function ShowEntityPathUpdateAll()
    local ShowEntityPathShow = Toggles.ShowEntityPath.Value
    local ShowEntityPathNodeTransparency = ShowEntityPathShow and Options.ShowEntityPathNodeTransparency.Value or 1
    local ShowEntityPathLineTransparency = Options.ShowEntityPathLineTransparency.Value
    local ShowEntityPathLineThickness = Options.ShowEntityPathLineThickness.Value

    ShowEntityPathClearAllLines()

    if not ShowEntityPathShow then
        ShowEntityPathSetNodeTransparency(1)
        return
    end

    ShowEntityPathSetNodeTransparency(ShowEntityPathNodeTransparency)

    local ShowEntityPathValidRooms = {}
    for _, ShowEntityPathRoom in ipairs(workspace.CurrentRooms:GetChildren()) do
        if ShowEntityPathRoom:FindFirstChild(loadstring(base64decode("UGF0aGZpbmROb2Rlcw=="))()) then
            table.insert(ShowEntityPathValidRooms, ShowEntityPathRoom)
        end
    end

    table.sort(ShowEntityPathValidRooms, function(a, b)
        return (tonumber(a.Name) or 0) < (tonumber(b.Name) or 0)
    end)

    for _, ShowEntityPathRoom in ipairs(ShowEntityPathValidRooms) do
        local ShowEntityPathNodes = ShowEntityPathRoom.PathfindNodes
        local ShowEntityPathSortedNodes = ShowEntityPathGetSortedNodes(ShowEntityPathNodes)

        if #ShowEntityPathSortedNodes > 0 then
            local ShowEntityPathRoomLines = {}

            for i = 1, #ShowEntityPathSortedNodes - 1 do
                local ShowEntityPathFrom = ShowEntityPathSortedNodes[i].Part
                local ShowEntityPathTo = ShowEntityPathSortedNodes[i + 1].Part

                local ShowEntityPathLine = ShowEntityPathCreateLine(
                    ShowEntityPathFrom.Position,
                    ShowEntityPathTo.Position,
                    ShowEntityPathLineTransparency,
                    ShowEntityPathLineThickness,
                    ShowEntityPathRoom
                )
                if ShowEntityPathLine then
                    table.insert(ShowEntityPathRoomLines, ShowEntityPathLine)
                end
            end

            if #ShowEntityPathRoomLines > 0 then
                ShowEntityPathLines[ShowEntityPathRoom] = ShowEntityPathRoomLines
            end
        end
    end
end

Toggles.ShowEntityPath:OnChanged(function()
    if ShowEntityPathChildAddedConnection then
        ShowEntityPathChildAddedConnection:Disconnect()
        ShowEntityPathChildAddedConnection = nil
    end

    ShowEntityPathUpdateAll()

    if Toggles.ShowEntityPath.Value then
        ShowEntityPathChildAddedConnection = workspace.CurrentRooms.ChildAdded:Connect(function(ShowEntityPathRoom)
            if ShowEntityPathRoom:WaitForChild(loadstring(base64decode("UGF0aGZpbmROb2Rlcw=="))(), 5) then
                task.wait(0.1)
                ShowEntityPathUpdateAll()
            end
        end)
    end
end)

Options.ShowEntityPathNodeTransparency:OnChanged(function()
    if Toggles.ShowEntityPath.Value then
        ShowEntityPathSetNodeTransparency(Options.ShowEntityPathNodeTransparency.Value)
    end
end)

Options.ShowEntityPathLineTransparency:OnChanged(function()
    if Toggles.ShowEntityPath.Value then
        ShowEntityPathSetLineTransparency(Options.ShowEntityPathLineTransparency.Value)
    end
end)

Options.ShowEntityPathLineThickness:OnChanged(function()
    if Toggles.ShowEntityPath.Value then
        ShowEntityPathUpdateAll()
    end
end)


Groupboxes.Visuals_Entities:AddDivider()

local ItemsToNotify = {}
for Index, Name in pairs(ItemNames) do
	if not table.find(ItemsToNotify, Name) then
		table.insert(ItemsToNotify, Name)
	end
end
table.sort(ItemsToNotify)

Groupboxes.Visuals_Entities:AddButton({
	Text = loadstring(base64decode("QWxs"))(),
	Tooltip = loadstring(base64decode("U2VsZWN0cyBldmVyeSBpdGVtIGluIHRoZSBJdGVtIExpc3QgYW5kIGVuYWJsZXMgTm90aWZ5IEl0ZW1zLg=="))(),
	Func = function()
		local Dropdown = Options.NotifyItemList
		if Dropdown then
			local AllValues = {}
			for _, Value in ipairs(Dropdown.Values or {}) do
				table.insert(AllValues, Value)
			end
			pcall(function() Dropdown:SetValue(AllValues) end)
			if not (type(Dropdown.Value) == loadstring(base64decode("dGFibGU="))() and next(Dropdown.Value)) then
				local Parsed = {}
				for _, Value in ipairs(Dropdown.Values or {}) do
					Parsed[Value] = true
				end
				pcall(function() Dropdown:SetValue(Parsed) end)
			end
		end
		local Toggle = Toggles.NotifyItemsToggle
		if Toggle then pcall(function() Toggle:SetValue(true) end) end
		Library:Notify(loadstring(base64decode("SXRlbSBMaXN0OiBhbGwgc2VsZWN0ZWQ="))(), 3)
	end
})

Groupboxes.Visuals_Entities:AddDropdown(loadstring(base64decode("Tm90aWZ5SXRlbUxpc3Q="))(), {
	Text = loadstring(base64decode("SXRlbSBMaXN0"))(),
	Values = ItemsToNotify,
	Multi = true, AllowNull = true
})
Groupboxes.Visuals_Entities:AddToggle(loadstring(base64decode("Tm90aWZ5SXRlbXNUb2dnbGU="))(),    { Text = loadstring(base64decode("Tm90aWZ5IEl0ZW1z"))(),    Default = false, Tooltip = loadstring(base64decode("U2VuZHMgYSBub3RpZmljYXRpb24gd2hlbiBhbiBpdGVtIHNwYXducy4="))() })
Groupboxes.Visuals_Entities:AddToggle(loadstring(base64decode("Tm90aWZ5SXRlbXNTaG93RGlzdGFuY2U="))(),    { Text = loadstring(base64decode("U2hvdyBEaXN0YW5jZQ=="))(),    Default = false, Tooltip = loadstring(base64decode("U2hvd3MgaG93IGZhciBhd2F5IHRoZSBpdGVtIGlzIGluIHRoZSBub3RpZmljYXRpb24u"))() })
Groupboxes.Visuals_Entities:AddDivider()
Groupboxes.Visuals_Entities:AddToggle(loadstring(base64decode("Tm90aWZ5TGlicmFyeUNvZGU="))(), { Text = loadstring(base64decode("Tm90aWZ5IExpYnJhcnkgQ29kZQ=="))(), Default = false, Tooltip = loadstring(base64decode("QXV0b21hdGljYWxseSBzb2x2ZXMgdGhlIGNvZGUgZm9yIHRoZSBsaWJyYXJ5IHBhZGxvY2su"))() })
Groupboxes.Visuals_Entities:AddToggle(loadstring(base64decode("Tm90aWZ5T3h5Z2Vu"))(),      { Text = loadstring(base64decode("Tm90aWZ5IE94eWdlbiBMZXZlbA=="))(), Default = false, Tooltip = loadstring(base64decode("U2hvd3MgaG93IG11Y2ggb3h5Z2VuIHlvdSBoYXZlIHJlbWFpbmluZy4="))() })
Groupboxes.Visuals_Entities:AddToggle(loadstring(base64decode("Tm90aWZ5SGFzdGVUaW1l"))(),   { Text = loadstring(base64decode("Tm90aWZ5IEhhc3RlIFRpbWU="))(),   Default = false, Tooltip = loadstring(base64decode("U2hvd3MgaG93IG11Y2ggdGltZSB5b3UgaGF2ZSByZW1haW5pbmcgYmVmb3JlICdIYXN0ZScgc3Bhd25zLg=="))() })

Globals.LibraryCodeFound = false
Toggles.NotifyLibraryCode:OnChanged(function(Value)
	if Value then
		local Code = Functions.GetLibraryCode()
		if Code and not Code:find(loadstring(base64decode("Xw=="))()) and not Globals.LibraryCodeFound and CurrentRooms:FindFirstChild(loadstring(base64decode("NTA="))()) then
			local Lock = Services.Workspace:FindFirstChild(loadstring(base64decode("UGFkbG9jaw=="))(), true)
			Functions.Notify({ Title = loadstring(base64decode("UGFkbG9jayBjb2RlIGZvdW5kIQ=="))(), Body = loadstring(base64decode("VGhlIGNvZGUgaXM6ICc="))() .. Code .. loadstring(base64decode("Jw=="))(), Time = Toggles.NotifyKeepNotifications.Value and Lock or 15 })
			Globals.LibraryCodeFound = true
		end
	end
end)

Groupboxes.Visuals_EntitySettings:AddToggle(loadstring(base64decode("RW50aXR5Q2hhdFRvZ2dsZQ=="))(), { Text = loadstring(base64decode("Tm90aWZ5IENoYXQ="))(), Default = false, Tooltip = loadstring(base64decode("U2VuZHMgYSBtZXNzYWdlIGluIHRoZSBjaGF0IHdoZW4gYW4gZW50aXR5IHNwYXducy4="))() })
Groupboxes.Visuals_EntitySettings:AddInput(loadstring(base64decode("RW50aXR5Q2hhdE1lc3NhZ2U="))(), { Text = loadstring(base64decode("TWVzc2FnZQ=="))(), Default = loadstring(base64decode("c3Bhd25lZCE="))(), Numeric = false, Placeholder = loadstring(base64decode("TWVzc2FnZQ=="))() })
Groupboxes.Visuals_EntitySettings:AddDivider()
Groupboxes.Visuals_EntitySettings:AddDropdown(loadstring(base64decode("Tm90aWZ5U3R5bGU="))(), { Text = loadstring(base64decode("Tm90aWZ5IFN0eWxl"))(), Values = { loadstring(base64decode("SVJU"))(), loadstring(base64decode("RG9vcnM="))(), loadstring(base64decode("U1RY"))(), loadstring(base64decode("TGlicmFyeQ=="))() }, Default = 1 })
Groupboxes.Visuals_EntitySettings:AddSlider(loadstring(base64decode("Tm90aWZ5U291bmRWb2x1bWU="))(), { Text = loadstring(base64decode("U291bmQgVm9sdW1l"))(), Min = 0, Max = 10, Default = 3, Rounding = 1 })
Groupboxes.Visuals_EntitySettings:AddToggle(loadstring(base64decode("Tm90aWZ5UGxheVNvdW5k"))(), { Text = loadstring(base64decode("UGxheSBTb3VuZA=="))(), Default = true, Tooltip = loadstring(base64decode("TWFrZXMgbm90aWZpY2F0aW9ucyBwbGF5IGFuIGFsZXJ0IHNvdW5kLg=="))() })
Groupboxes.Visuals_EntitySettings:AddToggle(loadstring(base64decode("Tm90aWZ5S2VlcE5vdGlmaWNhdGlvbnM="))(), { Text = loadstring(base64decode("S2VlcCBOb3RpZmljYXRpb25z"))(), Default = false, Tooltip = loadstring(base64decode("Q2VydGFpbiBub3RpZmljYXRpb25zIHdpbGwgc3RheSBvbiBzY3JlZW4gdW50aWwgdGhleSBhcmUgbm8gbG9uZ2VyIG5lZWRlZC4="))() })
Groupboxes.Visuals_EntitySettings:AddButton({ Text = loadstring(base64decode("VGVzdCBOb3RpZmljYXRpb24="))(), DoubleClick = false, Tooltip = loadstring(base64decode("U2VuZHMgYSB0ZXN0IG5vdGlmY2F0aW9uLCBzbyB5b3UgY2FuIHNlZSBob3cgeW91ciBzZXR0aW5ncyBsb29rLg=="))(), Func = function()
	Functions.Notify({Title = loadstring(base64decode("VGhpcyBpcyBhIHRlc3Qu"))()})
end})

Groupboxes.Visuals_ESP          = Tabs.Visuals:AddRightTabbox(loadstring(base64decode("RVNQL1NldHRpbmdz"))())
Groupboxes.Visuals_ESP_Toggles  = Groupboxes.Visuals_ESP:AddTab(loadstring(base64decode("RVNQ"))())
Groupboxes.Visuals_ESP_Settings = Groupboxes.Visuals_ESP:AddTab(loadstring(base64decode("U2V0dGluZ3M="))())

local function MakeESPToggle(ToggleKey, ColorKey, Text, Tooltip, ObjectsTable, LabelFunc, RoomBased)
	Groupboxes.Visuals_ESP_Toggles:AddToggle(ToggleKey, { Text = Text, Default = false, Tooltip = Tooltip })
	Toggles[ToggleKey]:AddColorPicker(ColorKey, { Text = Text, Default = Options[ColorKey] and Options[ColorKey].Value or Color3.new(1,1,1), Transparency = 0 })
	Toggles[ToggleKey]:OnChanged(function(Value)
		for _, Object in ObjectsTable do
			if Value then
				local Label, UseRoom = LabelFunc(Object)
				if Label then
					Functions.AddESP({ Object = Object, Text = Label, Color = Options[ColorKey].Value }, UseRoom ~= nil and UseRoom or RoomBased)
				end
			else
				Functions.RemoveESP(Object)
			end
		end
	end)
	Options[ColorKey]:OnChanged(function(Value)
		for _, Object in ObjectsTable do
			IRT.ESPLibrary:UpdateObjectColor(Object, Value)
		end
	end)
end

Groupboxes.Visuals_ESP_Toggles:AddButton({
	Text = loadstring(base64decode("QWxs"))(),
	Tooltip = loadstring(base64decode("RW5hYmxlcyBldmVyeSBFU1AgY2F0ZWdvcnkgYW5kIHNlbGVjdHMgYWxsIGVudGl0aWVzIGluIHRoZSBFbnRpdHkgTGlzdC4="))(),
	Func = function()
		local ESPToggles = {
			loadstring(base64decode("T2JqZWN0aXZlRVNQVG9nZ2xl"))(), loadstring(base64decode("RG9vckVTUFRvZ2dsZQ=="))(), loadstring(base64decode("SGlkaW5nU3BvdEVTUFRvZ2dsZQ=="))(), loadstring(base64decode("UGxheWVyRVNQVG9nZ2xl"))(),
			loadstring(base64decode("Q2hlc3RFU1BUb2dnbGU="))(), loadstring(base64decode("SXRlbUVTUFRvZ2dsZQ=="))(), loadstring(base64decode("Q3VycmVuY3lFU1BUb2dnbGU="))(), loadstring(base64decode("TGFkZGVyRVNQVG9nZ2xl"))(),
			loadstring(base64decode("TWlzY0VTUFRvZ2dsZQ=="))(), loadstring(base64decode("RW50aXR5RVNQVG9nZ2xl"))(),
		}
		for _, Flag in ipairs(ESPToggles) do
			local Toggle = Toggles[Flag]
			if Toggle then
				pcall(function() Toggle:SetValue(true) end)
			end
		end
		local Dropdown = Options.EntityESPOptions
		if Dropdown then
			local AllValues = {}
			for _, Value in ipairs(Dropdown.Values or {}) do
				table.insert(AllValues, Value)
			end
			pcall(function() Dropdown:SetValue(AllValues) end)
			if not (Dropdown.Value and Dropdown.Value[loadstring(base64decode("UnVzaA=="))()]) then
				local Parsed = {}
				for _, Value in ipairs(Dropdown.Values or {}) do
					Parsed[Value] = true
				end
				pcall(function() Dropdown:SetValue(Parsed) end)
			end
		end
		Library:Notify(loadstring(base64decode("RVNQOiBhbGwgY2F0ZWdvcmllcyBlbmFibGVk"))(), 3)
	end
})
Groupboxes.Visuals_ESP_Toggles:AddDivider()

Groupboxes.Visuals_ESP_Toggles:AddToggle(loadstring(base64decode("T2JqZWN0aXZlRVNQVG9nZ2xl"))(), { Text = loadstring(base64decode("T2JqZWN0aXZlcw=="))(), Default = false, Tooltip = loadstring(base64decode("SGlnaGxpZ2h0cyBhbGwgb2JqZWN0cyByZXF1aXJlZCB0byBwcm9ncmVzcy4="))() })
Toggles.ObjectiveESPToggle:AddColorPicker(loadstring(base64decode("T2JqZWN0aXZlRVNQQ29sb3I="))(), { Text = loadstring(base64decode("T2JqZWN0aXZlcw=="))(), Default = Color3.fromRGB(0, 255, 0), Transparency = 0 })

local ObjectiveLabels = {
	[loadstring(base64decode("U3RhaXJ3ZWxsTG9ja3BpY2tEb29y"))()]  = loadstring(base64decode("R2FyYWdlIERvb3I="))(),
	[loadstring(base64decode("TWlycm9y"))()]				   = loadstring(base64decode("TWlycm9y"))(),
	[loadstring(base64decode("U2hvcHBpbmdDYXJ0"))()]		   = loadstring(base64decode("U2hvcHBpbmcgQ2FydA=="))(),
	[loadstring(base64decode("U3RhaXJ3ZWxsRmlyZUFsYXJt"))()]     = loadstring(base64decode("RmlyZSBBbGFybQ=="))(),
	[loadstring(base64decode("U3RhaXJ3ZWxsU2NyYXBwZXI="))()]	   = loadstring(base64decode("U2NyYXBwZXI="))(),
	[loadstring(base64decode("QXJjaGl2ZXNQYWNrYWdlRGVwb3NpdA=="))()] = loadstring(base64decode("Qm94RGVwb3NpdA=="))(),
	[loadstring(base64decode("Q2VsbGFy"))()] 				   = loadstring(base64decode("Q2VsbGFy"))(),
	[loadstring(base64decode("QXJjaGl2ZXNGaWhUYW5r"))()]        = loadstring(base64decode("RmloIFRhbms="))(),
	[loadstring(base64decode("S2V5T2J0YWlu"))()]              = loadstring(base64decode("RG9vciBLZXk="))(),
	[loadstring(base64decode("RWxlY3RyaWNhbEtleU9idGFpbg=="))()]    = loadstring(base64decode("RWxlY3RyaWNhbCBLZXk="))(),
	[loadstring(base64decode("TWluZXNHZW5lcmF0b3I="))()]         = loadstring(base64decode("R2VuZXJhdG9y"))(),
	[loadstring(base64decode("RnVzZU9idGFpbg=="))()]             = loadstring(base64decode("R2VuZXJhdG9yIEZ1c2U="))(),
	[loadstring(base64decode("TGl2ZUhpbnRCb29r"))()]           = loadstring(base64decode("SGludCBCb29r"))(),
	[loadstring(base64decode("TGl2ZUJyZWFrZXJQb2xlUGlja3Vw"))()]  = loadstring(base64decode("RnVzZSBCcmVha2Vy"))(),
	[loadstring(base64decode("TGlicmFyeUhpbnRQYXBlcg=="))()]       = loadstring(base64decode("SGludCBQYXBlcg=="))(),
	[loadstring(base64decode("UGlja3VwSXRlbQ=="))()]             = loadstring(base64decode("SGludCBQYXBlcg=="))(),
	[loadstring(base64decode("Q3JpbmdsZVByZXNlbnQ="))()]         = loadstring(base64decode("UHJlc2VudA=="))(),
	[loadstring(base64decode("TGV2ZXJGb3JHYXRl"))()]           = loadstring(base64decode("R2F0ZSBMZXZlcg=="))(),
	[loadstring(base64decode("TWluZXNHYXRlQnV0dG9u"))()]        = loadstring(base64decode("R2F0ZSBCdXR0b24="))(),
	[loadstring(base64decode("R2FyZGVuR2F0ZUJ1dHRvbg=="))()]       = loadstring(base64decode("R2F0ZSBCdXR0b24="))(),
}

Toggles.ObjectiveESPToggle:OnChanged(function(Value)
	for _, Object in Objects.Objectives do
		if Value then
			local Label = ObjectiveLabels[Object.Name]
			if Object.Name == loadstring(base64decode("VGltZXJMZXZlcg=="))() then
				Label = loadstring(base64decode("VGltZSBMZXZlciBbKw=="))() .. Object:GetAttribute(loadstring(base64decode("QWRkVGltZQ=="))()) .. loadstring(base64decode("c10="))()
			elseif Object.Name == loadstring(base64decode("TWluZXNBbmNob3I="))() then
				Label = loadstring(base64decode("QW5jaG9yIFs="))() .. Object:WaitForChild(loadstring(base64decode("U2lnbg=="))()).TextLabel.Text .. loadstring(base64decode("XQ=="))()
			elseif Object.Name == loadstring(base64decode("V2F0ZXJQdW1w"))() then
				Functions.AddESP({ Object = Object.Wheel, Text = loadstring(base64decode("V2F0ZXIgUHVtcA=="))(), Color = Options.ObjectiveESPColor.Value }, true)
			elseif Object.Name == loadstring(base64decode("VmluZUd1aWxsb3RpbmU="))() then
				Functions.AddESP({ Object = Object.Lever, Text = loadstring(base64decode("VmluZSBMZXZlcg=="))(), Color = Options.ObjectiveESPColor.Value }, true)
			end
			if Label then
				Functions.AddESP({ Object = Object, Text = Label, Color = Options.ObjectiveESPColor.Value }, true)
			end
		else
			Functions.RemoveESP(Object)
		end
	end
end)
Options.ObjectiveESPColor:OnChanged(function(Value)
	for _, Object in Objects.Objectives do
		IRT.ESPLibrary:UpdateObjectColor(Object, Value)
	end
end)

Groupboxes.Visuals_ESP_Toggles:AddToggle(loadstring(base64decode("RG9vckVTUFRvZ2dsZQ=="))(),       { Text = loadstring(base64decode("RG9vcnM="))(),        Default = false, Tooltip = loadstring(base64decode("SGlnaGxpZ2h0cyB0aGUgbmV4dCBkb29yLg=="))() })
Groupboxes.Visuals_ESP_Toggles:AddToggle(loadstring(base64decode("SGlkaW5nU3BvdEVTUFRvZ2dsZQ=="))(), { Text = loadstring(base64decode("SGlkaW5nIFNwb3Rz"))(), Default = false, Tooltip = loadstring(base64decode("SGlnaGxpZ2h0cyBwbGFjZXMgd2hlcmUgeW91IGNhbiBoaWRlIGZyb20gZW50aXRpZXM="))() })
Groupboxes.Visuals_ESP_Toggles:AddToggle(loadstring(base64decode("UGxheWVyRVNQVG9nZ2xl"))(),     { Text = loadstring(base64decode("UGxheWVycw=="))(),      Default = false, Tooltip = loadstring(base64decode("SGlnaGxpZ2h0cyBvdGhlciBwbGF5ZXJzLg=="))() })
Groupboxes.Visuals_ESP_Toggles:AddToggle(loadstring(base64decode("Q2hlc3RFU1BUb2dnbGU="))(),      { Text = loadstring(base64decode("Q2hlc3Rz"))(),       Default = false, Tooltip = loadstring(base64decode("SGlnaGxpZ2h0cyBvYmplY3RzIHRoYXQgY2FuIGNvbnRhaW4gbG9vdC4="))() })
Groupboxes.Visuals_ESP_Toggles:AddToggle(loadstring(base64decode("SXRlbUVTUFRvZ2dsZQ=="))(),       { Text = loadstring(base64decode("SXRlbXM="))(),        Default = false, Tooltip = loadstring(base64decode("SGlnaGxpZ2h0cyBhbGwgY29sbGVjdGFibGUgaXRlbXMvY29uc3VtYWJsZXMu"))() })
Groupboxes.Visuals_ESP_Toggles:AddToggle(loadstring(base64decode("Q3VycmVuY3lFU1BUb2dnbGU="))(),   { Text = loadstring(base64decode("Q3VycmVuY3k="))(),     Default = false, Tooltip = loadstring(base64decode("SGlnaGxpZ2h0cyBhbGwgY3VycmVuY3kgdGhhdCBzcGF3bnMu"))() })
Groupboxes.Visuals_ESP_Toggles:AddToggle(loadstring(base64decode("TGFkZGVyRVNQVG9nZ2xl"))(),     { Text = loadstring(base64decode("TGFkZGVycw=="))(),      Default = false, Tooltip = loadstring(base64decode("SGlnaGxpZ2h0cyBsYWRkZXJzIHRoYXQgY2FuIGJlIHVzZWQgdG8gZGlzYWJsZSB0aGUgYW50aWNoZWF0Lg=="))() })
Groupboxes.Visuals_ESP_Toggles:AddToggle(loadstring(base64decode("TWlzY0VTUFRvZ2dsZQ=="))(),       { Text = loadstring(base64decode("TWlzYw=="))(),         Default = false, Tooltip = loadstring(base64decode("SGlnaGxpZ2h0cyBtaXNjZWxsYW5lb3VzIG9iamVjdHMgdGhhdCBjYW4gYmUgdXNlZCB0byBkaXNhYmxlIHRoZSBhbnRpY2hlYXQu"))() })
Groupboxes.Visuals_ESP_Toggles:AddDivider()
Groupboxes.Visuals_ESP_Toggles:AddDropdown(loadstring(base64decode("RW50aXR5RVNQT3B0aW9ucw=="))(),     { 
	Text = loadstring(base64decode("RW50aXR5IExpc3Q="))(),
	Values = { loadstring(base64decode("UnVzaA=="))(),loadstring(base64decode("QmFzaA=="))(),loadstring(base64decode("U2NyaWJibGVz"))(),loadstring(base64decode("VGVsbGVy"))(),loadstring(base64decode("RHJvbmVzU3RhbXBlZGU="))(),loadstring(base64decode("Q3JlYWs="))(),loadstring(base64decode("Tm9pc2U="))(),loadstring(base64decode("Tm9pc2VfVFY="))(),loadstring(base64decode("QmFsbHM="))(),loadstring(base64decode("UG9ydHJhaXQ="))(),loadstring(base64decode("QW1idXNo"))(),loadstring(base64decode("RXllcw=="))(),loadstring(base64decode("RHVwZQ=="))(),loadstring(base64decode("RmlndXJl"))(),loadstring(base64decode("QmxpdHo="))(),loadstring(base64decode("TG9va21hbg=="))(),loadstring(base64decode("U25hcmU="))(),loadstring(base64decode("R2lnZ2xl"))(),loadstring(base64decode("R2xvb21iYXQgRWdncw=="))(),loadstring(base64decode("R3J1bWJsZQ=="))(),loadstring(base64decode("QS02MA=="))(),loadstring(base64decode("QS0xMjA="))(),loadstring(base64decode("U2FsbHk="))(),loadstring(base64decode("SmVmZiB0aGUgS2lsbGVy"))(),loadstring(base64decode("R3JvdW5kc2tlZXBlcg=="))(),loadstring(base64decode("TWFuZHJha2UgSG9sZQ=="))(),loadstring(base64decode("TW9udW1lbnQ="))(),loadstring(base64decode("QnJhbWJsZQ=="))(),loadstring(base64decode("QVIweE1CVVNI"))(),loadstring(base64decode("Uk5JVVNIQ0c9PQ=="))() },
	Multi = true,
	AllowNull = true
})
Groupboxes.Visuals_ESP_Toggles:AddToggle(loadstring(base64decode("RW50aXR5RVNQVG9nZ2xl"))(),     { Text = loadstring(base64decode("RW50aXRpZXM="))(),      Default = false, Tooltip = loadstring(base64decode("SGlnaGxpZ2h0cyBhbGwgZW50aXRpZXMgdGhhdCBzcGF3bi4="))() })

Toggles.DoorESPToggle:AddColorPicker(loadstring(base64decode("RG9vckVTUENvbG9y"))(),           { Text = loadstring(base64decode("RG9vcnM="))(),        Default = Color3.fromRGB(0, 200, 255),  Transparency = 0 })
Toggles.HidingSpotESPToggle:AddColorPicker(loadstring(base64decode("SGlkaW5nU3BvdEVTUENvbG9y"))(), { Text = loadstring(base64decode("SGlkaW5nIFNwb3Rz"))(), Default = Color3.fromRGB(255, 170, 0),  Transparency = 0 })
Toggles.PlayerESPToggle:AddColorPicker(loadstring(base64decode("UGxheWVyRVNQQ29sb3I="))(),       { Text = loadstring(base64decode("UGxheWVycw=="))(),      Default = Color3.fromRGB(255, 255, 255), Transparency = 0 })
Toggles.ChestESPToggle:AddColorPicker(loadstring(base64decode("Q2hlc3RFU1BDb2xvcg=="))(),         { Text = loadstring(base64decode("Q2hlc3Rz"))(),       Default = Color3.fromRGB(255, 255, 0),   Transparency = 0 })
Toggles.ItemESPToggle:AddColorPicker(loadstring(base64decode("SXRlbUVTUENvbG9y"))(),           { Text = loadstring(base64decode("SXRlbXM="))(),        Default = Color3.fromRGB(170, 0, 255),   Transparency = 0 })
Toggles.CurrencyESPToggle:AddColorPicker(loadstring(base64decode("Q3VycmVuY3lFU1BDb2xvcg=="))(),   { Text = loadstring(base64decode("Q3VycmVuY3k="))(),     Default = Color3.fromRGB(255, 255, 0),   Transparency = 0 })
Toggles.LadderESPToggle:AddColorPicker(loadstring(base64decode("TGFkZGVyRVNQQ29sb3I="))(),       { Text = loadstring(base64decode("TGFkZGVycw=="))(),      Default = Color3.fromRGB(3, 67, 71), Transparency = 0 })
Toggles.MiscESPToggle:AddColorPicker(loadstring(base64decode("TWlzY0VTUENvbG9y"))(),           { Text = loadstring(base64decode("TWlzYw=="))(),         Default = Color3.fromRGB(255, 255, 255), Transparency = 0 })
Toggles.EntityESPToggle:AddColorPicker(loadstring(base64decode("RW50aXR5RVNQQ29sb3I="))(),       { Text = loadstring(base64decode("RW50aXRpZXM="))(),     Default = Color3.fromRGB(255, 0, 0),     Transparency = 0 })

local HidingSpotLabels = {
	Wardrobe = loadstring(base64decode("Q2xvc2V0"))(), [loadstring(base64decode("QmFja2Rvb3JfV2FyZHJvYmU="))()] = loadstring(base64decode("Q2xvc2V0"))(), Toolshed = loadstring(base64decode("Q2xvc2V0"))(),
	RetroWardrobe = loadstring(base64decode("Q2xvc2V0"))(), [loadstring(base64decode("V2FyZHJvYmUtRk9PTFMyNg=="))()] = loadstring(base64decode("Q2xvc2V0"))(),
	Locker_Large = loadstring(base64decode("TG9ja2Vy"))(), Rooms_Locker = loadstring(base64decode("SGlkaW5nX1Nwb3Q="))(), Rooms_Locker_Fridge = loadstring(base64decode("TG9ja2Vy"))(),
	Bed = loadstring(base64decode("QmVk"))(), Double_Bed = loadstring(base64decode("RG91YmxlIEJlZA=="))(), CircularVent = loadstring(base64decode("VmVudA=="))(), Dumpster = loadstring(base64decode("RHVtcHN0ZXI="))()
}
local ChestLabels = {
	ChestBox = true, ChestBoxLocked = true, Toolbox = true, Toolbox_Locked = true,
	Chest_Vine = loadstring(base64decode("VmluZSBDaGVzdA=="))(), Toolshed_Small = loadstring(base64decode("VG9vbHNoZWQ="))(), Locker_Small_Locked = loadstring(base64decode("TG9ja2VkIEl0ZW0gTG9ja2Vy"))(), MouseHole = loadstring(base64decode("TW91c2U="))()
}
local EntityESPLabels = {
	JeffTheKiller = loadstring(base64decode("SmVmZiB0aGUgS2lsbGVy"))(), GiggleCeiling = loadstring(base64decode("R2lnZ2xl"))(),
	Snare = loadstring(base64decode("U25hcmU="))(), GrumbleRig = loadstring(base64decode("R3J1bWJsZQ=="))(),
	Drakobloxxer = loadstring(base64decode("RHJha29ibG94eGVy"))(), Hole = loadstring(base64decode("TWFuZHJha2UgSG9sZQ=="))(), Groundskeeper = loadstring(base64decode("R3JvdW5kc2tlZXBlcg=="))(),
	LiveEntityBramble = loadstring(base64decode("QnJhbWJsZQ=="))(), Figure = loadstring(base64decode("RmlndXJl"))(), FigureRig = loadstring(base64decode("RmlndXJl"))(), FigureRagdoll = loadstring(base64decode("RmlndXJl"))(),
	FakeDoor = loadstring(base64decode("RHVwZQ=="))(), DoorFake = loadstring(base64decode("RHVwZQ=="))()
}

local NodeEntities = {
	Rush = true, Bash = true, Scribbles = true, DronesStampede = true, Ambush = true, Eyes = true, Blitz = true, Lookman = true, [loadstring(base64decode("QS02MA=="))()] = true, [loadstring(base64decode("QS0xMjA="))()] = true, Sally = true, [loadstring(base64decode("SmVmZiBUaGUgS2lsbGVy"))()] = true, Monument = true, [loadstring(base64decode("QVIweE1CVVNI"))()] = true, [loadstring(base64decode("Uk5JVVNIQ0c9PQ=="))()] = true
}

Toggles.DoorESPToggle:OnChanged(function(Value)
	for _, Object in Objects.Doors do
		if Value then Functions.AddESP({ Object = Object, Text = loadstring(base64decode("RG9vciA="))() .. Functions.GetDoorNumber(Object), Color = Options.DoorESPColor.Value }, true)
		else Functions.RemoveESP(Object) end
	end
end)
Options.DoorESPColor:OnChanged(function(Value)
	for _, Object in Objects.Doors do IRT.ESPLibrary:UpdateObjectColor(Object, Value) end
end)

Toggles.HidingSpotESPToggle:OnChanged(function(Value)
	for _, Object in Objects.HidingSpots do
		local Label = HidingSpotLabels[Object.Name]
		if Value and Label then Functions.AddESP({ Object = Object, Text = Label, Color = Options.HidingSpotESPColor.Value }, true)
		elseif not Value then Functions.RemoveESP(Object) end
	end
end)
Options.HidingSpotESPColor:OnChanged(function(Value)
	for _, Object in Objects.HidingSpots do IRT.ESPLibrary:UpdateObjectColor(Object, Value) end
end)

Toggles.PlayerESPToggle:OnChanged(function(Value)
	task.wait()
	for _, Player in Services.Players:GetPlayers() do
		if Player.Character and Player ~= LocalPlayer then
			if Value and Player:GetAttribute(loadstring(base64decode("QWxpdmU="))()) == true then
				Functions.AddESP({ Object = Player.Character, Text = Player.Name, Color = Options.PlayerESPColor.Value })
			else
				Functions.RemoveESP(Player.Character)
			end
		end
	end
end)
Options.PlayerESPColor:OnChanged(function(Value)
	for _, Player in Services.Players:GetPlayers() do
		if Player.Character and Player ~= LocalPlayer then
			IRT.ESPLibrary:UpdateObjectColor(Player.Character, Value)
		end
	end
end)

Toggles.ChestESPToggle:OnChanged(function(Value)
	for _, Object in Objects.Chests do
		if Value then
			local Label
			if Object.Name == loadstring(base64decode("Q2hlc3RCb3g="))() or Object.Name == loadstring(base64decode("Q2hlc3RCb3hMb2NrZWQ="))() then
				Label = Object:GetAttribute(loadstring(base64decode("TG9ja2Vk"))()) and loadstring(base64decode("TG9ja2VkIENoZXN0"))() or loadstring(base64decode("Q2hlc3Q="))()
			elseif Object.Name == loadstring(base64decode("VG9vbGJveA=="))() or Object.Name == loadstring(base64decode("VG9vbGJveF9Mb2NrZWQ="))() then
				Label = Object:GetAttribute(loadstring(base64decode("TG9ja2Vk"))()) and loadstring(base64decode("TG9ja2VkIFRvb2xib3g="))() or loadstring(base64decode("VG9vbGJveA=="))()
			elseif ChestLabels[Object.Name] and ChestLabels[Object.Name] ~= true then
				Label = ChestLabels[Object.Name]
			end
			if Label then Functions.AddESP({ Object = Object, Text = Label, Color = Options.ChestESPColor.Value }, true) end
		else
			Functions.RemoveESP(Object)
		end
	end
end)

Options.ChestESPColor:OnChanged(function(Value)
	for _, Object in Objects.Chests do IRT.ESPLibrary:UpdateObjectColor(Object, Value) end
end)

Toggles.ItemESPToggle:OnChanged(function(Value)
	for _, Object in Objects.Items do
		if Value then
			local Label = ItemNames[Object.Name] or (Object.Name == loadstring(base64decode("R3JlZW5fSGVyYg=="))() and loadstring(base64decode("R3JlZW4gSGVyYg=="))())
			if Label then
				Functions.AddESP({ Object = Object, Text = Label, Color = Options.ItemESPColor.Value }, Object:GetAttribute(loadstring(base64decode("UGFyZW50Um9vbQ=="))()) ~= nil)
			end
		else
			Functions.RemoveESP(Object)
		end
	end
end)
Options.ItemESPColor:OnChanged(function(Value)
	for _, Object in Objects.Items do IRT.ESPLibrary:UpdateObjectColor(Object, Value) end
end)

Toggles.CurrencyESPToggle:OnChanged(function(Value)
	for _, Object in Objects.Currency do
		if Value then
			local Label
			if Object.Name == loadstring(base64decode("R29sZFBpbGU="))() and Object:GetAttribute(loadstring(base64decode("R29sZFZhbHVl"))()) then
				Label = loadstring(base64decode("R29sZCBQaWxlIFs="))() .. Object:GetAttribute(loadstring(base64decode("R29sZFZhbHVl"))()) .. loadstring(base64decode("XQ=="))()
			elseif Object.Name == loadstring(base64decode("U3RhcmR1c3RQaWNrdXA="))() then
				Label = loadstring(base64decode("U3RhcmR1c3QgUGlsZQ=="))()
			end
			if Label then Functions.AddESP({ Object = Object, Text = Label, Color = Options.CurrencyESPColor.Value }, true) end
		else
			Functions.RemoveESP(Object)
		end
	end
end)
Options.CurrencyESPColor:OnChanged(function(Value)
	for _, Object in Objects.Currency do IRT.ESPLibrary:UpdateObjectColor(Object, Value) end
end)

Toggles.EntityESPToggle:OnChanged(function(Value)
	for _, Object in Objects.Entities do
		if Value then
			local Label = EntityESPLabels[Object.Name]
			if not Label and Entities[Object.Name] then Label = Entities[Object.Name].Alias end
			if Label and Options.EntityESPOptions.Value[Label] then
				Functions.AddESP({ Object = Object, Text = Label, Color = Options.EntityESPColor.Value }, NodeEntities[Label] ~= true)
			else
				Functions.RemoveESP(Object)
			end
		else
			Functions.RemoveESP(Object)
		end
	end
end)

Options.EntityESPOptions:OnChanged(function(Value)
	for _, Object in Objects.Entities do
		if Toggles.EntityESPToggle.Value then
			local Label = EntityESPLabels[Object.Name]
			if not Label and Entities[Object.Name] then Label = Entities[Object.Name].Alias end
			if Label and Options.EntityESPOptions.Value[Label] then
				Functions.AddESP({ Object = Object, Text = Label, Color = Options.EntityESPColor.Value }, NodeEntities[Label] ~= true)
			else
				Functions.RemoveESP(Object)
			end
		else
			Functions.RemoveESP(Object)
		end
	end
end)

Options.EntityESPColor:OnChanged(function(Value)
	for _, Object in Objects.Entities do IRT.ESPLibrary:UpdateObjectColor(Object, Value) end
end)

Toggles.LadderESPToggle:OnChanged(function(Value)
	for _, Object in Objects.Ladders do
		if Value then Functions.AddESP({ Object = Object, Text = loadstring(base64decode("TGFkZGVy"))(), Color = Options.LadderESPColor.Value }, true)
		else Functions.RemoveESP(Object) end
	end
end)
Options.LadderESPColor:OnChanged(function(Value)
	for _, Object in Objects.Ladders do IRT.ESPLibrary:UpdateObjectColor(Object, Value) end
end)

Toggles.MiscESPToggle:OnChanged(function(Value)
	for _, Object in Objects.Misc do
		if Value then
			local Label = Object.Name
			if Object.Name == loadstring(base64decode("U3RhaXJ3ZWxsTG9ja3BpY2tEb29y"))() or Object.Name == loadstring(base64decode("U3RpYXJ3ZWxsTG9ja3BpY2tEb29y"))() then
				Label = loadstring(base64decode("R2FyYWdlIERvb3I="))()
			elseif Object.Name == loadstring(base64decode("U3RhaXJ3ZWxsRmlyZUFsYXJt"))() then
				Label = loadstring(base64decode("RmlyZSBBbGFybQ=="))()
			elseif Object.Name == loadstring(base64decode("U2hvcHBpbmdDYXJ0"))() then
				Label = loadstring(base64decode("U2hvcHBpbmcgQ2FydA=="))()
			elseif Object.Name == loadstring(base64decode("QXJjaGl2ZXNGaWhUYW5r"))() or Object.Name == loadstring(base64decode("QXJjaGl2ZXNGaXNoVGFuaw=="))() then
				Label = loadstring(base64decode("RmlzaCBUYW5r"))()
			end
			Functions.AddESP({ Object = Object, Text = Label, Color = Options.MiscESPColor.Value }, true)
		else
			Functions.RemoveESP(Object)
		end
	end
end)
Options.MiscESPColor:OnChanged(function(Value)
	for _, Object in Objects.Misc do IRT.ESPLibrary:UpdateObjectColor(Object, Value) end
end)

Groupboxes.Visuals_ESP_Settings:AddToggle(loadstring(base64decode("RVNQUmFpbmJvdw=="))(),     { Text = loadstring(base64decode("UmFpbmJvdyBFZmZlY3Q="))(), Default = false, Tooltip = loadstring(base64decode("TWFrZXMgdGhlIGVzcCBvYmplY3RzIGNoYW5nZSBjb2xvdXIgbGlrZSBhIHJhaW5ib3cu"))() })
Groupboxes.Visuals_ESP_Settings:AddToggle(loadstring(base64decode("RVNQU2hvd0Rpc3RhbmNl"))(),{ Text = loadstring(base64decode("U2hvdyBEaXN0YW5jZQ=="))(),  Default = true,  Tooltip = loadstring(base64decode("U2hvd3MgaG93IGZhciBhd2F5IHlvdXIgY2hhcmFjdGVyIGlzIGZyb20gdGhlIG9iamVjdC4="))() })
Groupboxes.Visuals_ESP_Settings:AddDivider()
Groupboxes.Visuals_ESP_Settings:AddSlider(loadstring(base64decode("RVNQRmlsbFRyYW5zcGFyZW5jeQ=="))(),        { Text = loadstring(base64decode("RmlsbCBUcmFuc3BhcmVuY3k="))(),         Min = 0, Max = 1, Default = 0.75, Rounding = 2, Compact = true })
Groupboxes.Visuals_ESP_Settings:AddSlider(loadstring(base64decode("RVNQT3V0bGluZVRyYW5zcGFyZW5jeQ=="))(),     { Text = loadstring(base64decode("T3V0bGluZSBUcmFuc3BhcmVuY3k="))(),      Min = 0, Max = 1, Default = 0,    Rounding = 2, Compact = true })
Groupboxes.Visuals_ESP_Settings:AddSlider(loadstring(base64decode("RVNQVGV4dFRyYW5zcGFyZW5jeQ=="))(),        { Text = loadstring(base64decode("VGV4dCBUcmFuc3BhcmVuY3k="))(),         Min = 0, Max = 1, Default = 0,    Rounding = 2, Compact = true })
Groupboxes.Visuals_ESP_Settings:AddSlider(loadstring(base64decode("RVNQVGV4dE91dGxpbmVUcmFuc3BhcmVuY3k="))(), { Text = loadstring(base64decode("VGV4dCBPdXRsaW5lIFRyYW5zcGFyZW5jeQ=="))(), Min = 0, Max = 1, Default = 0,    Rounding = 2, Compact = true })
Groupboxes.Visuals_ESP_Settings:AddSlider(loadstring(base64decode("RVNQRmFkZVRpbWU="))(),                { Text = loadstring(base64decode("RmFkZSBUaW1l"))(),                 Min = 0, Max = 1, Default = 0.25, Rounding = 2, Compact = true })
Groupboxes.Visuals_ESP_Settings:AddSlider(loadstring(base64decode("RVNQUmVuZGVyTGltaXQ="))(),             { Text = loadstring(base64decode("UmVuZGVyIExpbWl0"))(),              Min = 30, Max = 240, Default = 240, Rounding = 0, Compact = true })
Groupboxes.Visuals_ESP_Settings:AddSlider(loadstring(base64decode("RVNQVGV4dFNpemU="))(),                { Text = loadstring(base64decode("VGV4dCBTaXpl"))(),                 Min = 12, Max = 24, Default = 20, Rounding = 0, Compact = true })
Groupboxes.Visuals_ESP_Settings:AddDropdown(loadstring(base64decode("RVNQVGV4dEZvbnQ="))(), {
	Text = loadstring(base64decode("VGV4dCBGb250"))(),
	Values = { loadstring(base64decode("TGVnYWN5"))(),loadstring(base64decode("QXJpYWw="))(),loadstring(base64decode("QXJpYWxCb2xk"))(),loadstring(base64decode("U291cmNlU2Fucw=="))(),loadstring(base64decode("U291cmNlU2Fuc0JvbGQ="))(),loadstring(base64decode("U291cmNlU2Fuc0xpZ2h0"))(),loadstring(base64decode("U291cmNlU2Fuc0l0YWxpYw=="))(),loadstring(base64decode("Qm9kb25p"))(),loadstring(base64decode("R2FyYW1vbmQ="))(),loadstring(base64decode("Q2FydG9vbg=="))(),loadstring(base64decode("Q29kZQ=="))(),loadstring(base64decode("SGlnaHdheQ=="))(),loadstring(base64decode("U2NpRmk="))(),loadstring(base64decode("QXJjYWRl"))(),loadstring(base64decode("RmFudGFzeQ=="))(),loadstring(base64decode("QW50aXF1ZQ=="))(),loadstring(base64decode("U291cmNlU2Fuc1NlbWlib2xk"))(),loadstring(base64decode("R290aGFt"))(),loadstring(base64decode("R290aGFtTWVkaXVt"))(),loadstring(base64decode("R290aGFtQm9sZA=="))(),loadstring(base64decode("R290aGFtQmxhY2s="))(),loadstring(base64decode("QW1hdGljU0M="))(),loadstring(base64decode("QmFuZ2Vycw=="))(),loadstring(base64decode("Q3JlZXBzdGVy"))(),loadstring(base64decode("RGVua09uZQ=="))(),loadstring(base64decode("Rm9uZGFtZW50bw=="))(),loadstring(base64decode("RnJlZG9rYU9uZQ=="))(),loadstring(base64decode("R3JlbnplR290aXNjaA=="))(),loadstring(base64decode("SW5kaWVGbG93ZXI="))(),loadstring(base64decode("Sm9zZWZpblNhbnM="))(),loadstring(base64decode("SnVyYQ=="))(),loadstring(base64decode("S2FsYW0="))(),loadstring(base64decode("THVja2llc3RHdXk="))(),loadstring(base64decode("TWVycml3ZWF0aGVy"))(),loadstring(base64decode("TWljaHJvbWE="))(),loadstring(base64decode("TnVuaXRv"))(),loadstring(base64decode("T3N3YWxk"))(),loadstring(base64decode("UGF0cmlja0hhbmQ="))(),loadstring(base64decode("UGVybWFuZW50TWFya2Vy"))(),loadstring(base64decode("Um9ib3Rv"))(),loadstring(base64decode("Um9ib3RvQ29uZGVuc2Vk"))(),loadstring(base64decode("Um9ib3RvTW9ubw=="))(),loadstring(base64decode("U2FycGFuY2g="))(),loadstring(base64decode("U3BlY2lhbEVsaXRl"))(),loadstring(base64decode("VGl0aWxsaXVtV2Vi"))(),loadstring(base64decode("VWJ1bnR1"))(),loadstring(base64decode("QnVpbGRlclNhbnM="))(),loadstring(base64decode("QnVpbGRlclNhbnNNZWRpdW0="))(),loadstring(base64decode("QnVpbGRlclNhbnNCb2xk"))(),loadstring(base64decode("QnVpbGRlclNhbnNFeHRyYUJvbGQ="))(),loadstring(base64decode("QXJpbW8="))(),loadstring(base64decode("QXJpbW9Cb2xk"))() },
	Default = 12
})
Groupboxes.Visuals_ESP_Settings:AddDivider()
Groupboxes.Visuals_ESP_Settings:AddDropdown(loadstring(base64decode("RVNQVHJhY2Vyc09yaWdpbg=="))(),  { Text = loadstring(base64decode("VHJhY2VyIE9yaWdpbg=="))(), Values = { loadstring(base64decode("Qm90dG9t"))(),loadstring(base64decode("Q2VudGVy"))(),loadstring(base64decode("VG9w"))(),loadstring(base64decode("TW91c2U="))() }, Default = 1 })
Groupboxes.Visuals_ESP_Settings:AddSlider(loadstring(base64decode("RVNQVHJhY2VyVGhpY2tuZXNz"))(),  { Text = loadstring(base64decode("VHJhY2VyIFRoaWNrbmVzcw=="))(), Min = 0.5, Max = 2, Default = 0.75, Rounding = 2, Compact = true })
Groupboxes.Visuals_ESP_Settings:AddToggle(loadstring(base64decode("RVNQVHJhY2Vyc1RvZ2dsZQ=="))(),    { Text = loadstring(base64decode("RW5hYmxlIFRyYWNlcnM="))(), Default = false, Tooltip = loadstring(base64decode("RHJhd3MgYSBsaW5lIHRvIGhpZ2hsaWdodGVkIG9iamVjdHMu"))() })
Groupboxes.Visuals_ESP_Settings:AddDivider()
Groupboxes.Visuals_ESP_Settings:AddSlider(loadstring(base64decode("RVNQQXJyb3dzUmFkaXVz"))(),     { Text = loadstring(base64decode("QXJyb3cgUmFkaXVz"))(), Min = 100, Max = 500, Default = 250, Rounding = 0, Compact = true })
Groupboxes.Visuals_ESP_Settings:AddToggle(loadstring(base64decode("RVNQQXJyb3dzVG9nZ2xl"))(),     { Text = loadstring(base64decode("RW5hYmxlIEFycm93cw=="))(), Default = false, Tooltip = loadstring(base64decode("U2hvd3MgYXJyb3cgdGhhdCBwb2ludCB0byBvZmYtc2NyZWVuIG9iamVjdHMu"))() })

IRT.ESPLibrary:SetRainbow(false)
IRT.ESPLibrary:SetShowDistance(true)
IRT.ESPLibrary:SetFillTransparency(0.75)
IRT.ESPLibrary:SetOutlineTransparency(0)
IRT.ESPLibrary:SetTextTransparency(0)
IRT.ESPLibrary:SetTextOutlineTransparency(0)
IRT.ESPLibrary:SetRenderLimit(240)
IRT.ESPLibrary:SetFadeTime(0.25)
IRT.ESPLibrary:SetTextSize(20)
IRT.ESPLibrary:SetFont(Enum.Font.Highway)
IRT.ESPLibrary:SetTracers(false)
IRT.ESPLibrary:SetTracerSize(0.75)
IRT.ESPLibrary:SetTracerOrigin(loadstring(base64decode("Qm90dG9t"))())
IRT.ESPLibrary:SetArrows(false)
IRT.ESPLibrary:SetArrowRadius(250)
IRT.ESPLibrary:SetDistanceSizeRatio(0.8)

Toggles.ESPRainbow:OnChanged(function(V)        IRT.ESPLibrary:SetRainbow(V) end)
Toggles.ESPShowDistance:OnChanged(function(V)   IRT.ESPLibrary:SetShowDistance(V) end)
Options.ESPFillTransparency:OnChanged(function(V)        IRT.ESPLibrary:SetFillTransparency(V) end)
Options.ESPOutlineTransparency:OnChanged(function(V)     IRT.ESPLibrary:SetOutlineTransparency(V) end)
Options.ESPTextTransparency:OnChanged(function(V)        IRT.ESPLibrary:SetTextTransparency(V) end)
Options.ESPTextOutlineTransparency:OnChanged(function(V) IRT.ESPLibrary:SetTextOutlineTransparency(V) end)
Options.ESPFadeTime:OnChanged(function(V)        IRT.ESPLibrary:SetFadeTime(V) end)
Options.ESPRenderLimit:OnChanged(function(V)     IRT.ESPLibrary:SetRenderLimit(V) end)
Options.ESPTextSize:OnChanged(function(V)        IRT.ESPLibrary:SetTextSize(V) end)
Options.ESPTextFont:OnChanged(function(V)        IRT.ESPLibrary:SetFont(Enum.Font[V]) end)
Toggles.ESPTracersToggle:OnChanged(function(V)   IRT.ESPLibrary:SetTracers(V) end)
Options.ESPTracersOrigin:OnChanged(function(V)   IRT.ESPLibrary:SetTracerOrigin(V) end)
Options.ESPTracerThickness:OnChanged(function(V) IRT.ESPLibrary:SetTracerSize(V) end)
Toggles.ESPArrowsToggle:OnChanged(function(V)    IRT.ESPLibrary:SetArrows(V) end)
Options.ESPArrowsRadius:OnChanged(function(V)    IRT.ESPLibrary:SetArrowRadius(V) end)

Tabs.Floors:UpdateWarningBox({
	Visible = true,
	Title = loadstring(base64decode("Q29tcGF0YWJpbGl0eS9SaXNrIFdhcm5pbmc="))(),
	Text = loadstring(base64decode("RmVhdHVyZXMgaGlnaGxpZ2h0ZWQgaW4gcmVkIGFyZSByaXNreSAvIGRvbnQgd29yayBpbiB0aGUgY3VycmVudCBmbG9vci4="))(),
})
Groupboxes.Floors_Automation = Tabs.Floors:AddRightGroupbox(loadstring(base64decode("QXV0b21hdGlvbg=="))())

Groupboxes.Floors_Automation:AddToggle(loadstring(base64decode("U2tpcFNlZWtNaW5lcw=="))(), {
	Text = loadstring(base64decode("U2tpcCBTZWVrIChNaW5lcyk="))(),
	Default = false,
	Tooltip = loadstring(base64decode("U2tpcHMgdGhlIGVudGlyZSBTZWVrIHNlY3Rpb25zLg=="))(),
	Risky = Floor ~= loadstring(base64decode("TWluZXM="))()
})

Toggles.SkipSeekMines:OnChanged(function(Value)
	if Value then
		if Floor ~= loadstring(base64decode("TWluZXM="))() then
			return
		end
		task.spawn(function()
			local MinesSkipSeekCurrentRooms

			repeat
				if not Toggles.SkipSeekMines.Value then
					return
				end

				MinesSkipSeekCurrentRooms = workspace:FindFirstChild(loadstring(base64decode("Q3VycmVudFJvb21z"))())
				task.wait()
			until MinesSkipSeekCurrentRooms

			local MinesSkipSeekStartRoom

			repeat
				if not Toggles.SkipSeekMines.Value then
					return
				end

				MinesSkipSeekCurrentRooms = workspace:FindFirstChild(loadstring(base64decode("Q3VycmVudFJvb21z"))())

				if MinesSkipSeekCurrentRooms then
					MinesSkipSeekStartRoom = MinesSkipSeekCurrentRooms:FindFirstChild(loadstring(base64decode("NDI="))())
				end

				task.wait()
			until MinesSkipSeekStartRoom

			local MinesSkipSeekStartDoor

			repeat
				if not Toggles.SkipSeekMines.Value then
					return
				end

				MinesSkipSeekStartDoor = MinesSkipSeekStartRoom:FindFirstChild(loadstring(base64decode("RG9vcg=="))(), true)
				task.wait()
			until MinesSkipSeekStartDoor

			repeat
				if not Toggles.SkipSeekMines.Value then
					return
				end

				task.wait()
			until MinesSkipSeekStartDoor:GetAttribute(loadstring(base64decode("T3BlbmVk"))()) == true

			if Character and Character:GetAttribute(loadstring(base64decode("TWluZWNhcnRpbmc="))()) == true then
				Character:SetAttribute(loadstring(base64decode("TWluZWNhcnRpbmc="))(), false)
			end

			for _, MinesSkipSeekRoomNumber in ipairs({
				43, 44, 45, 46, 47, 48, 49,
				78, 79, 80, 81, 82, 83
			}) do
				if not Toggles.SkipSeekMines.Value then
					return
				end

				local MinesSkipSeekRoom

				repeat
					if not Toggles.SkipSeekMines.Value then
						return
					end

					MinesSkipSeekCurrentRooms = workspace:FindFirstChild(loadstring(base64decode("Q3VycmVudFJvb21z"))())

					if MinesSkipSeekCurrentRooms then
						MinesSkipSeekRoom = MinesSkipSeekCurrentRooms:FindFirstChild(
							tostring(MinesSkipSeekRoomNumber)
						)
					end

					task.wait()
				until MinesSkipSeekRoom

				local MinesSkipSeekDoor

				repeat
					if not Toggles.SkipSeekMines.Value then
						return
					end

					MinesSkipSeekDoor = MinesSkipSeekRoom:FindFirstChild(loadstring(base64decode("RG9vcg=="))(), true)
					task.wait()
				until MinesSkipSeekDoor

				repeat
					if not Toggles.SkipSeekMines.Value then
						return
					end

					if Character then
						Character:PivotTo(MinesSkipSeekDoor:GetPivot())
					end

					task.wait()
				until MinesSkipSeekDoor:GetAttribute(loadstring(base64decode("T3BlbmVk"))()) == true

				if MinesSkipSeekRoomNumber == 49 or MinesSkipSeekRoomNumber == 83 then
					if not Character then
						return
					end

					local MinesSkipSeekVoidPivot = Character:GetPivot()
					MinesSkipSeekVoidPivot = MinesSkipSeekVoidPivot + Vector3.new(0, -1000, 0)

					task.wait(0.3)

					for MinesSkipSeekVoidCount = 1, 12 do
						Character:PivotTo(MinesSkipSeekVoidPivot)
					end

					for MinesSkipSeekVoidCount = 1, 12 do
						Character:PivotTo(MinesSkipSeekVoidPivot)
					end

					for MinesSkipSeekVoidCount = 1, 12 do
						Character:PivotTo(MinesSkipSeekVoidPivot)
					end

					task.wait(0.3)

					for MinesSkipSeekVoidCount = 1, 6 do
						Character:PivotTo(MinesSkipSeekVoidPivot)
					end
				end

				if MinesSkipSeekRoomNumber == 83 then
					return
				end
			end
		end)
	end
end)

Groupboxes.Floors_Automation:AddToggle(loadstring(base64decode("QXV0b1N0ZWVyTWluZWNhcnQ="))(), {
	Text = loadstring(base64decode("QXV0byBTdGVlciBNaW5lY2FydA=="))(), Default = false, Tooltip = loadstring(base64decode("QXV0b21hdGljYWxseSBjb21wbGV0ZXMgdGhlIG1pbmVjYXJ0IGNoYXNlLg=="))(),
	Disabled = not Functions.CheckCompatability({loadstring(base64decode("cmVxdWlyZQ=="))()}), DisabledTooltip = Globals.IncompatibleMessage
})
Groupboxes.Floors_Automation:AddSlider(loadstring(base64decode("QXV0b1N0ZWVyTWluZWNhcnRUdXJuRGlzdGFuY2U="))(), {
	Text = loadstring(base64decode("VHVybiBEaXN0YW5jZQ=="))(), Min = 20, Max = 40, Default = 30, Rounding = 0,
	Disabled = not Functions.CheckCompatability({loadstring(base64decode("cmVxdWlyZQ=="))()}), DisabledTooltip = Globals.IncompatibleMessage
})
Groupboxes.Floors_Automation:AddSlider(loadstring(base64decode("QXV0b1N0ZWVyTWluZWNhcnREdWNrRGlzdGFuY2U="))(), {
	Text = loadstring(base64decode("Q3JvdWNoIERpc3RhbmNl"))(), Min = 20, Max = 40, Default = 30, Rounding = 0,
	Disabled = not Functions.CheckCompatability({loadstring(base64decode("cmVxdWlyZQ=="))()}), DisabledTooltip = Globals.IncompatibleMessage
})
Groupboxes.Floors_Automation:AddDivider()
Groupboxes.Floors_Automation:AddToggle(loadstring(base64decode("Um9vbXNBdXRvV2Fsaw=="))(),             { Text = loadstring(base64decode("QXV0byBSb29tcw=="))(),       Default = false, Tooltip = loadstring(base64decode("QXV0b21hdGljYWxseSBtb3ZlcyBhbmQgaGlkZXMgZnJvbSBlbnRpdGllcyBpbiBUaGUgUm9vbXMu"))() })
Groupboxes.Floors_Automation:AddSlider(loadstring(base64decode("Um9vbXNBdXRvV2Fsa1BhdGhmaW5kVGltZW91dA=="))(), { Text = loadstring(base64decode("UGF0aGZpbmQgVGltZW91dA=="))(), Min = 0.5, Max = 3, Default = 1, Rounding = 1 })
Groupboxes.Floors_Automation:AddToggle(loadstring(base64decode("Um9vbXNBdXRvV2Fsa0lnbm9yZUE2MA=="))(),    { Text = loadstring(base64decode("SWdub3JlIEEtNjA="))(),      Default = false, Tooltip = loadstring(base64decode("Q29udGludWVzIHRvIHdhbGsgaWYgZW50aXR5ICdBLTYwJyBpcyBwcmVzZW50LCBlbmFibGVzIHBvc2l0aW9uIHNwb29mIGF1dG9tYXRpY2FsbHku"))() })
Groupboxes.Floors_Automation:AddToggle(loadstring(base64decode("Um9vbXNBdXRvV2Fsa1Nob3dQYXRoVG9nZ2xl"))(), { Text = loadstring(base64decode("U2hvdyBQYXRo"))(),       Default = false, Tooltip = loadstring(base64decode("U2hvd3MgdGhlIGN1cnJlbnQgcGF0aCBvZiByb29tcyBhdXRvLXdhbGsu"))() })
Groupboxes.Floors_Automation:AddToggle(loadstring(base64decode("Um9vbXNBdXRvV2Fsa1Nwb29mRm9vdHN0ZXBz"))(), {
    Text = loadstring(base64decode("U3Bvb2YgRm9vdHN0ZXBz"))(), Default = false, Tooltip = loadstring(base64decode("TWFrZXMgaXQgYXBwZWFyIGFzIGlmIHlvdXIgY2hhcmFjdGVyIGlzIHdhbGtpbmcgbm9ybWFsbHku"))(),
    Disabled = not Functions.CheckCompatability({loadstring(base64decode("aG9va21ldGFtZXRob2Q="))(), loadstring(base64decode("bmV3Y2Nsb3N1cmU="))(), loadstring(base64decode("Z2V0bmFtZWNhbGxtZXRob2Q="))()}), DisabledTooltip = Globals.IncompatibleMessage
})

Toggles.RoomsAutoWalk:OnChanged(function()
	for _, Object in Globals.RoomsNodesFolder:GetChildren() do
		if Object.Name == loadstring(base64decode("UGF0aE5vZGU="))() then Object:Destroy() end
	end
end)
Toggles.RoomsAutoWalkShowPathToggle:AddColorPicker(loadstring(base64decode("Um9vbXNBdXRvV2Fsa1Nob3dQYXRoQ29sb3I="))(), { Text = loadstring(base64decode("UGF0aA=="))(), Default = Color3.fromRGB(0, 255, 0), Transparency = 0 })
Toggles.RoomsAutoWalkShowPathToggle:OnChanged(function(Value)
	for _, Object in Globals.RoomsNodesFolder:GetChildren() do
		if Object.Name == loadstring(base64decode("UGF0aE5vZGU="))() then Object.Transparency = Value and 0.5 or 1 end
	end
end)
Options.RoomsAutoWalkShowPathColor:OnChanged(function(Value)
	for _, Object in Globals.RoomsNodesFolder:GetChildren() do
		if Object.Name == loadstring(base64decode("UGF0aE5vZGU="))() then Object.Color = Value end
	end
end)

Functions.RoomsAutoWalk = {}
Functions.RoomsAutoWalk.GetNearestHidingSpot = function()
	local Nearest = { Distance = math.huge, Object = nil }
	for _, Object in Objects.HidingSpots do
		if Object.PrimaryPart and Object:FindFirstChild(loadstring(base64decode("SGlkZVByb21wdA=="))()) then
			local Distance = LocalPlayer:DistanceFromCharacter(Object.PrimaryPart.Position)
			if Distance < Nearest.Distance and Object.PrimaryPart.Position.Y > -10 then
				local HiddenPlayer = Object:FindFirstChild(loadstring(base64decode("SGlkZGVuUGxheWVy"))(), true)
				if HiddenPlayer and not HiddenPlayer.Value then
					Nearest.Distance = Distance
					Nearest.Object = Object
				end
			end
		end
	end
	return Nearest.Object
end

local RoomsEntityList = { loadstring(base64decode("UnVzaE1vdmluZw=="))(),loadstring(base64decode("QW1idXNoTW92aW5n"))(),loadstring(base64decode("QmFja2Rvb3JSdXNo"))(),loadstring(base64decode("QTYw"))(),loadstring(base64decode("QTEyMA=="))(),loadstring(base64decode("Q3VzdG9tRW50aXR5"))(),loadstring(base64decode("R2xpdGNoUnVzaA=="))(),loadstring(base64decode("R2xpdGNoQW1idXNo"))() }
Functions.RoomsAutoWalk.GetPathfindTarget = function()
	for _, Object in Services.Workspace:GetChildren() do
		if table.find(RoomsEntityList, Object.Name) and Object.PrimaryPart then
			local Y = Object.PrimaryPart.Position.Y
			if Y > -10 and Y < 150 then
				if Object.Name == loadstring(base64decode("QTYw"))() and not Toggles.RoomsAutoWalkIgnoreA60.Value or Object.Name ~= loadstring(base64decode("QTYw"))() then
					return Functions.RoomsAutoWalk.GetNearestHidingSpot() or CurrentRooms[tostring(LatestRoom.Value)]:FindFirstChild(loadstring(base64decode("Um9vbUV4aXQ="))())
				end
			end
		end
	end
	return CurrentRooms[tostring(LatestRoom.Value)]:FindFirstChild(loadstring(base64decode("Um9vbUV4aXQ="))())
end

Connections.RoomsAutoWalkHandler = Services.RunService.Heartbeat:Connect(function()
	if Floor ~= loadstring(base64decode("Um9vbXM="))() or not Toggles.RoomsAutoWalk.Value or Globals.RoomsAutoWalkActive or not CollisionPart or LatestRoom.Value >= 1000 then return end
	Globals.RoomsAutoWalkActive = true

	local Path = Services.PathfindingService:CreatePath({
		AgentCanJump = true, AgentCanClimb = false, WaypointSpacing = 4,
		AgentRadius = 1.5, AgentHeight = 1.5, Costs = { StuckPart = 8 }
	})

	if Toggles.RoomsAutoWalkIgnoreA60.Value and not Toggles.PositionSpoof.Value then
		Toggles.PositionSpoof:SetValue(true)
	end

	local TargetPart = Functions.RoomsAutoWalk.GetPathfindTarget()
	if not TargetPart then
		Globals.RoomsAutoWalkActive = false
		return
	end

	local TargetPosition
	if TargetPart.Name == loadstring(base64decode("Um9vbUV4aXQ="))() then
		TargetPosition = TargetPart.Position
	elseif TargetPart:FindFirstChild(loadstring(base64decode("SGlkZVByb21wdA=="))()) then
		for _, Part in TargetPart:GetDescendants() do
			if Part:IsA(loadstring(base64decode("QmFzZVBhcnQ="))()) then Part.CanCollide = false end
		end
		TargetPosition = TargetPart.PrimaryPart.Position
	end

	if CollisionPart.Anchored and not TargetPart:FindFirstChild(loadstring(base64decode("SGlkZVByb21wdA=="))()) then
		Character:SetAttribute(loadstring(base64decode("SGlkaW5n"))(), true)
		RemotesFolder.CamLock:FireServer()
		Character:SetAttribute(loadstring(base64decode("SGlkaW5n"))(), false)
	end

	local CurrentRoom = CurrentRooms[tostring(LatestRoom.Value)]
	if CurrentRoom:FindFirstChild(loadstring(base64decode("RG9vcg=="))()) then
		CurrentRoom.Door.Door.CanCollide = false
	end

	if not TargetPosition or LocalPlayer:DistanceFromCharacter(TargetPosition) >= 750 then
		Globals.RoomsAutoWalkActive = false
		return
	end

	Path:ComputeAsync(CollisionPart.Position, TargetPosition)
	local Waypoints = Path:GetWaypoints()

	if #Waypoints == 0 then
		local RoomExit = CurrentRoom:FindFirstChild(loadstring(base64decode("Um9vbUV4aXQ="))())
		if RoomExit then Humanoid:MoveTo(RoomExit.Position) end
		Globals.RoomsAutoWalkActive = false
		return
	end

	for _, Node in Globals.RoomsNodesFolder:GetChildren() do
		if Node.Name == loadstring(base64decode("UGF0aE5vZGU="))() then Node:Destroy() end
	end

	for _, Waypoint in Waypoints do
		local Block = Instance.new(loadstring(base64decode("UGFydA=="))(), Globals.RoomsNodesFolder)
		Block.Transparency = Toggles.RoomsAutoWalkShowPathToggle.Value and 0.5 or 1
		Block.Size = Vector3.one
		Block.Position = Waypoint.Position
		Block.Shape = Enum.PartType.Ball
		Block.CanCollide = false
		Block.Anchored = true
		Block.Name = loadstring(base64decode("UGF0aE5vZGU="))()
		Block.Color = Options.RoomsAutoWalkShowPathColor.Value
		Block.Material = Enum.Material.Neon
	end

	local Stuck = false
	for _, Waypoint in Waypoints do
		if Stuck or not Toggles.RoomsAutoWalk.Value then break end

		local Finished = false
		local Start = tick()

		local StepConnection = Services.RunService.RenderStepped:Connect(function()
			if Stuck or not Toggles.RoomsAutoWalk.Value then Finished = true return end

			local NewTarget = Functions.RoomsAutoWalk.GetPathfindTarget()
			if NewTarget and NewTarget:FindFirstChild(loadstring(base64decode("SGlkZVByb21wdA=="))()) and not TargetPart:FindFirstChild(loadstring(base64decode("SGlkZVByb21wdA=="))()) then
				Finished = true return
			end
			if TargetPart:FindFirstChild(loadstring(base64decode("SGlkZVByb21wdA=="))()) then
				local HidePrompt = TargetPart:FindFirstChild(loadstring(base64decode("SGlkZVByb21wdA=="))())
				if LocalPlayer:DistanceFromCharacter(TargetPosition) < HidePrompt.MaxActivationDistance
					and Character:GetAttribute(loadstring(base64decode("SGlkaW5n"))()) ~= true
				then
					Functions.ForceFirePrompt(HidePrompt)
				end
			end
			local FlatPos = Vector3.new(Waypoint.Position.X, RootPart.Position.Y, Waypoint.Position.Z)
			if LocalPlayer:DistanceFromCharacter(FlatPos) < 5 then Finished = true end
			Humanoid:MoveTo(Waypoint.Position)
		end)

		while not Finished do
			if tick() - Start > Options.RoomsAutoWalkPathfindTimeout.Value then
				local StuckBlock = Instance.new(loadstring(base64decode("UGFydA=="))(), Globals.RoomsNodesFolder)
				StuckBlock.Transparency = 1
				StuckBlock.Size = Vector3.one
				StuckBlock.CFrame = Collision.CFrame
				StuckBlock.Shape = Enum.PartType.Ball
				StuckBlock.CanCollide = false
				StuckBlock.Anchored = true
				StuckBlock.Name = loadstring(base64decode("U3R1Y2tQYXJ0"))()
				local Modifier = Instance.new(loadstring(base64decode("UGF0aGZpbmRpbmdNb2RpZmllcg=="))(), StuckBlock)
				Modifier.Label = loadstring(base64decode("U3R1Y2tQYXJ0"))()
				Stuck = true
				break
			end
			task.wait()
		end
		StepConnection:Disconnect()
		Humanoid:MoveTo(RootPart.Position)
	end

	Globals.RoomsAutoWalkActive = false
end)

Connections.RoomsHandler = CurrentRooms.ChildAdded:Connect(function(Room)
	for _, Object in Globals.RoomsNodesFolder:GetChildren() do
		if Object.Name == loadstring(base64decode("U3R1Y2tQYXJ0"))() then Object:Destroy() end
	end

	if Room:GetAttribute(loadstring(base64decode("UmF3TmFtZQ=="))()) and string.find(Room:GetAttribute(loadstring(base64decode("UmF3TmFtZQ=="))()), loadstring(base64decode("RXllc3RhbGs="))()) then
        local PreviousNode = nil

		local function CreateEyestalkNode(WaypointPos)
			local NewNode = Instance.new(loadstring(base64decode("UGFydA=="))())
			NewNode.Size = Vector3.one
			NewNode.Transparency = 1
			NewNode.Parent = Globals.SeekNodesFolder
			NewNode.Anchored = true
			NewNode.Position = WaypointPos
			NewNode.CanCollide = false
			NewNode.Name = loadstring(base64decode("U2Vla0xpZ2h0Tm9kZQ=="))()

			local PrevNode = PreviousNode or NewNode
			PreviousNode = NewNode

			local NewBeam = Instance.new(loadstring(base64decode("QmVhbQ=="))())
			NewBeam.Color = ColorSequence.new({ ColorSequenceKeypoint.new(0, Options.ShowEyestalkPathColor.Value), ColorSequenceKeypoint.new(1, Options.ShowEyestalkPathColor.Value) })
			NewBeam.FaceCamera = true
			NewBeam.Width0 = 0.2
			NewBeam.Width1 = 0.2
			NewBeam.Brightness = 10
			NewBeam.LightInfluence = 0
			NewBeam.LightEmission = 0
			NewBeam.Enabled = true

			local Vis = Toggles.ShowEyestalkPathToggle.Value and 0 or 1
			NewBeam.Transparency = NumberSequence.new({ NumberSequenceKeypoint.new(0, Vis), NumberSequenceKeypoint.new(1, Vis) })
			NewBeam.Parent = Globals.SeekNodesFolder

			local A0 = Instance.new(loadstring(base64decode("QXR0YWNobWVudA=="))(), NewNode)
			local A1 = Instance.new(loadstring(base64decode("QXR0YWNobWVudA=="))(), PrevNode)
			NewBeam.Attachment0 = A0
			NewBeam.Attachment1 = A1

			table.insert(Objects.EyestalkHighlights, NewBeam)
		end

		Room:WaitForChild(loadstring(base64decode("Um9vbUVudHJhbmNl"))(), 9e9)
		Room:WaitForChild(loadstring(base64decode("Um9vbUV4aXQ="))(), 9e9)

		while not Room:GetAttribute(loadstring(base64decode("UGF0aEZvdW5k"))()) do
			if Toggles.ShowEyestalkPathToggle.Value then
				local EyePath = game:GetService(loadstring(base64decode("UGF0aGZpbmRpbmdTZXJ2aWNl"))()):CreatePath({
					AgentCanJump = false, AgentCanClimb = false, WaypointSpacing = 2, AgentRadius = 1, AgentHeight = 1
				})
				EyePath:ComputeAsync(RootPart.Position, Room.RoomExit.Position)
				if EyePath.Status == Enum.PathStatus.Success then
					Room:SetAttribute(loadstring(base64decode("UGF0aEZvdW5k"))(), true)
					for _, Waypoint in EyePath:GetWaypoints() do
						CreateEyestalkNode(Waypoint.Position)
						task.wait()
					end
                    break
				end
			end
			task.wait(0.25)
		end
	end
end)

Groupboxes.Floors_Completion = Tabs.Floors:AddRightGroupbox(loadstring(base64decode("Q29tcGxldGlvbg=="))())
Groupboxes.Floors_Completion:AddButton({
    Text = loadstring(base64decode("QXV0byBDb21wbGV0ZSBEYW0gU2Vlaw=="))(),
    Tooltip = loadstring(base64decode("QXV0b21hdGljYWxseSB0ZWxlcG9ydHMgdG8gYW5kIGludGVyYWN0cyB3aXRoIGVhY2ggd2F0ZXIgcHVtcC4="))(),
    Func = function()
        if LatestRoom.Value < 100 or Floor ~= loadstring(base64decode("TWluZXM="))() then
            Functions.Notify({Title = loadstring(base64decode("WW91IG11c3QgYmUgaW4gUm9vbSAyMDAgdG8gZG8gdGhpcy4="))()})
            return
        end

		local IsCutscene = false
		local CutsceneConnection = RemotesFolder.Cutscene.OnClientEvent:Connect(function()
			IsCutscene = true
			task.wait(7)
			IsCutscene = false
		end)

        local function GetNextPump()
            local Highest = {
                Height = -69420,
                Object = nil
            }
            for _, Object in pairs(Objects.Objectives) do
                if Object.Name == loadstring(base64decode("V2F0ZXJQdW1w"))() and Object:GetAttribute(loadstring(base64decode("SVJUX0NvbXBsZXRlZA=="))()) ~= true then
                    if Object.PrimaryPart and Object.PrimaryPart.Position.Y > Highest.Height then
                        Highest.Object = Object
                        Highest.Height = Object.PrimaryPart.Position.Y
                    end
                end
            end
            return Highest.Object
        end

        local function HandlePump(Pump)

            while task.wait(0.1) do
				if IsCutscene then
					continue
				end

                Character:PivotTo(Pump:GetPivot())

                local Prompt = Pump:FindFirstChild(loadstring(base64decode("VmFsdmVQcm9tcHQ="))(), true)
                if Prompt then
                    Functions.ForceFirePrompt(Prompt)
                end

                if Pump:GetAttribute(loadstring(base64decode("SVJUX0NvbXBsZXRlZA=="))()) then
                    break
                end
            end
        end

        Functions.Notify({Title = loadstring(base64decode("QXR0ZW1wdGluZyB0byBjb21wbGV0ZSB0aGUgdmFsdmVzLg=="))(), Body = loadstring(base64decode("UGxlYXNlIHdhaXQu"))()})
        while task.wait(0.1) do
            local Pump = GetNextPump()
            if Pump then
                HandlePump(Pump)
            else
                break
            end
        end
        Functions.Notify({Title = loadstring(base64decode("U3VjY2Vzc2Z1bGx5IGNvbXBsZXRlZCB0aGUgdmFsdmVzLg=="))()})
    end
})

Groupboxes.Floors_Completion:AddButton({
    Text = loadstring(base64decode("QXV0byBDb21wbGV0ZSBDcmluZ2xl"))(),
    Tooltip = loadstring(base64decode("SW5zdGFudGx5IGNvbXBsZXRlcyB0aGUgcXVlc3Qu"))(),
    Func = function()
        local TouchPart = CurrentRooms:FindFirstChild(loadstring(base64decode("UmlwcGxlRXhpdERvb3I="))(), true)
        if TouchPart then
            Character:PivotTo(TouchPart:GetPivot())
        end
    end
})

Groupboxes.Floors_Visuals = Tabs.Floors:AddLeftGroupbox(loadstring(base64decode("VmlzdWFscw=="))())
Groupboxes.Floors_Visuals:AddToggle(loadstring(base64decode("U2hvd1NlZWtQYXRoVG9nZ2xl"))(), {
	Text = loadstring(base64decode("U2hvdyBTZWVrIFBhdGg="))(), Default = false, Tooltip = loadstring(base64decode("U2hvd3MgeW91IHRoZSBjb3JyZWN0IHBhdGggaW4gc2VlayBjaGFzZXMu"))(),
	Risky = Floor ~= loadstring(base64decode("TWluZXM="))()
})
Toggles.ShowSeekPathToggle:AddColorPicker(loadstring(base64decode("U2hvd1NlZWtQYXRoQ29sb3I="))(), { Text = loadstring(base64decode("U2VlayBQYXRo"))(), Default = Color3.fromRGB(0, 255, 0), Transparency = 0 })

local function UpdateBeamVisibility(BeamTable, ColorKey, Visible)
	local Vis = Visible and 0 or 1
	local Seq = NumberSequence.new({ NumberSequenceKeypoint.new(0, Vis), NumberSequenceKeypoint.new(1, Vis) })
	for _, Beam in BeamTable do Beam.Transparency = Seq end
end
local function UpdateBeamColor(BeamTable, Value)
	local Seq = ColorSequence.new({ ColorSequenceKeypoint.new(0, Value), ColorSequenceKeypoint.new(1, Value) })
	for _, Beam in BeamTable do Beam.Color = Seq end
end

Toggles.ShowSeekPathToggle:OnChanged(function(V)  UpdateBeamVisibility(Objects.SeekHighlights, loadstring(base64decode("U2hvd1NlZWtQYXRoQ29sb3I="))(), V) end)
Options.ShowSeekPathColor:OnChanged(function(V)   UpdateBeamColor(Objects.SeekHighlights, V) end)

Groupboxes.Floors_Visuals:AddToggle(loadstring(base64decode("U2hvd0V5ZXN0YWxrUGF0aFRvZ2dsZQ=="))(), {
	Text = loadstring(base64decode("U2hvdyBFeWVzdGFsayBQYXRo"))(), Default = false, Tooltip = loadstring(base64decode("U2hvd3MgeW91IHRoZSBjb3JyZWN0IHBhdGggaW4gdGhlIGV5ZXN0YWxrIGNoYXNlLg=="))(),
	Risky = Floor ~= loadstring(base64decode("R2FyZGVu"))()
})
Toggles.ShowEyestalkPathToggle:AddColorPicker(loadstring(base64decode("U2hvd0V5ZXN0YWxrUGF0aENvbG9y"))(), { Text = loadstring(base64decode("RXllc3RhbGsgUGF0aA=="))(), Default = Color3.fromRGB(0, 255, 0), Transparency = 0 })
Toggles.ShowEyestalkPathToggle:OnChanged(function(V) UpdateBeamVisibility(Objects.EyestalkHighlights, loadstring(base64decode("U2hvd0V5ZXN0YWxrUGF0aENvbG9y"))(), V) end)
Options.ShowEyestalkPathColor:OnChanged(function(V)  UpdateBeamColor(Objects.EyestalkHighlights, V) end)

Groupboxes.Floors_Bypass = Tabs.Floors:AddLeftGroupbox(loadstring(base64decode("QnlwYXNz"))())
Groupboxes.Floors_Bypass:AddToggle(loadstring(base64decode("UmVtb3ZlU2Vla1RyaWdnZXI="))(), {
	Text = loadstring(base64decode("RGVsZXRlIFNlZWsgVHJpZ2dlcg=="))(), Default = false, Tooltip = loadstring(base64decode("RGlhYmxlcyB0aGUgJ1NlZWsnIGNoYXNlIHRyaWdnZXIu"))(),
	Risky = not (Floor == loadstring(base64decode("Rm9vbHM="))() or Floor == loadstring(base64decode("T2xkSG90ZWw="))()),
	Disabled = not Functions.CheckCompatability({loadstring(base64decode("ZmlyZXRvdWNoaW50ZXJlc3Q="))()}), DisabledTooltip = Globals.IncompatibleMessage
})
Groupboxes.Floors_Bypass:AddToggle(loadstring(base64decode("UmVtb3ZlRmlndXJl"))(), {
	Text = loadstring(base64decode("RGVsZXRlIEZpZ3VyZQ=="))(), Default = false, Tooltip = loadstring(base64decode("Q29tcGxldGVseSByZW1vdmVzIHRoZSBlbnRpdHkgJ0ZpZ3VyZScgKGRvZXNuJ3QgYWx3YXlzIHdvcmspLg=="))(),
	Risky = not (Floor == loadstring(base64decode("Rm9vbHM="))() or Floor == loadstring(base64decode("T2xkSG90ZWw="))() or Floor == loadstring(base64decode("TWluZXM="))()),
	Disabled = not Functions.CheckCompatability({loadstring(base64decode("aXNuZXR3b3Jrb3duZXI="))()}), DisabledTooltip = Globals.IncompatibleMessage
})
Groupboxes.Floors_Bypass:AddToggle(loadstring(base64decode("QXV0b1Jldml2ZQ=="))(), {
	Text = loadstring(base64decode("SW5maW5pdGUgUmV2aXZlcw=="))(), Default = false, Tooltip = loadstring(base64decode("QXV0b21hdGljYWxseSByZXZpdmVzIGFmdGVyIGR5aW5nLCB3aXRoIHVubGltaXRlZCByZXNwYXducy4="))(),
	Risky = not (Floor == loadstring(base64decode("Rm9vbHM="))() or Floor == loadstring(base64decode("T2xkSG90ZWw="))())
})
Groupboxes.Floors_Bypass:AddToggle(loadstring(base64decode("RmlndXJlR29kbW9kZQ=="))(), {
	Text = loadstring(base64decode("RmlndXJlIEdvZG1vZGU="))(), Default = false, Tooltip = loadstring(base64decode("UHJldmVudHMgJ0ZpZ3VyZScgZnJvbSBodXJ0aW5nIHlvdS4="))(),
	Risky = not (Floor == loadstring(base64decode("Rm9vbHM="))() or Floor == loadstring(base64decode("T2xkSG90ZWw="))())
})
Groupboxes.Floors_Bypass:AddDivider()
Groupboxes.Floors_Bypass:AddToggle(loadstring(base64decode("UmVtb3ZlQmFzZW1lbnRHYXRl"))(),  { Text = loadstring(base64decode("UmVtb3ZlIEJhc2VtZW50IEdhdGU="))(),   Default = false, Tooltip = loadstring(base64decode("UmVtb3ZlcyB0aGUgZ2F0ZSBmcm9tIGJhc2VtZW50IHJvb21zLg=="))(),            Risky = not (Floor == loadstring(base64decode("Rm9vbHM="))() or Floor == loadstring(base64decode("T2xkSG90ZWw="))()) })
Groupboxes.Floors_Bypass:AddToggle(loadstring(base64decode("UmVtb3ZlUGFpbnRpbmdzRG9vcg=="))(), { Text = loadstring(base64decode("UmVtb3ZlIFBhaW50aW5ncyBEb29y"))(),  Default = false, Tooltip = loadstring(base64decode("UmVtb3ZlcyB0aGUgZmlyZXBsYWNlIGRvb3JzIGZyb20gcGFpbnRpbmcgcm9vbXMu"))(), Risky = not (Floor == loadstring(base64decode("Rm9vbHM="))() or Floor == loadstring(base64decode("T2xkSG90ZWw="))()) })
Groupboxes.Floors_Bypass:AddToggle(loadstring(base64decode("UmVtb3ZlU2tlbGV0b25Eb29y"))(),  { Text = loadstring(base64decode("UmVtb3ZlIFNrZWxldG9uIERvb3I="))(),   Default = false, Tooltip = loadstring(base64decode("UmVtb3ZlcyB0aGUgc2tlbGV0b24gZG9vciBmcm9tIHRoZSBpbmZpcm1hcnku"))(),    Risky = Floor ~= loadstring(base64decode("Rm9vbHM="))() })

local ObstructionNames = { ThingToOpen = loadstring(base64decode("UmVtb3ZlQmFzZW1lbnRHYXRl"))(), MovingDoor = loadstring(base64decode("UmVtb3ZlUGFpbnRpbmdzRG9vcg=="))(), Wax_Door = loadstring(base64decode("UmVtb3ZlU2tlbGV0b25Eb29y"))() }
for ObjName, ToggleName in ObstructionNames do
	Toggles[ToggleName]:OnChanged(function(Value)
		for _, Object in Objects.Obstructions do
			if Object.Name == ObjName then
				Object:PivotTo(Value and CFrame.new(-10000, -10000, -10000) or Object:GetAttribute(loadstring(base64decode("T3JpZ2luYWxQb3NpdGlvbg=="))()))
			end
		end
	end)
end

Groupboxes.Floors_Farming = Tabs.Floors:AddLeftGroupbox(loadstring(base64decode("RmFybWluZw=="))())
Groupboxes.Floors_Farming:AddToggle(loadstring(base64decode("S25vYkZhcm0="))(), {
    Text = loadstring(base64decode("S25vYiBGYXJt"))(),
    Default = false,
    Tooltip = loadstring(base64decode("QXV0b21hdGljYWxseSBnYWlucyBrbm9icyBmb3IgeW91LCBkaWVzIGFuZCByZXZpdmVzIHJlcGVhdGVkbHku"))(),
	Risky = Floor ~= loadstring(base64decode("QmFsbHo="))(),
})

Groupboxes.Floors_Farming:AddButton({
    Text = loadstring(base64decode("U3RhcnQgS25vYiBGYXJt"))(),
    Tooltip = loadstring(base64decode("U3RhcnRzIGZhcm1pbmcga25vYnMsIGNsaWNrIHRoaXMgd2hlbiB5b3UgaGF2ZSBlbm91Z2ggZ29sZC4="))(),
    Func = function()
		if LatestRoom.Value ~= 0 then
			Functions.Notify({Title = loadstring(base64decode("WW91IG11c3QgYmUgaW4gUm9vbSAwIHRvIHVzZSB0aGlzLg=="))()})
			return
		end

		if LocalPlayer.PlayerGui:FindFirstChild(loadstring(base64decode("VG9wYmFyVUk="))()) then 
			local GoldCount = LocalPlayer.PlayerGui.TopbarUI.Topbar.StatsTopbarHandler.StatModules.Gold.GoldVal
			if GoldCount.Value <= 0 then
				Functions.Notify({Title = loadstring(base64decode("WW91IG11c3QgaGF2ZSBnb2xkIHRvIGRvIHRoaXMu"))()})
				return
			end
		end

        Globals.KnobFarmStarted = true
    end
})

Groupboxes.Floors_Farming:AddDivider()
Groupboxes.Floors_Farming:AddButton({
	Text = loadstring(base64decode("U3RhcnQgRGVhdGggRmFybQ=="))(),
	DoubleClick = true,
	Tooltip = loadstring(base64decode("QXV0b21hdGljYWxseSBmYXJtcyBkZWF0aHMsIGpvaW5pbmcgbmV3IHJ1bnMu"))(),
	Func = function()
		loadstring(game:HttpGet(loadstring(base64decode("aHR0cHM6Ly9yYXcuZ2l0aHVidXNlcmNvbnRlbnQuY29tL2JvY2FqMTExMDA0L0FieXNhbGwvcmVmcy9oZWFkcy9tYWluL1NjcmlwdHMvRGVhdGhGYXJtLmx1YXU="))()))()
	end,

	Disabled = not Functions.CheckCompatability({loadstring(base64decode("ZmlyZXByb3hpbWl0eXByb21wdA=="))(), loadstring(base64decode("ZmlyZXNpZ25hbA=="))()}),
	DisabledTooltip = Globals.ImcompatibleMessage
})
Groupboxes.Floors_Farming:AddButton({
	Text = loadstring(base64decode("Q29weSBEZWF0aCBGYXJtIExvYWRzdHJpbmc="))(),
	DoubleClick = false,
	Tooltip = loadstring(base64decode("Q29waWVzIHRoZSBkZWF0aCBmYXJtIGxvYWRzdHJpbmcgdG8geW91ciBjbGlwYm9hcmQu"))(),
	Func = function()
		toclipboard([==[
			loadstring(game:HttpGet(loadstring(base64decode("aHR0cHM6Ly9yYXcuZ2l0aHVidXNlcmNvbnRlbnQuY29tL2JvY2FqMTExMDA0L0FieXNhbGwvcmVmcy9oZWFkcy9tYWluL1NjcmlwdHMvRGVhdGhGYXJtLmx1YXU="))()))()
		]==])
		Library:Notify(loadstring(base64decode("TG9hZHN0cmluZyBoYXMgYmVlbiBjb3BpZWQgdG8geW91ciBjbGlwYm9hcmQu"))())
	end,

	Disabled = not Functions.CheckCompatability({loadstring(base64decode("ZmlyZXByb3hpbWl0eXByb21wdA=="))(), loadstring(base64decode("ZmlyZXNpZ25hbA=="))()}),
	DisabledTooltip = Globals.ImcompatibleMessage
})

Toggles.KnobFarm:OnChanged(function(Value)
    if Value then
        Functions.Notify({Title = loadstring(base64decode("UGxlYXNlIGNvbGxlY3Qgc29tZSBnb2xkIHRvIGVhcm4ga25vYnMu"))(), Body = loadstring(base64decode("Q2xpY2sgJ1N0YXJ0IEtub2IgRmFybScgd2hlbiB5b3UncmUgcmVhZHku"))()})
	else
		Globals.KnobFarmStarted = false
    end
end)

Globals.KnobFarmActive = false
Globals.KnobFarmStarted = false
Connections.KnobFarm = Services.RunService.Heartbeat:Connect(function()
	if Toggles.KnobFarm.Value and Globals.KnobFarmStarted then
		if not Globals.KnobFarmActive then
			Globals.KnobFarmActive = true
			if Functions.CheckCompatability({loadstring(base64decode("cmVwbGljYXRlc2lnbmFs"))()}) then
				IRT.Environment.replicatesignal(LocalPlayer.Kill)
			else
				LocalPlayer.Character.Humanoid.Health = 0
			end
			while task.wait() do
				if LocalPlayer:GetAttribute(loadstring(base64decode("QWxpdmU="))()) then
					break
				end
			end
			RemotesFolder.Statistics:FireServer()
			task.wait(0.25)
			Globals.KnobFarmActive = false
		end
	end
end)

local MainHook
local OtherHook
if Functions.CheckCompatability({loadstring(base64decode("aG9va21ldGFtZXRob2Q="))(), loadstring(base64decode("bmV3Y2Nsb3N1cmU="))(), loadstring(base64decode("Z2V0bmFtZWNhbGxtZXRob2Q="))()}) then
	MainHook = IRT.Environment.hookmetamethod(game, loadstring(base64decode("X19uYW1lY2FsbA=="))(), IRT.Environment.newcclosure(function(Self, ...)
		local Args = { ... }
		if IRT and IRT.Environment then
			local Method = IRT.Environment.getnamecallmethod()

			if Self.Name == loadstring(base64decode("Q3JvdWNo"))() and Method == loadstring(base64decode("RmlyZVNlcnZlcg=="))() then
				if Toggles.CrouchSpoof.Value or Toggles.PositionSpoof.Value then
					Args[1] = true
				end
				Args[2] = true
			end

			if Self.Name == loadstring(base64decode("Q2x1dGNoSGVhcnRiZWF0"))() and Method == loadstring(base64decode("RmlyZVNlcnZlcg=="))() and Toggles.AutoHeartbeatMinigame.Value or Self.Name == loadstring(base64decode("SGlkZU1vbnN0ZXI="))() and Method == loadstring(base64decode("RmlyZVNlcnZlcg=="))() and Toggles.AutoHeartbeatMinigame.Value then
				return
			end

			if Self.Name == loadstring(base64decode("TW90b3JSZXBsaWNhdGlvbg=="))() and Method == loadstring(base64decode("RmlyZVNlcnZlcg=="))() then
				local DoBypass = (Toggles.BypassEyes.Value and Globals.IsEyes) or (Toggles.BypassLookman.Value and Globals.IsLookman)
				if DoBypass then
					if Floor == loadstring(base64decode("Rm9vbHM="))() or Floor == loadstring(base64decode("T2xkSG90ZWw="))() then
						Args[1] = 0 Args[2] = (Globals.SpoofOffset == 200 and 65 or -65) Args[3] = 0 Args[4] = false
					else
						Args[1] = -650
					end
				end
			end
		end
		return MainHook(Self, table.unpack(Args))
	end))

    OtherHook = IRT.Environment.hookmetamethod(game, loadstring(base64decode("X19pbmRleA=="))(), IRT.Environment.newcclosure(function(Self, Property)
        local Real = OtherHook(Self, Property)

        if Property == loadstring(base64decode("TW92ZURpcmVjdGlvbg=="))() and Self == Humanoid and Globals.RoomsAutoWalkActive and Toggles.RoomsAutoWalkSpoofFootsteps.Value and Floor == loadstring(base64decode("Um9vbXM="))() and not Character:GetAttribute(loadstring(base64decode("SGlkaW5n"))()) then
            return RootPart.CFrame.LookVector
        end
        
        return Real
    end))
end

if Services.ReplicatedStorage:FindFirstChild(loadstring(base64decode("TW9kdWxlc0NsaWVudA=="))()) then
	ClientModules = Services.ReplicatedStorage.ModulesClient
else
	ClientModules = Services.ReplicatedStorage.ClientModules
end

Modules = {
	Glitch         = ClientModules.EntityModules.Glitch,
	Shade          = ClientModules.EntityModules.Shade,
	Void           = ClientModules.EntityModules:FindFirstChild(loadstring(base64decode("Vm9pZA=="))()),
	SpiderJumpscare = nil,
	A90            = nil,
	Screech        = nil,
	Dread          = nil,
	GlitchScreech  = nil,
}

local CharacterOldConnectionKeys = {
	loadstring(base64decode("TWFpbkhhbmRsZXI="))(), loadstring(base64decode("SnVtcEhhbmRsZXI="))(), loadstring(base64decode("U2xpZGVIYW5kbGVy"))(), loadstring(base64decode("TGlicmFyeUNvZGVIYW5kbGVyMQ=="))(), loadstring(base64decode("TGlicmFyeUNvZGVIYW5kbGVyMg=="))(),
	loadstring(base64decode("T3h5Z2VuQ29ubmVjdGlvbg=="))(), loadstring(base64decode("QW5pbWF0aW9uSGFuZGxlcg=="))(), loadstring(base64decode("QXV0b0hpZGVDb25uZWN0aW9u"))(), loadstring(base64decode("QXV0b1Jldml2ZUhhbmRsZXI="))(),
	loadstring(base64decode("U0hNRml4ZXI="))(), loadstring(base64decode("QW50aWNoZWF0RGlzYWJsZXI="))(), loadstring(base64decode("QW50aWNoZWF0RW5hYmxlRGV0ZWN0b3Ix"))(), loadstring(base64decode("QW50aWNoZWF0RW5hYmxlRGV0ZWN0b3Iy"))(),
	loadstring(base64decode("QXV0b1N0ZWVyTWluZWNhcnREdWNrSGFuZGxlcg=="))(), loadstring(base64decode("QXV0b1NvbHZlQW5jaG9yc0Nvbm5lY3Rpb24="))(), loadstring(base64decode("SW5maW5pdGVKdW1wc0Nvbm5lY3Rpb24x"))(), loadstring(base64decode("SW5maW5pdGVKdW1wc0Nvbm5lY3Rpb24y"))(),
	loadstring(base64decode("Rm9vdHN0ZXBIYW5kbGVy"))()
}

Globals.IsTyping = false
Connections.TextBoxConnection1 = Services.UserInputService.TextBoxFocused:Connect(function()
	Globals.IsTyping = true
end)
Connections.TextBoxConnection2 = Services.UserInputService.TextBoxFocusReleased:Connect(function()
	Globals.IsTyping = false
end)

Functions.HandleCharacter = function(NewCharacter)
	for _, Key in CharacterOldConnectionKeys do
		if Connections[Key] then
			Connections[Key]:Disconnect()
			Connections[Key] = nil
		end
	end

	while not LocalPlayer.PlayerGui:FindFirstChild(loadstring(base64decode("TWFpblVJ"))()) do
		task.wait()
	end

	Character = NewCharacter
	Humanoid = NewCharacter:WaitForChild(loadstring(base64decode("SHVtYW5vaWQ="))(), 9e9)
	RootPart = NewCharacter:FindFirstChild(loadstring(base64decode("SHVtYW5vaWRSb290UGFydA=="))())
	Camera   = Services.Workspace.CurrentCamera

	Globals.OldCamera = Camera
	Globals.MainUI = LocalPlayer.PlayerGui.MainUI

	Collision = NewCharacter:WaitForChild(loadstring(base64decode("Q29sbGlzaW9u"))())
	CollisionPart  = NewCharacter:FindFirstChild(loadstring(base64decode("Q29sbGlzaW9uUGFydA=="))()) or NewCharacter:FindFirstChild(loadstring(base64decode("Q29sbGlzaW9u"))())
	CollisionClone = Collision:Clone()
	CollisionClone.Parent = NewCharacter
	CollisionClone.Name = loadstring(base64decode("Q29sbGlzaW9uQ2xvbmU="))()
	CollisionClone.Massless = true

	CollisionPartClone = CollisionPart:Clone()
	CollisionPartClone.Parent = NewCharacter
	CollisionPartClone.Name = loadstring(base64decode("Q29sbGlzaW9uUGFydENsb25l"))()
	CollisionPartClone.CanCollide = false
	CollisionPartClone.Massless = true

	if CollisionPartClone:FindFirstChild(loadstring(base64decode("Q29sbGlzaW9uQ3JvdWNo"))()) then
		CollisionPartClone.CollisionCrouch:Destroy()
	end

	Character:SetAttribute(loadstring(base64decode("U3BlZWRCb29zdA=="))(), 0)
	Character:SetAttribute(loadstring(base64decode("U3BlZWRCb29zdEJlaGluZA=="))(), 0)
	Character:SetAttribute(loadstring(base64decode("U3BlZWRCb29zdEV4dHJh"))(), 0)

	OldJump  = NewCharacter:GetAttribute(loadstring(base64decode("Q2FuSnVtcA=="))())
	OldSlide = NewCharacter:GetAttribute(loadstring(base64decode("Q2FuU2xpZGU="))())

	if Toggles.EnableCharacterJump.Value  then Character:SetAttribute(loadstring(base64decode("Q2FuSnVtcA=="))(),  true) end
	if Toggles.EnableCharacterSlide.Value then Character:SetAttribute(loadstring(base64decode("Q2FuU2xpZGU="))(), true) end

	if Functions.CheckCompatability({loadstring(base64decode("cmVxdWlyZQ=="))()}) then
		Main_Game = IRT.Environment.require(Globals.MainUI.Initiator.Main_Game)
	end

	if Main_Game and Toggles.RemoveCameraBobbing.Value then
		Main_Game.spring.Speed = 9e9
	end

	if Main_Game and Functions.CheckCompatability({loadstring(base64decode("cmVxdWlyZQ=="))()}) then
		local Controls = require(LocalPlayer.PlayerScripts.PlayerModule):GetControls()
		local OriginalGetMoveVector = Controls.GetMoveVector
		Globals.OriginalGetMoveVector = OriginalGetMoveVector
		Controls.GetMoveVector = function(...)
			if Toggles.AutoSteerMinecart.Value and Floor == loadstring(base64decode("TWluZXM="))() then
				local Node = Globals.NearestTurnNode
				if Node and Functions.GetMinecart() then
					local Turn = Node:GetAttribute(loadstring(base64decode("VHVybg=="))())
					return Turn == loadstring(base64decode("TGVmdA=="))() and Vector3.new(-1, 0, 0) or Turn == loadstring(base64decode("UmlnaHQ="))() and Vector3.new(1, 0, 0) or Vector3.zero
				end
			end
			return OriginalGetMoveVector(...)
		end
	end

	Globals.AutoMinecartDucked = false
	Globals.LastDuck = tick()
	Connections.AutoSteerMinecartDuckHandler = Services.RunService.Heartbeat:Connect(function()
		if not Toggles.AutoSteerMinecart.Value or not Functions.GetMinecart() or tick() - Globals.LastDuck < 0.1 then return end
		Globals.NearestTurnNode = Functions.GetNearestTurnNode()

		if not Globals.AutoMinecartDucked and Functions.GetNearestDuckBoard() then
			Main_Game.crouch(true)
			Globals.AutoMinecartDucked = true
		elseif not Functions.GetNearestDuckBoard() and Globals.AutoMinecartDucked then
			Main_Game.crouch(false)
			Globals.AutoMinecartDucked = false
		end
		if Main_Game then
			Main_Game.fovtarget = Options.FieldOfView.Value
		else
			Camera.FieldOfView = Options.FieldOfView.Value
		end
		Globals.LastDuck = tick()
	end)

	Globals.AnticheatDisabled = false

	local UIModules = Globals.MainUI.Initiator.Main_Game.RemoteListener.Modules
	Modules.A90             = UIModules:FindFirstChild(loadstring(base64decode("QTkw"))())
	Modules.Screech         = UIModules.Screech
	Modules.Dread           = UIModules:FindFirstChild(loadstring(base64decode("RHJlYWQ="))())
	Modules.SpiderJumpscare = UIModules.SpiderJumpscare

	if Toggles.RemoveScreech.Value    then Modules.Screech.Name = loadstring(base64decode("U2NyZWVjaF9EaXNhYmxlZA=="))() print (loadstring(base64decode("c2NyZWVjaCBnb25l"))()) end
	if Toggles.RemoveA90.Value and Modules.A90   then Modules.A90.Name = loadstring(base64decode("QTkwX0Rpc2FibGVk"))() end
	if Toggles.RemoveDread.Value and Modules.Dread then Modules.Dread.Name = loadstring(base64decode("RHJlYWRfRGlzYWJsZWQ="))() end
	if Toggles.DisableTimothyJumpscare.Value then Modules.SpiderJumpscare.Name = loadstring(base64decode("U3BpZGVySnVtcHNjYXJlX0Rpc2FibGVk"))() end

	if Toggles.DisableHideVignette.Value then
		local Vignette = Globals.MainUI:FindFirstChild(loadstring(base64decode("SGlkZVZpZ25ldHRl"))()) or Globals.MainUI.MainFrame:FindFirstChild(loadstring(base64decode("SGlkZVZpZ25ldHRl"))())
		if Vignette then Vignette.Image = loadstring(base64decode("RGlzYWJsZWQ="))() end
	end
	if Toggles.RemoveInteractingSounds.Value then
		local PS = Globals.MainUI.Initiator.Main_Game.PromptService
		PS.Triggered.Volume = 0
		PS.Holding.Volume   = 0
		PS.Notification.Volume = 0
		Globals.MainUI.Initiator.Main_Game.Reminder.Caption.Volume = 0
	end
	if Toggles.DisableEntityJumpscares.Value then
		local JS = Globals.MainUI.Initiator.Main_Game.RemoteListener:FindFirstChild(loadstring(base64decode("SnVtcHNjYXJlcw=="))())
		if JS then JS.Name = loadstring(base64decode("SnVtcHNjYXJlc19EaXNhYmxlZA=="))() end
	end
    local Cutscenes = Globals.MainUI.Initiator.Main_Game.RemoteListener.Cutscenes
    for _, Object in pairs(Cutscenes:GetChildren()) do
        if table.find(CutsceneNames, Object.Name) and Object:IsA(loadstring(base64decode("TW9kdWxlU2NyaXB0"))()) then
            Object:SetAttribute(loadstring(base64decode("T3JpZ2luYWxOYW1l"))(), Object.Name)
            if Toggles.RemoveCutscenes.Value then
                Object.Name = Object.Name .. loadstring(base64decode("X0Rpc2FibGVk"))()
            end
        end
    end
    for _, Object in pairs(FloorReplicated:GetChildren()) do
        if table.find(CutsceneNames, Object.Name) and Object:IsA(loadstring(base64decode("TW9kdWxlU2NyaXB0"))()) then
            Object:SetAttribute(loadstring(base64decode("T3JpZ2luYWxOYW1l"))(), Object.Name)
            if Toggles.RemoveCutscenes.Value then
                Object.Name = Object.Name .. loadstring(base64decode("X0Rpc2FibGVk"))()
            end
        end
    end

	CustomPhysics = PhysicalProperties.new(
		100,
		RootPart.CustomPhysicalProperties.Friction,
		RootPart.CustomPhysicalProperties.Elasticity,
		RootPart.CustomPhysicalProperties.FrictionWeight,
		RootPart.CustomPhysicalProperties.ElasticityWeight
	)
	for _, Part in NewCharacter:GetDescendants() do
		if Part:IsA(loadstring(base64decode("QmFzZVBhcnQ="))()) then
			PartProperties[Part] = Part.CustomPhysicalProperties
			if Toggles.RemoveAcceleration.Value then
				Part.CustomPhysicalProperties = CustomPhysics
			end
		end
	end

	Connections.LibraryCodeHandler1 = LocalPlayer.PlayerGui.PermUI.Hints.ChildAdded:Connect(function()
		if Toggles.NotifyLibraryCode.Value then
			local Code = Functions.GetLibraryCode()
			if Code and not Code:find(loadstring(base64decode("Xw=="))()) and not Globals.LibraryCodeFound then
				local Lock = Services.Workspace:FindFirstChild(loadstring(base64decode("UGFkbG9jaw=="))(), true)
				Functions.Notify({ Title = loadstring(base64decode("UGFkbG9jayBjb2RlIGZvdW5kIQ=="))(), Body = loadstring(base64decode("VGhlIGNvZGUgaXM6ICc="))() .. Code .. loadstring(base64decode("Jw=="))(), Time = Toggles.NotifyKeepNotifications.Value and Lock or 15 })
				Globals.LibraryCodeFound = true
			end
		end
	end)

	Connections.LibraryCodeHandler2 = Character.ChildAdded:Connect(function(Child)
		if (Child.Name == loadstring(base64decode("TGlicmFyeUhpbnRQYXBlcg=="))() or Child.Name == loadstring(base64decode("TGlicmFyeUhpbnRQYXBlckhhcmQ="))()) and Toggles.NotifyLibraryCode.Value then
			local Code = Functions.GetLibraryCode()
			if Code and not Code:find(loadstring(base64decode("Xw=="))()) and not Globals.LibraryCodeFound then
				local Lock = Services.Workspace:FindFirstChild(loadstring(base64decode("UGFkbG9jaw=="))(), true)
				Functions.Notify({ Title = loadstring(base64decode("UGFkbG9jayBjb2RlIGZvdW5kIQ=="))(), Body = loadstring(base64decode("VGhlIGNvZGUgaXM6ICc="))() .. Code .. loadstring(base64decode("Jw=="))(), Time = Toggles.NotifyKeepNotifications.Value and Lock or 15 })
				Globals.LibraryCodeFound = true
			end
		end
	end)

	Connections.FootstepHandler = Character.ChildAdded:Connect(function(Object)
		if Object:IsA(loadstring(base64decode("U291bmQ="))()) and Object.Name == loadstring(base64decode("U291bmQ="))() and Toggles.RemoveFootstepSounds.Value then
			Object.Volume = 0
		end
	end)

	Globals.OldOxygen = Character:GetAttribute(loadstring(base64decode("T3h5Z2Vu"))())
	Connections.OxygenConnection = Character:GetAttributeChangedSignal(loadstring(base64decode("T3h5Z2Vu"))()):Connect(function()
		local NewOxy = Character:GetAttribute(loadstring(base64decode("T3h5Z2Vu"))())
		if NewOxy < Globals.OldOxygen and Toggles.NotifyOxygen.Value then
			Functions.Caption(Functions.FormatOxygen(NewOxy), true)
		end
		Globals.OldOxygen = NewOxy
	end)

	Connections.AutoReviveHandler = LocalPlayer:GetAttributeChangedSignal(loadstring(base64decode("QWxpdmU="))()):Connect(function()
		if LocalPlayer:GetAttribute(loadstring(base64decode("QWxpdmU="))()) == false and Toggles.AutoRevive.Value then
			if Floor == loadstring(base64decode("Rm9vbHM="))() or Floor == loadstring(base64decode("T2xkSG90ZWw="))() then
				while LocalPlayer:GetAttribute(loadstring(base64decode("QWxpdmU="))()) ~= true do
					RemotesFolder.Revive:FireServer()
					task.wait(0.5)
				end
			end
		end
	end)

	Connections.SHMFixer = RootPart:GetPropertyChangedSignal(loadstring(base64decode("QW5jaG9yZWQ="))()):Connect(function()
		task.wait()
		if Floor == loadstring(base64decode("Rm9vbHM="))() and RootPart.Anchored and Character:GetAttribute(loadstring(base64decode("SGlkaW5n"))()) ~= true then
			RootPart.Anchored = false
		end
	end)

	Connections.AnticheatDisabler = Character:GetAttributeChangedSignal(loadstring(base64decode("Q2xpbWJpbmc="))()):Connect(function()
		if Character:GetAttribute(loadstring(base64decode("Q2xpbWJpbmc="))()) == true and Toggles.DisableAnticheat.Value and not Globals.AnticheatDisabled then
			task.wait(0.25)
			Character:SetAttribute(loadstring(base64decode("Q2xpbWJpbmc="))(), false)
			Functions.Notify({ Title = loadstring(base64decode("U3VjY2Vzc2Z1bGx5IGRpc2FibGVkIHRoZSBhbnRpY2hlYXQu"))(), Body = loadstring(base64decode("SXQgd2lsbCBiZSByZS1lbmFibGVkIGFmdGVyIGEgY3V0c2NlbmUgb3IgaGFsdCByb29tLg=="))() })
			Globals.AnticheatDisabled = true
		end
	end)

	Connections.AnticheatEnableDetector1 = RemotesFolder:WaitForChild(loadstring(base64decode("Q3V0c2NlbmU="))()).OnClientEvent:Connect(function(CutsceneName)
		if Globals.AnticheatDisabled and not CutsceneName:find(loadstring(base64decode("U2V3ZXJTZWVr"))()) then
			Globals.AnticheatDisabled = false
			Functions.Notify({ Title = loadstring(base64decode("VGhlIGFudGljaGVhdCBoYXMgYmVlbiByZS1lbmFibGVkLg=="))(), Body = loadstring(base64decode("SW50ZXJhY3Qgd2l0aCBhIGxhZGRlciB0byBkaXNhYmxlIGl0IGFnYWluLg=="))() })
		end
	end)

	Connections.AnticheatEnableDetector2 = RemotesFolder:WaitForChild(loadstring(base64decode("VXNlRW5lbXlNb2R1bGU="))()).OnClientEvent:Connect(function(ModuleName)
		if ModuleName == loadstring(base64decode("Vm9pZA=="))() or ModuleName == loadstring(base64decode("R2xpdGNo"))() then
			if Globals.AnticheatDisabled then
				Globals.AnticheatDisabled = false
				Functions.Notify({ Title = loadstring(base64decode("VGhlIGFudGljaGVhdCBoYXMgYmVlbiByZS1lbmFibGVkLg=="))(), Body = loadstring(base64decode("SW50ZXJhY3Qgd2l0aCBhIGxhZGRlciB0byBkaXNhYmxlIGl0IGFnYWluLg=="))() })
			end
			LocalPlayer:SetAttribute(loadstring(base64decode("Q3VycmVudFJvb20="))(), LatestRoom.Value)
		end
	end)

	Connections.AnimationHandler = Character.ChildAdded:Connect(function()
		local ToolNames = { loadstring(base64decode("TG9ja3BpY2s="))(),loadstring(base64decode("U2hlYXJz"))(),loadstring(base64decode("U2tlbGV0b25LZXk="))(),loadstring(base64decode("S2V5"))(),loadstring(base64decode("R2VuZXJhdG9yRnVzZQ=="))(),loadstring(base64decode("S2V5RWxlY3RyaWNhbA=="))(),loadstring(base64decode("S2V5QmFja2Rvb3I="))(),loadstring(base64decode("S2V5SXJvbg=="))(), loadstring(base64decode("TXVsdGl0b29s"))() }
		local Tool
		for _, Name in ToolNames do
			Tool = Character:FindFirstChild(Name)
			if Tool then break end
		end
		if not Tool then return end

		local UseAnim = Tool:FindFirstChild(loadstring(base64decode("dXNl"))(), true) or Tool:FindFirstChild(loadstring(base64decode("cHJvbXB0YW5pbQ=="))(), true)
		if UseAnim then
			UseAnim = Humanoid:LoadAnimation(UseAnim)
			UseAnim.Priority = Enum.AnimationPriority.Action4
			Globals.UseAnimation = UseAnim
		end
		local UseAnimBreak = Tool:FindFirstChild(loadstring(base64decode("dXNlZmluaXNo"))(), true) or Tool:FindFirstChild(loadstring(base64decode("cHJvbXB0YW5pbWVuZA=="))(), true) or Tool:FindFirstChild(loadstring(base64decode("bG9ja3BpY2t1c2U="))(), true)
		if UseAnimBreak then
			UseAnimBreak = Humanoid:LoadAnimation(UseAnimBreak)
			UseAnimBreak.Priority = Enum.AnimationPriority.Action4
			Globals.UseAnimationBreak = UseAnimBreak
		end
	end)

	Connections.JumpHandler = Character:GetAttributeChangedSignal(loadstring(base64decode("Q2FuSnVtcA=="))()):Connect(function()
		local Val = Character:GetAttribute(loadstring(base64decode("Q2FuSnVtcA=="))())
		if Toggles.EnableCharacterJump.Value and Val ~= true or not Toggles.EnableCharacterJump.Value then
			OldJump = Val
		end
		if Toggles.EnableCharacterJump.Value then Character:SetAttribute(loadstring(base64decode("Q2FuSnVtcA=="))(), true) end
	end)

	Connections.SlideHandler = Character:GetAttributeChangedSignal(loadstring(base64decode("Q2FuU2xpZGU="))()):Connect(function()
		local Val = Character:GetAttribute(loadstring(base64decode("Q2FuU2xpZGU="))())
		if Toggles.EnableCharacterSlide.Value and Val ~= true or not Toggles.EnableCharacterSlide.Value then
			OldSlide = Val
		end
		if Toggles.EnableCharacterSlide.Value then Character:SetAttribute(loadstring(base64decode("Q2FuU2xpZGU="))(), true) end
	end)

	Connections.InfiniteJumpsConnection1 = Services.UserInputService.InputBegan:Connect(function(Input)
		if Input.KeyCode == Enum.KeyCode.Space and Toggles.InfiniteJumps.Value and not Globals.IsTyping then
			Humanoid:ChangeState(Enum.HumanoidStateType.Jumping)
		end
	end)

	local JumpButton = Globals.MainUI.MainFrame.MobileButtons:FindFirstChild(loadstring(base64decode("SnVtcEJ1dHRvbg=="))())
	if JumpButton then
		Connections.InfiniteJumpsConnection2 = JumpButton.MouseButton1Down:Connect(function()
			if Toggles.InfiniteJumps.Value then
				Humanoid:ChangeState(Enum.HumanoidStateType.Jumping)
			end
		end)
	end

	Globals.SpoofOffset = 0
	Globals.LastAutoHide = tick()
	Connections.AutoHideConnection = Services.RunService.Heartbeat:Connect(function()
		if not Toggles.AutoClosetToggle.Value or tick() - Globals.LastAutoHide <= 0.1 then
			Globals.AutoClosetActive = false
			return
		end
		local Entity = Functions.GetNearestEntity(true, Options.AutoClosetEntityList.Value)
		local EntityNearby = Entity and LocalPlayer:DistanceFromCharacter(Entity.PrimaryPart.Position) <= (EntityDistances[Entity.Name] or 150)
		if Character:GetAttribute(loadstring(base64decode("SGlkaW5n"))()) == true then
			Globals.AutoClosetActive = false
			Globals.SpectateEntity = nil
			if not EntityNearby then
				RemotesFolder.CamLock:FireServer()
			end
			Globals.LastAutoHide = tick()
			return
		end
		if not Entity then
			Globals.SpectateEntity = nil
			Globals.AutoClosetActive = false
			Globals.LastAutoHide = tick()
			return
		end
		if not EntityNearby then
			Globals.SpectateEntity = nil
			Globals.AutoClosetActive = false
			Globals.LastAutoHide = tick()
			return
		end
		local Closet = Functions.GetNearestHidingSpot()
		if Character:GetAttribute(loadstring(base64decode("SGlkaW5n"))()) ~= true and Closet then
			local Prompt = Closet:FindFirstChild(loadstring(base64decode("SGlkZVByb21wdA=="))())
				or Closet:FindFirstChild(loadstring(base64decode("SGlkaW5nUHJvbXB0"))())
				or Closet:FindFirstChild(loadstring(base64decode("SGlkZVByb21wdA=="))(), true)
				or Closet:FindFirstChild(loadstring(base64decode("SGlkaW5nUHJvbXB0"))(), true)

			if not Prompt then
				for _, Child in Closet:GetDescendants() do
					if (Child:IsA(loadstring(base64decode("UHJveGltaXR5UHJvbXB0"))()) or Child:IsA(loadstring(base64decode("SW50ZXJhY3RQcm9tcHQ="))()))
						and (Child.Name == loadstring(base64decode("SGlkZVByb21wdA=="))() or Child.Name == loadstring(base64decode("SGlkaW5nUHJvbXB0"))())
					then
						Prompt = Child
						break
					end
				end
			end

			if Prompt then
				Globals.AutoClosetActive = true
				Functions.ForceFirePrompt(Prompt)
			end
		end
		if Character:GetAttribute(loadstring(base64decode("SGlkaW5n"))()) then
			if Toggles.SpectateEntityToggle.Value and Entity.PrimaryPart then
				Globals.SpectateEntity = Entity
			end
		end
		Globals.LastAutoHide = tick()
	end)

	Globals.LastAutoAnchor = tick()
	Connections.AutoSolveAnchorsConnection = Services.RunService.Heartbeat:Connect(function()
		if not Toggles.AutoSolveAnchors.Value then return end
		if not Globals.MainUI:FindFirstChild(loadstring(base64decode("QW5jaG9ySGludEZyYW1l"))()) then return end
		if tick() - Globals.LastAutoAnchor <= 0.1 then return end
		local Anchor = Functions.GetCurrentAnchor()
		if Anchor and LocalPlayer:DistanceFromCharacter(Anchor.PrimaryPart.Position) < Anchor.ActivateEventPrompt.MaxActivationDistance and not Anchor:GetAttribute(loadstring(base64decode("QWN0aXZhdGVk"))()) then
			Anchor:WaitForChild(loadstring(base64decode("QW5jaG9yUmVtb3Rl"))()):InvokeServer(Globals.MainUI.AnchorHintFrame.Code.Text)
		end
		Globals.LastAutoAnchor = tick()
	end)

	Globals.ManipulateBody = Instance.new(loadstring(base64decode("Qm9keVZlbG9jaXR5"))())
	Globals.ManipulateBody.MaxForce = Vector3.new(9e9, 9e9, 9e9)

	Globals.FlyBody = Instance.new(loadstring(base64decode("Qm9keVZlbG9jaXR5"))())
	Globals.FlyBody.MaxForce = Vector3.new(9e9, 9e9, 9e9)

	Globals.SelfKilled = false
	Globals.ThirdPersonParts = {}
	for _, Object in Character:GetDescendants() do
		if Object:IsA(loadstring(base64decode("QWNjZXNzb3J5"))()) and Object:FindFirstChild(loadstring(base64decode("SGFuZGxl"))()) then
			table.insert(Globals.ThirdPersonParts, Object.Handle)
		end
	end
	table.insert(Globals.ThirdPersonParts, Character:WaitForChild(loadstring(base64decode("SGVhZA=="))()))

	Globals.LastAnimationCheck = tick()
	Globals.LastCrouchFire = tick()
	Globals.OriginalC1 = Character.LowerTorso.Root.C1

	local RayParams = RaycastParams.new()
	RayParams.FilterType = Enum.RaycastFilterType.Exclude

	local MainFrame = Globals.MainUI:FindFirstChild(loadstring(base64decode("TWFpbkZyYW1l"))())
	if MainFrame and MainFrame:FindFirstChild(loadstring(base64decode("U3VyZ2VWaWduZXR0ZQ=="))()) then
		Globals.SurgeFrame = MainFrame.SurgeVignette
		if Toggles.RemoveSurge.Value then
			Globals.SurgeFrame.Name = loadstring(base64decode("U3VyZ2VWaWduZXR0ZV9EaXNhYmxlZA=="))()
		end
	end

	Connections.MainHandler = Services.RunService.RenderStepped:Connect(function()
		if Services.Workspace:FindFirstChild(loadstring(base64decode("Q2FtZXJh"))()) then
			Camera = Services.Workspace:FindFirstChild(loadstring(base64decode("Q2FtZXJh"))())
		end

		if Toggles.SpeedBoostToggle.Value then
			Humanoid.WalkSpeed = Functions.GetCurrentSpeed() + Options.SpeedBoostSlider.Value
		end

		if Globals.Lagging or (Options.SpeedBoostSlider.Value <= 6 and Options.FlySpeed.Value <= 21) then
			CollisionPartClone.Massless = true
		end

		Globals.IsEyes    = Services.Workspace:FindFirstChild(loadstring(base64decode("RXllcw=="))()) ~= nil or Services.Workspace:FindFirstChild(loadstring(base64decode("TG9va21hbg=="))()) ~= nil
		Globals.IsLookman = Services.Workspace:FindFirstChild(loadstring(base64decode("QmFja2Rvb3JMb29rbWFu"))()) ~= nil

		if Toggles.AmbientToggle.Value then
			Services.TweenService:Create(Services.Lighting, TweenInfo.new(0.2, Enum.EasingStyle.Exponential), { Ambient = Options.AmbientColor.Value }):Play()
		end

		if Main_Game then
			if Toggles.RemoveCameraShake.Value     then Main_Game.csgo = CFrame.new() end
			if Toggles.ViewmodelOffsetToggle.Value then
				Main_Game.tooloffset = Vector3.new(Options.ViewmodelOffsetX.Value, Options.ViewmodelOffsetY.Value, Options.ViewmodelOffsetZ.Value)
			else
				Main_Game.tooloffset = Vector3.zero
			end
		end

		if Globals.SelfKilled and Globals.MainUI:FindFirstChild(loadstring(base64decode("U3RhdGlzdGljcw=="))()) then
			Globals.MainUI.Statistics.Death.Text = loadstring(base64decode("RGllZCB0byBJUlQgSHVi"))()
		end

		if Globals.Deathing and Globals.MainUI:FindFirstChild(loadstring(base64decode("U3RhdGlzdGljcw=="))()) then
			Globals.MainUI.Statistics.Death.Text = loadstring(base64decode("RGllZCB0byBWZXJpdHk="))()
		end

		local MainFrame = Globals.MainUI:FindFirstChild(loadstring(base64decode("TWFpbkZyYW1l"))())
		if MainFrame then
			local Effects = MainFrame.Healthbar:FindFirstChild(loadstring(base64decode("RWZmZWN0cw=="))())
			if Effects and Effects:FindFirstChild(loadstring(base64decode("Q3JvdWNoaW5n"))()) then
				Effects.Crouching.Visible = Functions.IsCrouching()
			end
		end

		if (Toggles.CrouchSpoof.Value or Toggles.PositionSpoof.Value) and RemotesFolder:FindFirstChild(loadstring(base64decode("Q3JvdWNo"))()) then
			RemotesFolder.Crouch:FireServer(true, true)
		end

		if Floor ~= loadstring(base64decode("Rm9vbHM="))() and Floor ~= loadstring(base64decode("T2xkSG90ZWw="))() and not Camera:FindFirstChild(loadstring(base64decode("TWluZWNhcnRSaWc="))()) then
			RootPart.CanCollide = false
		end

		for _, Part in Character:GetChildren() do
			if Part:IsA(loadstring(base64decode("QmFzZVBhcnQ="))()) then Part.CanCollide = false end
		end

		if LocalPlayer:GetAttribute(loadstring(base64decode("QWxpdmU="))()) == true then
			Services.SoundService:WaitForChild(loadstring(base64decode("TWFpbg=="))()).Volume = 1
		end

		if Floor == loadstring(base64decode("T2xkSG90ZWw="))() or Floor == loadstring(base64decode("Rm9vbHM="))() then
			local SpoofOffset = Toggles.PositionSpoof.Value and Functions.GetNearestEntity() and 200 or Toggles.FigureGodmode.Value and Functions.GetNearestFigure() and 200 or 0
			Globals.SpoofOffset = SpoofOffset
			Collision.Position = RootPart.Position + Vector3.new(0, SpoofOffset, 0)
			Collision.CanCollide = false
			if Floor == loadstring(base64decode("Rm9vbHM="))() then
				Collision.CollisionCrouch.CanCollide = false
				CollisionClone.CollisionCrouch.CanCollide = false
			end
			RootPart.CanCollide = not (Toggles.NoclipToggle.Value or Toggles.VelocityManipulationToggle.Value)
		else
			Collision.CanCollide = false
			if Collision:FindFirstChild(loadstring(base64decode("Q29sbGlzaW9uQ3JvdWNo"))()) then Collision.CollisionCrouch.CanCollide = false end

			if CollisionClone:FindFirstChild(loadstring(base64decode("Q29sbGlzaW9uQ3JvdWNo"))()) then
				local IsCrouch = Functions.IsCrouching()
				CollisionClone.CanCollide = not (Toggles.NoclipToggle.Value or Toggles.VelocityManipulationToggle.Value or IsCrouch)
				CollisionClone.CollisionCrouch.CanCollide = not (Toggles.NoclipToggle.Value or Toggles.VelocityManipulationToggle.Value or not IsCrouch)
			else
				RootPart.CanCollide = not (Toggles.NoclipToggle.Value or Toggles.VelocityManipulationToggle.Value)
			end

			if Character:FindFirstChild(loadstring(base64decode("TG93ZXJUb3Jzbw=="))()) and Character.LowerTorso:FindFirstChild(loadstring(base64decode("Um9vdA=="))()) then
				Character.LowerTorso.Root.C1 = Globals.OriginalC1 * CFrame.new(0, Toggles.PositionSpoof.Value and -2.346 or 0, 0)
			end

			local SpoofY = Toggles.PositionSpoof.Value and 2.328 or 0.18
			Collision.Position     = RootPart.Position + Vector3.new(0, SpoofY, 0)
			CollisionPart.Position = RootPart.Position + Vector3.new(0, SpoofY, 0)

			if Collision:FindFirstChild(loadstring(base64decode("Q29sbGlzaW9uQ3JvdWNo"))()) and CollisionClone:FindFirstChild(loadstring(base64decode("Q29sbGlzaW9uQ3JvdWNo"))()) then
				local CrouchY = Toggles.PositionSpoof.Value and 1.328 or -0.982
				Collision.CollisionCrouch.Position = RootPart.Position + Vector3.new(0, CrouchY, 0)
				CollisionClone.CollisionCrouch.CollisionGroup = Collision.CollisionCrouch.CollisionGroup
			end
			if CollisionClone:FindFirstChild(loadstring(base64decode("Q29sbGlzaW9uQ3JvdWNo"))()) then
				CollisionClone.CollisionCrouch.Position = RootPart.Position + Vector3.new(0, Toggles.PositionSpoof.Value and 0.75 or -0.982, 0)
			end
		end

		CollisionClone.CollisionGroup = Collision.CollisionGroup
		CollisionClone.Position = RootPart.Position + Vector3.new(0, Toggles.PositionSpoof.Value and 1.75 or 0.18, 0)

		if Toggles.VelocityManipulationToggle.Value and Options.VelocityManipulationMode.Value == loadstring(base64decode("VmVsb2NpdHk="))() then
			Globals.ManipulateBody.Parent = RootPart
			Globals.ManipulateBody.Velocity = RootPart.CFrame.LookVector * 2.25
		else
			Globals.ManipulateBody.Parent = nil
		end

		if Toggles.VelocityManipulationToggle.Value and Options.VelocityManipulationMode.Value == loadstring(base64decode("UGl2b3Q="))() and Floor ~= loadstring(base64decode("Rm9vbHM="))() and Floor ~= loadstring(base64decode("T2xkSG90ZWw="))() then
			Character:PivotTo(Camera:GetPivot() * CFrame.new(0, 0, 2560))
		end

		if Toggles.FlyToggle.Value then
			Globals.FlyBody.Parent = RootPart
			Globals.FlyBody.Velocity = Functions.GetFlyVelocity() * Options.FlySpeed.Value
		else
			Globals.FlyBody.Parent = nil
		end

		local DoEyesBypass = (Toggles.BypassEyes.Value and Globals.IsEyes) or (Toggles.BypassLookman.Value and Globals.IsLookman)
		if DoEyesBypass then
			if Floor == loadstring(base64decode("Rm9vbHM="))() or Floor == loadstring(base64decode("T2xkSG90ZWw="))() then
				RemotesFolder.MotorReplication:FireServer(0, (Globals.SpoofOffset == 200 and 65 or -65), 0, false)
			else
				RemotesFolder.MotorReplication:FireServer(-650)
			end
		end

		if RemotesFolder:FindFirstChild(loadstring(base64decode("Q3JvdWNo"))()) and tick() - Globals.LastCrouchFire > 0.1 then
			local IsCrouch = Functions.IsCrouching()
			if Toggles.CrouchSpoof.Value or Toggles.PositionSpoof.Value then IsCrouch = true end
			RemotesFolder.Crouch:FireServer(IsCrouch, true)
			Globals.LastCrouchFire = tick()
		end

		if tick() - Globals.LastAnimationCheck > 0.1 then
			local Sliding = false
			for _, Anim in Humanoid:GetPlayingAnimationTracks() do
				if Anim.Name == loadstring(base64decode("U2xpZGU="))() then Sliding = true break end
			end
			Globals.Sliding = Sliding
			Globals.LastAnimationCheck = tick()
		end

		Character:SetAttribute(loadstring(base64decode("U2xpZGluZw=="))(), Globals.Sliding)
		if Character:GetAttribute(loadstring(base64decode("Q3JvdWNoaW5n"))()) ~= Functions.IsCrouching() then
			Character:SetAttribute(loadstring(base64decode("Q3JvdWNoaW5n"))(), Functions.IsCrouching())
		end

		RayParams.FilterDescendantsInstances = { Character }
		local TPOffset = CFrame.new(Options.ThirdPersonOffsetX.Value, Options.ThirdPersonOffsetY.Value, Options.ThirdPersonOffsetZ.Value)
		local Direction = (Camera.CFrame * TPOffset).Position - Camera.CFrame.Position
		local WallResult = Services.Workspace:Spherecast(Camera.CFrame.Position, 0.2, Direction, RayParams)

		if Toggles.ThirdPersonToggle.Value then
			if Toggles.ThirdPersonWallCheck.Value and WallResult and WallResult.Instance.CanCollide then
				local NewPos = Camera.CFrame.Position + Direction.Unit * WallResult.Distance
				Camera.CFrame = CFrame.new(NewPos, NewPos + Camera.CFrame.LookVector)
			else
				Camera.CFrame = Camera.CFrame * TPOffset
			end
		end

		for _, Part in Globals.ThirdPersonParts do
			Part.Transparency = Toggles.ThirdPersonToggle.Value and 0 or 1
			Part.LocalTransparencyModifier = Toggles.ThirdPersonToggle.Value and 0 or 1
		end

		if Globals.SpectateEntity and Toggles.AutoClosetToggle.Value and Toggles.SpectateEntityToggle.Value then
			local Entity = Globals.SpectateEntity

			local CamPosition
			if Options.SpecateEntityMode.Value == loadstring(base64decode("UGxheWVyIHRvIEVudGl0eQ=="))() then
				CamPosition = CFrame.lookAt(Character.Head.Position, Entity.PrimaryPart.Position)
			else
				CamPosition = CFrame.lookAt(Entity.PrimaryPart.Position, Character.Head.Position)
			end

			Camera.CFrame = CamPosition
		end

		if Toggles.FOVToggle.Value then
			if Main_Game then
				task.wait()
				Main_Game.fovtarget = Options.FieldOfView.Value
			else
				Camera.FieldOfView = Options.FieldOfView.Value
			end
		end

		if Toggles.RemoveClosetDelay.Value
			and Humanoid.MoveDirection ~= Vector3.zero
			and (CollisionPart.Anchored or RootPart.Anchored)
			and Character:GetAttribute(loadstring(base64decode("QW5pbWF0aW5nQ2xpZW50"))()) ~= true
			and Character:GetAttribute(loadstring(base64decode("SGlkaW5n"))()) == true
		then
			RemotesFolder.CamLock:FireServer()
		end

		local ClosestPlayer = { Distance = math.huge, Object = nil }
		for _, Player in Services.Players:GetPlayers() do
			if Player.Character and Player ~= LocalPlayer then
				local Root = Player.Character:FindFirstChild(loadstring(base64decode("SHVtYW5vaWRSb290UGFydA=="))())
				if Root then
					local D = (Camera.CFrame.Position - Root.Position).Magnitude
					if D < ClosestPlayer.Distance then
						ClosestPlayer.Distance = D
						ClosestPlayer.Object = Player
					end
				end
			end
		end
		if ClosestPlayer.Object and LocalPlayer:GetAttribute(loadstring(base64decode("QWxpdmU="))()) ~= true then
			LocalPlayer:SetAttribute(loadstring(base64decode("Q3VycmVudFJvb20="))(), ClosestPlayer.Object:GetAttribute(loadstring(base64decode("Q3VycmVudFJvb20="))()))
		end
	end)

	task.wait(1)
	if Toggles.PositionSpoof.Value and Floor ~= loadstring(base64decode("Rm9vbHM="))() and Floor ~= loadstring(base64decode("T2xkSG90ZWw="))() then
		RootPart.CFrame = RootPart.CFrame * CFrame.new(0, -2.346, 0)
		Humanoid.HipHeight = 0.05
		RemotesFolder.Crouch:FireServer(true, true)
	end

	local Jam = Globals.MainUI.Initiator.Main_Game.Health:FindFirstChild(loadstring(base64decode("SmFt"))())
	if Jam and Toggles.RemoveJamminMusic.Value then
		Jam.Volume = 0
		Globals.JamMuffle.Enabled = false
	end
end

Functions.HandleHidingTransparency = function(Model)
	local Parts = {}
	for _, Part in Model:GetDescendants() do
		if Part:IsA(loadstring(base64decode("QmFzZVBhcnQ="))()) then
			Part:SetAttribute(loadstring(base64decode("VHJhbnNwYXJlbmN5X09sZA=="))(), Part.Transparency)
			table.insert(Parts, Part)
		end
		if Part.Name == loadstring(base64decode("SGlkZGVuUGxheWVy"))() then
			local HideConn = Part:GetPropertyChangedSignal(loadstring(base64decode("VmFsdWU="))()):Connect(function()
				for _, P in Parts do
					if P:GetAttribute(loadstring(base64decode("VHJhbnNwYXJlbmN5X09sZA=="))()) then
						Services.TweenService:Create(P, TweenInfo.new(0.25, Enum.EasingStyle.Linear), {
							Transparency = (Part.Value == Character and Toggles.TransparentHidingSpotsToggle.Value)
								and Options.TransparentHidingSpotsSlider.Value
								or P:GetAttribute(loadstring(base64decode("VHJhbnNwYXJlbmN5X09sZA=="))())
						}):Play()
					end
				end
			end)
			table.insert(Connections, HideConn)
			Model.Destroying:Once(function()
				HideConn:Disconnect()
				local Pos = table.find(Connections, HideConn)
				if Pos then table.remove(Connections, Pos) end
			end)
		end
	end
end

Functions.HandleObject = function(Object)
	for _, Room in CurrentRooms:GetChildren() do
		if Object:IsDescendantOf(Room) then
			Object:SetAttribute(loadstring(base64decode("UGFyZW50Um9vbQ=="))(), tonumber(Room.Name))
			break
		end
		task.wait()
	end

	if Object.Parent == CurrentRooms then
		local FiredampVal = Object:GetAttribute(loadstring(base64decode("RmlyZWRhbXA="))())
		Object:SetAttribute(loadstring(base64decode("RmlyZWRhbXBfT2xk"))(), FiredampVal ~= nil and FiredampVal or false)
		if Toggles.DisableFiredampEffect.Value then
			Object:SetAttribute(loadstring(base64decode("RmlyZWRhbXA="))(), false)
		end
	end

	local Name = Object.Name

	if Name == loadstring(base64decode("S2V5T2J0YWlu"))() then
		task.spawn(function()
			task.wait(0.5)
			if Object.Parent then
				if Toggles.ObjectiveESPToggle.Value then Functions.AddESP({ Object = Object, Text = loadstring(base64decode("RG9vciBLZXk="))(), Color = Options.ObjectiveESPColor.Value }, true) end
				table.insert(Objects.Objectives, Object)
			end
		end)
	elseif Name == loadstring(base64decode("RWxlY3RyaWNhbEtleU9idGFpbg=="))() then
		task.spawn(function()
			task.wait(0.5)
			if Object.Parent then
				if Toggles.ObjectiveESPToggle.Value then Functions.AddESP({ Object = Object, Text = loadstring(base64decode("RWxlY3RyaWNhbCBLZXk="))(), Color = Options.ObjectiveESPColor.Value }, true) end
				table.insert(Objects.Objectives, Object)
			end
		end)
	elseif Name == loadstring(base64decode("VGltZXJMZXZlcg=="))() then
		task.spawn(function()
			task.wait(0.5)
			if Object.Parent then
				Object:SetAttribute(loadstring(base64decode("QWRkVGltZQ=="))(), Object.TakeTimer.TextLabel.Text == loadstring(base64decode("MDE6MDA="))() and 60 or 30)
				if Toggles.ObjectiveESPToggle.Value then Functions.AddESP({ Object = Object, Text = loadstring(base64decode("VGltZSBMZXZlciBbKw=="))() .. Object:GetAttribute(loadstring(base64decode("QWRkVGltZQ=="))()) .. loadstring(base64decode("c10="))(), Color = Options.ObjectiveESPColor.Value }, true) end
				Object:WaitForChild(loadstring(base64decode("TWFpbg=="))()).SoundToPlay.Played:Once(function()
					Functions.RemoveESP(Object)
					Functions.BlacklistESP(Object)
				end)
				table.insert(Objects.Objectives, Object)
			end
		end)
	elseif Name == loadstring(base64decode("U3RhaXJ3ZWxsTG9ja3BpY2tEb29y"))() then
		if Toggles.MiscESPToggle.Value then Functions.AddESP({ Object = Object, Text = loadstring(base64decode("R2FyYWdlIERvb3I="))(), Color = Options.MiscESPColor.Value }, true) end
		table.insert(Objects.Misc, Object)
	elseif Name == loadstring(base64decode("TWlycm9y"))() then
		if Toggles.MiscESPToggle.Value then Functions.AddESP({ Object = Object, Text = loadstring(base64decode("TWlycm9y"))(), Color = Options.MiscESPColor.Value }, true) end
		table.insert(Objects.Misc, Object)
	elseif Name == loadstring(base64decode("U3RhaXJ3ZWxsRmlyZUFsYXJt"))() then
		if Toggles.MiscESPToggle.Value then Functions.AddESP({ Object = Object, Text = loadstring(base64decode("RmlyZSBBbGFybQ=="))(), Color = Options.MiscESPColor.Value }, true) end
		table.insert(Objects.Misc, Object)
	elseif Name == loadstring(base64decode("U2hvcHBpbmdDYXJ0"))() then
		if Toggles.MiscESPToggle.Value then Functions.AddESP({ Object = Object, Text = loadstring(base64decode("U2hvcHBpbmcgQ2FydA=="))(), Color = Options.MiscESPColor.Value }, true) end
		table.insert(Objects.Misc, Object)
	elseif Name == loadstring(base64decode("U3RhaXJ3ZWxsU2NyYXBwZXI="))() then
		if Toggles.ObjectiveESPToggle.Value then Functions.AddESP({ Object = Object, Text = loadstring(base64decode("U2NyYXBwZXI="))(), Color = Options.ObjectiveESPColor.Value }, true) end
		table.insert(Objects.Objectives, Object)
	elseif Name == loadstring(base64decode("QXJjaGl2ZXNQYWNrYWdlRGVwb3NpdA=="))() then
		if Toggles.ObjectiveESPToggle.Value then Functions.AddESP({ Object = Object, Text = loadstring(base64decode("UGFja2FnZSBEZXBvc2l0"))(), Color = Options.ObjectiveESPColor.Value }, true) end
		table.insert(Objects.Objectives, Object)
	elseif Name == loadstring(base64decode("Q2VsbGFy"))() then
		if Toggles.ObjectiveESPToggle.Value then Functions.AddESP({ Object = Object, Text = loadstring(base64decode("Q2VsbGFy"))(), Color = Options.ObjectiveESPColor.Value }, true) end
		table.insert(Objects.Objectives, Object)
	elseif Name == loadstring(base64decode("QXJjaGl2ZXNGaWhUYW5r"))() then
		if Toggles.MiscESPToggle.Value then Functions.AddESP({ Object = Object, Text = loadstring(base64decode("RmloIFRhbms="))(), Color = Options.MiscESPColor.Value }, true) end
		table.insert(Objects.Misc, Object)
	elseif Name == loadstring(base64decode("TGl2ZUhpbnRCb29r"))() then
		if Toggles.ObjectiveESPToggle.Value then Functions.AddESP({ Object = Object, Text = loadstring(base64decode("SGludCBCb29r"))(), Color = Options.ObjectiveESPColor.Value }, true) end
		table.insert(Objects.Objectives, Object)
	elseif Name == loadstring(base64decode("TGl2ZUJyZWFrZXJQb2xlUGlja3Vw"))() then
		if Toggles.ObjectiveESPToggle.Value then Functions.AddESP({ Object = Object, Text = loadstring(base64decode("RnVzZSBCcmVha2Vy"))(), Color = Options.ObjectiveESPColor.Value }, true) end
		for _, Child in Object:GetChildren() do
			if Child.Name == loadstring(base64decode("QWN0aXZhdGVFdmVudFByb21wdA=="))() and (Child.MaxActivationDistance == 5 or Child:GetAttribute(loadstring(base64decode("TWF4QWN0aXZhdGlvbkRpc3RhbmNlX09sZA=="))()) == 5) then
				Child:Destroy()
			end
		end
		table.insert(Objects.Objectives, Object)
	elseif Name == loadstring(base64decode("TGlicmFyeUhpbnRQYXBlcg=="))() or Name == loadstring(base64decode("UGlja3VwSXRlbQ=="))() then
		if Toggles.ObjectiveESPToggle.Value then Functions.AddESP({ Object = Object, Text = loadstring(base64decode("SGludCBQYXBlcg=="))(), Color = Options.ObjectiveESPColor.Value }, true) end
		table.insert(Objects.Objectives, Object)
	elseif Name == loadstring(base64decode("TWluZXNBbmNob3I="))() then
		if Toggles.ObjectiveESPToggle.Value then Functions.AddESP({ Object = Object, Text = loadstring(base64decode("QW5jaG9yIFs="))() .. Object:WaitForChild(loadstring(base64decode("U2lnbg=="))()).TextLabel.Text .. loadstring(base64decode("XQ=="))(), Color = Options.ObjectiveESPColor.Value }, true) end
		Object:GetAttributeChangedSignal(loadstring(base64decode("QWN0aXZhdGVk"))()):Once(function()
			Functions.RemoveESP(Object)
			Functions.BlacklistESP(Object)
		end)
		table.insert(Objects.Objectives, Object)
	elseif Name == loadstring(base64decode("V2F0ZXJQdW1w"))() then
		if Toggles.ObjectiveESPToggle.Value then Functions.AddESP({ Object = Object:WaitForChild(loadstring(base64decode("V2hlZWw="))()), Text = loadstring(base64decode("V2F0ZXIgUHVtcA=="))(), Color = Options.ObjectiveESPColor.Value }, true) end
		Object:WaitForChild(loadstring(base64decode("V2hlZWw="))()).Sound.Played:Once(function()
			Object:SetAttribute(loadstring(base64decode("SVJUX0NvbXBsZXRlZA=="))(), true)

			Functions.RemoveESP(Object.Wheel)
			Functions.BlacklistESP(Object.Wheel)
		end)
		table.insert(Objects.Objectives, Object)
	elseif Name == loadstring(base64decode("Q3JpbmdsZVByZXNlbnQ="))() then
		if Toggles.ObjectiveESPToggle.Value then Functions.AddESP({ Object = Object, Text = loadstring(base64decode("UHJlc2VudA=="))(), Color = Options.ObjectiveESPColor.Value }, true) end
		Object:WaitForChild(loadstring(base64decode("VG9vbFByb3A="))()).Highlight:Destroy()
		table.insert(Objects.Objectives, Object)
	elseif Name == loadstring(base64decode("TGV2ZXJGb3JHYXRl"))() then
		if Toggles.ObjectiveESPToggle.Value then Functions.AddESP({ Object = Object, Text = loadstring(base64decode("R2F0ZSBMZXZlcg=="))(), Color = Options.ObjectiveESPColor.Value }, true) end
		Object:WaitForChild(loadstring(base64decode("TWFpbg=="))()).SoundToPlay.Played:Once(function()
			Functions.RemoveESP(Object)
			Functions.BlacklistESP(Object)
		end)
		table.insert(Objects.Objectives, Object)
	elseif Name == loadstring(base64decode("VmluZUd1aWxsb3RpbmU="))() then
		if Toggles.ObjectiveESPToggle.Value then Functions.AddESP({ Object = Object.Lever, Text = loadstring(base64decode("VmluZSBMZXZlcg=="))(), Color = Options.ObjectiveESPColor.Value }, true) end
		Object.Lever:WaitForChild(loadstring(base64decode("QWN0aXZhdGVFdmVudFByb21wdA=="))()):GetAttributeChangedSignal(loadstring(base64decode("SW50ZXJhY3Rpb25z"))()):Once(function()
			Functions.RemoveESP(Object)
			Functions.BlacklistESP(Object)
		end)
		table.insert(Objects.Objectives, Object)
	elseif Name == loadstring(base64decode("TWFuZHJha2VMaXZl"))() then
		if Toggles.ObjectiveESPToggle.Value and Options.EntityESPOptions.Value[loadstring(base64decode("TWFuZHJha2UgSG9sZQ=="))()] then Functions.AddESP({ Object = Object.Hole, Text = loadstring(base64decode("TWFuZHJha2UgSG9sZQ=="))(), Color = Options.EntityESPColor.Value }, true) end
		table.insert(Objects.Entities, Object.Hole)
	elseif Name == loadstring(base64decode("TWluZXNHZW5lcmF0b3I="))() then
		task.spawn(function()
			task.wait(0.75)
			if Object.Parent then
				if Toggles.ObjectiveESPToggle.Value then Functions.AddESP({ Object = Object, Text = loadstring(base64decode("R2VuZXJhdG9y"))(), Color = Options.ObjectiveESPColor.Value }, true) end
				Object:WaitForChild(loadstring(base64decode("TGV2ZXI="))()).Sound.Played:Once(function()
					Functions.RemoveESP(Object)
					Functions.BlacklistESP(Object)
				end)
				table.insert(Objects.Objectives, Object)
			end
		end)
	elseif Name == loadstring(base64decode("RnVzZU9idGFpbg=="))() then
		if Toggles.ObjectiveESPToggle.Value then Functions.AddESP({ Object = Object, Text = loadstring(base64decode("R2VuZXJhdG9yIEZ1c2U="))(), Color = Options.ObjectiveESPColor.Value }, true) end
		Object:WaitForChild(loadstring(base64decode("SGl0Ym94"))()).FuseModel:GetPropertyChangedSignal(loadstring(base64decode("TG9jYWxUcmFuc3BhcmVuY3lNb2RpZmllcg=="))()):Once(function()
			Functions.RemoveESP(Object)
			Functions.BlacklistESP(Object)
		end)
		table.insert(Objects.Objectives, Object)
	elseif Name == loadstring(base64decode("TWluZXNHYXRlQnV0dG9u"))() then
		if Toggles.ObjectiveESPToggle.Value then Functions.AddESP({ Object = Object, Text = loadstring(base64decode("R2F0ZSBCdXR0b24="))(), Color = Options.ObjectiveESPColor.Value }, true) end
		Object.Parent:WaitForChild(loadstring(base64decode("TWluZXNHYXRl"))()).Main.SoundOpen.Played:Once(function()
			Functions.RemoveESP(Object)
			Functions.BlacklistESP(Object)
		end)
		table.insert(Objects.Objectives, Object)
	elseif Name == loadstring(base64decode("R2FyZGVuR2F0ZUJ1dHRvbg=="))() then
		if Toggles.ObjectiveESPToggle.Value then Functions.AddESP({ Object = Object, Text = loadstring(base64decode("R2F0ZSBCdXR0b24="))(), Color = Options.ObjectiveESPColor.Value }, true) end
		Object.Parent:WaitForChild(loadstring(base64decode("R2FyZGVuR2F0ZQ=="))()).Collision.Sound.Played:Once(function()
			Functions.RemoveESP(Object)
			Functions.BlacklistESP(Object)
		end)
		table.insert(Objects.Objectives, Object)
	elseif Name == loadstring(base64decode("TGFkZGVy"))() then
		if Toggles.LadderESPToggle.Value then Functions.AddESP({ Object = Object, Text = loadstring(base64decode("TGFkZGVy"))(), Color = Options.LadderESPColor.Value }, true) end
		table.insert(Objects.Ladders, Object)
	elseif Name == loadstring(base64decode("RG9vcg=="))() and Object.Parent and tonumber(Object.Parent.Name) then
		local DoorParts = {}
		for _, Child in Object:GetChildren() do
			if Child.Name == loadstring(base64decode("RG9vcg=="))() and Child:IsA(loadstring(base64decode("QmFzZVBhcnQ="))()) then
				table.insert(DoorParts, Child)
			end
		end

		if #DoorParts == 2 then
			local HighlightModel = Instance.new(loadstring(base64decode("TW9kZWw="))(), Object)
			HighlightModel.Name = loadstring(base64decode("SGlnaGxpZ2h0TW9kZWw="))()
			Instance.new(loadstring(base64decode("SHVtYW5vaWQ="))(), HighlightModel).Name = loadstring(base64decode("SGlnaGxpZ2h0SHVtYW5vaWQ="))()
			HighlightModel:SetAttribute(loadstring(base64decode("UGFyZW50Um9vbQ=="))(), tonumber(Object.Parent.Name))

			for _, DoorPart in DoorParts do
				local HP = Instance.new(loadstring(base64decode("UGFydA=="))(), HighlightModel)
				HP.Transparency = 0.999
				HP.Size = DoorPart.Size
				HP.CanCollide = false
				HP.CFrame = DoorPart.CFrame
				HP.Name = loadstring(base64decode("SGlnaGxpZ2h0UGFydA=="))()
				HP.Material = Enum.Material.Plastic
				HP:SetAttribute(loadstring(base64decode("UGFyZW50Um9vbQ=="))(), tonumber(Object.Parent.Name))
				local W = Instance.new(loadstring(base64decode("V2VsZENvbnN0cmFpbnQ="))(), HP)
				W.Part0 = HP W.Part1 = DoorPart W.Enabled = true
			end
			table.insert(Objects.Doors, HighlightModel)
			if Toggles.DoorESPToggle.Value then Functions.AddESP({ Object = HighlightModel, Text = loadstring(base64decode("RG9vciA="))() .. Functions.GetDoorNumber(Object), Color = Options.DoorESPColor.Value }, true) end
		else
			local Root = Object:WaitForChild(loadstring(base64decode("RG9vcg=="))(), 9e9)
			local HP = Instance.new(loadstring(base64decode("UGFydA=="))(), Object)
			HP.Transparency = 0.999
			HP.Size = Root.Size
			HP.CanCollide = false
			HP.CFrame = Root.CFrame
			HP.Name = loadstring(base64decode("SGlnaGxpZ2h0UGFydA=="))()
			HP.Material = Enum.Material.Plastic
			HP:SetAttribute(loadstring(base64decode("UGFyZW50Um9vbQ=="))(), tonumber(Object.Parent.Name))
			local W = Instance.new(loadstring(base64decode("V2VsZENvbnN0cmFpbnQ="))(), HP)
			W.Part0 = HP W.Part1 = Root W.Enabled = true
			Instance.new(loadstring(base64decode("SHVtYW5vaWQ="))(), Object).Name = loadstring(base64decode("SGlnaGxpZ2h0SHVtYW5vaWQ="))()
			table.insert(Objects.Doors, HP)
			if Toggles.DoorESPToggle.Value then Functions.AddESP({ Object = HP, Text = loadstring(base64decode("RG9vciA="))() .. Functions.GetDoorNumber(Object), Color = Options.DoorESPColor.Value }, true) end
		end

		local LastDoorFire = tick()
		local DoorConn = Services.RunService.Heartbeat:Connect(function()
			if Object:FindFirstChild(loadstring(base64decode("RG9vcg=="))()) and Object:FindFirstChild(loadstring(base64decode("Q2xpZW50T3Blbg=="))()) then
				if LocalPlayer:DistanceFromCharacter(Object.Door.Position) < 75
					and tick() - LastDoorFire > 0.1
					and (Toggles.DoorReachToggle.Value or Functions.GetMinecart())
				then
					Object.ClientOpen:FireServer()
					LastDoorFire = tick()
				end
			end
		end)
		Object.Destroying:Once(function()
			DoorConn:Disconnect()
		end)
		Object:WaitForChild(loadstring(base64decode("RG9vcg=="))()):WaitForChild(loadstring(base64decode("T3Blbg=="))()).Played:Once(function()
			DoorConn:Disconnect()
		end)
		table.insert(Connections, DoorConn)

	elseif Name == loadstring(base64decode("UGF0aExpZ2h0cw=="))() then
		local ObjectsToHighlight = {}
		local PLConn = Object.ChildAdded:Connect(function(Child)
			table.insert(ObjectsToHighlight, Child)
		end)
		for _, Child in Object:GetChildren() do
			table.insert(ObjectsToHighlight, Child)
		end

		local function CreateSeekNode(Light)
			if Light.Name ~= loadstring(base64decode("U2Vla0d1aWRpbmdMaWdodA=="))() or Light:GetAttribute(loadstring(base64decode("SGlnaGxpZ2h0ZWQ="))()) then return end
			Light:SetAttribute(loadstring(base64decode("SGlnaGxpZ2h0ZWQ="))(), true)

			local NewNode = Instance.new(loadstring(base64decode("UGFydA=="))())
			NewNode.Size = Vector3.one
			NewNode.Transparency = 1
			NewNode.Parent = Globals.SeekNodesFolder
			NewNode.Anchored = true
			NewNode.CFrame = Light.CFrame
			NewNode.CanCollide = false
			NewNode.Name = loadstring(base64decode("U2Vla0xpZ2h0Tm9kZQ=="))()

			local PrevNode2 = PreviousNode or NewNode
			PreviousNode = NewNode

			local Beam = Instance.new(loadstring(base64decode("QmVhbQ=="))())
			Beam.Color = ColorSequence.new({ ColorSequenceKeypoint.new(0, Options.ShowSeekPathColor.Value), ColorSequenceKeypoint.new(1, Options.ShowSeekPathColor.Value) })
			Beam.FaceCamera = true
			Beam.Width0 = 0.2
			Beam.Width1 = 0.2
			Beam.Brightness = 10
			Beam.LightInfluence = 0
			Beam.LightEmission = 0
			Beam.Enabled = true
			local Vis = Toggles.ShowSeekPathToggle.Value and 0 or 1
			Beam.Transparency = NumberSequence.new({ NumberSequenceKeypoint.new(0, Vis), NumberSequenceKeypoint.new(1, Vis) })
			Beam.Parent = Globals.SeekNodesFolder
			local A0 = Instance.new(loadstring(base64decode("QXR0YWNobWVudA=="))(), NewNode)
			local A1 = Instance.new(loadstring(base64decode("QXR0YWNobWVudA=="))(), PrevNode2)
			Beam.Attachment0 = A0
			Beam.Attachment1 = A1
			table.insert(Objects.SeekHighlights, Beam)
			Light:Destroy()
		end

		task.spawn(function()
			while task.wait() do
				local Light = table.remove(ObjectsToHighlight, 1)
				if Light then CreateSeekNode(Light) end
			end
		end)

		table.insert(Connections, PLConn)
		table.insert(Objects.PathLights, Object)
		Object.Destroying:Once(function() PLConn:Disconnect() end)
	elseif Name == loadstring(base64decode("U2Vla01vdmluZ05ld0Nsb25l"))() then
		local Connection = Object.Destroying:Connect(function()
			for _, Folder in pairs(Objects.PathLights) do
				Folder:ClearAllChildren()
			end
			Globals.SeekNodesFolder:ClearAllChildren()
		end)
		table.insert(Connections, Connection)
	elseif Name == loadstring(base64decode("QnJpZGdl"))() then
		for _, Child in Object:GetChildren() do
			if Child.Name == loadstring(base64decode("UGxheWVyQmFycmllcg=="))() and Child.Size.Y == 2.75 and (Child.Rotation.X == 0 or Child.Rotation.X == 180) then
				local NewBridge = Child:Clone()
				NewBridge.CFrame = NewBridge.CFrame * CFrame.new(0, 0, -5)
				NewBridge.Name = IRT.ESPLibrary:GenerateRandomString()
				NewBridge.Size = Vector3.new(NewBridge.Size.X, NewBridge.Size.Y, 11)
				NewBridge.Parent = Object
				NewBridge.CanCollide = Toggles.BypassSeekObstructions.Value
				NewBridge.Color = Color3.fromRGB(0, 255, 255)
				NewBridge.Transparency = Toggles.BypassSeekObstructions.Value and 0 or 1
				NewBridge.Material = Enum.Material.ForceField
				table.insert(Objects.SeekBridges, NewBridge)
			end
			task.wait()
		end
    elseif Name == loadstring(base64decode("TWluZWNhcnRSaWc="))() then
        Globals.Minecart = Object
	elseif Name == loadstring(base64decode("UnVubmVyTm9kZXM="))() then
		local function IsBehind(Part1, Part2)
			local P1 = (Part1.CFrame + Part1.CFrame.LookVector).Position
			local P2 = (Part1.CFrame + Part1.CFrame.LookVector * -1).Position
			return (P1 - Part2.Position).Magnitude > (P2 - Part2.Position).Magnitude
		end
		local function GetDirection(Part1, Part2)
			local RightDist = Part1.CFrame.RightVector:Dot(Part1.Position - Part2.Position)
			if RightDist > 0.5    then return IsBehind(Part1, Part2) and loadstring(base64decode("UmlnaHQ="))() or loadstring(base64decode("TGVmdA=="))() end
			if RightDist < -0.5   then return IsBehind(Part1, Part2) and loadstring(base64decode("TGVmdA=="))() or loadstring(base64decode("UmlnaHQ="))() end
			return loadstring(base64decode("U3RyYWlnaHQ="))()
		end
		local function GetClosestNode(Node)
			local Best, BestDist = nil, math.huge
			local NodeID2 = tonumber(Node.Name:split(loadstring(base64decode("TWluZWNhcnROb2Rl"))())[2])
			for _, OtherNode in Object:GetChildren() do
				local OtherID = tonumber(OtherNode.Name:split(loadstring(base64decode("TWluZWNhcnROb2Rl"))())[2])
				if OtherNode ~= Node and OtherID and NodeID2 and OtherID > NodeID2 then
					local D = (Node.Position - OtherNode.Position).Magnitude
					if D < BestDist and OtherNode:GetAttribute(loadstring(base64decode("RGlzdGFuY2VCbGFja2xpc3Q="))()) ~= true then
						BestDist = D Best = OtherNode
					end
				end
			end
			return Best
		end

		for _, Node in Object:GetChildren() do
			local NodeID = tonumber(Node.Name:split(loadstring(base64decode("TWluZWNhcnROb2Rl"))())[2])
			if Node:GetAttribute(loadstring(base64decode("RGVhdGhUeXBl"))()) then Node:SetAttribute(loadstring(base64decode("RGlzdGFuY2VCbGFja2xpc3Q="))(), true) end
			for I = 1, 20 do
				local NextNode = NodeID and Object:FindFirstChild(loadstring(base64decode("TWluZWNhcnROb2Rl"))() .. NodeID + I)
				if NextNode and NextNode:GetAttribute(loadstring(base64decode("RGVhdGhUeXBl"))()) ~= nil then
					Node:SetAttribute(loadstring(base64decode("RGlzdGFuY2VCbGFja2xpc3Q="))(), true)
				end
			end
			local PrevNode3 = NodeID and Object:FindFirstChild(loadstring(base64decode("TWluZWNhcnROb2Rl"))() .. NodeID - 1)
			if PrevNode3 and PrevNode3:GetAttribute(loadstring(base64decode("Rm9yY2VDb25uZWN0"))()) then
				Node:SetAttribute(loadstring(base64decode("RGlzdGFuY2VCbGFja2xpc3Q="))(), nil)
			end
			task.wait()
		end

		for _, Node in Object:GetChildren() do
			if Node:GetAttribute(loadstring(base64decode("Rm9yY2VDb25uZWN0"))()) then
				local NextNode = GetClosestNode(Node)
				if NextNode then
					Node:SetAttribute(loadstring(base64decode("VHVybg=="))(), GetDirection(Node, NextNode))
					table.insert(Objects.SeekNodes, Node)
				end
			end
			task.wait()
		end

	elseif Name == loadstring(base64decode("RXllc3RhbGtFbmRDdXRzY2VuZQ=="))() then
		Object.Name = loadstring(base64decode("X0V5ZXN0YWxrRW5kQ3V0c2NlbmU="))()
	elseif Name == loadstring(base64decode("RHVja0JvYXJk"))() then
		table.insert(Objects.SeekDuckBoards, Object)
	elseif HidingSpotLabels[Name] or string.find(string.lower(Name), loadstring(base64decode("aGlkaW5nc3BvdA=="))()) then
		local Label = HidingSpotLabels[Name] or (string.find(string.lower(Name), loadstring(base64decode("aGlkaW5nc3BvdA=="))()) and loadstring(base64decode("SGlkaW5nIFNwb3Q="))() or nil)
		if Label and Toggles.HidingSpotESPToggle.Value then Functions.AddESP({ Object = Object, Text = Label, Color = Options.HidingSpotESPColor.Value }, true) end
		Functions.HandleHidingTransparency(Object)
		table.insert(Objects.HidingSpots, Object)
	elseif Object:FindFirstChild(loadstring(base64decode("SGlkaW5nUHJvbXB0"))()) or Object:FindFirstChild(loadstring(base64decode("SGlkZVByb21wdA=="))()) then
		Functions.HandleHidingTransparency(Object)
		table.insert(Objects.HidingSpots, Object)
	elseif Name == loadstring(base64decode("TGF2YQ=="))() then
		if Toggles.BypassKillbricks.Value then Object.CanTouch = false end
		table.insert(Objects.Obstructions, Object)
	elseif Name == loadstring(base64decode("U2NhcnlXYWxs"))() then
		for _, Part in Object:GetDescendants() do
			if Part:IsA(loadstring(base64decode("QmFzZVBhcnQ="))()) then
				Part.CanTouch = not Toggles.BypassSeekingWall.Value
				Part.CanCollide = not Toggles.BypassSeekingWall.Value

                local Connection1 = Part:GetPropertyChangedSignal(loadstring(base64decode("Q2FuVG91Y2g="))()):Connect(function()
                    if Part.CanTouch == Toggles.BypassSeekingWall.Value then
                        Part.CanTouch = not Toggles.BypassSeekingWall.Value
                    end
                end)
                local Connection2 = Part:GetPropertyChangedSignal(loadstring(base64decode("Q2FuQ29sbGlkZQ=="))()):Connect(function()
                    if Part.CanCollide == Toggles.BypassSeekingWall.Value then
                        Part.CanCollide = not Toggles.BypassSeekingWall.Value
                    end
                end)

                table.insert(Connections, Connection1)
                table.insert(Connections, Connection2)
            end
		end
		table.insert(Objects.Obstructions, Object)
	elseif Name == loadstring(base64decode("Q2hlc3RCb3g="))() or Name == loadstring(base64decode("Q2hlc3RCb3hMb2NrZWQ="))() then
		if Toggles.ChestESPToggle.Value then Functions.AddESP({ Object = Object, Text = Object:GetAttribute(loadstring(base64decode("TG9ja2Vk"))()) and loadstring(base64decode("TG9ja2VkIENoZXN0"))() or loadstring(base64decode("Q2hlc3Q="))(), Color = Options.ChestESPColor.Value }, true) end
		table.insert(Objects.Chests, Object)
	elseif Name == loadstring(base64decode("VG9vbGJveA=="))() or Name == loadstring(base64decode("VG9vbGJveF9Mb2NrZWQ="))() then
		if Toggles.ChestESPToggle.Value then Functions.AddESP({ Object = Object, Text = Object:GetAttribute(loadstring(base64decode("TG9ja2Vk"))()) and loadstring(base64decode("TG9ja2VkIFRvb2xib3g="))() or loadstring(base64decode("VG9vbGJveA=="))(), Color = Options.ChestESPColor.Value }, true) end
		table.insert(Objects.Chests, Object)
	elseif Name == loadstring(base64decode("Q2hlc3RfVmluZQ=="))() then
		if Toggles.ChestESPToggle.Value then Functions.AddESP({ Object = Object, Text = loadstring(base64decode("VmluZSBDaGVzdA=="))(), Color = Options.ChestESPColor.Value }, true) end
		table.insert(Objects.Chests, Object)
	elseif Name == loadstring(base64decode("VG9vbHNoZWRfU21hbGw="))() then
		if Toggles.ChestESPToggle.Value then Functions.AddESP({ Object = Object, Text = loadstring(base64decode("VG9vbHNoZWQ="))(), Color = Options.ChestESPColor.Value }, true) end
		table.insert(Objects.Chests, Object)
	elseif Name == loadstring(base64decode("TG9ja2VyX1NtYWxsX0xvY2tlZA=="))() then
		if Toggles.ChestESPToggle.Value then Functions.AddESP({ Object = Object, Text = loadstring(base64decode("TG9ja2VkIEl0ZW0gTG9ja2Vy"))(), Color = Options.ChestESPColor.Value }, true) end
		table.insert(Objects.Chests, Object)
	elseif Name == loadstring(base64decode("TW91c2VIb2xl"))() then
		if Toggles.ChestESPToggle.Value then Functions.AddESP({ Object = Object, Text = loadstring(base64decode("TW91c2U="))(), Color = Options.ChestESPColor.Value }, true) end
		table.insert(Objects.Chests, Object)
	elseif ItemNames[Name] and Object:FindFirstChild(loadstring(base64decode("TW9kdWxlUHJvbXB0"))()) then
		if Toggles.ItemESPToggle.Value then Functions.AddESP({ Object = Object, Text = ItemNames[Name], Color = Options.ItemESPColor.Value }, Object:GetAttribute(loadstring(base64decode("UGFyZW50Um9vbQ=="))()) ~= nil) end
		if Name == loadstring(base64decode("TG90dXNIb2xkZXI="))() or Name == loadstring(base64decode("TG90dXNQZXRhbFBpY2t1cA=="))() then
			Object.Handle:GetPropertyChangedSignal(loadstring(base64decode("TG9jYWxUcmFuc3BhcmVuY3lNb2RpZmllcg=="))()):Connect(function()
				IRT.ESPLibrary:RemoveESP(Object)
				Functions.BlacklistESP(Object)
			end)
		end

		if Toggles.NotifyItemsToggle.Value and Options.NotifyItemList.Value[ItemNames[Name]] and Object.Parent.Name ~= loadstring(base64decode("RHJvcHM="))() then
			if Toggles.NotifyItemsShowDistance.Value then
				Functions.Notify({ Title = loadstring(base64decode("SXRlbSAn"))() .. ItemNames[Name] .. loadstring(base64decode("JyBoYXMgc3Bhd25lZC4="))(), Body = loadstring(base64decode("SXQgaXMgJw=="))() .. math.round(LocalPlayer:DistanceFromCharacter(Object.PrimaryPart.Position)) .. loadstring(base64decode("JyBzdHVkcyBhd2F5IGZyb20geW91Lg=="))() })
			else
				Functions.Notify({ Title = loadstring(base64decode("SXRlbSAn"))() .. ItemNames[Name] .. loadstring(base64decode("JyBoYXMgc3Bhd25lZC4="))()})
			end
		end

		table.insert(Objects.Items, Object)
	elseif Name == loadstring(base64decode("R3JlZW5fSGVyYg=="))() then
		if Toggles.ItemESPToggle.Value then Functions.AddESP({ Object = Object, Text = loadstring(base64decode("R3JlZW4gSGVyYg=="))(), Color = Options.ItemESPColor.Value }, true) end
		table.insert(Objects.Items, Object)
	elseif Name == loadstring(base64decode("R29sZFBpbGU="))() and Object:GetAttribute(loadstring(base64decode("R29sZFZhbHVl"))()) then
		if Toggles.CurrencyESPToggle.Value then Functions.AddESP({ Object = Object, Text = loadstring(base64decode("R29sZCBQaWxlIFs="))() .. Object:GetAttribute(loadstring(base64decode("R29sZFZhbHVl"))()) .. loadstring(base64decode("XQ=="))(), Color = Options.CurrencyESPColor.Value }, true) end
		table.insert(Objects.Currency, Object)
	elseif Name == loadstring(base64decode("U3RhcmR1c3RQaWNrdXA="))() then
		if Toggles.CurrencyESPToggle.Value then Functions.AddESP({ Object = Object, Text = loadstring(base64decode("U3RhcmR1c3QgUGlsZQ=="))(), Color = Options.CurrencyESPColor.Value }, true) end
		table.insert(Objects.Currency, Object)
	elseif Name == loadstring(base64decode("R2lnZ2xlQ2VpbGluZw=="))() then
		if Toggles.EntityESPToggle.Value and Options.EntityESPOptions.Value[loadstring(base64decode("R2lnZ2xl"))()] then Functions.AddESP({ Object = Object, Text = loadstring(base64decode("R2lnZ2xl"))(), Color = Options.EntityESPColor.Value }, true) end
		if Toggles.BypassGiggle.Value then Object:WaitForChild(loadstring(base64decode("SGl0Ym94"))()).CanTouch = false end
		table.insert(Objects.Entities, Object)
	elseif Name == loadstring(base64decode("R2xvb21QaWxl"))() then
		if Toggles.BypassGloombatEggs.Value then
			for _, Part in Object:GetDescendants() do
				if Part:IsA(loadstring(base64decode("QmFzZVBhcnQ="))()) then Part.CanTouch = false
				end
			end
		end
		local Connection = Object.DescendantAdded:Connect(function(Part)
			if Part:IsA(loadstring(base64decode("QmFzZVBhcnQ="))()) then Part.CanTouch = false end
		end)

		if Toggles.EntityESPToggle.Value and Options.EntityESPOptions.Value[loadstring(base64decode("R2xvb21iYXQgRWdncw=="))()] then
			Functions.AddESP({ Object = Object, Text = loadstring(base64decode("R2xvb21iYXQgRWdncw=="))(), Color = Options.EntityESPColor.Value })
		end

		table.insert(Connections, Connection)
		table.insert(Objects.Entities, Object)
	elseif Name == loadstring(base64decode("VHJpZ2dlckV2ZW50Q29sbGlzaW9u"))() and Functions.CheckCompatability({loadstring(base64decode("ZmlyZXRvdWNoaW50ZXJlc3Q="))()}) then
		if (Floor == loadstring(base64decode("Rm9vbHM="))() or Floor == loadstring(base64decode("T2xkSG90ZWw="))()) and Toggles.RemoveSeekTrigger.Value then
			task.spawn(function()
				while Object:IsDescendantOf(game) do
					for _, Part in Object:GetChildren() do
						if Part:IsA(loadstring(base64decode("QmFzZVBhcnQ="))()) then
							IRT.Environment.firetouchinterest(RootPart, Part, 0)
							task.wait()
							IRT.Environment.firetouchinterest(RootPart, Part, 1)
						end
					end
					task.wait()
				end
			end)
		end
		table.insert(Objects.EventTriggers, Object)
	elseif Name == loadstring(base64decode("RG9vckZha2U="))() or Name == loadstring(base64decode("RmFrZURvb3I="))() then
		if Object.Parent and Object:FindFirstChild(loadstring(base64decode("SGlkZGVu"))()) then
			if Toggles.BypassDupe.Value then
				Object:WaitForChild(loadstring(base64decode("SGlkZGVu"))()).CanTouch = false
				local Lock = Object:FindFirstChild(loadstring(base64decode("TG9jaw=="))())
				if Lock and Lock:FindFirstChild(loadstring(base64decode("VW5sb2NrUHJvbXB0"))()) then Lock.UnlockPrompt.Enabled = false end
			end
			if Toggles.EntityESPToggle.Value and Options.EntityESPOptions.Value[loadstring(base64decode("RHVwZQ=="))()] then
				Functions.AddESP({ Object = Object, Text = loadstring(base64decode("RHVwZQ=="))(), Color = Options.EntityESPColor.Value }, true)
			end
			table.insert(Objects.Entities, Object)
		end
	elseif Name == loadstring(base64decode("U2lkZXJvb21TcGFjZQ=="))() then
		if Toggles.BypassVacuum.Value then
			Object:WaitForChild(loadstring(base64decode("Q29sbGlzaW9u"))()).CanCollide = true
			Object:WaitForChild(loadstring(base64decode("Q29sbGlzaW9u"))()).CanTouch = false
		end
		table.insert(Objects.Entities, Object)
	elseif Name == loadstring(base64decode("U25hcmU="))() then
		if Toggles.EntityESPToggle.Value and Options.EntityESPOptions.Value[loadstring(base64decode("U25hcmU="))()] then Functions.AddESP({ Object = Object, Text = loadstring(base64decode("U25hcmU="))(), Color = Options.EntityESPColor.Value }, true) end
		for _, Part in Object:GetDescendants() do
			if Part:IsA(loadstring(base64decode("QmFzZVBhcnQ="))()) then Part.CanTouch = not Toggles.BypassSnare.Value end
		end
		local Connection = Object.DescendantAdded:Connect(function(Part)
			if Part:IsA(loadstring(base64decode("QmFzZVBhcnQ="))()) then Part.CanTouch = not Toggles.BypassSnare.Value end
		end)
		table.insert(Connections, Connection)
		table.insert(Objects.Entities, Object)

		if Object:FindFirstChild(loadstring(base64decode("U25hcmU="))()) then
			Object:WaitForChild(loadstring(base64decode("U25hcmU="))()):WaitForChild(loadstring(base64decode("Um9vdHM="))()).Transparency = 1
			Object:WaitForChild(loadstring(base64decode("U25hcmU="))()):WaitForChild(loadstring(base64decode("U25hcmVCYXNl"))()).Transparency = 1
		end
		if Object:FindFirstChild(loadstring(base64decode("Vm9pZA=="))()) then
			Object.Void.Transparency = 0
			Object.Void.Color = Color3.fromRGB(76, 67, 55)
		end
	elseif Name == loadstring(base64decode("U2Vla19Bcm0="))() or Name == loadstring(base64decode("Q2hhbmRlbGllck9ic3RydWN0aW9u"))() then
		for _, Part in Object:GetDescendants() do
			if Part:IsA(loadstring(base64decode("QmFzZVBhcnQ="))()) then
				Part.CanTouch = not Toggles.BypassSeekObstructions.Value
				table.insert(Objects.SeekObstructions, Part)
			end
		end
	elseif Name == loadstring(base64decode("U2Vla0Zsb29kbGluZQ=="))() then
		Object.CanCollide = Toggles.BypassSeekObstructions.Value
		local FloodConn = Object:GetPropertyChangedSignal(loadstring(base64decode("Q2FuQ29sbGlkZQ=="))()):Connect(function()
			if Object.CanCollide ~= Toggles.BypassSeekObstructions.Value then
				Object.CanCollide = Toggles.BypassSeekObstructions.Value
			end
		end)
		Object.Destroying:Once(function() FloodConn:Disconnect() end)
		table.insert(Objects.SeekObstructions, Object)
	elseif Object:GetAttribute(loadstring(base64decode("UmF3TmFtZQ=="))()) and Object:GetAttribute(loadstring(base64decode("UmF3TmFtZQ=="))()):find(loadstring(base64decode("SGFsdA=="))()) or Object:GetAttribute(loadstring(base64decode("U2hhZGU="))()) == true then
		if Toggles.NotifyEntities.Value and Options.EntityList.Value[loadstring(base64decode("SGFsdA=="))()] then
			Functions.Notify({ Title = loadstring(base64decode("RW50aXR5ICdIYWx0JyB3aWxsIHNwYXduIGluIHRoZSBuZXh0IHJvb20u"))(), Image = EntityIcons[loadstring(base64decode("SGFsdA=="))()] })
			if Toggles.EntityChatToggle.Value then Functions.SendChat(loadstring(base64decode("SGFsdCBuZXh0IHJvb20h"))()) end
		end
		local HaltLogConn
		HaltLogConn = Services.LogService.MessageOut:Connect(function(Message)
			if Message == loadstring(base64decode("Y2xpZW50IHRlbGVwb3J0aW5n"))() then
				if Globals.AnticheatDisabled then
					Globals.AnticheatDisabled = false
					Functions.Notify({ Title = loadstring(base64decode("VGhlIGFudGljaGVhdCBoYXMgYmVlbiByZS1lbmFibGVkLg=="))(), Body = loadstring(base64decode("SW50ZXJhY3Qgd2l0aCBhIGxhZGRlciB0byBkaXNhYmxlIGl0IGFnYWluLg=="))() })
				end
				HaltLogConn:Disconnect()
			end
		end)
	elseif Name == loadstring(base64decode("QmFuYW5hUGVlbA=="))() then
		if Toggles.BypassBanana.Value then Object.CanTouch = false end
		table.insert(Objects.Entities, Object)
	elseif Name == loadstring(base64decode("SmVmZlRoZUtpbGxlcg=="))() then
		if Toggles.BypassJeff.Value then
			for _, Part in Object:GetDescendants() do
				if Part:IsA(loadstring(base64decode("QmFzZVBhcnQ="))()) then Part.CanCollide = false Part.CanTouch = false end
			end
			Object:WaitForChild(loadstring(base64decode("SHVtYW5vaWQ="))()).Health = 0
		end
	elseif Name == loadstring(base64decode("R3J1bWJsZVJpZw=="))() then
		if Toggles.EntityESPToggle.Value and Options.EntityESPOptions.Value[loadstring(base64decode("R3J1bWJsZQ=="))()] then Functions.AddESP({ Object = Object, Text = loadstring(base64decode("R3J1bWJsZQ=="))(), Color = Options.EntityESPColor.Value }, true) end
		table.insert(Objects.Entities, Object)
	elseif Name == loadstring(base64decode("TGl2ZUVudGl0eUJyYW1ibGU="))() then
		if Toggles.EntityESPToggle.Value and Options.EntityESPOptions.Value[loadstring(base64decode("QnJhbWJsZQ=="))()] then Functions.AddESP({ Object = Object, Text = loadstring(base64decode("QnJhbWJsZQ=="))(), Color = Options.EntityESPColor.Value }, true) end
		table.insert(Objects.Entities, Object)
	elseif Name == loadstring(base64decode("R3JvdW5kc2tlZXBlcg=="))() then
		if Toggles.EntityESPToggle.Value and Options.EntityESPOptions.Value[loadstring(base64decode("R3JvdW5kc2tlZXBlcg=="))()] then Functions.AddESP({ Object = Object, Text = loadstring(base64decode("R3JvdW5kc2tlZXBlcg=="))(), Color = Options.EntityESPColor.Value }, true) end
		if Toggles.NotifyEntities.Value and Options.EntityList.Value[loadstring(base64decode("R3JvdW5kc2tlZXBlcg=="))()] then
			local ED = Entities[loadstring(base64decode("R3JvdW5kc2tlZXBlcg=="))()]
			Functions.Notify({ Title = ED.NotifyMessage.Title, Body = ED.NotifyMessage.Body, Image = EntityIcons[loadstring(base64decode("R3JvdW5kc2tlZXBlcg=="))()] })
		end
		table.insert(Objects.Entities, Object)
	elseif Name == loadstring(base64decode("RmlndXJl"))() or Name == loadstring(base64decode("RmlndXJlUmln"))() or Name == loadstring(base64decode("RmlndXJlUmFnZG9sbA=="))() then
		for _, Part in Object:GetDescendants() do
			if Part:IsA(loadstring(base64decode("QmFzZVBhcnQ="))()) then
				Part.CanTouch = false
			end
		end
		if Toggles.EntityESPToggle.Value and Options.EntityESPOptions.Value[loadstring(base64decode("RmlndXJl"))()] then Functions.AddESP({ Object = Object, Text = loadstring(base64decode("RmlndXJl"))(), Color = Options.EntityESPColor.Value }, true) end
		table.insert(Objects.Entities, Object)
		if Toggles.RemoveFigure.Value and Functions.CheckCompatability({loadstring(base64decode("aXNuZXR3b3Jrb3duZXI="))()}) then
			if Floor == loadstring(base64decode("TWluZXM="))() then
				for _, Part in Object:GetDescendants() do
					if Part:IsA(loadstring(base64decode("QmFzZVBhcnQ="))()) then
						task.spawn(function()
							if IRT.Environment.isnetworkowner(Part) then
								Part.Position = Vector3.new(-49999, -49999, -49999)
							end
						end)
					end
				end
			elseif Floor == loadstring(base64decode("T2xkSG90ZWw="))() or Floor == loadstring(base64decode("Rm9vbHM="))() then
				CurrentRooms.ChildAdded:Wait()
				for _, Part in Object:GetDescendants() do
					if Part:IsA(loadstring(base64decode("QmFzZVBhcnQ="))()) then
						Part.CanCollide = false
						task.spawn(function()
							while IRT.Environment.isnetworkowner(Part) do
								Part.Position = Vector3.new(math.random(-29999,29999), math.random(-29999,29999), math.random(-29999,29999))
								task.wait()
							end
						end)
					end
				end
			end
		end
	elseif (Name == loadstring(base64decode("VGhpbmdUb09wZW4="))() or Name == loadstring(base64decode("TW92aW5nRG9vcg=="))()) and (Floor == loadstring(base64decode("Rm9vbHM="))() or Floor == loadstring(base64decode("T2xkSG90ZWw="))())
		or Name == loadstring(base64decode("V2F4X0Rvb3I="))() and Floor == loadstring(base64decode("Rm9vbHM="))()
	then
		Object:SetAttribute(loadstring(base64decode("T3JpZ2luYWxQb3NpdGlvbg=="))(), Object:GetPivot())
		local ToggleMap = { ThingToOpen = loadstring(base64decode("UmVtb3ZlQmFzZW1lbnRHYXRl"))(), MovingDoor = loadstring(base64decode("UmVtb3ZlUGFpbnRpbmdzRG9vcg=="))(), Wax_Door = loadstring(base64decode("UmVtb3ZlU2tlbGV0b25Eb29y"))() }
		if ToggleMap[Name] and Toggles[ToggleMap[Name]].Value then
			Object:PivotTo(CFrame.new(-10000, -10000, -10000))
		end
		table.insert(Objects.Obstructions, Object)
	elseif Name == loadstring(base64decode("RWxldmF0b3JCcmVha2Vy"))() then
		if Toggles.AutoBreakerBox.Value and not Globals.BreakerBoxNotified then
			Functions.Notify({ Title = loadstring(base64decode("SW50ZXJhY3Qgd2l0aCB0aGUgYnJlYWtlciBib3gu"))(), Body = loadstring(base64decode("SXQgd2lsbCBiZSBhdXRvbWF0aWNhbGx5IHNvbHZlZC4="))() })
			Globals.BreakerBoxNotified = true
		end
		Connections.BreakerConnection = Object:WaitForChild(loadstring(base64decode("U3VyZmFjZUd1aQ=="))()).Frame.Code:GetPropertyChangedSignal(loadstring(base64decode("VGV4dA=="))()):Connect(function()
			if Toggles.AutoBreakerBox.Value then
				if not Globals.BreakerBoxStartNotified and (Floor == loadstring(base64decode("Rm9vbHM="))() or Floor == loadstring(base64decode("T2xkSG90ZWw="))()) then
					Functions.Notify({ Title = loadstring(base64decode("QXR0ZW1wdGluZyB0byBzb2x2ZSB0aGUgYnJlYWtlciBib3gu"))(), Body = loadstring(base64decode("UGxlYXNlIHdhaXQu"))() })
					Globals.BreakerBoxStartNotified = true
				end
				RemotesFolder.EBF:FireServer()
			end
			Globals.BreakerBoxInteracted = true
		end)
	elseif Name == loadstring(base64decode("RWxldmF0b3JDYXI="))() then
		local ElevConn = Object.DescendantAdded:Connect(function(Desc)
			if Toggles.AutoBreakerBox.Value and Desc.Name == loadstring(base64decode("VG91Y2hJbnRlcmVzdA=="))() and not Globals.BreakerBoxFinishedNotified then
				Functions.Notify({ Title = loadstring(base64decode("U3VjY2Vzc2Z1bGx5IHNvbHZlZCB0aGUgYnJlYWtlciBib3gu"))(), Body = loadstring(base64decode("VHJ5IGdvaW5nIHRvIHRoZSBlbGV2YXRvciE="))() })
				Globals.BreakerBoxFinishedNotified = true
			end
		end)
		Object.Destroying:Once(function() ElevConn:Disconnect() end)
	elseif Object.ClassName == loadstring(base64decode("UHJveGltaXR5UHJvbXB0"))() and not Object:GetAttribute(loadstring(base64decode("RmFrZVByb21wdA=="))()) then
		if Object:HasTag(loadstring(base64decode("RGlzYWJsZVdoZW5FbmFibGVkT25DbGllbnQ="))()) then Object:RemoveTag(loadstring(base64decode("RGlzYWJsZVdoZW5FbmFibGVkT25DbGllbnQ="))()) end

		Object:SetAttribute(loadstring(base64decode("SG9sZER1cmF0aW9uX09sZA=="))(), Object.HoldDuration)
		Object:SetAttribute(loadstring(base64decode("UmVxdWlyZXNMaW5lT2ZTaWdodF9PbGQ="))(), Object.RequiresLineOfSight)
		Object:SetAttribute(loadstring(base64decode("TWF4QWN0aXZhdGlvbkRpc3RhbmNlX09sZA=="))(), Object.MaxActivationDistance)

		if Toggles.InstantPrompts.Value    then Object.HoldDuration = 0 end
		if Toggles.PromptClip.Value        then Object.RequiresLineOfSight = false end
		Object.MaxActivationDistance = Object:GetAttribute(loadstring(base64decode("TWF4QWN0aXZhdGlvbkRpc3RhbmNlX09sZA=="))()) * Options.PromptReachSlider.Value

		local LockPromptNames = { UnlockPrompt=true, SkullPrompt=true, LockPrompt=true, ThingToEnable=true, FusesPrompt=true }

		if Functions.CheckCompatability({loadstring(base64decode("ZmlyZXByb3hpbWl0eXByb21wdA=="))()}) and Floor ~= loadstring(base64decode("T2xkSG90ZWw="))() and Floor ~= loadstring(base64decode("Rm9vbHM="))() then
			local IsLockPrompt = LockPromptNames[Object.Name]
				or (Object.Parent and Object.Parent:GetAttribute(loadstring(base64decode("TG9ja2Vk"))()) == true)
				or (Object.Parent and Object.Parent.Parent and Object.Parent.Parent.Name == loadstring(base64decode("TG9ja2VyX1NtYWxsX0xvY2tlZA=="))() and Object.Name == loadstring(base64decode("QWN0aXZhdGVFdmVudFByb21wdA=="))())

			if IsLockPrompt then
				local FakePrompt = Object:Clone()
				FakePrompt:SetAttribute(loadstring(base64decode("RmFrZVByb21wdA=="))(), true)
				task.wait()
				FakePrompt.Parent = Object.Parent

				FakePrompt:SetAttribute(loadstring(base64decode("SG9sZER1cmF0aW9uX09sZA=="))(), Object:GetAttribute(loadstring(base64decode("SG9sZER1cmF0aW9uX09sZA=="))()))
				FakePrompt:SetAttribute(loadstring(base64decode("UmVxdWlyZXNMaW5lT2ZTaWdodF9PbGQ="))(), Object:GetAttribute(loadstring(base64decode("UmVxdWlyZXNMaW5lT2ZTaWdodF9PbGQ="))()))
				FakePrompt:SetAttribute(loadstring(base64decode("TWF4QWN0aXZhdGlvbkRpc3RhbmNlX09sZA=="))(), Object:GetAttribute(loadstring(base64decode("TWF4QWN0aXZhdGlvbkRpc3RhbmNlX09sZA=="))()))

				FakePrompt.HoldDuration = Object.HoldDuration
				FakePrompt.RequiresLineOfSight = Object.RequiresLineOfSight
				FakePrompt.MaxActivationDistance = Object.MaxActivationDistance

				if Toggles.InstantPrompts.Value    then FakePrompt.HoldDuration = 0 end
				if Toggles.PromptClip.Value        then FakePrompt.RequiresLineOfSight = false end
				FakePrompt.MaxActivationDistance = FakePrompt:GetAttribute(loadstring(base64decode("TWF4QWN0aXZhdGlvbkRpc3RhbmNlX09sZA=="))()) * Options.PromptReachSlider.Value

				FakePrompts[FakePrompt] = Object
				pcall(function() Object.Parent = Globals.PromptContainer end)

				local FPEnabledConn = Object:GetPropertyChangedSignal(loadstring(base64decode("RW5hYmxlZA=="))()):Connect(function()
					FakePrompt.Enabled = Object.Enabled
				end)
				Object:GetPropertyChangedSignal(loadstring(base64decode("QWN0aW9uVGV4dA=="))()):Once(function()
					Object.Parent = FakePrompt.Parent
					FakePrompt:Destroy()
					FPEnabledConn:Disconnect()
				end)
				Object.Destroying:Once(function()
					FakePrompt:Destroy()
					FPEnabledConn:Disconnect()
				end)
				table.insert(Connections, FPEnabledConn)
				table.insert(Objects.Prompts, FakePrompt)

				FakePrompt.Enabled = false
				task.wait()
				FakePrompt.Enabled = Object.Enabled
			end
		end
		table.insert(Objects.Prompts, Object)
	elseif Name == loadstring(base64decode("UGFkbG9jaw=="))() then
		local PadlockConn = Services.RunService.Heartbeat:Connect(function()
			if Object.PrimaryPart then
				local Distance = LocalPlayer:DistanceFromCharacter(Object.PrimaryPart.Position)
				if Toggles.AutoUnlockPadlockToggle.Value then
					local Code = Functions.GetLibraryCode()
					if Code and tonumber(Code) and Distance < Options.AutoUnlockPadlockSlider.Value then
						RemotesFolder.PL:FireServer(Code)
					end
				end
				if Toggles.AutoLibraryGuessCode.Value and LatestRoom.Value == 50 then
					local Code = Functions.GetRandomCode()
					if Code then RemotesFolder.PL:FireServer(Code) end
				end
			end
		end)
		Object.Destroying:Once(function()
			PadlockConn:Disconnect()
		end)
	end
end

Connections.PromptAnimationFixer1 = Services.ProximityPromptService.PromptButtonHoldBegan:Connect(function(Object)
	if not Object:GetAttribute(loadstring(base64decode("RmFrZVByb21wdA=="))()) then return end
	local ToolNames = { loadstring(base64decode("TG9ja3BpY2s="))(),loadstring(base64decode("U2hlYXJz"))(),loadstring(base64decode("U2tlbGV0b25LZXk="))(),loadstring(base64decode("S2V5"))(),loadstring(base64decode("R2VuZXJhdG9yRnVzZQ=="))(),loadstring(base64decode("S2V5RWxlY3RyaWNhbA=="))(),loadstring(base64decode("S2V5QmFja2Rvb3I="))(),loadstring(base64decode("S2V5SXJvbg=="))(), loadstring(base64decode("TXVsdGl0b29s"))() }
	local AnimateToolNames = { loadstring(base64decode("TG9ja3BpY2s="))(),loadstring(base64decode("U2hlYXJz"))(),loadstring(base64decode("U2tlbGV0b25LZXk="))(),loadstring(base64decode("S2V5"))(),loadstring(base64decode("S2V5RWxlY3RyaWNhbA=="))(),loadstring(base64decode("S2V5QmFja2Rvb3I="))(),loadstring(base64decode("S2V5SXJvbg=="))(), loadstring(base64decode("TXVsdGl0b29s"))() }
	local Tool
	for _, N in ToolNames do Tool = Character:FindFirstChild(N) if Tool then break end end

	local Prompt = Object
	local LockPromptNames = { UnlockPrompt=true, SkullPrompt=true, LockPrompt=true, ThingToEnable=true, FusesPrompt=true }
	local IsLockPrompt = LockPromptNames[Object.Name]
		or (Object.Parent and Object.Parent:GetAttribute(loadstring(base64decode("TG9ja2Vk"))()) == true)
		or (Object.Parent and Object.Parent.Parent and Object.Parent.Parent.Name == loadstring(base64decode("TG9ja2VyX1NtYWxsX0xvY2tlZA=="))() and Object.Name == loadstring(base64decode("QWN0aXZhdGVFdmVudFByb21wdA=="))())
	if IsLockPrompt then
		if Options.AutoInteractIgnoreList.Value[loadstring(base64decode("TG9ja3M="))()] then return end
		local KeyItems = { loadstring(base64decode("S2V5"))(),loadstring(base64decode("R2VuZXJhdG9yRnVzZQ=="))(),loadstring(base64decode("S2V5QmFja2Rvb3I="))(),loadstring(base64decode("S2V5RWxlY3RyaWNhbA=="))(),loadstring(base64decode("S2V5SXJvbg=="))(),loadstring(base64decode("TG9ja3BpY2s="))(),loadstring(base64decode("U2tlbGV0b25LZXk="))(),loadstring(base64decode("U2hlYXJz"))(),loadstring(base64decode("TXVsdGl0b29s"))() }
		local OffhandKeyItems = { loadstring(base64decode("S2V5"))(),loadstring(base64decode("R2VuZXJhdG9yRnVzZQ=="))(),loadstring(base64decode("S2V5RWxlY3RyaWNhbA=="))(),loadstring(base64decode("S2V5SXJvbg=="))() }
		local HasKey = false
		for _, K in KeyItems do if Functions.HasItem(K, true) then HasKey = true break end end
		for _, K in OffhandKeyItems do if Functions.HasItem(K) then HasKey = true break end end
		if not HasKey then return end
	end

	if Prompt.Parent.Name == loadstring(base64decode("Q3V0dGFibGVWaW5lcw=="))() and not Functions.HasItem(loadstring(base64decode("U2hlYXJz"))(), true) and not Functions.HasItem(loadstring(base64decode("TXVsdGl0b29s"))(), true) or Prompt.Parent.Name == loadstring(base64decode("Q2hlc3RfVmluZQ=="))() and not Functions.HasItem(loadstring(base64decode("U2hlYXJz"))(), true) and not Functions.HasItem(loadstring(base64decode("TXVsdGl0b29s"))(), true) or Prompt.Parent.Name == loadstring(base64decode("Q2VsbGFy"))() and not Functions.HasItem(loadstring(base64decode("U2hlYXJz"))(), true) and not Functions.HasItem(loadstring(base64decode("TXVsdGl0b29s"))(), true) then return end
	if Prompt.Parent.Name == loadstring(base64decode("U2t1bGxMb2Nr"))() and not Functions.HasItem(loadstring(base64decode("U2tlbGV0b25LZXk="))(), true) then return end
	if Prompt.Parent.Name == loadstring(base64decode("TG9jazE="))() and not Functions.HasItem(loadstring(base64decode("TG9ja3BpY2s="))(), true) and not Functions.HasItem(loadstring(base64decode("TXVsdGl0b29s"))(), true) or Prompt.Parent.Name == loadstring(base64decode("TG9jazI="))() and not Functions.HasItem(loadstring(base64decode("TG9ja3BpY2s="))(), true) and not Functions.HasItem(loadstring(base64decode("TXVsdGl0b29s"))(), true) then return end
	if Functions.HasItem(loadstring(base64decode("U2hlYXJz"))(), true) and IsLockPrompt and Prompt.Parent.Name ~= loadstring(base64decode("Q3V0dGFibGVWaW5lcw=="))() and Prompt.Parent.Name ~= loadstring(base64decode("Q2hlc3RfVmluZQ=="))() and Prompt.Parent.Name ~= loadstring(base64decode("Q2VsbGFy"))() then return end
	
	if Tool and table.find(AnimateToolNames, Tool.Name) and Globals.UseAnimation then
		Globals.UseAnimationBreak:Stop()
		Globals.UseAnimation:Stop()
		Globals.UseAnimation:Play()
		if Tool.Name == loadstring(base64decode("U2hlYXJz"))() then Tool:WaitForChild(loadstring(base64decode("SGFuZGxl"))()):WaitForChild(loadstring(base64decode("c291bmRfcHJvbXB0"))()):Play() end
	end
end)

Globals.ObjectQueue = {}
local AllowedInstances = {
	Lava=true, GoldPile=true, KeyObtain=true, Drakobloxxer=true, FuseObtain=true,
	MinesGenerator=true, JeffTheKiller=true, Snare=true, FakeDoor=true, DoorFake=true, SideroomSpace=true,
	ChestBox=true, ChestBoxLocked=true, Chest_Vine=true, Locker_Small_Locked=true, Toolbox=true,
	Toolbox_Locked=true, Wardrobe=true, [loadstring(base64decode("V2FyZHJvYmUtRk9PTFMyNg=="))()]=true, Toolshed=true, Toolshed_Small=true,
	Bed=true, MinesAnchor=true, Double_Bed=true, RetroWardrobe=true, Backdoor_Wardrobe=true,
	Rooms_Locker=true, Rooms_Locker_Fridge=true, Locker_Large=true, FigureRig=true, FigureRagdoll=true,
	TimerLever=true, Lever=true, Seek_Arm=true, ChandelierObstruction=true, ScaryWall=true, Ladder=true,
	CircularVent=true, Dumpster=true, SquareGrate=true, TriggerEventCollision=true, GrumbleRig=true,
	GiggleCeiling=true, MinesGateButton=true, ElectricalKeyObtain=true, LibraryHintPaper=true,
	WaterPump=true, CringlePresent=true, Wheel=true, PickupItem=true, LiveHintBook=true,
	LiveBreakerPolePickup=true, LeverForGate=true, GloomPile=true, SeekFloodline=true, Door=true,
	Green_Herb=true, Bridge=true, MouseHole=true, BananaPeel=true, NannerPeel=true, PowerupPad=true,
	IndustrialGate=true, CollisionFloor=true, ElevatorCar=true, Wax_Door=true, ThingToOpen=true,
	MovingDoor=true, StardustPickup=true, Hole=true, Groundskeeper=true, MandrakeLive=true,
	GardenGateButton=true, LotusPetalPickup=true, VineGuillotine=true, LiveEntityBramble=true, ArchivesFihTank=true,
	RiftSpawn=true, ElevatorBreaker=true, RunnerNodes=true, PathLights=true, DuckBoard=true,
	Padlock=true, EyestalkEndCutscene=true, MinecartRig=true, SeekMovingNewClone=true, Cellar=true, ArchivesPackageDeposit=true, StairwellScrapper=true,
	StairwellFireAlarm=true, ShoppingCart=true, Mirror=true, StairwellLockpickDoor=true
}

Functions.QueueObject = function(Object)
	if TimeShowerClone and Object:IsDescendantOf(TimeShowerClone) then
		return
	end
	local IsHidingSpot = typeof(Object.Name) == loadstring(base64decode("c3RyaW5n"))() and string.find(string.lower(Object.Name), loadstring(base64decode("aGlkaW5nc3BvdA=="))())
	if not AllowedInstances[Object.Name] and not IsHidingSpot and Object.ClassName ~= loadstring(base64decode("UHJveGltaXR5UHJvbXB0"))() and Object.Parent ~= CurrentRooms and not ItemNames[Object.Name] then
		return
	end
	table.insert(Globals.ObjectQueue, Object)
end

Globals.QueueDone = true
Connections.QueueConnection = Services.RunService.RenderStepped:Connect(function()
	local Object = table.remove(Globals.ObjectQueue, 1)
	if Object then
		Functions.HandleObject(Object)
	end
end)

for _, Object in Services.Workspace:GetDescendants() do
	task.spawn(function() Functions.QueueObject(Object) end)
end

Connections.InstanceHandler = Services.Workspace.DescendantAdded:Connect(function(Object)
	Functions.QueueObject(Object)
end)

for _, Player in Services.Players:GetPlayers() do
	if Player ~= LocalPlayer then
		if Player.Character and Toggles.PlayerESPToggle.Value then
			Functions.AddESP({ Object = Player.Character, Text = Player.Name, Color = Options.PlayerESPColor.Value })
		end
		local CharConn = Player.CharacterAdded:Connect(function(NewCharacter)
			if Toggles.PlayerESPToggle.Value then
				Functions.AddESP({ Object = NewCharacter, Text = Player.Name, Color = Options.PlayerESPColor.Value })
			end
		end)
		local DeadConn = Player:GetAttributeChangedSignal(loadstring(base64decode("QWxpdmU="))()):Connect(function()
			if Player:GetAttribute(loadstring(base64decode("QWxpdmU="))()) ~= true and Player.Character then
				Functions.RemoveESP(Player.Character)
			end
		end)
		table.insert(Connections, CharConn)
		table.insert(Connections, DeadConn)
		Player.Destroying:Once(function()
			CharConn:Disconnect()
			DeadConn:Disconnect()
		end)
	end
end

Connections.PlayerHandler = Services.Players.PlayerAdded:Connect(function(Player)
	if Player == LocalPlayer then return end
	if Player.Character and Toggles.PlayerESPToggle.Value then
		Functions.AddESP({ Object = Player.Character, Text = Player.Name, Color = Options.PlayerESPColor.Value })
	end
	local CharConn = Player.CharacterAdded:Connect(function(NewCharacter)
		if Toggles.PlayerESPToggle.Value then
			Functions.AddESP({ Object = NewCharacter, Text = Player.Name, Color = Options.PlayerESPColor.Value })
		end
	end)
	local DeadConn = Player:GetAttributeChangedSignal(loadstring(base64decode("QWxpdmU="))()):Connect(function()
		if Player:GetAttribute(loadstring(base64decode("QWxpdmU="))()) ~= true and Player.Character then
			Functions.RemoveESP(Player.Character)
		end
	end)
	table.insert(Connections, CharConn)
	table.insert(Connections, DeadConn)
	Player.Destroying:Once(function()
		CharConn:Disconnect()
		DeadConn:Disconnect()
	end)
end)

local PromptsToFire = {}
local PromptCooldown = {}

Functions.FirePrompt      = IRT.Environment.fireproximityprompt
Functions.ForceFirePrompt = IRT.Environment.fireproximityprompt

if not Functions.FirePrompt then
	Functions.FirePrompt = function(Prompt)
		if not Prompt:IsA(loadstring(base64decode("UHJveGltaXR5UHJvbXB0"))()) or PromptCooldown[Prompt] or table.find(PromptsToFire, Prompt) or not Camera then return end
		table.insert(PromptsToFire, Prompt)
	end
	Functions.ForceFirePrompt = Functions.FirePrompt

	task.spawn(function()
		while task.wait() do
			local Prompt = table.remove(PromptsToFire, 1)
			if not Prompt then continue end
			PromptCooldown[Prompt] = true

			local OldDist   = Prompt.MaxActivationDistance
			local OldEnable = Prompt.Enabled
			local OldParent = Prompt.Parent
			local OldHold   = Prompt.HoldDuration
			local OldLOS    = Prompt.RequiresLineOfSight

			Prompt.MaxActivationDistance = 99999
			Prompt.Enabled = true
			Prompt.HoldDuration = 0
			Prompt.RequiresLineOfSight = false

			local TempPart = Instance.new(loadstring(base64decode("UGFydA=="))())
			TempPart.Parent = Services.Workspace
			TempPart.CanCollide = false TempPart.CanQuery = false TempPart.CanTouch = false
			TempPart.Anchored = true TempPart.Transparency = 1
			TempPart.Size = Vector3.new(0.001, 0.001, 0.001)
			TempPart.Position = Camera.CFrame:ToWorldSpace(CFrame.new(0, 0, -0.1)).Position

			if not Prompt or not OldParent then
				TempPart:Destroy()
				PromptCooldown[Prompt] = nil
				continue
			end

			pcall(function() Prompt.Parent = TempPart end)

			local Shown, Fired = false, false

			local ShownConn = Services.ProximityPromptService.PromptShown:Connect(function(P)
				if P == Prompt then Shown = true end
			end)
			local FiredConn = Prompt.Triggered:Connect(function() Fired = true end)

			local T1 = 0
			while not Shown and T1 < 5 do T1 += 1 task.wait() end

			local T2 = 0
			while not Fired and T2 < 5 do
				Prompt:InputHoldBegin()
				Prompt:InputHoldEnd()
				T2 += 1 task.wait()
			end

			Prompt.MaxActivationDistance = OldDist
			Prompt.Enabled = OldEnable
			Prompt.HoldDuration = OldHold
			Prompt.RequiresLineOfSight = OldLOS
			pcall(function() Prompt.Parent = OldParent end)
			task.wait()
			PromptCooldown[Prompt] = nil
			TempPart:Destroy()
			ShownConn:Disconnect()
			FiredConn:Disconnect()
		end
	end)
end

local AutoInteractBlacklist = {
	HidePrompt=true, RiftPrompt=true, StarRiftPrompt=true, InteractPrompt=true, ClimbPrompt=true,
	DonatePrompt=true, DialoguePrompt=true, RevivePrompt=true, EnterPrompt=true, AnimatePrompt=true,
	ToolEventPrompt=true, Prompt=true, PropPrompt=true
}

local TriggerDebounce = false

local function GetHidingSpotModel(Prompt)
	if not Prompt or not Prompt.Parent then return false end
	local Model = Prompt.Parent
	while Model and not Model:IsA(loadstring(base64decode("TW9kZWw="))()) do
		Model = Model.Parent
	end
	if not Model then return nil end

	local Name = string.lower(Model.Name)
	if not string.find(Name, loadstring(base64decode("aGlkaW5nc3BvdA=="))()) and not string.find(Name, loadstring(base64decode("aGlkaW5nX3Nwb3Q="))()) then
		return nil
	end
	return Model
end

local function HasHidePrompt(Model)
	return Model and (Model:FindFirstChild(loadstring(base64decode("SGlkZVByb21wdA=="))()) or Model:FindFirstChild(loadstring(base64decode("SGlkaW5nUHJvbXB0"))())) ~= nil
end

local function IsHidingSpotPrompt(Prompt)
	if not Prompt or not Prompt.Parent then return false end
	if Prompt.Name ~= loadstring(base64decode("SGlkZVByb21wdA=="))() and Prompt.Name ~= loadstring(base64decode("SGlkaW5nUHJvbXB0"))() then return false end
	return HasHidePrompt(GetHidingSpotModel(Prompt))
end

Functions.TriggerPrompt = function(Prompt)
	if not Prompt or not Prompt.Parent then return end
	if Character:GetAttribute(loadstring(base64decode("SGlkaW5n"))()) == true then return end
	local HidingSpot = GetHidingSpotModel(Prompt)
	if HidingSpot and Prompt.Name ~= loadstring(base64decode("SW50ZXJhY3RQcm9tcHQ="))() then return end
	local IsHidingSpotInteractPrompt = HidingSpot and Prompt.Name == loadstring(base64decode("SW50ZXJhY3RQcm9tcHQ="))()
	if AutoInteractBlacklist[Prompt.Name] and not IsHidingSpotPrompt(Prompt) and not IsHidingSpotInteractPrompt then return end
	if (Prompt.Name == loadstring(base64decode("SGlkZVByb21wdA=="))() or Prompt.Name == loadstring(base64decode("SGlkaW5nUHJvbXB0"))()) and not IsHidingSpotPrompt(Prompt) then return end
	if (Prompt.Name == loadstring(base64decode("SGlkZVByb21wdA=="))() or Prompt.Name == loadstring(base64decode("SGlkaW5nUHJvbXB0"))() or IsHidingSpotPrompt(Prompt)) then
		if not Toggles.AutoClosetToggle.Value then return end
		local Entity = Functions.GetNearestEntity(true, Options.AutoClosetEntityList.Value)
		if not Entity then return end
		local EntityDistance = LocalPlayer:DistanceFromCharacter(Entity.PrimaryPart.Position)
		if EntityDistance > (EntityDistances[Entity.Name] or 150) then return end
	end
	if TriggerDebounce then return end

	local ParentItem = Functions.HasItem(Prompt.Parent.Name)
	if ParentItem and ParentItem:GetAttribute(loadstring(base64decode("RHVyYWJpbGl0eQ=="))()) and ParentItem:GetAttribute(loadstring(base64decode("RHVyYWJpbGl0eU1heA=="))())
		and ParentItem:GetAttribute(loadstring(base64decode("RHVyYWJpbGl0eQ=="))()) >= ParentItem:GetAttribute(loadstring(base64decode("RHVyYWJpbGl0eU1heA=="))())
	then return end

	local LockPromptNames = { UnlockPrompt=true, SkullPrompt=true, LockPrompt=true, ThingToEnable=true, FusesPrompt=true }
	local IsLockPrompt = LockPromptNames[Prompt.Name]
		or (Prompt.Parent and Prompt.Parent:GetAttribute(loadstring(base64decode("TG9ja2Vk"))()) == true)
		or (Prompt.Parent and Prompt.Parent.Parent and Prompt.Parent.Parent.Name == loadstring(base64decode("TG9ja2VyX1NtYWxsX0xvY2tlZA=="))() and Prompt.Name == loadstring(base64decode("QWN0aXZhdGVFdmVudFByb21wdA=="))())

	if IsLockPrompt then
		if Options.AutoInteractIgnoreList.Value[loadstring(base64decode("TG9ja3M="))()] then return end
		local KeyItems = { loadstring(base64decode("S2V5"))(),loadstring(base64decode("R2VuZXJhdG9yRnVzZQ=="))(),loadstring(base64decode("S2V5QmFja2Rvb3I="))(),loadstring(base64decode("S2V5RWxlY3RyaWNhbA=="))(),loadstring(base64decode("S2V5SXJvbg=="))(),loadstring(base64decode("TG9ja3BpY2s="))(),loadstring(base64decode("U2tlbGV0b25LZXk="))(),loadstring(base64decode("U2hlYXJz"))(),loadstring(base64decode("TXVsdGl0b29s"))() }
		local OffhandKeyItems = { loadstring(base64decode("S2V5"))(),loadstring(base64decode("R2VuZXJhdG9yRnVzZQ=="))(),loadstring(base64decode("S2V5RWxlY3RyaWNhbA=="))(),loadstring(base64decode("S2V5SXJvbg=="))() }
		local HasKey = false
		for _, K in KeyItems do if Functions.HasItem(K, true) then HasKey = true break end end
		for _, K in OffhandKeyItems do if Functions.HasItem(K) then HasKey = true break end end
		if not HasKey then return end
	end

	if Prompt.Parent.Name == loadstring(base64decode("Q3V0dGFibGVWaW5lcw=="))() and not Functions.HasItem(loadstring(base64decode("U2hlYXJz"))(), true) and not Functions.HasItem(loadstring(base64decode("TXVsdGl0b29s"))(), true) or Prompt.Parent.Name == loadstring(base64decode("Q2hlc3RfVmluZQ=="))() and not Functions.HasItem(loadstring(base64decode("U2hlYXJz"))(), true) and not Functions.HasItem(loadstring(base64decode("TXVsdGl0b29s"))(), true) or Prompt.Parent.Name == loadstring(base64decode("Q2VsbGFy"))() and not Functions.HasItem(loadstring(base64decode("U2hlYXJz"))(), true) and not Functions.HasItem(loadstring(base64decode("TXVsdGl0b29s"))(), true) then return end
	if Prompt.Parent.Name == loadstring(base64decode("U2t1bGxMb2Nr"))() and not Functions.HasItem(loadstring(base64decode("U2tlbGV0b25LZXk="))(), true) then return end
	if Prompt.Parent.Name == loadstring(base64decode("TG9jazE="))() and not Functions.HasItem(loadstring(base64decode("TG9ja3BpY2s="))(), true) and not Functions.HasItem(loadstring(base64decode("TXVsdGl0b29s"))(), true) or Prompt.Parent.Name == loadstring(base64decode("TG9jazI="))() and not Functions.HasItem(loadstring(base64decode("TG9ja3BpY2s="))(), true) and not Functions.HasItem(loadstring(base64decode("TXVsdGl0b29s"))(), true) then return end
	if Functions.HasItem(loadstring(base64decode("U2hlYXJz"))(), true) and IsLockPrompt and Prompt.Parent.Name ~= loadstring(base64decode("Q3V0dGFibGVWaW5lcw=="))() and Prompt.Parent.Name ~= loadstring(base64decode("Q2hlc3RfVmluZQ=="))() and Prompt.Parent.Name ~= loadstring(base64decode("Q2VsbGFy"))() then return end

	if Prompt.Parent.Name == loadstring(base64decode("R2xpdGNoQ3ViZQ=="))() and Options.AutoInteractIgnoreList.Value[loadstring(base64decode("R2xpdGNoIEZyYWdtZW50cw=="))()] then return end

	if (Prompt.Parent.Name == loadstring(base64decode("S2V5T2J0YWlu"))() and (Functions.HasItem(loadstring(base64decode("S2V5"))()) or Functions.HasItem(loadstring(base64decode("S2V5QmFja2Rvb3I="))())))
		or (Prompt.Parent.Name == loadstring(base64decode("RWxlY3RyaWNhbEtleU9idGFpbg=="))() and Functions.HasItem(loadstring(base64decode("S2V5RWxlY3RyaWNhbA=="))()))
	then return end

	if Prompt:IsDescendantOf(Drops) and Options.AutoInteractIgnoreList.Value[loadstring(base64decode("RHJvcHBlZCBJdGVtcw=="))()] then return end
	if Prompt.Parent.Name == loadstring(base64decode("VHJhY2tMZXZlcg=="))() then return end
	if Prompt.Name == loadstring(base64decode("QWN0aXZhdGVFdmVudFByb21wdA=="))() and (Prompt.ActionText == loadstring(base64decode("Q2xvc2U="))()
		or Prompt.Parent.Name == loadstring(base64decode("RWxldmF0b3JCcmVha2Vy"))()
		or (Prompt.Parent.Parent and Prompt.Parent.Parent.Name == loadstring(base64decode("SW5kdXN0cmlhbEdhdGU="))()))
	then return end
	if Prompt.Name == loadstring(base64decode("QWN0aXZhdGVFdmVudFByb21wdA=="))() and (Prompt.Parent.Name == loadstring(base64decode("UGFkbG9jaw=="))() or Prompt.Parent.Name == loadstring(base64decode("TWluZXNBbmNob3I="))()) then return end
	if Prompt.Parent.Name == loadstring(base64decode("TGV2ZXJGb3JHYXRl"))() and Prompt:GetAttribute(loadstring(base64decode("SW50ZXJhY3Rpb25z"))()) then return end
	if Prompt.Parent.Parent and (Prompt.Parent.Parent.Name == loadstring(base64decode("RG9vckZha2U="))() or Prompt.Parent.Parent.Name == loadstring(base64decode("RmFrZURvb3I="))()) then return end
	if Prompt.Parent:GetAttribute(loadstring(base64decode("SmVmZlNob3A="))()) and Options.AutoInteractIgnoreList.Value[loadstring(base64decode("SmVmZiBJdGVtcw=="))()] then return end
	if Prompt:GetAttribute(loadstring(base64decode("QXV0b0ludGVyYWN0SWdub3Jl"))()) then return end
	if Prompt.Name == loadstring(base64decode("UHVzaFByb21wdA=="))() and Options.AutoInteractIgnoreList.Value[loadstring(base64decode("TWluZWNhcnRz"))()] then return end
	if (Prompt.Parent.Name == loadstring(base64decode("R29sZFBpbGU="))() or Prompt.Parent.Name == loadstring(base64decode("U3RhcmR1c3RQaWNrdXA="))()) and Options.AutoInteractIgnoreList.Value[loadstring(base64decode("Q3VycmVuY3k="))()] then return end

	if Prompt.Parent.Name == loadstring(base64decode("QmFuZGFnZQ=="))() then
		local BPack = Functions.HasItem(loadstring(base64decode("QmFuZGFnZVBhY2s="))())
		if Humanoid.Health >= Humanoid.MaxHealth and not BPack then return end
		if BPack and BPack:GetAttribute(loadstring(base64decode("RHVyYWJpbGl0eQ=="))()) >= BPack:GetAttribute(loadstring(base64decode("RHVyYWJpbGl0eU1heA=="))()) then return end
	end

	if Prompt.Parent.Name == loadstring(base64decode("QmF0dGVyeQ=="))() then
		local Tool = Character:FindFirstChildOfClass(loadstring(base64decode("VG9vbA=="))())
		local BPack = Functions.HasItem(loadstring(base64decode("QmF0dGVyeVBhY2s="))())
		if not Tool and not BPack then return end
		if Tool and Tool:GetAttribute(loadstring(base64decode("TGlnaHRTb3VyY2U="))()) then
			if Tool:GetAttribute(loadstring(base64decode("RHVyYWJpbGl0eQ=="))()) and Tool:GetAttribute(loadstring(base64decode("RHVyYWJpbGl0eU1heA=="))())
				and Tool:GetAttribute(loadstring(base64decode("RHVyYWJpbGl0eQ=="))()) > Tool:GetAttribute(loadstring(base64decode("RHVyYWJpbGl0eU1heA=="))())
			then return end
		elseif not BPack then
			return
		end
		if BPack and BPack:GetAttribute(loadstring(base64decode("RHVyYWJpbGl0eQ=="))()) >= BPack:GetAttribute(loadstring(base64decode("RHVyYWJpbGl0eU1heA=="))()) then return end
	end

	if Prompt.Name == loadstring(base64decode("SGVyYlByb21wdA=="))() then
		local Effects = Globals.MainUI.MainFrame.Healthbar:FindFirstChild(loadstring(base64decode("RWZmZWN0cw=="))())
		if Effects and Effects.HerbGreenEffect.Visible then return end
	end

	if (Prompt.Parent.Name == loadstring(base64decode("TGlicmFyeUhpbnRQYXBlcg=="))() or Prompt.Parent.Name == loadstring(base64decode("UGlja3VwSXRlbQ=="))()) and (Functions.HasItem(loadstring(base64decode("TGlicmFyeUhpbnRQYXBlcg=="))()) or Functions.HasItem(loadstring(base64decode("TGlicmFyeUhpbnRQYXBlckhhcmQ="))())) then return end
	if Prompt.Parent.Name == loadstring(base64decode("QWxhcm1DbG9jaw=="))() and Functions.HasItem(loadstring(base64decode("QWxhcm1DbG9jaw=="))()) then return end
	if Prompt.Parent.Name == loadstring(base64decode("S2V5T2J0YWluRmFrZQ=="))() or Prompt.Parent.Name == loadstring(base64decode("VGl0aGluZ1BsYXRl"))() then return end
	if Prompt.Parent.Name == loadstring(base64decode("U3RhckJvdHRsZQ=="))() then return end
    -- archives
	if Prompt.parent.Name == loadstring(base64decode("QXJjaGl2ZXNTdG9yYWdlQm94"))() then return end
	if Prompt.Parent.Name == loadstring(base64decode("QnJpZWZjYXNl"))() then return end
	if Prompt.Name == loadstring(base64decode("U2lua1Byb21wdA=="))() or Prompt.Parent.Name == loadstring(base64decode("RmF1Y2V0"))() then return end
	if Prompt.Parent.Name == loadstring(base64decode("UGFwZXJQbGFuZVBpY2t1cA=="))() or Prompt.Parent.Name == loadstring(base64decode("UGFwZXJQbGFuZQ=="))() then return end
	if Prompt.Name == loadstring(base64decode("TWFudWFsT3BlblByb21wdA=="))() or Prompt.Name == loadstring(base64decode("RW50cnlQcm9tcHQ="))() then return end
	if Prompt.Parent.Parent.Name == loadstring(base64decode("QXJjaGl2ZXNMYXJnZVByaW50ZXI="))() then return end
	if Prompt.Name == loadstring(base64decode("VHJhc2hjYW5Qcm9tcHQ="))() then return end
	if Prompt.Parent.Name == loadstring(base64decode("S2V5Ym9hcmQ="))() then return end
	if Prompt.Name == loadstring(base64decode("Q2FydFByb21wdA=="))() or Prompt.Parent.Parent.Name == loadstring(base64decode("QXJjaGl2ZXNPZmZpY2VDaGFpcg=="))() then return end
	if Prompt.Parent.Name == loadstring(base64decode("QXJjaGl2ZXNUZXJtaW5hbA=="))() then return end
	if Prompt.Name == loadstring(base64decode("VmVuZG9yUHJvbXB0"))() then return end
    if Prompt.Parent.Name == loadstring(base64decode("U2VhdFBhcnQ="))() or Prompt.Name == loadstring(base64decode("U2VhdFByb21wdA=="))() then return end


	-- Stairwell
	if Prompt.Parent.Name == loadstring(base64decode("U3RhaXJ3ZWxsU2NyYXBwZXI="))() then return end
	if Prompt.Name == loadstring(base64decode("UG9ydHJhaXREdXBlUHJvbXB0"))() or Prompt.Parent.Name == loadstring(base64decode("TWlycm9yVG9vbA=="))() then return end
	if Prompt.Name == loadstring(base64decode("TGFwdG9wUHJvbXB0"))() or Prompt.Parent.Name == loadstring(base64decode("U2VjcmV0TGFwdG9w"))() then return end
	if Prompt.Parent.Name == loadstring(base64decode("U3RhaXJ3ZWxsRmlyZUFsYXJt"))() or Prompt.Parent.Parent.Name == loadstring(base64decode("U3RhaXJ3ZWxsRmlyZUFsYXJt"))() then return end
	if Prompt.Parent.name == loadstring(base64decode("Q29iYmxlckZyaWVuZGx5"))() then return end
	if Prompt.Parent.Name == loadstring(base64decode("U3RhaXJ3ZWxsVGVybWluYWw="))() then return end
	if Prompt.Parent.Parent.Name == loadstring(base64decode("TWVsZENob3Jk"))() then return end

	Functions.FirePrompt(Prompt)
	TriggerDebounce = true
	if Floor == loadstring(base64decode("T2xkSG90ZWw="))() then task.wait() end
	TriggerDebounce = false
end

Globals.LastAutoInteractFire = tick()
Connections.AutoInteract = Services.RunService.Heartbeat:Connect(function()
	local Active = Toggles.AutoInteractToggle.Value or Options.AutoInteractKeybind2:GetState()
    if not Active then return end
    if tick() - Globals.LastAutoInteractFire < 1/60 then return end

	for _, Prompt in Objects.Prompts do
        if Prompt:GetAttribute(loadstring(base64decode("UGFyZW50Um9vbQ=="))()) and tonumber(Prompt:GetAttribute(loadstring(base64decode("UGFyZW50Um9vbQ=="))())) ~= tonumber(LocalPlayer:GetAttribute(loadstring(base64decode("Q3VycmVudFJvb20="))())) then continue end

		if Prompt.Parent and (Prompt.Parent:IsA(loadstring(base64decode("QmFzZVBhcnQ="))()) or Prompt.Parent:IsA(loadstring(base64decode("TW9kZWw="))())) then
			local Distance
			if Prompt.Parent:IsA(loadstring(base64decode("QmFzZVBhcnQ="))()) then
				Distance = LocalPlayer:DistanceFromCharacter(Prompt.Parent.Position)
			else
				Distance = LocalPlayer:DistanceFromCharacter(Prompt.Parent:GetPivot().Position)
			end
			if Distance <= Prompt.MaxActivationDistance and Prompt.Enabled or Distance <= Prompt.MaxActivationDistance and Prompt.Name == loadstring(base64decode("TG9uZ1B1c2hQcm9tcHQ="))() or Distance <= Prompt.MaxActivationDistance and Prompt.Name == loadstring(base64decode("QmlnUHJvcFByb21wdA=="))() then
				task.spawn(Functions.TriggerPrompt, Prompt)
			end
		end
	end
    Globals.LastAutoInteractFire = tick()
end)

Connections.InfiniteItemsHandler = Services.ProximityPromptService.PromptTriggered:Connect(function(Object)
	if not Object:GetAttribute(loadstring(base64decode("RmFrZVByb21wdA=="))()) then return end

	local ToolNames = { loadstring(base64decode("TG9ja3BpY2s="))(),loadstring(base64decode("U2hlYXJz"))(),loadstring(base64decode("U2tlbGV0b25LZXk="))(),loadstring(base64decode("S2V5"))(),loadstring(base64decode("R2VuZXJhdG9yRnVzZQ=="))(),loadstring(base64decode("S2V5RWxlY3RyaWNhbA=="))(),loadstring(base64decode("S2V5QmFja2Rvb3I="))(),loadstring(base64decode("S2V5SXJvbg=="))(), loadstring(base64decode("TXVsdGl0b29s"))() }
	local AnimateToolNames = { loadstring(base64decode("TG9ja3BpY2s="))(),loadstring(base64decode("U2hlYXJz"))(),loadstring(base64decode("U2tlbGV0b25LZXk="))(),loadstring(base64decode("S2V5"))(),loadstring(base64decode("S2V5RWxlY3RyaWNhbA=="))(),loadstring(base64decode("S2V5QmFja2Rvb3I="))(),loadstring(base64decode("S2V5SXJvbg=="))(), loadstring(base64decode("TXVsdGl0b29s"))() }
	local Tool
	for _, N in ToolNames do Tool = Character:FindFirstChild(N) if Tool then break end end

	local Prompt = Object
	local LockPromptNames = { UnlockPrompt=true, SkullPrompt=true, LockPrompt=true, ThingToEnable=true, FusesPrompt=true }
	local IsLockPrompt = LockPromptNames[Object.Name]
		or (Object.Parent and Object.Parent:GetAttribute(loadstring(base64decode("TG9ja2Vk"))()) == true)
		or (Object.Parent and Object.Parent.Parent and Object.Parent.Parent.Name == loadstring(base64decode("TG9ja2VyX1NtYWxsX0xvY2tlZA=="))() and Object.Name == loadstring(base64decode("QWN0aXZhdGVFdmVudFByb21wdA=="))())
	if IsLockPrompt then
		if Options.AutoInteractIgnoreList.Value[loadstring(base64decode("TG9ja3M="))()] then return end
		local KeyItems = { loadstring(base64decode("S2V5"))(),loadstring(base64decode("R2VuZXJhdG9yRnVzZQ=="))(),loadstring(base64decode("S2V5QmFja2Rvb3I="))(),loadstring(base64decode("S2V5RWxlY3RyaWNhbA=="))(),loadstring(base64decode("S2V5SXJvbg=="))(),loadstring(base64decode("TG9ja3BpY2s="))(),loadstring(base64decode("U2tlbGV0b25LZXk="))(),loadstring(base64decode("U2hlYXJz"))(),loadstring(base64decode("TXVsdGl0b29s"))() }
		local OffhandKeyItems = { loadstring(base64decode("S2V5"))(),loadstring(base64decode("R2VuZXJhdG9yRnVzZQ=="))(),loadstring(base64decode("S2V5RWxlY3RyaWNhbA=="))(),loadstring(base64decode("S2V5SXJvbg=="))() }
		local HasKey = false
		for _, K in KeyItems do if Functions.HasItem(K, true) then HasKey = true break end end
		for _, K in OffhandKeyItems do if Functions.HasItem(K) then HasKey = true break end end
		if not HasKey then return end
	end

	if Prompt.Parent.Name == loadstring(base64decode("Q3V0dGFibGVWaW5lcw=="))() and not Functions.HasItem(loadstring(base64decode("U2hlYXJz"))(), true) and not Functions.HasItem(loadstring(base64decode("TXVsdGl0b29s"))(), true) or Prompt.Parent.Name == loadstring(base64decode("Q2hlc3RfVmluZQ=="))() and not Functions.HasItem(loadstring(base64decode("U2hlYXJz"))(), true) and not Functions.HasItem(loadstring(base64decode("TXVsdGl0b29s"))(), true) or Prompt.Parent.Name == loadstring(base64decode("Q2VsbGFy"))() and not Functions.HasItem(loadstring(base64decode("U2hlYXJz"))(), true) and not Functions.HasItem(loadstring(base64decode("TXVsdGl0b29s"))(), true) then return end
	if Prompt.Parent.Name == loadstring(base64decode("U2t1bGxMb2Nr"))() and not Functions.HasItem(loadstring(base64decode("U2tlbGV0b25LZXk="))(), true) then return end
	if Prompt.Parent.Name == loadstring(base64decode("TG9jazE="))() and not Functions.HasItem(loadstring(base64decode("TG9ja3BpY2s="))(), true) and not Functions.HasItem(loadstring(base64decode("TXVsdGl0b29s"))(), true) or Prompt.Parent.Name == loadstring(base64decode("TG9jazI="))() and not Functions.HasItem(loadstring(base64decode("TG9ja3BpY2s="))(), true) and not Functions.HasItem(loadstring(base64decode("TXVsdGl0b29s"))(), true) then return end
	if Functions.HasItem(loadstring(base64decode("U2hlYXJz"))(), true) and IsLockPrompt and Prompt.Parent.Name ~= loadstring(base64decode("Q3V0dGFibGVWaW5lcw=="))() and Prompt.Parent.Name ~= loadstring(base64decode("Q2hlc3RfVmluZQ=="))() and Prompt.Parent.Name ~= loadstring(base64decode("Q2VsbGFy"))() then return end

	if Tool and table.find(AnimateToolNames, Tool.Name) and Globals.UseAnimation and Globals.UseAnimationBreak then
		Globals.UseAnimation:Stop()
		Globals.UseAnimationBreak:Stop()
		Globals.UseAnimationBreak:Play()
		if Tool.Name == loadstring(base64decode("U2hlYXJz"))() then Tool:WaitForChild(loadstring(base64decode("SGFuZGxl"))()):WaitForChild(loadstring(base64decode("c291bmRfcHJvbXB0"))()):Play() end
	end

	local AnyTool = Character:FindFirstChildOfClass(loadstring(base64decode("VG9vbA=="))())
	local ToolData = AnyTool and ItemNames[AnyTool.Name]
	if AnyTool and ToolData and Toggles.InfiniteItemsToggle.Value and Options.InfiniteItemsList.Value[ToolData] then
		Drops.ChildAdded:Once(function(NewTool)
			local Prompt = NewTool:FindFirstChild(loadstring(base64decode("TW9kdWxlUHJvbXB0"))())
			local RealPrompt = FakePrompts[Object]
			Functions.FirePrompt(Prompt)
			Functions.FirePrompt(RealPrompt)
		end)
		Character.ChildAdded:Once(function(NewTool)
			if NewTool.Name == loadstring(base64decode("U2hlYXJz"))() then NewTool:WaitForChild(loadstring(base64decode("SGFuZGxl"))()):WaitForChild(loadstring(base64decode("c291bmRfcHJvbXB0ZW5k"))()):Play() end
		end)
		RemotesFolder.DropItem:FireServer(AnyTool)
	else
		local RealPrompt = FakePrompts[Object]
		Functions.FirePrompt(RealPrompt)
	end
end)

Connections.FloorReplicatedHandler = FloorReplicated.DescendantAdded:Connect(function(Object)
	if Object.Name == loadstring(base64decode("R2xpdGNoU2NyZWVjaA=="))() then
		Modules.GlitchScreech = Object
		if Toggles.RemoveScreech.Value then Object.Name = loadstring(base64decode("R2xpdGNoU2NyZWVjaF9EaXNhYmxlZA=="))() end
	end
	if Object.Name:find(loadstring(base64decode("SnVtcHNjYXJl"))()) and Object:IsA(loadstring(base64decode("TW9kdWxlU2NyaXB0"))())
		and not Object.Name:find(loadstring(base64decode("RXllc3RhbGs="))()) and not Object.Name:find(loadstring(base64decode("R3JvdW5kc2tlZXBlcg=="))()) and not Object.Name:find(loadstring(base64decode("TW9udW1lbnQ="))())
	then
		Object:SetAttribute(loadstring(base64decode("T3JpZ2luYWxOYW1l"))(), Object.Name)
		if Toggles.DisableEntityJumpscares.Value then Object.Name = Object.Name .. loadstring(base64decode("X0Rpc2FibGVk"))() end
		table.insert(Objects.JumpscareModules, Object)
	end
end)

if FloorReplicated:FindFirstChild(loadstring(base64decode("RGlnaXRhbFRpbWVy"))()) then
	Connections.HasteTimerConnection = FloorReplicated.DigitalTimer:GetPropertyChangedSignal(loadstring(base64decode("VmFsdWU="))()):Connect(function()
		if Toggles.NotifyHasteTime.Value then Functions.Caption(Functions.GetHasteTime(), true) end
	end)
end

Connections.FogHandler = Services.Lighting:GetPropertyChangedSignal(loadstring(base64decode("Rm9nRW5k"))()):Connect(function()
	if Services.Lighting.FogEnd ~= 10000000 then
		Globals.OldFog = Services.Lighting.FogEnd
	end
	if Toggles.RemoveCameraFog.Value then
		Services.Lighting.FogEnd = 10000000
	end
end)

Connections.FogHandler2 = Services.Lighting.DescendantAdded:Connect(function(Object)
	if not Object:IsA(loadstring(base64decode("QXRtb3NwaGVyZQ=="))()) then return end
	Object:SetAttribute(loadstring(base64decode("RGVuc2l0eV9PbGQ="))(), Object.Density)
	if Toggles.RemoveCameraFog.Value then Object.Density = 0 end

	local AtmoConn2 = Object:GetPropertyChangedSignal(loadstring(base64decode("RGVuc2l0eQ=="))()):Connect(function()
		if Object.Density ~= 0 then Object:SetAttribute(loadstring(base64decode("RGVuc2l0eV9PbGQ="))(), Object.Density) end
		if Toggles.RemoveCameraFog.Value then Object.Density = 0 end
	end)
	Object.Destroying:Once(function() AtmoConn2:Disconnect() end)
	table.insert(Connections, AtmoConn2)
	table.insert(Globals.FogInstances, Object)
end)

local RusherAliases = { Rush=true, Bash=true, Scribbles=true, DronesStampede=true, Ambush=true, Eyes=true, Lookman=true, Blitz=true, [loadstring(base64decode("QS02MA=="))()]=true, [loadstring(base64decode("QS0xMjA="))()]=true, AR0xMBUSH=true, [loadstring(base64decode("Uk5JVVNIQ0c9PQ=="))()]=true, [loadstring(base64decode("Q3VzdG9tIEVudGl0eQ=="))()]=true }

local function HandleEntitySpawn(Entity)
	if not Entity or typeof(Entity) ~= loadstring(base64decode("SW5zdGFuY2U="))() then return end

	local Model = Entity
	if Entity:IsA(loadstring(base64decode("SHVtYW5vaWQ="))()) then
		Model = Entity.Parent
	end
	if not Model or not Model:IsA(loadstring(base64decode("TW9kZWw="))()) then return end

	local EntityData = Entities[Model.Name]
	if not EntityData then return end
	if Model:GetAttribute(loadstring(base64decode("SVJUX0VudGl0eUhhbmRsZWQ="))()) then return end
	Model:SetAttribute(loadstring(base64decode("SVJUX0VudGl0eUhhbmRsZWQ="))(), true)

	while not Model.PrimaryPart do
		for _, Child in Model:GetChildren() do
			if Child:IsA(loadstring(base64decode("QmFzZVBhcnQ="))()) then Model.PrimaryPart = Child end
		end
		if not Model.PrimaryPart then task.wait() end
	end
	task.wait(0.1)

	if not Model.PrimaryPart or LocalPlayer:DistanceFromCharacter(Model.PrimaryPart.Position) >= 10000 then return end

	local Alias = EntityData.Alias
	local RealAlias = Alias
	if Options.EntityList.Value[Alias] and Toggles.NotifyEntities.Value then
		local NotifyTitle = EntityData.NotifyMessage.Title
		local NotifyBody  = EntityData.NotifyMessage.Body
		local NotifyImage = EntityIcons[Model.Name]

		if Model.Name == loadstring(base64decode("UnVzaE1vdmluZw=="))() and Model.PrimaryPart.Name ~= loadstring(base64decode("UnVzaE5ldw=="))() then
			NotifyTitle = NotifyTitle:gsub(loadstring(base64decode("UnVzaA=="))(), Model.PrimaryPart.Name)
			NotifyImage = Model.PrimaryPart:WaitForChild(loadstring(base64decode("QXR0YWNobWVudA=="))()).ParticleEmitter.Texture
			Alias = Model.PrimaryPart.Name
		end

		Functions.Notify({ Title = NotifyTitle, Body = NotifyBody, Image = NotifyImage, Time = Toggles.NotifyKeepNotifications.Value and Model or nil })

		if Toggles.EntityChatToggle.Value then
			Functions.SendChat(Alias .. loadstring(base64decode("IA=="))() .. Options.EntityChatMessage.Value)
		end
	end

	if Model.Name ~= loadstring(base64decode("R2xvb21iYXRTd2FybQ=="))() then
		if Toggles.EntityESPToggle.Value and Options.EntityESPOptions.Value[RealAlias] then
			if Model.Name == loadstring(base64decode("TW9udW1lbnRFbnRpdHk="))() then
				Functions.AddESP({ Object = Model.Top, Text = Alias, Color = Options.EntityESPColor.Value })
			else
				Functions.AddESP({ Object = Model, Text = Alias, Color = Options.EntityESPColor.Value })
			end
		end
		table.insert(Objects.Entities, Model)
	end

	if RusherAliases[EntityData.Alias] then
		Instance.new(loadstring(base64decode("SHVtYW5vaWQ="))(), Model).Name = loadstring(base64decode("SGlnaGxpZ2h0SHVtYW5vaWQ="))()
		local Root = Model.PrimaryPart
		if Root then Root.Transparency = 0.999 Root.Material = Enum.Material.Plastic end
	end

	if Model.Name == loadstring(base64decode("TG9va21hbg=="))() then
		CurrentRooms.ChildAdded:Wait()
		task.wait(10)
		Model:Destroy()
	end
end

Connections.EntityHandler = Services.Workspace.ChildAdded:Connect(HandleEntitySpawn)
Connections.EntityDescendantHandler = Services.Workspace.DescendantAdded:Connect(function(Descendant)
	local EntityModel = Descendant:IsA(loadstring(base64decode("SHVtYW5vaWQ="))()) and Descendant.Parent or Descendant
	if EntityModel and EntityModel:IsA(loadstring(base64decode("TW9kZWw="))()) and Entities[EntityModel.Name] then
		task.defer(function()
			HandleEntitySpawn(Descendant)
		end)
	end
end)

local LastClean = tick()
Connections.Cleaner = Services.RunService.Heartbeat:Connect(function()
	if tick() - LastClean <= 0.5 then return end
	LastClean = tick()

	for ArrayName, Array in Objects do
		local I = #Array
		while I >= 1 do
			local Object = Array[I]
			if Object == nil or not Object:IsDescendantOf(Services.Workspace) then
				table.remove(Array, I)
				local Conn = ESPConnections[Object]
				if Conn then
					Conn:Disconnect()
					ESPConnections[Object] = nil
					local Pos = table.find(Connections, Conn)
					if Pos then table.remove(Connections, Pos) end
				end
			end
			I -= 1
		end
	end
end)

local LastPromptFix = tick()
Connections.PromptFixer = Services.RunService.Heartbeat:Connect(function()
	if tick() - LastPromptFix <= 0.5 then return end
	LastPromptFix = tick()
	for _, Prompt in Objects.Prompts do
		if Prompt:HasTag(loadstring(base64decode("RGlzYWJsZVdoZW5FbmFibGVkT25DbGllbnQ="))()) then
			Prompt:RemoveTag(loadstring(base64decode("RGlzYWJsZVdoZW5FbmFibGVkT25DbGllbnQ="))())
		end
	end
end)

if LocalPlayer.Character then
	task.spawn(function() Functions.HandleCharacter(LocalPlayer.Character) end)
end

LocalPlayer.CharacterAdded:Connect(function(NewCharacter)
	if Connections.MainHandler then
		Connections.MainHandler:Disconnect()
		Connections.MainHandler = nil
	end
	task.wait(0.5)
	Functions.HandleCharacter(NewCharacter)
end)

Library:OnUnload(function()
	StopTimeShower(true)
	for Key, Connection in Connections do
		if type(Key) == loadstring(base64decode("c3RyaW5n"))() then
			pcall(function() Connection:Disconnect() end)
		else
			pcall(function() Key:Disconnect() end)
			pcall(function() Connection:Disconnect() end)
		end
	end

	for _, Object in Objects.Entities do
		if Object.Name == loadstring(base64decode("U25hcmU="))() or Object.Name == loadstring(base64decode("R2lnZ2xlQ2VpbGluZw=="))() then
			local Hitbox = Object:FindFirstChild(loadstring(base64decode("SGl0Ym94"))())
			if Hitbox then Hitbox.CanTouch = true end
		end
		if Object.Name == loadstring(base64decode("R2xvb21QaWxl"))() then
			for _, Part in Object:GetDescendants() do
				if Part:IsA(loadstring(base64decode("QmFzZVBhcnQ="))()) then Part.CanTouch = true end
			end
		end
		if Object.Name == loadstring(base64decode("RmFrZURvb3I="))() or Object.Name == loadstring(base64decode("RG9vckZha2U="))() then
			local Hidden = Object:FindFirstChild(loadstring(base64decode("SGlkZGVu"))())
			if Hidden then Hidden.CanTouch = true end
			local Lock = Object:FindFirstChild(loadstring(base64decode("TG9jaw=="))())
			if Lock and Lock:FindFirstChild(loadstring(base64decode("VW5sb2NrUHJvbXB0"))()) then Lock.UnlockPrompt.Enabled = true end
		end
		if Object.Name == loadstring(base64decode("U2lkZXJvb21TcGFjZQ=="))() then
			local Coll = Object:FindFirstChild(loadstring(base64decode("Q29sbGlzaW9u"))())
			if Coll then Coll.CanCollide = false Coll.CanTouch = true end
		end
	end

	for _, Object in Objects.SeekBridges do Object:Destroy() end

	for _, Fog in Globals.FogInstances do
		Fog.Density = Fog:GetAttribute(loadstring(base64decode("RGVuc2l0eV9PbGQ="))())
	end
	Services.Lighting.FogEnd = Globals.OldFog

	local Vignette = Globals.MainUI:FindFirstChild(loadstring(base64decode("SGlkZVZpZ25ldHRl"))()) or Globals.MainUI.MainFrame:FindFirstChild(loadstring(base64decode("SGlkZVZpZ25ldHRl"))())
	if Vignette then Vignette.Image = loadstring(base64decode("cmJ4YXNzZXRpZDovLzYxMDAwNzYzMjA="))() end

	local ModuleRestores = {
		Screech = loadstring(base64decode("U2NyZWVjaA=="))(), Glitch = loadstring(base64decode("R2xpdGNo"))(), Shade = loadstring(base64decode("U2hhZGU="))(),
		SpiderJumpscare = loadstring(base64decode("U3BpZGVySnVtcHNjYXJl"))(), A90 = loadstring(base64decode("QTkw"))(), Dread = loadstring(base64decode("RHJlYWQ="))(), Void = loadstring(base64decode("Vm9pZA=="))()
	}
	for Key, OriginalName in ModuleRestores do
		if Modules[Key] then Modules[Key].Name = OriginalName end
	end

	FakeEvents.Screech:Destroy()
	FakeEvents.Screech_Real.Parent = RemotesFolder
	FakeEvents.Shade:Destroy()
	FakeEvents.Shade_Real.Parent = RemotesFolder

	if FakeEvents.A90_Real then
		FakeEvents.A90:Destroy()
		FakeEvents.A90_Real.Parent = RemotesFolder
	end
	if FakeEvents.Surge_Real then
		FakeEvents.Surge:Destroy()
		FakeEvents.Surge_Real.Parent = RemotesFolder
	end

	Globals.SeekNodesFolder:Destroy()
	Globals.RoomsNodesFolder:Destroy()
	Globals.ManipulateBody:Destroy()

	local OldAmbient = CurrentRooms:FindFirstChild(tostring(LocalPlayer:GetAttribute(loadstring(base64decode("Q3VycmVudFJvb20="))()))):GetAttribute(loadstring(base64decode("QW1iaWVudA=="))())
	Services.TweenService:Create(Services.Lighting, TweenInfo.new(0.2, Enum.EasingStyle.Exponential), { Ambient = OldAmbient }):Play()

	for _, Prompt in Objects.Prompts do
		if FakePrompts[Prompt] then
			FakePrompts[Prompt].Parent = Prompt.Parent
			Prompt:Destroy()
		end
		if Prompt.Parent then
			Prompt.HoldDuration = Prompt:GetAttribute(loadstring(base64decode("SG9sZER1cmF0aW9uX09sZA=="))()) or Prompt.HoldDuration
			Prompt.RequiresLineOfSight = Prompt:GetAttribute(loadstring(base64decode("UmVxdWlyZXNMaW5lT2ZTaWdodF9PbGQ="))()) or Prompt.RequiresLineOfSight
			Prompt.MaxActivationDistance = Prompt:GetAttribute(loadstring(base64decode("TWF4QWN0aXZhdGlvbkRpc3RhbmNlX09sZA=="))()) or Prompt.MaxActivationDistance
		end
	end

	Character:SetAttribute(loadstring(base64decode("Q2FuSnVtcA=="))(),  OldJump)
	Character:SetAttribute(loadstring(base64decode("Q2FuU2xpZGU="))(), OldSlide)

	for _, Object in Services.Workspace:GetDescendants() do
		task.spawn(function() Functions.RemoveESP(Object) end)
	end

	Humanoid.WalkSpeed  = Functions.GetCurrentSpeed()
	Humanoid.JumpPower  = 5
	Humanoid.HipHeight  = 2.367

	local BaseY = 0.18
	Collision.Position          = RootPart.Position + Vector3.new(0, BaseY, 0)
	CollisionPart.Position      = RootPart.Position + Vector3.new(0, BaseY, 0)
	CollisionPartClone.Position = RootPart.Position + Vector3.new(0, BaseY, 0)

	if Character:FindFirstChild(loadstring(base64decode("TG93ZXJUb3Jzbw=="))()) and Character.LowerTorso:FindFirstChild(loadstring(base64decode("Um9vdA=="))()) then
		Character.LowerTorso.Root.C1 = Globals.OriginalC1
	end
	if Collision:FindFirstChild(loadstring(base64decode("Q29sbGlzaW9uQ3JvdWNo"))()) then
		Collision.CollisionCrouch.Position = RootPart.Position + Vector3.new(0, -0.982, 0)
	end

	CollisionClone:Destroy()
	CollisionPartClone:Destroy()
	IRT.ESPLibrary:Unload()

	if Main_Game then
		Main_Game.fovtarget   = 70
		Main_Game.spring.Speed = 8
		Main_Game.tooloffset   = Vector3.zero
	end

	if Globals.OriginalGetMoveVector then 
		local Controls = require(LocalPlayer.PlayerScripts.PlayerModule):GetControls()
		Controls.GetMoveVector = Globals.OriginalGetMoveVector
	end

	getgenv().IRT = nil
	shared.Hastelepasta = false
end)



while not Globals.MainUI do task.wait() end

-- IRT.Interface.ApplySettingsTab — SaveManager/ThemeManager уже привязаны базой
Functions.Notify({ Title = loadstring(base64decode("U3VjY2Vzc2Z1bGx5IGxvYWRlZCBpbiA="))() .. math.floor((tick() - LoadStart) * 1000) / 1000 .. loadstring(base64decode("IHNlY29uZHMu"))() , Body = loadstring(base64decode("UHJlc3MgJw=="))() .. tostring(Options.MenuKeybind and Options.MenuKeybind.Value or loadstring(base64decode("UmlnaHRDb250cm9s"))()) .. loadstring(base64decode("JyB0byB0b2dnbGUgdGhlIFVJLg=="))()})
end
9BqXDd5L(c5aRF)
end)(...)
