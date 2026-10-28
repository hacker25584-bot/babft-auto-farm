-- Panda Auth - PUSL-V4
-- Paste this at the very top of your script.

local PUSL = loadstring(game:HttpGet("https://secure.pandauth.com/pv4/lib"))()
if not PUSL or type(PUSL.configure) ~= "function" then
    return warn("[Panda] Library failed to initialize.")
end

PUSL.configure({
    serviceId = "irt",
})

local key = "USER_KEY_HERE" -- replace with your own key input
local result = PUSL.validate(key)

if not result.success then
    warn("[Panda] Get a key: " .. PUSL.getKeyUrl())
    return
end

print("[Panda] Authenticated. Premium:", result.isPremium)

-- Your protected code goes below this line.

local Players = game:GetService("Players")
local LocalPlayer = Players.LocalPlayer
local Camera = workspace.CurrentCamera
local RunService = game:GetService("RunService")
local Lighting = game:GetService("Lighting")
local UserInputService = game:GetService("UserInputService")
local PathfindingService = game:GetService("PathfindingService")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Debris = game:GetService("Debris")
local ProximityPromptService = game:GetService("ProximityPromptService")
local TweenService = game:GetService("TweenService")
repeat task.wait() until game:IsLoaded()
if game:GetService("Players").LocalPlayer:GetAttribute("NovaLoaded") then
if getgenv().Library then
getgenv().Library:Notify("IRT 『 Already Loaded 』",4)
else
print("IRT 『 Already Loaded 』")
end
return end
game:GetService("Players").LocalPlayer:SetAttribute("NovaLoaded",true)
local LibraryName = 'IRT'
repeat task.wait() until LocalPlayer.Character
if   getgenv().ScriptLibrary ~= "Linoria" then
getgenv().ScriptLibrary = getgenv().ScriptLibrary or "Linoria"
end
local repo = getgenv().ScriptLibrary == "Obsidian" and 'https://raw.githubusercontent.com/mstudio45/Obsidian/main/' or getgenv().ScriptLibrary == "Linoria" and 'https://raw.githubusercontent.com/mstudio45/LinoriaLib/main/'
local Library = loadstring(game:HttpGet(repo .. 'Library.lua'))()
task.wait()
local ThemeManager, SaveManager
pcall(function() ThemeManager = loadstring(game:HttpGet(repo .. 'addons/ThemeManager.lua'))() end)
pcall(function() SaveManager = loadstring(game:HttpGet(repo .. 'addons/SaveManager.lua'))() end)
local ESPLibrary = loadstring(game:HttpGet("https://raw.githubusercontent.com/TheHunterSolo1/Scripts/main/ESPLibrary"))() 
local HttpService = game:GetService("HttpService")
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
NotifySide = "Right",
ShowCustomCursor = true,
})
if Library.KeybindFrame then
if getgenv().NovaHub_KeybindPos then
local p = getgenv().NovaHub_KeybindPos
Library.KeybindFrame.Position = UDim2.new(p[1], p[2], p[3], p[4])
end
table.insert(Connections, Library.KeybindFrame:GetPropertyChangedSignal("Position"):Connect(function()
local pos = Library.KeybindFrame.Position
getgenv().NovaHub_KeybindPos = { pos.X.Scale, pos.X.Offset, pos.Y.Scale, pos.Y.Offset }
end))
end
local Notifying = "Library"
local PlaySound = true
local function Notify(txt, duration)
Library:Notify(txt, duration)
if PlaySound then
local Sound = Instance.new("Sound", game:GetService("SoundService"))
Sound.SoundId = "rbxassetid://101511361468852"
Sound.PlaybackSpeed = 0.77
Sound.Volume = 2
Sound:Play()
game:GetService("Debris"):AddItem(Sound, 3)
end
end
function AddESP(part,txt,color)
ESPLibrary:AddESP({
Object = part, Text = txt, Color = color })
end
function AddEntityESP(part,txt,color)
if part:IsA("Model") then
while not part.PrimaryPart do
for _, v in pairs(part:GetChildren()) do
if v:IsA("BasePart") then
part.PrimaryPart = v
end
end
task.wait()
end
if part.PrimaryPart then
part.PrimaryPart.Transparency = 0.99
end
if not part:FindFirstChildOfClass("Humanoid") then
Instance.new("Humanoid",part)
end
end
if part.Name == "FigureRig" or part.Name == "FigureRagdoll" then
part:WaitForChild("Root").Size = Vector3.new(0.001, 0.001, 0.001)
end
ESPLibrary:AddESP({
Object = part, Text = txt, Color =  color, })
end
function GetLibraryCode()
local CodeLength = game.ReplicatedStorage.GameData.Floor.Value == "Fools" and 10 or 5
local Slot = table.create(CodeLength, "_")
local Paper
for _, plr in pairs(Players:GetPlayers()) do
local char = plr.Character
if char then
Paper = char:FindFirstChild("LibraryHintPaper") or char:FindFirstChild("LibraryHintPaperHard") or
plr.Backpack:FindFirstChild("LibraryHintPaper") or plr.Backpack:FindFirstChild("LibraryHintPaperHard")
if Paper then break end
end
end
if not Paper then return table.concat(Slot) end
local Hints = LocalPlayer.PlayerGui.PermUI.Hints:GetChildren()
for _, i in pairs(Paper.UI:GetChildren()) do
if i:IsA("ImageLabel") and i.Name ~= "Image" then
local Pos = tonumber(i.Name)
if Pos and Slot[Pos] then
for _, v in pairs(Hints) do
if v.Name == "Icon" and v.ImageRectOffset.X == i.ImageRectOffset.X then
local Label = v:FindFirstChild("TextLabel")
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
if workspace:FindFirstChild("Lobby") then
local Tabs = {
Main = Window:AddTab('Game', "star"),
Settings = Window:AddTab('Settings',"settings"),
}
local Tp = Tabs.Main:AddLeftGroupbox("Teleport")
Tp:AddLabel('Main menu appears after teleport', true)
local function FastElevator(dest, settings)
local Event = game:GetService("ReplicatedStorage"):FindFirstChild("RemotesFolder") and game:GetService("ReplicatedStorage").RemotesFolder:FindFirstChild("CreateElevator")
if Event then
Event:FireServer({
Mods = {},
Settings = settings or {},
Destination = dest,
FriendsOnly = false,
MaxPlayers = "1"
})
end
end
Tp:AddButton("Teleport to Hotel", function() FastElevator("Hotel") end)
Tp:AddButton("Teleport to Mines", function() FastElevator("Mines") end)
Tp:AddButton("Teleport to Rooms (NOT WORk)", function() FastElevator("Rooms") end)
Tp:AddButton("Teleport to Backdoors", function() FastElevator("Backdoor") end)
Tp:AddButton("Teleport to Outdoors (FREE)", function() FastElevator("Garden") end)
Tp:AddButton("Teleport to Retro Mode", function() FastElevator("Retro") end)
Tp:AddButton("Teleport to Super Hard Mode", function() FastElevator("SuperHardMode") end)
Tp:AddButton("Teleport to Endless", function() FastElevator("Endless") end)
Tp:AddButton("Teleport to Rush Mode", function() FastElevator("Fools26") end)
Tp:AddButton("Teleport to Battle Mode", function() FastElevator("Party") end)
Tp:AddButton("Teleport to Chaos", function() FastElevator("Curated", { youtube = "", twitch = "" }) end)
Tp:AddButton("Teleport to Daily Run", function() FastElevator("Daily") end)
Tp:AddButton("Teleport to Cringles Workshop", function() FastElevator("CringlesWorkshop") end)
Tp:AddButton("Teleport to Trick Or Treat", function() FastElevator("Halloween25") end)
Tp:AddButton("Teleport to Hotel-", function() FastElevator("BeforePlus") end)
local MenuGroup = Tabs.Settings:AddLeftGroupbox('UI Settings')
local UtilityBox = Tabs.Settings:AddRightGroupbox('Hub Utilities')
MenuGroup:AddLabel("Menu bind"):AddKeyPicker("MenuKeybind", { Default = "RightShift", NoUI = true, Text = "Menu keybind" })
Library.ToggleKeybind = Options.MenuKeybind
MenuGroup:AddToggle("ShowKeybinds", { Text = "Show Keybinds Overlay", Default = false }):OnChanged(function()
Library.KeybindFrame.Visible = Toggles.ShowKeybinds.Value
end)
MenuGroup:AddToggle("ShowCustomCursor", {
Text = "Custom Cursor",
Default = true,
Callback = function(Value)
Library.ShowCustomCursor = Value
end,
})
MenuGroup:AddDivider()
MenuGroup:AddToggle('PlayNotifySound',{
Text = "Play Notification Sound",
Default = true,
Callback = function(Value)
PlaySound = Value
end
})
MenuGroup:AddDropdown("NotificationSide", {
Values = { "Left", "Right" },
Default = "Right",
Text = "Notification Side",
Callback = function(Value)
Library:SetNotifySide(Value)
end,
})
MenuGroup:AddButton('Test Notification',function()
Notify("Hello World",2)
end)
MenuGroup:AddDropdown("Library", {
Values = { "Obsidian", "Linoria" },
Default = 2,
Text = "Library",
Callback = function(Value)
getgenv().ScriptLibrary = tostring(Value)
Notify('Please Unload Script and Execute Again to Take Effect',4)
end,
})
MenuGroup:AddDivider()
MenuGroup:AddDropdown("DPIDropdown", {
Values = { "50%", "75%", "100%", "125%", "150%", "175%", "200%" },
Default = "100%",
Text = "DPI Scale",
Callback = function(Value)
Value = Value:gsub("%%", "")
local DPI = tonumber(Value)
Library:SetDPIScale(DPI)
end,
})
UtilityBox:AddButton({
Text = "Unload Hub",
Func = function()
LocalPlayer:SetAttribute("NovaLoaded", nil)
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
ThemeManager:SetFolder("NovaHub")
end
if SaveManager then
SaveManager:SetLibrary(Library)
SaveManager:IgnoreThemeSettings()
SaveManager:SetIgnoreIndexes({'MenuKeybind'})
SaveManager:SetFolder("NovaHub/DOORSLOBBY")
SaveManager:BuildConfigSection(Tabs['Settings'])
end
if ThemeManager then
ThemeManager:ApplyToTab(Tabs['Settings'])
end
Notify("Successfully Loaded for Game |  DOORS Lobby ",4)
else
local function GetDistanceToPlayer(Pos)
local DisA = LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("HumanoidRootPart") and LocalPlayer.Character:FindFirstChild("HumanoidRootPart").Position or workspace.CurrentCamera and workspace.CurrentCamera.CFrame.Position or Vector3.new(0, 0, 0)
local Dis = (DisA - Pos).Magnitude
return Dis
end
local PathFolder = Instance.new("Folder",workspace)
PathFolder.Name = "PathFolder"
function PathTo(Pos)
local Character = LocalPlayer.Character
local Root = Character and Character:FindFirstChild("HumanoidRootPart")
local Humanoid = Character and Character:FindFirstChild("Humanoid")
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
local ReplicateSignal = replicatesignal or (typeof(replicatesignal) == "function" and replicatesignal)
local FireTouch = firetouchinterest
local HookMeta = hookmetamethod
local IsNetworkOwner = isnetworkowner
Items = {
["Bandage"] = "Bandage",
["Flashlight"] = "Flash light",
["Battery"] = "Battery",
["BatteryPack"] = "Battery Pack",
["SkeletonKey"] = "Skeleton Key",
["Crucifix"] = "Crucifix",
["Straplight"] = "Strap Light",
["Lockpick"] = "Lockpick",
["Bulklight"] = "Bulk Light",
["Vitamins"] = "Vitamin",
["Shears"] = "Shears",
["LaserPointer"] = "Laser Pointer",
["Candle"] = "Candle",
["Smoothie"] = "Smoothie",
["StarJug"] = "Jug of Bottle",
["StardustPickup"] = "Stardust",
["ChestBoxLocked"] = "Locked Chest",
["ChestBox"] = "Chest",
["Chest_Vine"] = "Chest Vine",
["Toolbox_Locked"] = "Locked Toolbox",
["Toolshed_Small"] = "Toolshed",
["TimerLever"] = "Lever",
["HolyGrenade"] = "Holy Grenade",
["ShieldMini"] = "Mini Shield",
["ShieldBig"] = "Big Shield",
["CrucifixWall"] = "Crucifix",
["Glowsticks"] = "Glow Sticks",
["BandagePack"] = "Bandage Pack",
["AlarmClock"] = "Alarm Clock",
["MouseHole"] = "Louie Mouse",
["StarVial"] = "Star Vial",
["StarBottle"] = "Star Bottle",
["Compass"] = "Compass",
["Lantern"] = "Lantern",
["KeyIron"] = "Iron Key",
["GoldGun"] = "Golden Gun",
["Candy"] = "Candy",
["WaterPump"] = "Water Pump",
["VineGuillotine"] = "Vine Lever",
["Shakelight"] = "Shake Light",
["LibraryHintPaper"] = "Hint Paper",
["LotusPetalPickup"] = "Lotus Petal",
}
local Floor = ReplicatedStorage:WaitForChild("GameData"):WaitForChild("Floor")
local LatestRoom = ReplicatedStorage:WaitForChild("GameData"):WaitForChild("LatestRoom")
local MainGame = LocalPlayer:WaitForChild("PlayerGui"):WaitForChild("MainUI").Initiator:WaitForChild("Main_Game")
local RemoteListener = MainGame:WaitForChild("RemoteListener")
local RequiredMainGame
local ClientModules = ReplicatedStorage:FindFirstChild("ModulesClient") or ReplicatedStorage:FindFirstChild("ClientModules")
local RemotesFolder = ReplicatedStorage:FindFirstChild("EntityInfo") and ReplicatedStorage:FindFirstChild("EntityInfo")  or ReplicatedStorage:FindFirstChild("Bricks")  and ReplicatedStorage:FindFirstChild("Bricks") or ReplicatedStorage:FindFirstChild("RemotesFolder")
local MotorReplication = RemotesFolder:WaitForChild("MotorReplication")
local CollisionClone
local CamLock = RemotesFolder:WaitForChild("CamLock")
local AnchorArgs
local PL = RemotesFolder:WaitForChild("PL")
local ClutchHeartbeat = RemotesFolder:WaitForChild("ClutchHeartbeat")
local params = RaycastParams.new()
params.FilterDescendantsInstances = {LocalPlayer.Character}
local  SeekPath = Instance.new("Folder",workspace)
SeekPath.Name = "SeekPath"
function ShowSeekPath(v)
local Part = Instance.new("Part", SeekPath)
Part.Size = Vector3.new(1.5, 1.5, 1.5)
Part.Anchored = true
Part.Shape = "Ball"
Part.Position = v.Position
Part.CanCollide = false
Part.Color = Color3.new(0, 1, 0)
Debris:AddItem(Part, 60)
end
function FixBridge(v)
for _, i in pairs(v:GetChildren()) do
if i.Name == "PlayerBarrier" and i.Rotation.X == 180 then
local Barrier = i:Clone()
Barrier.CFrame = CFrame.new(i.Position.X, i.Position.Y, i.Position.Z)
Barrier.CFrame = Barrier.CFrame * CFrame.new(0, -7, 0)
Barrier.Size = Vector3.new(40, 0.1, 40)
Barrier.Transparency = 0.5
Barrier.Color = Color3.new(0.5, 0, 0.5)
Barrier.Material = "ForceField"
Barrier.Parent = v
Barrier.Name = "BridgeBarrier"
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
MainGame = LocalPlayer.PlayerGui.MainUI.Initiator:WaitForChild("Main_Game")
RemoteListener = MainGame.RemoteListener
params.FilterDescendantsInstances = {LocalPlayer.Character}
if Toggles.NoScenes.Value then
local Cutscene = RemoteListener:FindFirstChild("Cutscenes") or RemoteListener:FindFirstChild("Cutscenes_")
Cutscene.Name = "Cutscenes_"
end
if Require then
RequiredMainGame = require(MainGame)
end
end
if Toggles.Jamming.Value then
if  ReplicatedStorage:FindFirstChild("LiveModifiers") and ReplicatedStorage:FindFirstChild("LiveModifiers"):FindFirstChild("Jammin") then
local Jam = LocalPlayer.PlayerGui.MainUI.Initiator:FindFirstChild("Main_Game").Health.Jam
Jam.Playing = false
local Jamming = game:GetService("SoundService").Main.Jamming
Jamming.Enabled =  false
end
end
if Toggles.Godmode.Value and RemotesFolder.Name ~= "RemotesFolder" then
LocalPlayer.Character.Collision.Position -= Vector3.new(0, 4, 0)
end
if Toggles.Dread.Value then
local Dread = LocalPlayer:FindFirstChild("Dread",true) or LocalPlayer:FindFirstChild("_Dread",true)
if Dread then
Dread.Name = "_Dread"
end
end
if Toggles.Halt.Value then
local Dread = ClientModules.EntityModules:FindFirstChild("Shade",true) or ClientModules.EntityModules:FindFirstChild("_Shade",true)
if Dread then
Dread.Name = "_Shade"
end
end
end))
-- ===== Заглушки вкладок Player / Bypass / Visuals / Floor (вкладки удалены) =====
-- Все опции этих вкладок продолжают существовать внутри Library.Toggles / Library.Options
-- со значениями по умолчанию, но не имеют UI: код, который их читает, не падает.
-- Если тело хаба создаёт опцию с тем же флагом, оно перезаписывает заглушку реальным тогглом.
local function StubOption(OptionType, Flag, Info)
	Info = Info or {}
	Flag = tostring(Flag or Info.Flag or Info.Text or ("Stub_" .. OptionType .. "_" .. tostring(math.random(1, 1e9))))
	local Default
	if OptionType == "ColorPicker" then
		Default = Info.DefaultColor or Info.Default or Color3.fromRGB(255, 255, 255)
	elseif OptionType == "Slider" then
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
	if type(Info.Callback) == "function" then
		table.insert(Node.Callbacks, Info.Callback)
	end
	if OptionType == "KeyPicker" then
		Node.Value = Enum.KeyCode.Unknown
		Node.State = false
	else
		Node.State = Default
	end
	function Node:OnChanged(Callback)
		if type(Callback) == "function" then
			table.insert(self.Callbacks, Callback)
		end
		self.Connection = Callback
		return self
	end
	function Node:SetValue(NewValue, NoCallback)
		self.Value = NewValue
		if self.Type ~= "KeyPicker" then
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
		if type(Flag) == "table" then Info, Flag = Flag, Flag.Flag end
		return StubOption("Toggle", Flag, Info)
	end
	function Node:AddSlider(Flag, Info)
		if type(Flag) == "table" then Info, Flag = Flag, Flag.Flag end
		return StubOption("Slider", Flag, Info)
	end
	function Node:AddDropdown(Flag, Info)
		if type(Flag) == "table" then Info, Flag = Flag, Flag.Flag end
		return StubOption("Dropdown", Flag, Info)
	end
	function Node:AddColorPicker(Flag, Info)
		if type(Flag) == "table" then Info, Flag = Flag, Flag.Flag end
		return StubOption("ColorPicker", Flag, Info)
	end
	function Node:AddKeyPicker(Flag, Info)
		if type(Flag) == "table" then Info, Flag = Flag, Flag.Flag end
		return StubOption("KeyPicker", Flag, Info)
	end
	function Node:AddInput(Flag, Info)
		if type(Flag) == "table" then Info, Flag = Flag, Flag.Flag end
		return StubOption("Input", Flag, Info)
	end
	if Library.Options[Flag] == nil then
		Library.Options[Flag] = Node
		if OptionType == "Toggle" then
			Library.Toggles[Flag] = Node
		end
	end
	return Node
end
local function StubGroup()
	local Group = {}
	local Kinds = {
		AddToggle = "Toggle",
		AddSlider = "Slider",
		AddDropdown = "Dropdown",
		AddColorPicker = "ColorPicker",
		AddKeyPicker = "KeyPicker",
		AddInput = "Input",
	}
	for Method, Kind in pairs(Kinds) do
		Group[Method] = function(_, Flag, Info)
			if type(Flag) == "table" then
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
	NoClip = "NoclipToggle",
	Flight = "FlyToggle",
	FlightSpeed = "FlySpeed",
	InfJump = "InfiniteJumps",
	EnableJump = "EnableCharacterJump",
	FOV = "FieldOfView",
}
table.insert(Connections, RunService.Heartbeat:Connect(function()
	for BaseFlag, BodyFlag in pairs(BridgeAliases) do
		local Real, Stub = Options[BodyFlag], Options[BaseFlag]
		if Real and Stub and Stub.IsStub then
			local NewValue = Real.Value
			if BaseFlag == "FOV" and Toggles.FOVToggle and not Toggles.FOVToggle.Value then
				NewValue = 70
			end
			if Stub.Value ~= NewValue then
				Stub.Value = NewValue
				if Stub.Type ~= "KeyPicker" then
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
	Settings = Window:AddTab('Settings',"settings"),
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
Text = "Anti Lava",
Default = false,
Callback = function(Value)
for _, v in pairs(workspace.CurrentRooms:GetDescendants()) do
if v.Name == "Lava" then
v.CanTouch = not Value
end
end
end
})
FoolsFloor:AddToggle('AntiBanana',{
Text = "Anti Banana",
Default = false,
Callback = function(Value)
for _, v in pairs(workspace:GetChildren()) do
if v.Name == "BananaPeel" then
v.CanTouch = not Value
end
end
end
})
FoolsFloor:AddToggle('AntiJeff',{
Text = "Anti Jeff",
Default = false,
Callback = function(Value)
local v = workspace:FindFirstChild("JeffTheKiller")
if v.Name == "JeffTheKiller" then
repeat task.wait() until v.PrimaryPart and isnetworkowner(v.PrimaryPart)
for _, i in pairs(v:GetChildren()) do
if i:IsA("BasePart") then
i.CanTouch = Value and false or true
end
end
v.Humanoid.Health = Value and 0 or 100
end
end
})
GameBox:AddButton({
Text = "Revive",
DoubleClick = true,
Func = function()
RemotesFolder.Revive:FireServer()
end
})
GameBox:AddButton({
Text = "Play Again",
DoubleClick = true,
Func = function()
RemotesFolder.PlayAgain:FireServer()
end
})
local Pressed = false
GameBox:AddButton({
Text = "Reset",
DoubleClick = true,
Func = function()
Pressed = not Pressed
if not Pressed then
if RemotesFolder:FindFirstChild("Underwater") then
RemotesFolder.Underwater:FireServer(false)
end
return
end
if ReplicateSignal then
replicatesignal(LocalPlayer.Kill)
else
Notify("Double Click to stop", 5)
task.spawn(function()
while Pressed and LocalPlayer:GetAttribute("Alive") ~= false do
if RemotesFolder:FindFirstChild("Underwater") then
RemotesFolder.Underwater:FireServer(true)
end
task.wait()
end
if RemotesFolder:FindFirstChild("Underwater") then
RemotesFolder.Underwater:FireServer(false)
end
Pressed = false
end)
end
end
})
GameBox:AddButton({
Text = "Lobby",
DoubleClick = true,
Func = function()
RemotesFolder.Lobby:FireServer()
end
})
FoolsFloor:AddToggle('InfRevive',{
Text = "Infinite Revive",
Default = false
})
FoolsFloor:AddToggle('DeleteSeekFE',{
Text = "Delete Seek (FE)",
Default = false,
Callback = function(Value)
if Value then
for _, v in pairs(workspace.CurrentRooms:GetDescendants()) do
if v.Name == "TriggerEventCollision" then
Notify("Deleting Seek",3)
for _, i  in pairs(v:GetChildren()) do
if i.Name == "Collision" then
if FireTouch then
firetouchinterest(LocalPlayer.Character.HumanoidRootPart, i, 0)
end
end
end
task.wait(0.5)
if v:FindFirstChild("Collision") then
Notify("Failed to remove Seek", 3)
else
Notify("Deleted Seek Successfully", 3)
end
end
end
end
end
})
RetroFloor:AddToggle('AntiWall',{
Text = "Anti SeekWall",
Default = false,
Callback = function(Value)
for _, v in pairs(workspace.CurrentRooms:GetDescendants()) do
if v.Name == "ScaryWall" then
for _, i in pairs(v:GetChildren()) do
if i:IsA("BasePart") then
i.CanTouch = not Value
end
end
end
end
end
})
RetroFloor:AddToggle('RealBridge',{
Text = "Show Real Bridge",
Default = false,
Callback = function(Value)
for _, v in pairs(workspace.CurrentRooms:GetDescendants()) do
if v.Name == "Bridge" then
if v.CanCollide == false then
v.Transparency = Value and 1 or 0
end
end
end
end
})
local Figures = {}
MinesFloor:AddToggle('DeleteFigureFE',{
Text = "Delete Figure (FE)",
Default = false,
Callback = function(Value)
for _, v in pairs(workspace.CurrentRooms:GetDescendants()) do
if v.Name == "FigureRig" or v.Name == "FigureRagdoll" then
table.insert(Figures,v)
end
end
end
})
MinesFloor:AddToggle('ShowPath',{
Text = "Show Seek Path",
Default = false,
Callback = function(Value)
if Value then
for _, v in pairs(workspace.CurrentRooms:GetDescendants()) do
if v.Name == "SeekGuidingLight" then
ShowSeekPath(v)
end
end
else
SeekPath:ClearAllChildren()
end
end
})
MinesFloor:AddToggle('FixBrokenBridge',{
Text = "Fix Broken Bridge",
Default = false,
Callback = function(Value)
if Value then
for _, v in pairs(workspace.CurrentRooms:GetDescendants()) do
if v.Name == "Bridge" then
FixBridge(v)
end
end
else
for _, v in pairs(workspace.CurrentRooms:GetDescendants()) do
if v.Name == "BridgeBarrier" then
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
Text = "Auto Minecart",
Risky = true,
Default = false,
Callback = function(Value)
if Value then
for _, v in workspace.CurrentRooms:GetDescendants() do
if v.Name == "DuckBoard" then
table.insert(DuckBoards, v)
end
if string.find(v.Name, "MinecartNode") then
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
Text = "Auto Anchor Solver",
Default = false,
Callback = function(Value)
if Value then
for _, v in pairs(workspace.CurrentRooms:GetDescendants()) do
if v.Name == "MinesAnchor" then
table.insert(Anchors,v)
end
end
end
end
})
MinesFloor:AddToggle('AntiSeekFlood',{
Text = "Anti Seek Flood",
Default = false,
Callback = function(Value)
for _, v in pairs(workspace.CurrentRooms:GetDescendants()) do
if v.Name == "SeekFloodline" then
v.CanCollide = Value
end
end
end
})
RoomsFloor:AddToggle('AutoRooms',{
Text = "Auto A-1000",
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
if not checkcaller() and k == "MoveDirection" and t:IsA("Humanoid") then
local char = LocalPlayer.Character
if char and Toggles.AutoRooms.Value and not char:GetAttribute("Hiding") then
return Vector3.new(0, 0, 1)
end
end
return oldIndex(t, k)
end)
setro(mt, true)
end
RoomsFloor:AddToggle('IgnoreA60',{
Text = "Ignore A-60",
})
ESPSettings:AddToggle('ShowDistance',{
Text = "Show ESP Distance",
Default = true,
Callback = function(Value)
ESPLibrary:SetShowDistance(Value)
end
})
ESPSettings:AddToggle('ShowTracers',{
Text = "Show ESP Tracers",
Default = false,
Callback = function(Value)
ESPLibrary:SetTracers(Value)
end
})
ESPSettings:AddToggle('ShowRainbow',{
Text = "Show ESP Rainbow",
Default = false,
Callback = function(Value)
ESPLibrary:SetRainbow(Value)
end
})
ESPSettings:AddDropdown("SetESPMode", {
Text = "Set ESP Mode",
Values = {"Highlight/Text", "Text", "Highlight"},
Default = 1,
Multi = false,
Callback = function(Value)
ESPLibrary:SetESPMode(Value)
end
})
ESPSettings:AddDropdown("SetFont", {
Text = "Set Font",
Values = {
"Legacy", "Arial", "ArialBold", "SourceSans", "SourceSansBold",
"SourceSansLight", "SourceSansItalic", "Bodoni", "Garamond",
"Cartoon", "Code", "Highway", "SciFi", "Arcade", "Fantasy",
"Antique", "Gotham", "GothamMedium", "GothamBold", "GothamBlack",
"AmaticSC", "Bangers", "Creepster", "DenkOne", "FredokaOne",
"IndieFlower", "LuckiestGuy", "Michroma", "Nunito", "Oswald",
"PatrickHand", "PermanentMarker", "Roboto", "RobotoCondensed",
"RobotoMono", "Sarpanch", "SpecialElite", "TitilliumWeb", "Ubuntu"
},
Default = "Legacy",
Multi = false,
Callback = function(Value)
ESPLibrary:SetFont(Value)
end
})
task.spawn(function()
task.wait(0.1)
ESPLibrary:SetTracers(false)
ESPLibrary:SetFont("Legacy")
end)
PlayerBox:AddSlider("MovementSpeed", {
Text = "Movement Speed",
Default = 15,
Min = 15,
Max = 21,
Rounding = 1,
Compact = false,
Callback = function(Value)
end,
Tooltip = "Walking Speed",
})
PlayerBox:AddToggle('EnableMovementSpeed',{
Text = "Enable Movement Speed",
Default = false,
Callback = function(Value)
if not Value then
LocalPlayer.Character.Humanoid.WalkSpeed = 15
end
end
})
PlayerBox:AddSlider("ClimbingSpeed", {
Text = "Climbing Speed",
Default = 15,
Min = 15,
Max = 30,
Rounding = 1,
Compact = false,
Callback = function(Value)
end,
Tooltip = "Climbing Speed",
})
PlayerBox:AddToggle('EnableClimbingSpeed',{
Text = "Enable Climbing Speed",
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
Text = "No Slipping",
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
Text = "No Clip",
Default = false,
Tooltip = "You Can Move Through Wall",
Callback = function(Value) end,
}):AddKeyPicker("NoclipKeybind", {
Default = "N", 	SyncToggleState = true,
Mode ="Toggle" , 
Text = "No Clip", 	NoUI = false, 
Callback = function(Value)
end,
ChangedCallback = function(NewKey, NewModifiers)
end,
})
PlayerBox:AddToggle('Flight',{
Text = "Flight",
Default = false,
Callback = function(Value)
if not Value then
if LocalPlayer.Character.HumanoidRootPart:FindFirstChild("FlightVelocity") then
LocalPlayer.Character.HumanoidRootPart:FindFirstChild("FlightVelocity"):Destroy()
end
end
end
}):AddKeyPicker("FlightKeybind", {
Default = "F", 	SyncToggleState = true,
Mode ="Toggle" , 
Text = "Flight", 	NoUI = false, 
Callback = function(Value)
end,
ChangedCallback = function(NewKey, NewModifiers)
end,
})
PlayerBox:AddSlider("FlightSpeed", {
Text = "Flight Speed",
Default = 15,
Min = 15,
Max = 21,
Rounding = 1,
Compact = false,
Callback = function(Value)
end,
Tooltip = "Flight Speed",
})
PlayerBox:AddToggle('EnableJump',{
Text = "Enable Jumping",
Default = false,
Tooltip = "You Can Move Jump",
Callback = function(Value)
if not Value then
LocalPlayer.Character:SetAttribute("CanJump",false)
end
end
})
PlayerBox:AddToggle('InstaInteract',{
Text = "Instant Interact",
Default = false,
Tooltip = "Interactions are Instantly",
Callback = function(Value)
if Value then
for _, v in ipairs(workspace:GetDescendants()) do
if v:IsA("ProximityPrompt") then
v:SetAttribute("Duration",v.HoldDuration)
v.HoldDuration = 0
end
end
else
for _, v in ipairs(workspace:GetDescendants()) do
if v:IsA("ProximityPrompt") then
v.HoldDuration = v:GetAttribute("Duration") or 0
end
end
end
end
})
PlayerBox:AddToggle('InfJump',{
Text = "Infinite Jump",
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
if LocalPlayer.PlayerGui.MainUI.MainFrame.MobileButtons:FindFirstChild("JumpButton") then
table.insert(Connections, LocalPlayer.PlayerGui.MainUI.MainFrame.MobileButtons.JumpButton.MouseButton1Click:Connect(function()
if Toggles.InfJump.Value and LocalPlayer.Character then
LocalPlayer.Character.Humanoid:ChangeState(Enum.HumanoidStateType.Jumping, true)
end
end))
end
end))
if LocalPlayer.PlayerGui.MainUI.MainFrame.MobileButtons:FindFirstChild("JumpButton") then
table.insert(Connections, LocalPlayer.PlayerGui.MainUI.MainFrame.MobileButtons.JumpButton.MouseButton1Click:Connect(function()
if Toggles.InfJump.Value and LocalPlayer.Character then
LocalPlayer.Character.Humanoid:ChangeState(Enum.HumanoidStateType.Jumping, true)
end
end))
end
end
PlayerBox:AddToggle('Godmode',{
Text = "Godmode",
Default = false,
Tooltip = "Can Lagback you or not work",
Risky  = true,
Callback = function(Value)
if Value and RemotesFolder.Name ~= "RemotesFolder" then
LocalPlayer.Character.Collision.Position -= Vector3.new(0, 4, 0)
end
if Value and RemotesFolder.Name == "RemotesFolder" then
LocalPlayer.Character:PivotTo(LocalPlayer.Character.CollisionPart.CFrame * CFrame.new(0, -2,0))
end
if not Value and RemotesFolder.Name == "RemotesFolder" then
LocalPlayer.Character.Humanoid.HipHeight = 2.4
LocalPlayer.Character.Collision.Size = Vector3.new(5.5, 3, 3)
LocalPlayer.Character.LowerTorso.Root.C1 = CFrame.new(Vector3.new(0, 0, 0))
LocalPlayer.Character.Collision.CollisionCrouch.Size = Vector3.new(5.5, 3, 3)
LocalPlayer.Character:PivotTo(LocalPlayer.Character.CollisionPart.CFrame * CFrame.new(0, 2,0))
end
if not Value and RemotesFolder.Name ~= "RemotesFolder" then
LocalPlayer.Character.Collision.Position = LocalPlayer.Character.HumanoidRootPart.Position
end
end
}):AddKeyPicker("GodmodeKeybind", {
Default = "G", 	SyncToggleState = true,
Mode ="Toggle" , 
Text = "Godmode", 	NoUI = false, 
Callback = function(Value)
end,
ChangedCallback = function(NewKey, NewModifiers)
end,
})
HidingPlaces = {
["Wardrobe"] = "Closet",
["Rooms_Locker"] = "Locker",
["Rooms_Locker_Fridge"] = "Fridge",
["Locker_Large"] = "Locker",
["Backdoor_Wardrobe"] = "Closet",
["Bed"] = "Bed",
["Double_Bed"]  = "Double Bed",
["Toolshed"] = "Closet",
["RetroWardrobe"] = "Closet",
["CircularVent"] = "Vent",
["Bed"] = "Bed",
["Double_Bed"] = "Double_Bed",
}
Closets = {}
AutoBox:AddDivider()
AutoBox:AddToggle('AutoLibraryCode',{
Text = "Auto Library Code",
Default = false,
})
AutoBox:AddToggle('BruteForceLibCode',{
Text = "Bruteforce Library Code",
Default = false,
})
AutoBox:AddToggle('AutoHeartbeat',{
Text = "Auto Heartbeat Minigame",
Default = false
})
local function Breaker(part)
local label = part:WaitForChild("SurfaceGui"):WaitForChild("Frame"):WaitForChild("Code")
local function run()
task.wait(0.05)
if not Toggles.AutoBreaker.Value then return end
local target = tonumber(label.Text)
if target then
for _, v in part:GetChildren() do
if v.Name == "BreakerSwitch" and v:GetAttribute("ID") == target then
local trans = part:WaitForChild("SurfaceGui"):WaitForChild("Frame"):WaitForChild("Code"):WaitForChild("Frame").BackgroundTransparency
local pc = v:FindFirstChild("PrismaticConstraint")
local light = v:FindFirstChild("Light")
local sound = v:FindFirstChild("Sound")
if trans == 0 then
if v:GetAttribute("Enabled") then return end
v:SetAttribute("Enabled", true)
if pc then pc.TargetPosition = -0.2 end
if light then
light.Material = Enum.Material.Neon
local spark = light:FindFirstChild("Spark", true)
if spark then spark:Emit(1) end
end
if sound then sound:Play() end
elseif trans == 1 then
if not v:GetAttribute("Enabled") then return end
v:SetAttribute("Enabled", false)
if pc then pc.TargetPosition = 0.2 end
if light then light.Material = Enum.Material.Glass end
if sound then sound:Play() end
end
break
end
end
end
end
label:GetPropertyChangedSignal("Text"):Connect(run)
run()
end
AutoBox:AddToggle('AutoBreaker',{
Text = "Auto Breaker Minigame",
Default = false,
Callback = function(Value)
if Value then
for _, v in pairs(workspace.CurrentRooms:GetDescendants()) do
if v.Name == "ElevatorBreaker" then
Breaker(v)
end
end
end
end
})
local OldFogEnd
LightingBox:AddToggle('NoFog',{
Text = "No Fog",
Default = false,
Tooltip = "No fog",
Callback = function(Value)
if not Value then
for _, v in pairs(Lighting:GetChildren()) do
if v:IsA("Atmosphere") then
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
Text = "Fullbright",
Default = false,
Tooltip = "Make you see in darkness",
Callback = function(Value)
if not Value then
Lighting.Ambient = Color3.fromRGB(0, 0, 0)
Lighting.GlobalShadows = true
for _, v in pairs(workspace.CurrentRooms:GetChildren()) do
v:SetAttribute("Ambient", v:GetAttribute("OldAmbient"))
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
local doorModel = roomFolder:FindFirstChild("Door")
if doorModel then
local doorPart = doorModel:FindFirstChild("Door")
if doorPart then
local roomID = doorModel:GetAttribute("RoomID") or doorPart:GetAttribute("RoomID") or tostring(roomNum)
local cached = DoorStringCache[roomID]
if not cached then
cached = "Door " .. tostring(roomID)
DoorStringCache[roomID] = cached
end
AddDoorESP(doorPart, cached, DoorColor, roomNum)
local boards = doorPart:FindFirstChild("CrossBoards")
if boards then AddDoorESP(boards, "", DoorColor, roomNum) end
end
end
for _, v in ipairs(roomFolder:GetDescendants()) do
if v.Name == "KeyObtain" then
AddDoorESP(v, "Key", DoorColor, roomNum)
elseif v.Name == "ElectrialKeyObtain" then
AddDoorESP(v, "Electrical Key", DoorColor, roomNum)
end
end
end
local function UpdateDoorESP()
if not (Toggles.Door and Toggles.Door.Value) then return end
local currentRoomNum = tonumber(LocalPlayer:GetAttribute("CurrentRoom")) or 0
CleanOldDoorRooms(currentRoomNum)
local rooms = workspace:FindFirstChild("CurrentRooms")
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
elseif v.Name == "MinesAnchor" then
local sign = v:FindFirstChild("Sign")
local label = sign and sign:FindFirstChild("TextLabel")
local text = label and label.Text or ""
local key = "Anchor " .. text
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
local currentRoomNum = tonumber(LocalPlayer:GetAttribute("CurrentRoom")) or 0
CleanOldObjectiveRooms(currentRoomNum)
local rooms = workspace:FindFirstChild("CurrentRooms")
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
local currentRoomNum = tonumber(LocalPlayer:GetAttribute("CurrentRoom")) or 0
CleanOldHidingPlaceRooms(currentRoomNum)
local rooms = workspace:FindFirstChild("CurrentRooms")
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
local cached = GateLeverStringCache["Lever"]
if not cached then
cached = "Gate Lever"
GateLeverStringCache["Lever"] = cached
end
for _, v in ipairs(roomFolder:GetDescendants()) do
if v.Name == "LeverForGate" then
AddGateLeverESP(v, cached, LeverColor, roomNum)
end
end
end
local function UpdateGateLeverESP()
if not (Toggles.GateLever and Toggles.GateLever.Value) then return end
local currentRoomNum = tonumber(LocalPlayer:GetAttribute("CurrentRoom")) or 0
CleanOldGateLeverRooms(currentRoomNum)
local rooms = workspace:FindFirstChild("CurrentRooms")
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
local cached = BookStringCache["Book"]
if not cached then
cached = "Library Book"
BookStringCache["Book"] = cached
end
for _, v in ipairs(roomFolder:GetDescendants()) do
if v.Name == "LiveHintBook" then
AddBookESP(v, cached, BookColor, roomNum)
end
end
end
local function UpdateBookESP()
if not (Toggles.Books and Toggles.Books.Value) then return end
local currentRoomNum = tonumber(LocalPlayer:GetAttribute("CurrentRoom")) or 0
CleanOldBookRooms(currentRoomNum)
local rooms = workspace:FindFirstChild("CurrentRooms")
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
local cached = BreakerStringCache["Breaker"]
if not cached then
cached = "Breaker"
BreakerStringCache["Breaker"] = cached
end
for _, v in ipairs(roomFolder:GetDescendants()) do
if v.Name == "LiveBreakerPolePickup" then
AddBreakerESP(v, cached, BreakerColor, roomNum)
end
end
end
local function UpdateBreakerESP()
if not (Toggles.Breakers and Toggles.Breakers.Value) then return end
local currentRoomNum = tonumber(LocalPlayer:GetAttribute("CurrentRoom")) or 0
CleanOldBreakerRooms(currentRoomNum)
local rooms = workspace:FindFirstChild("CurrentRooms")
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
if v.Name == "GoldPile" then
local value = tonumber(v:GetAttribute("GoldValue")) or 0
local cached = GoldStringCache[value]
if not cached then
cached = "Gold " .. tostring(value)
GoldStringCache[value] = cached
end
AddGoldESP(v, cached, GoldColor, roomNum)
end
end
end
local function UpdateGoldESP()
if not (Toggles.Gold and Toggles.Gold.Value) then return end
local currentRoomNum = tonumber(LocalPlayer:GetAttribute("CurrentRoom")) or 0
CleanOldGoldRooms(currentRoomNum)
local rooms = workspace:FindFirstChild("CurrentRooms")
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
local cached = LadderStringCache["Ladder"]
if not cached then
cached = "Ladder"
LadderStringCache["Ladder"] = cached
end
for _, v in ipairs(roomFolder:GetDescendants()) do
if v.Name == "Ladder" then
AddLadderESP(v, cached, LadderColor, roomNum)
end
end
end
local function UpdateLadderESP()
if not (Toggles.Ladder and Toggles.Ladder.Value) then return end
local currentRoomNum = tonumber(LocalPlayer:GetAttribute("CurrentRoom")) or 0
CleanOldLadderRooms(currentRoomNum)
local rooms = workspace:FindFirstChild("CurrentRooms")
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
if n == "FuseObtain" then
AddFuseESP(v, "Fuse", FuseColor, roomNum)
elseif n == "MinesGenerator" then
AddFuseESP(v, "Generator", FuseColor, roomNum)
elseif n == "MinesGateButton" then
AddFuseESP(v, "Gate Button", FuseColor, roomNum)
end
end
end
local function UpdateFuseESP()
if not (Toggles.Fuse and Toggles.Fuse.Value) then return end
local currentRoomNum = tonumber(LocalPlayer:GetAttribute("CurrentRoom")) or 0
CleanOldFuseRooms(currentRoomNum)
local rooms = workspace:FindFirstChild("CurrentRooms")
if not rooms then return end
ProcessRoomFuses(rooms:FindFirstChild(tostring(currentRoomNum)), currentRoomNum)
ProcessRoomFuses(rooms:FindFirstChild(tostring(currentRoomNum + 1)), currentRoomNum + 1)
end
local EntityNear = {
["Snare"] = "Snare",
["MandrakeLive"] = "Man Drake",
["Mandrake"] = "Man Drake",
["JeffTheKiller"] = "Jeff",
["Eyes"] = "Eyes",
["Lookman"] = "Eyes",
["BackdoorLookman"] = "Lookman",
}
local EntityCurrent = {
["FigureRig"] = "Figure",
["FigureRagdoll"] = "Figure",
["Groundskeeper"] = "Ground Keeper",
["LiveEntityBramble"] = "Bramble",
}
local EntityGlobal = {
["RushMoving"] = "Rush",
["AmbushMoving"] = "Ambush",
["A60"] = "A-60",
["A120"] = "A-120",
["GlitchRush"] = "Glitch Rush",
["GlitchAmbush"] = "Glitch Ambush",
["BackdoorRush"] = "Blitz",
}
local EntityRoom150 = {
["GrumbleRig"] = "Grumble",
}
local EntityAll = {}
for k, v in pairs(EntityNear) do EntityAll[k] = v end
for k, v in pairs(EntityCurrent) do EntityAll[k] = v end
for k, v in pairs(EntityGlobal) do EntityAll[k] = v end
for k, v in pairs(EntityRoom150) do EntityAll[k] = v end
EntityAll["DoorFake"] = "Dupe"
EntityAll["GiggleCeiling"] = "Giggle"
local EntityActiveESP = {}
local EntityRoomCache = {}
local EntityStringCache = {}
local function PrepareEntity(part)
if not part then return false end
if part:IsA("Model") then
if not part.PrimaryPart then
local base = part:FindFirstChildWhichIsA("BasePart")
if not base then return false end
part.PrimaryPart = base
end
pcall(function() part.PrimaryPart.Transparency = 0.99 end)
if not part:FindFirstChildOfClass("Humanoid") then
Instance.new("Humanoid", part)
end
end
if part.Name == "FigureRig" or part.Name == "FigureRagdoll" then
local root = part:FindFirstChild("Root")
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
local currentRoomNum = tonumber(LocalPlayer:GetAttribute("CurrentRoom")) or 0
local isCurrent = (roomNum == currentRoomNum)
for _, v in ipairs(roomFolder:GetDescendants()) do
local n = v.Name
local label = EntityNear[n]
if label then
if n ~= "Snare" or v:FindFirstChild("Hitbox") then
AddEntityESP(v, label, EntityColor, roomNum)
end
elseif n == "DoorFake" then
if v.Parent and v.Parent.Name == "SideroomDupe" then
local fake = v:FindFirstChild("Door")
if fake then AddEntityESP(fake, "Dupe", EntityColor, roomNum) end
end
elseif n == "GiggleCeiling" then
if v:FindFirstChild("Hitbox") then
AddEntityESP(v, "Giggle", EntityColor, roomNum)
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
local currentRoomNum = tonumber(LocalPlayer:GetAttribute("CurrentRoom")) or 0
for part in pairs(EntityActiveESP) do
if not part.Parent then RemoveEntityESP(part) end
end
CleanOldEntityRooms(currentRoomNum)
local rooms = workspace:FindFirstChild("CurrentRooms")
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
["RushMoving"] = "Rush",
["AmbushMoving"] = "Ambush",
["A60"] = "A-60",
["A120"] = "A-120",
["GlitchRush"] = "Glitch Rush",
["GlitchAmbush"] = "Glitch Ambush",
["Eyes"] = "Eyes",
["Lookman"] = "Eyes",
["BackdoorRush"] = "Blitz",
["BackdoorLookman"] = "Lookman",
["JeffTheKiller"] = "Jeff",
}
local NotifyOptionKey = {
["RushMoving"] = "Rush",
["AmbushMoving"] = "Ambush",
["A60"] = "A-60",
["A120"] = "A-120",
["GlitchRush"] = "GlitchRush",
["GlitchAmbush"] = "GlitchAmbush",
["Eyes"] = "Eyes",
["Lookman"] = "Eyes",
["BackdoorRush"] = "Blitz",
["BackdoorLookman"] = "Lookman",
["JeffTheKiller"] = "Jeff",
}
local function CheckAndNotifyEntity(entity)
if not entity then return end
if NotifiedEntities[entity] then return end
if not (Toggles.NotifySpawn and Toggles.NotifySpawn.Value) then return end
local key = NotifyOptionKey[entity.Name]
if not key then return end
local selected = Options.Notify and Options.Notify.Value
if type(selected) ~= "table" or not selected[key] then return end
NotifiedEntities[entity] = true
local con
con = entity.AncestryChanged:Connect(function(_, parent)
if not parent then
NotifiedEntities[entity] = nil
if con then con:Disconnect() con = nil end
end
end)
table.insert(Connections, con)
Notify(NotifyNames[entity.Name] .. " has Spawned", 5)
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
Text = "Door",
Default = false,
Callback = function(Value)
if Value then task.defer(UpdateDoorESP) else ClearAllDoorESP() end
end
}):AddColorPicker("ColorPicker2", {
Default = DoorColor,
Title = "Door ESP Color",
Callback = function(Value)
DoorColor = Value
if Toggles.Door and Toggles.Door.Value then
ClearAllDoorESP()
task.defer(UpdateDoorESP)
end
end,
})
ESPBox:AddToggle('Objective', {
Text = "Objective",
Default = false,
Callback = function(Value)
if Value then task.defer(UpdateObjectiveESP) else ClearAllObjectiveESP() end
end
}):AddColorPicker("ColorPicker3", {
Default = ItemsColor,
Title = "Objective ESP Color",
Callback = function(Value)
ItemsColor = Value
if Toggles.Objective and Toggles.Objective.Value then
ClearAllObjectiveESP()
task.defer(UpdateObjectiveESP)
end
end,
})
ESPBox:AddToggle('HidingPlace', {
Text = "Hiding Place",
Default = false,
Callback = function(Value)
if Value then task.defer(UpdateHidingPlaceESP) else ClearAllHidingPlaceESP() end
end
}):AddColorPicker("ColorPicker3", {
Default = HidingPlaceColor,
Title = "Hiding Place ESP Color",
Callback = function(Value)
HidingPlaceColor = Value
if Toggles.HidingPlace and Toggles.HidingPlace.Value then
ClearAllHidingPlaceESP()
task.defer(UpdateHidingPlaceESP)
end
end,
})
ESPBox:AddToggle('GateLever', {
Text = "Gate Lever",
Default = false,
Callback = function(Value)
if Value then task.defer(UpdateGateLeverESP) else ClearAllGateLeverESP() end
end
}):AddColorPicker("ColorPicker3", {
Default = LeverColor,
Title = "Gate Lever ESP Color",
Callback = function(Value)
LeverColor = Value
if Toggles.GateLever and Toggles.GateLever.Value then
ClearAllGateLeverESP()
task.defer(UpdateGateLeverESP)
end
end,
})
ESPBox:AddToggle('Books', {
Text = "Library Book",
Default = false,
Callback = function(Value)
if Value then task.defer(UpdateBookESP) else ClearAllBookESP() end
end
}):AddColorPicker("ColorPicker3", {
Default = BookColor,
Title = "Library ESP Color",
Callback = function(Value)
BookColor = Value
if Toggles.Books and Toggles.Books.Value then
ClearAllBookESP()
task.defer(UpdateBookESP)
end
end,
})
ESPBox:AddToggle('Breakers', {
Text = "Breaker",
Default = false,
Callback = function(Value)
if Value then task.defer(UpdateBreakerESP) else ClearAllBreakerESP() end
end
}):AddColorPicker("ColorPicker3", {
Default = BreakerColor,
Title = "Breaker ESP Color",
Callback = function(Value)
BreakerColor = Value
if Toggles.Breakers and Toggles.Breakers.Value then
ClearAllBreakerESP()
task.defer(UpdateBreakerESP)
end
end,
})
ESPBox:AddToggle('Gold', {
Text = "Gold",
Default = false,
Callback = function(Value)
if Value then task.defer(UpdateGoldESP) else ClearAllGoldESP() end
end
}):AddColorPicker("ColorPicker3", {
Default = GoldColor,
Title = "Gold ESP Color",
Callback = function(Value)
GoldColor = Value
if Toggles.Gold and Toggles.Gold.Value then
ClearAllGoldESP()
task.defer(UpdateGoldESP)
end
end,
})
ESPBox:AddToggle('Entity', {
Text = "Entity",
Default = false,
Callback = function(Value)
if Value then task.defer(UpdateEntityESP) else ClearAllEntityESP() end
end
}):AddColorPicker("ColorPicker3", {
Default = EntityColor,
Title = "Entity ESP Color",
Callback = function(Value)
EntityColor = Value
if Toggles.Entity and Toggles.Entity.Value then
ClearAllEntityESP()
task.defer(UpdateEntityESP)
end
end,
})
ESPBox:AddToggle('Ladder', {
Text = "Ladder",
Default = false,
Callback = function(Value)
if Value then task.defer(UpdateLadderESP) else ClearAllLadderESP() end
end
}):AddColorPicker("ColorPickerLadder", {
Default = LadderColor,
Title = "Ladder ESP Color",
Callback = function(Value)
LadderColor = Value
if Toggles.Ladder and Toggles.Ladder.Value then
ClearAllLadderESP()
task.defer(UpdateLadderESP)
end
end,
})
ESPBox:AddToggle('Fuse', {
Text = "Fuse",
Default = false,
Callback = function(Value)
if Value then task.defer(UpdateFuseESP) else ClearAllFuseESP() end
end
}):AddColorPicker("ColorPickerFuse", {
Default = FuseColor,
Title = "Fuse ESP Color",
Callback = function(Value)
FuseColor = Value
if Toggles.Fuse and Toggles.Fuse.Value then
ClearAllFuseESP()
task.defer(UpdateFuseESP)
end
end,
})
local ESPWatch = {
["Door"] = UpdateDoorESP,
["KeyObtain"] = UpdateDoorESP,
["ElectrialKeyObtain"] = UpdateDoorESP,
["MinesAnchor"] = UpdateObjectiveESP,
["LeverForGate"] = UpdateGateLeverESP,
["LiveHintBook"] = UpdateBookESP,
["LiveBreakerPolePickup"] = UpdateBreakerESP,
["GoldPile"] = UpdateGoldESP,
["Ladder"] = UpdateLadderESP,
["FuseObtain"] = UpdateFuseESP,
["MinesGenerator"] = UpdateFuseESP,
["MinesGateButton"] = UpdateFuseESP,
}
table.insert(Connections, LocalPlayer:GetAttributeChangedSignal("CurrentRoom"):Connect(function()
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
CameraBox:AddSlider("FOV", {
Text = "FOV",
Default = 70,
Min = 70,
Max = 120,
Rounding = 1,
Compact = false,
Callback = function(Value)
end,
Tooltip = "Field of View",
})
CameraBox:AddDivider()
CameraBox:AddToggle('ThirdPerson',{
Text = "Third Person",
Default = false
}):AddKeyPicker("ThirdpersonKeybind", {
Default = "T", 	SyncToggleState = true,
Mode = "Toggle", 
Text = "Third Person", 	NoUI = false, 
Callback = function(Value)
end,
ChangedCallback = function(NewKey, NewModifiers)
end,
})
CameraBox:AddSlider("X", {
Text = "X",
Default = 2,
Min = -10,
Max = 10,
Rounding = 1,
Compact = false,
Callback = function(Value)
end,
Tooltip = "X",
})
CameraBox:AddSlider("Y", {
Text = "Y",
Default = 0,
Min = -10,
Max = 10,
Rounding = 1,
Compact = false,
Callback = function(Value)
end,
Tooltip = "Y",
})
CameraBox:AddSlider("Z", {
Text = "Z",
Default = 4,
Min = -10,
Max = 10,
Rounding = 1,
Compact = false,
Callback = function(Value)
end,
Tooltip = "Z",
})
CameraBox:AddToggle('NoCamShake',{
Text = "No Camera Shake",
Disabled = not require and true or false,
})
local OldMinZoom = LocalPlayer.CameraMinZoomDistance
local OldMaxZoom  = LocalPlayer.CameraMaxZoomDistance
CameraBox:AddToggle('Freecam',{
Text = "Freecam",
Default = false,
Callback = function(Value)
if not Value then
local fcPart = workspace:FindFirstChild("FreecamPart")
if fcPart then
fcPart:Destroy()
local root = LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("HumanoidRootPart")
if root then root.Anchored = false end
LocalPlayer.CameraMinZoomDistance = LocalPlayer:GetAttribute("fc_om") or 0.5
LocalPlayer.CameraMaxZoomDistance = LocalPlayer:GetAttribute("fc_ox") or 128
end
end
end
}):AddKeyPicker("FreecamKeybind", {
Default = "B", 	SyncToggleState = true,
Mode ="Toggle" , 
Text = "Freecam", 	NoUI = false, 
Callback = function(Value)
end,
ChangedCallback = function(NewKey, NewModifiers)
end,
})
CameraBox:AddToggle('NoScenes',{
Text = "No Cutscenes",
Default = false,
Callback = function(Value)
local Cutscene = RemoteListener:FindFirstChild("Cutscenes") or RemoteListener:FindFirstChild("Cutscenes_")
if Value then
Cutscene.Name = "Cutscenes_"
else
Cutscene.Name = "Cutscenes"
end
end
})
NotifyBox:AddDropdown("Notify", {
Values = { "Rush","Ambush","GlitchRush","GlitchAmbush","A-60","A-120","Eyes","Blitz","Lookman","Jeff"},
Default = 1, 	Multi = true, 
Text = "Choose to Notify",
Callback = function(Value)
end,
})
NotifyBox:AddToggle('NotifySpawn',{
Text = "Notify Entity",
Default = false,
Tooltip = "Notify Entity In Spawn",
Callback = function(Value)
if Value and ESPHooks and ESPHooks.ScanNotify then
task.defer(ESPHooks.ScanNotify)
end
end
})
local FakeScreech = Instance.new("RemoteEvent",RemotesFolder)
FakeScreech.Name = "Screech_"
local FakeA90 = Instance.new("RemoteEvent",RemotesFolder)
FakeA90.Name = "A90_"
local gotToggled = false
local gotToggled2 = false
BypassEntityBox:AddToggle('Screech',{
Text = "Anti Screech Damage",
Default = false,
Callback = function(Value)
if Value then
gotToggled = true
RemotesFolder.Screech.Name = "Screech_"
FakeScreech.Name = "Screech"
else
if gotToggled then
RemotesFolder["Screech_"].Name = "Screech"
FakeScreech.Name = "Screech_"
end
end
end
})
BypassEntityBox:AddToggle('A90',{
Text = "Anti A90 Damage",
Default = false,
Callback = function(Value)
if Value then
gotToggled2 = true
RemotesFolder.A90.Name = "A90_"
FakeA90.Name = "A90"
else
if gotToggled2 then
RemotesFolder["A90_"].Name = "A90"
FakeA90.Name = "A90_"
end
end
end
})
BypassEntityBox:AddToggle('Dread',{
Text = "Anti Dread",
Default = false,
Callback = function(Value)
if Value then
local Dread = LocalPlayer:FindFirstChild("Dread",true) or LocalPlayer:FindFirstChild("_Dread",true)
if Dread then
Dread.Name = "_Dread"
end
else
local Dread = LocalPlayer:FindFirstChild("Dread",true) or LocalPlayer:FindFirstChild("_Dread",true)
if Dread then
Dread.Name = "Dread"
end
end
end
})
BypassEntityBox:AddToggle('Halt',{
Text = "Anti Halt",
Default = false,
Callback = function(Value)
if Value then
local Dread = ClientModules.EntityModules:FindFirstChild("Shade",true) or ClientModules.EntityModules:FindFirstChild("_Shade",true)
if Dread then
Dread.Name = "_Shade"
end
else
local Dread = ClientModules.EntityModules:FindFirstChild("Shade",true) or ClientModules.EntityModules:FindFirstChild("_Shade",true)
if Dread then
Dread.Name = "Shade"
end
end
end
})
BypassEntityBox:AddToggle('Jamming',{
Text = "Anti Jammimg",
Default = false,
Callback = function(Value)
if  ReplicatedStorage:FindFirstChild("LiveModifiers") and ReplicatedStorage:FindFirstChild("LiveModifiers"):FindFirstChild("Jammin") then
local Jam = LocalPlayer.PlayerGui.MainUI.Initiator:FindFirstChild("Main_Game").Health.Jam
Jam.Playing = not Value
local Jamming = game:GetService("SoundService").Main.Jamming
Jamming.Enabled =  not Value
end
end
})
local Surge = Instance.new("RemoteEvent",ReplicatedStorage)
Surge.Name = "SurgeRemote"
BypassEntityBox:AddToggle('BypassSurgeDamage',{
Text = "Anti Surge Damage",
Default = false,
Callback = function(Value)
if Value then
if RemotesFolder:FindFirstChild("SurgeRemote") then
RemotesFolder.SurgeRemote.Parent = ReplicatedStorage
Surge.Parent = RemotesFolder
end
else
if RemotesFolder:FindFirstChild("SurgeRemote") then
ReplicatedStorage.SurgeRemote.Parent = RemotesFolder
Surge.Parent = ReplicatedStorage
end
end
end
})
BypassEntityBox:AddToggle('Snare',{
Text = "Anti Snare",
Default = false,
Callback = function(Value)
for _, v in pairs(workspace.CurrentRooms:GetDescendants()) do
if   v.Name == "Snare" then
local wait = 0
repeat task.wait(0.01) wait = wait  + 0.01 until wait > 2 or v:FindFirstChild("Hitbox")
if v:FindFirstChild("Hitbox") then
v.Hitbox.CanTouch = not Value
end
end
end
end
})
BypassEntityBox:AddToggle('Giggle',{
Text = "Anti Giggle",
Default = false,
Callback = function(Value)
for _, v in pairs(workspace.CurrentRooms:GetDescendants()) do
if   v.Name == "GiggleCeiling" then
local wait = 0
repeat task.wait(0.01) wait = wait  + 0.01 until wait > 2 or v:FindFirstChild("Hitbox")
if v:FindFirstChild("Hitbox") then
v.Hitbox.CanTouch = not Value
end
end
end
end
})
BypassEntityBox:AddToggle('Dupe',{
Text = "Anti Dupe",
Default = false,
Callback = function(Value)
for _, v in pairs(workspace.CurrentRooms:GetDescendants()) do
if v.Name == "DoorFake"  and v.Parent.Name == "SideroomDupe" then
v:WaitForChild("Hidden",9e9).CanTouch = not Value
end
end
end
})
BypassBox:AddToggle('BypassSpeed',{
Text = "Speed Bypass",
Default = false,
Callback  = function(Value)
Options.MovementSpeed:SetMax(Value and 75 or 21)
Options.FlightSpeed:SetMax(Value and 75 or 21)
end
})
BypassBox:AddDivider()
BypassBox:AddDropdown("AntiCheatManiMethod", {
Values = { "Velocity", "Anticheat" },
Default = 1,
Text = "Manipulation Method",
Callback = function(Value)
end,
})
BypassBox:AddToggle('AntiCheatMani',{
Text = "Manipulation",
Default = false,
Callback = function(Value)
if not Value then
if LocalPlayer.Character.HumanoidRootPart:FindFirstChild("VelocityMani") then
LocalPlayer.Character.HumanoidRootPart:FindFirstChild("VelocityMani"):Destroy()
end
if Toggles.NoclipToggle and Toggles.NoclipToggle.Value then
Toggles.NoclipToggle:SetValue(false)
end
end
end
}):AddKeyPicker("AntiCheatMan", {
Default = "V", 	SyncToggleState = true,
Mode = Library.IsMobile and "Toggle" or "Hold",  
Text = " Manipulation", 	NoUI = false, 
Callback = function(Value)
print("[cb] Keybind clicked!", Value)
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
if v.Name == "BananaPeel" then
v.CanTouch = false
end
end
if Toggles.AntiJeff.Value then
if v.Name == "JeffTheKiller" then
repeat task.wait() until v.PrimaryPart and isnetworkowner(v.PrimaryPart)
for _, i in pairs(v:GetChildren()) do
if i:IsA("BasePart") then
i.CanTouch = false
end
end
v.Humanoid.Health = 0
end
end
end))
BypassEntityBox:AddToggle('EyesDamage',{
Text = "Anti Eyes Damage",
Default = false
})
BypassEntityBox:AddToggle('LookmanDamage',{
Text = "Anti Lookman Damage",
Default = false
})
BypassEntityBox:AddToggle('GloomEggDamage',{
Text = "Anti Gloom Egg",
Default = false,
Callback = function(Value)
for _, v in pairs(workspace.CurrentRooms:GetDescendants()) do
if v.Name == "GloomEgg" then
for _, i in pairs(v:GetChildren()) do
if i:IsA("BasePart")  then
i.CanTouch = not Value
end
end
end
end
end
})
HotelFloor:AddToggle('NotifyLibraryCode',{
Text = "Notify Library Code",
Default = false,
})
HotelFloor:AddToggle('SeekObf',{
Text = "Anti Seek Obstacles",
Default = false,
Callback = function(Value)
for _, v in pairs(workspace.CurrentRooms:GetDescendants()) do
if v.Name == "Seek_Arm" or v.Name == "ChandelierObstruction" then
for _, i in pairs(v:GetChildren()) do
if i:IsA("BasePart") then
i.CanTouch = not Value
end
end
end
end
end
})
BypassEntityBox:AddToggle('FigureHearing',{
Text = "Anti Figure Hearing",
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
Text = "Anti Lag ",
Default = false,
Callback = function(Value)
if Value then
for _, v in workspace.CurrentRooms:GetDescendants() do
if v:IsA("BasePart") then
v:SetAttribute("Mat", v.Material)
v.Material = "Plastic"
end
end
else
for _, v in workspace.CurrentRooms:GetDescendants() do
if v:IsA("BasePart") then
if v:GetAttribute("Mat") then
v.Material = v:GetAttribute("Mat") or "Plastic"
end
end
end
end
end
})
ReachBox:AddToggle('PromptReach',{
Text = "Prompt Reach",
Default = false,
Callback = function(Value)
if Value then
for _, v in pairs(workspace:GetDescendants()) do
if v:IsA("ProximityPrompt") then
v:SetAttribute("Range", v.MaxActivationDistance)
v.MaxActivationDistance = v.MaxActivationDistance * 2
end
end
else
for _, v in pairs(workspace:GetDescendants()) do
if v:IsA("ProximityPrompt") then
v.MaxActivationDistance = v:GetAttribute("Range") or v.MaxActivationDistance
end
end
end
end
})
ReachBox:AddToggle('PromptClip',{
Text = "Prompt Clip",
Default = false,
Callback = function(Value)
if Value then
for _, v in pairs(workspace:GetDescendants()) do
if v:IsA("ProximityPrompt") then
v:SetAttribute("Clip", v.RequiresLineOfSight)
v.RequiresLineOfSight = false
end
end
else
for _, v in pairs(workspace:GetDescendants()) do
if v:IsA("ProximityPrompt") then
v.RequiresLineOfSight = v:GetAttribute("Clip") or true
end
end
end
end
})
ReachBox:AddToggle('DoorReach',{
Text = "Door Reach",
Default = false
})
PlayerColor = Color3.fromRGB(150, 150, 150)
ESPBox:AddToggle('Player', {
Text = "Player",
Default = false,
Callback = function(Value)
for _, v in pairs(Players:GetPlayers()) do
if v ~= LocalPlayer and v.Character then
ESPLibrary:RemoveESP(v.Character)
if Value then
local hum = v.Character:FindFirstChildOfClass("Humanoid")
if hum and hum.Health > 0 then
AddESP(v.Character, v.Name .. " [" .. math.floor((hum.Health / hum.MaxHealth) * 100) .. "%]", PlayerColor)
end
end
end
end
end
}):AddColorPicker("ColorPicker99", {
Default = PlayerColor,
Title = "Player ESP Color",
Callback = function(Value)
PlayerColor = Value
Toggles.Player:SetValue(false)
Toggles.Player:SetValue(true)
end,
})
BypassBox:AddDivider()
BypassBox:AddLabel("Infinite Crucfix Only Works on A-60, A-120, Rush, Ambush. Have a chance to fail",true)
BypassBox:AddToggle('InfCrucifix',{
Text = "Infinite Crucifix ",
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
if not prompt or not prompt:IsA("ProximityPrompt") then return false end
if prompt.Name == "FusesPrompt" then return true end
local parent = prompt.Parent
if not parent then return false end
local parentName = parent.Name
local grandParentName = parent.Parent and parent.Parent.Name
if Names[parentName] or (grandParentName and Names[grandParentName]) then return true end
if grandParentName == "Locker_Small_Locked" then return true end
return false
end
local function RestorePrompt(Prompt)
if not Prompt then return end
if Prompt.Parent then
local ExistingPrompt = Prompt.Parent:FindFirstChild("InfPrompt")
if ExistingPrompt then
ExistingPrompt:Destroy()
end
end
Prompt:SetAttribute("InfItems", nil)
Prompt:SetAttribute("Tool", nil)
Prompt:SetAttribute("InfTime", nil)
Prompt.Enabled = true
Prompt.ClickablePrompt = true
end
local function InfPrompt(Prompt)
local Char = LocalPlayer.Character
if not Char then return end
local RootPart = Char:FindFirstChild("HumanoidRootPart")
if not RootPart then return end
local Tool = Char:FindFirstChild("Lockpick") or Char:FindFirstChild("SkeletonKey") or Char:FindFirstChild("Shears")
local Name = Tool and Tool.Name
local TargetPart = Prompt.Parent and (Prompt.Parent:IsA("BasePart") and Prompt.Parent or Prompt.Parent:FindFirstChildWhichIsA("BasePart"))
local Dist = TargetPart and GetDistanceToPlayer(TargetPart.Position) or 999
if Tool and Dist <= (Prompt.MaxActivationDistance + 5) then
if Prompt:GetAttribute("InfItems") and Prompt:GetAttribute("Tool") ~= Name then
RestorePrompt(Prompt)
end
if Prompt:GetAttribute("InfItems") then
local startTime = Prompt:GetAttribute("InfTime") or 0
if (tick() - startTime > 8) or (Dist > Prompt.MaxActivationDistance + 7) then
RestorePrompt(Prompt)
end
return
end
if not Prompt:GetAttribute("InfItems") then
Prompt.Enabled = false
Prompt:SetAttribute("InfItems", true)
Prompt:SetAttribute("Tool", Name)
Prompt:SetAttribute("InfTime", tick())
Prompt.ClickablePrompt = false
local Clone = Prompt:Clone()
Clone.Name = "InfPrompt"
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
if workspace:FindFirstChild("Drops") then
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
if Name == "Shears" then
if firePromptFunc then firePromptFunc(Prompt) end
if Drop then
local DropPrompt = Drop:FindFirstChildWhichIsA("ProximityPrompt", true)
if DropPrompt and firePromptFunc then firePromptFunc(DropPrompt) end
end
else
if Drop then
local DropPrompt = Drop:FindFirstChildWhichIsA("ProximityPrompt", true)
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
if Prompt:GetAttribute("InfItems") then
RestorePrompt(Prompt)
end
end
end
BypassBox:AddToggle('InfItems',{
Text = "Infinite Items",
BypassBox:AddLabel("If Infinite Items doesn't work with Auto-Interact (R), it will work with the default game bind (E). Just keep tapping it",true),
Callback = function(Value)
if Value then
for _, v in pairs(workspace.CurrentRooms:GetDescendants()) do
if IsInfItemTarget(v) then
table.insert(Stored, v)
end
end
else
for _, Prompt in pairs(workspace.CurrentRooms:GetDescendants()) do
if Prompt:IsA("ProximityPrompt") and Prompt:GetAttribute("InfItems") then
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
if not LocalPlayer:GetAttribute("Alive") then
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
if not LocalPlayer.Character:GetAttribute("Climbing") and Toggles.EnableMovementSpeed.Value then
if LocalPlayer.Character.Humanoid.WalkSpeed ~= Options.MovementSpeed.Value then
LocalPlayer.Character.Humanoid.WalkSpeed = Options.MovementSpeed.Value
end
elseif LocalPlayer.Character:GetAttribute("Climbing") and Toggles.EnableClimbingSpeed.Value then
if LocalPlayer.Character.Humanoid.WalkSpeed ~= Options.ClimbingSpeed.Value then
LocalPlayer.Character.Humanoid.WalkSpeed = Options.ClimbingSpeed.Value
end
end
if Toggles.ThirdPerson.Value then
Camera.CFrame = Camera.CFrame * CFrame.new(Options.X.Value, Options.Y.Value, Options.Z.Value)
end
for _, v in pairs(LocalPlayer.Character:GetChildren()) do
if v:IsA("BasePart") and (v.Name == "Head" or v.Name == "FakeHead") then
v.Transparency = Toggles.ThirdPerson.Value and 0 or 1
v.LocalTransparencyModifier = Toggles.ThirdPerson.Value and 0 or 1
end
if v:IsA("Accessory") then
local handle = v:FindFirstChild("Handle")
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
local hum = char and char:FindFirstChild("Humanoid")
local root = char and char:FindFirstChild("HumanoidRootPart")
if root and not root.Anchored then root.Anchored = true end
if not workspace:FindFirstChild("FreecamPart") then
local part = Instance.new("Part")
part.Name = "FreecamPart"
part.Size = Vector3.new(0.01, 0.01, 0.01)
part.Transparency = 1
part.CanCollide = false
part.Anchored = true
part.CFrame = Camera.CFrame
part.Parent = workspace
LocalPlayer:SetAttribute("fc_om", LocalPlayer.CameraMinZoomDistance)
LocalPlayer:SetAttribute("fc_ox", LocalPlayer.CameraMaxZoomDistance)
LocalPlayer.CameraMinZoomDistance = 0
LocalPlayer.CameraMaxZoomDistance = 0
local rx, ry, rz = Camera.CFrame:ToOrientation()
LocalPlayer:SetAttribute("fc_p", math.deg(rx))
LocalPlayer:SetAttribute("fc_y", math.deg(ry))
end
local fcPart = workspace:FindFirstChild("FreecamPart")
local curCam = Camera
if fcPart and curCam then
local delta = UserInputService:GetMouseDelta()
local sensitivity = UserInputService.KeyboardEnabled and 0.3 or 0.6
local pitch = (LocalPlayer:GetAttribute("fc_p") or 0) - (delta.Y * sensitivity)
local yaw = (LocalPlayer:GetAttribute("fc_y") or 0) - (delta.X * sensitivity)
pitch = math.clamp(pitch, -80, 80)
LocalPlayer:SetAttribute("fc_p", pitch)
LocalPlayer:SetAttribute("fc_y", yaw)
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
local Root = v:FindFirstChild("Root")
if not IsNetworkOwner then
Notify("Sorry your executor wont support Delete Figure Because isnetworkowner", 5)
Toggles.DeleteFigureFE:SetValue(false)
end
if Root and isnetworkowner(Root) then
if Root:FindFirstChild("BodyForce") then
Root.BodyForce.Force = Vector3.new(0, -50000, 0)
else
Root:PivotTo(CFrame.new(0, -50000, 0))
end
for _, part in pairs(v:GetDescendants()) do
if part:IsA("BasePart") and part.CanCollide then
part.CanCollide = false
part.Anchored = false
end
end
if Root.Position.Y < -1000 and not v:GetAttribute("Deleted") then
Notify("Deleted Figure Successfully", 4)
v:SetAttribute("Deleted", true)
end
end
end
end
if Toggles.AutoAnchorSolver.Value and LatestRoom.Value == 50 and AutoAnchorSolver > 0.5  then
AutoAnchorSolver = 0
local Hint = LocalPlayer.PlayerGui.MainUI:FindFirstChild("AnchorHintFrame")
if Anchors and Hint and Hint.Visible then
local ID = Hint.AnchorCode.Text
for _, v in pairs(Anchors) do
if v:FindFirstChild("Sign") and v.Sign.TextLabel.Text == ID then
local Code = Hint.Code.Text
local Note = v:FindFirstChild("Note")
local NoteText = Note and Note.SurfaceGui.TextLabel.Text or ""
local Mod = tonumber(string.match(NoteText, "%d+")) or 0
local Final = ""
for i = 1, #Code do
local Digit = tonumber(string.sub(Code, i, i)) or 0
local Res = string.find(NoteText, "+") and (Digit + Mod) % 10 or (Digit - Mod) % 10
Final = Final .. tostring(Res < 0 and Res + 10 or Res)
end
local Dis = (LocalPlayer.Character.HumanoidRootPart.Position - v:GetPivot().Position).Magnitude
if Dis < 20 then
local AnchorRemote = v:FindFirstChildOfClass("RemoteFunction")
if AnchorRemote then
AnchorRemote:InvokeServer(tostring(Code))
end
Notify("Anchor " .. Final, 1)
end
end
end
end
end
if Toggles.AutoMinecart.Value and Camera:FindFirstChild("MinecartRig") then
if LatestRoom.Value < 49 then
if not LocalPlayer:GetAttribute("NotifyMinecart") then
Notify("[Auto Minecart] DONT MOVE", 5)
LocalPlayer:SetAttribute("NotifyMinecart", true)
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
if Node:GetAttribute("ForceConnect") then
local Dist = (Root.Position - Node.Position).Magnitude
if Dist < MinDist then
MinDist = Dist
CurrentNode = Node
end
end
end
if CurrentNode then
local CurrentNum = tonumber(string.match(CurrentNode.Name, "%d+"))
if CurrentNum then
local Node1
for _, Node in pairs(Nodes) do
if Node.Name == "MinecartNode" .. tostring(CurrentNum + 3) then
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
if LocalPlayer:GetAttribute("NotifyMinecart") then
Notify("[Auto Minecart] YOU CAN MOVE", 5)
LocalPlayer:SetAttribute("NotifyMinecart", false)
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
Notify("Code " .. Code)
end
end
if Toggles.Flight.Value then
if not LocalPlayer.Character.HumanoidRootPart:FindFirstChild("FlightVelocity") then
local Velocity = Instance.new("BodyVelocity", LocalPlayer.Character.HumanoidRootPart)
Velocity.MaxForce = Vector3.new(math.huge, math.huge, math.huge)
Velocity.Velocity = Vector3.zero
Velocity.Name = "FlightVelocity"
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
LocalPlayer.Character.HumanoidRootPart:FindFirstChild("FlightVelocity").Velocity = Camera.CFrame:VectorToWorldSpace(localInput) * Options.FlightSpeed.Value
end
if Toggles.Godmode.Value then
if RemotesFolder.Name == "RemotesFolder" then
if not Toggles.FigureHearing.Value then
Notify("Enabled Figure Hearing Automaticlly cause Godmode needs it", 3)
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
if (Floor.Value == "Fools" or RemotesFolder.Name == "Bricks") and not (Toggles.NoclipToggle and Toggles.NoclipToggle.Value) then
Toggles.NoclipToggle:SetValue(true)
end
end
if not LocalPlayer.Character:FindFirstChild("CollisionClone") then
if LocalPlayer.Character:FindFirstChild("CollisionPart") then
CollisionClone = LocalPlayer.Character.CollisionPart:Clone()
CollisionClone.Parent = LocalPlayer.Character
CollisionClone.Name = "CollisionClone"
CollisionClone.RootPriority = 127
CollisionClone.Anchored = false
CollisionClone.CanCollide = false
if CollisionClone:FindFirstChild("CollisionCrouch") then
CollisionClone:FindFirstChild("CollisionCrouch"):Destroy()
end
end
end
if Toggles.NoScenes.Value and LatestRoom.Value == 100 then
Toggles.NoScenes:SetValue(false)
end
if not HookMeta then
if Toggles.FigureHearing.Value then
if RemotesFolder:FindFirstChild("Crouch") then
RemotesFolder.Crouch:FireServer(true)
end
end
end
if Toggles.InfCrucifix.Value and not Toggles.Godmode.Value and LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("HumanoidRootPart") then
local Origin = LocalPlayer.Character.HumanoidRootPart.Position
local Tool = LocalPlayer.Character:FindFirstChild("Crucifix")
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
local Drops = workspace:FindFirstChild("Drops")
local Drop = Drops and Drops:FindFirstChild("Crucifix")
local Prompt = Drop and Drop:FindFirstChildOfClass("ProximityPrompt")
if Prompt and FireFunc then
FireFunc(Prompt)
end
until LocalPlayer.Character:FindFirstChild("Crucifix") or (tick() - StartTime) > 1.2
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
if Toggles.BruteForceLibCode.Value and string.find(Code, "_") then
local Bruted = ""
for i = 1, #Code do
local char = string.sub(Code, i, i)
Bruted ..= (char == "_" and math.random(0, 9) or char)
end
Code = Bruted
end
PL:FireServer(Code)
end
end
end
if Toggles.DoorReach.Value and DoorReach > 0.2 then
DoorReach = 0
local Rooms = workspace:FindFirstChild("CurrentRooms")
local Room = Rooms and Rooms:FindFirstChild(tostring(tonumber(LatestRoom.Value) or 0))
local Door = Room and Room:FindFirstChild("Door")
if Door and Door:FindFirstChild("Door") and Door.Parent and Door.Parent.Name ~= "101" and GetDistanceToPlayer(Door.Door.Position) < 30 then
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
if not LocalPlayer.Character:GetAttribute("CanJump") then
LocalPlayer.Character:SetAttribute("CanJump",true)
end
end
if Toggles.NoFog.Value then
if Lighting.FogEnd < 100000 then
Lighting.FogEnd = 100000
end
for _, v in pairs(Lighting:GetChildren()) do
if v:IsA("Atmosphere") and v.Density > 0 then
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
local hum = v.Character:FindFirstChildOfClass("Humanoid")
if hum then
if hum.Health > 0 then
AddESP(v.Character, v.Name .. " [" .. math.floor((hum.Health / hum.MaxHealth) * 100) .. "%]", PlayerColor)
else
ESPLibrary:RemoveESP(v.Character)
end
end
end
end
end
if Toggles.EyesDamage.Value then
if (workspace:FindFirstChild("Eyes") or workspace:FindFirstChild("Lookman")) and not LocalPlayer.Character:GetAttribute("Hiding") then
if RemotesFolder.Name ~= "RemotesFolder" then
MotorReplication:FireServer(0, -650, 0, false)
else
MotorReplication:FireServer(-650)
end
end
end
if Toggles.LookmanDamage.Value then
if workspace:FindFirstChild("BackdoorLookman") then
if not LocalPlayer.Character:GetAttribute("Hiding") then
MotorReplication:FireServer(-650)
end
end
end
if Toggles.FullBright.Value then
if Lighting.Ambient ~= Color3.new(1, 1, 1) then
Lighting.Ambient = Color3.new(1, 1, 1)
end
local FBRooms = workspace:FindFirstChild("CurrentRooms")
local FBNum = tonumber(LocalPlayer:GetAttribute("CurrentRoom")) or 0
local FBRoom = FBRooms and FBRooms:FindFirstChild(tostring(FBNum))
if FBRoom then
if not FBRoom:GetAttribute("OldAmbient") then
FBRoom:SetAttribute("OldAmbient", FBRoom:GetAttribute("Ambient"))
end
if FBRoom:GetAttribute("Ambient") ~= Color3.new(1, 1, 1) then
FBRoom:SetAttribute("Ambient", Color3.new(1, 1, 1))
end
end
if (tonumber(LatestRoom.Value) or 0) < 100 then
local FBNext = FBRooms and FBRooms:FindFirstChild(tostring(FBNum + 1))
if FBNext then
if not FBNext:GetAttribute("OldAmbient") then
FBNext:SetAttribute("OldAmbient", FBNext:GetAttribute("Ambient"))
end
if FBNext:GetAttribute("Ambient") ~= Color3.new(1, 1, 1) then
FBNext:SetAttribute("Ambient", Color3.new(1, 1, 1))
end
end
end
end
if Toggles.AntiCheatMani.Value and LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("HumanoidRootPart") then
if Options.AntiCheatManiMethod.Value == "Velocity" then
if Toggles.NoclipToggle and not Toggles.NoclipToggle.Value then
Toggles.NoclipToggle:SetValue(true)
end
local BodyVelocity = LocalPlayer.Character.HumanoidRootPart:FindFirstChild("VelocityMani") or Instance.new("BodyVelocity", LocalPlayer.Character.HumanoidRootPart)
local LookingVector = LocalPlayer.Character.HumanoidRootPart.CFrame.LookVector * 2
BodyVelocity.Velocity = Vector3.new(LookingVector.X, LookingVector.Y, LookingVector.Z)
BodyVelocity.MaxForce = Vector3.new(math.huge, math.huge, math.huge)
BodyVelocity.Name = "VelocityMani"
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
if v:IsA("BasePart") and v.Name ~= "CollisionClone" and v.CanCollide then
v.CanCollide = false
end
end
if LocalPlayer.Character:FindFirstChild("Collision") then
LocalPlayer.Character.Collision.CanCollide = false
if LocalPlayer.Character.Collision:FindFirstChild("CollisionCrouch") then
LocalPlayer.Character.Collision.CollisionCrouch.CanCollide = false
end
end
end
if not Toggles.NoClip.Value and not (Toggles.NoclipToggle and Toggles.NoclipToggle.Value) and not (Toggles.VelocityManipulationToggle and Toggles.VelocityManipulationToggle.Value) then
for _, v in pairs(LocalPlayer.Character:GetChildren()) do
if v.Name ~= "CollisionClone" and v.Name ~= "Collision" then
if v:IsA("BasePart") and not v.CanCollide then
v.CanCollide = true
end
end
end
if LocalPlayer.Character:FindFirstChild("Collision") then
LocalPlayer.Character.Collision.CanCollide = (LocalPlayer.Character.Collision.CollisionGroup == "PlayerCrouching" and false or LocalPlayer.Character.Collision.CollisionGroup ~= "PlayerCrouching" and true)
if LocalPlayer.Character.Collision:FindFirstChild("CollisionCrouch") then
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
Notify("Godmode Enabled Automatically For Ignore A-60", 5)
end
LocalPlayer.Character.Collision.Size = Vector3.new(1, 1, 3)
local DangerousEntity = workspace:FindFirstChild("A120") or workspace:FindFirstChild("GlitchRush") or workspace:FindFirstChild("GlitchAmbush")
local A60 = workspace:FindFirstChild("A60")
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
LocalPlayer.Character:SetAttribute("Hiding", false)
local CurrentRoom = workspace.CurrentRooms:FindFirstChild(tostring(LatestRoom.Value))
if CurrentRoom then
local TargetDoor = CurrentRoom:FindFirstChild("Door")
if TargetDoor and TargetDoor:FindFirstChild("Door") then
PathTo(TargetDoor.Door.Position)
end
end
end
end
end))
if HookMeta then
local Old
Old = hookmetamethod(game, "__namecall", function(Self, ...)
if Library.Unloaded then
return Old(Self, ...)
end
local Method = getnamecallmethod()
if Method == "FireServer" or Method == "InvokeServer" then
if Toggles.AutoHeartbeat.Value and Self.Name == "ClutchHeartbeat" then
return Old(Self, true)
end
if Method == "FireServer" and Toggles.FigureHearing.Value and Self.Name == "Crouch" then
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
if v.Parent:FindFirstChildOfClass("Humanoid") then return end
if (v.Name == "Candle" and v.Parent.Name == "Candle" or v.Parent.Parent and v.Parent.Parent.Name == "Candle") then return end
if  HidingPlaces[v.Name] then
table.insert(Closets, v)
end
if Toggles.AntiLag.Value then
if v:IsA("BasePart") then
v:SetAttribute("Mat", v.Material)
v.Material = "Plastic"
end
end
if Toggles.InfItems.Value then
if IsInfItemTarget(v) then
table.insert(Stored, v)
end
end
if Toggles.DeleteSeekFE.Value then
if v.Name == "TriggerEventCollision" then
Notify("Deleting Seek", 3)
local Part = v:FindFirstChild("Collision") or v.ChildAdded:Wait()
if Part then
Notify("DONT OPEN NEXT DOOR", 1)
task.wait(0.1)
for _, Item in pairs(v:GetChildren()) do
if Item.Name == "Collision" then
if LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("HumanoidRootPart") then
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
if Item.Name == "Collision" then
Success = false
break
end
end
if Success then
Notify("Deleted Seek Successfully Open Next Door", 3)
else
Notify("Failed To Delete Seek Open Next Door", 3)
end
end
end
end
if Toggles.SeekObf.Value then
if v.Name == "Seek_Arm" or v.Name == "ChandelierObstruction" then
for _, i in pairs(v:GetChildren()) do
if i:IsA("BasePart") then
i.CanTouch = false
end
end
end
end
if Toggles.AutoMinecart.Value then
if v.Name == "DuckBoard" then
table.insert(DuckBoards, v)
end
if string.find(v.Name, "MinecartNode") then
table.insert(Nodes, v)
end
end
if Toggles.AntiSeekFlood.Value then
if v.Name == "SeekFloodline" then
v.CanCollide = true
end
end
if Toggles.ShowPath.Value then
if v.Name == "SeekGuidingLight" then
ShowSeekPath(v)
end
end
if Toggles.DeleteFigureFE.Value then
if v.Name == "FigureRig" or v.Name == "FigureRagdoll" then
table.insert(Figures,v)
end
end
if Toggles.PromptClip.Value then
if v:IsA("ProximityPrompt") then
v:SetAttribute("Clip", v.RequiresLineOfSight)
v.RequiresLineOfSight = false
end
end
if Toggles.AutoBreaker.Value then
if v.Name == "ElevatorBreaker" then
Breaker(v)
end
end
if Toggles.PromptReach.Value then
if v:IsA("ProximityPrompt") then
v:SetAttribute("Range", v.MaxActivationDistance)
v.MaxActivationDistance = v.MaxActivationDistance * 2
end
end
if Toggles.Snare.Value then
if  v.Name == "Snare" then
local wait = 0
repeat task.wait(0.01) wait = wait  + 0.01 until wait > 1 or v:FindFirstChild("Hitbox")
if v:FindFirstChild("Hitbox") then
v.Hitbox.CanTouch = false
end
end
end
if Toggles.AntiLava.Value then
if v.Name == "Lava" then
v.CanTouch = false
end
end
if Toggles.AntiWall.Value then
if v.Name == "ScaryWall" then
for _, i in pairs(v:GetChildren()) do
if i:IsA("BasePart") then
i.CanTouch = false
end
end
end
end
if Toggles.RealBridge.Value then
if v.Name == "Bridge" then
if v.CanCollide == false then
v.Transparency = 1
end
end
end
if Toggles.Dupe.Value then
if v.Name == "DoorFake"  and v.Parent.Name == "SideroomDupe" then
v:WaitForChild("Hidden",9e9).CanTouch = false
end
end
if Toggles.FixBrokenBridge.Value then
if v.Name == "Bridge" then
FixBridge(v)
end
end
if Toggles.AutoAnchorSolver.Value then
if v.Name == "MinesAnchor" then
table.insert(Anchors,v)
end
end
if Toggles.GloomEggDamage.Value then
if v.Name == "GloomEgg" then
repeat task.wait() until v:FindFirstChildWhichIsA("BasePart")
for _, i in pairs(v:GetChildren()) do
if i:IsA("BasePart")  then
i.CanTouch = false
end
end
end
end
if Toggles.Giggle.Value then
if   v.Name == "GiggleCeiling" then
repeat task.wait() until v:FindFirstChild("Hitbox")
v.Hitbox.CanTouch = false
end
end
if v:IsA("ProximityPrompt") then
if Toggles.InstaInteract.Value then
v:SetAttribute("Duration",v.HoldDuration)
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
MenuGroup:AddLabel("Menu bind"):AddKeyPicker("MenuKeybind", { Default = "RightShift", NoUI = true, Text = "Menu keybind" })
Library.ToggleKeybind = Options.MenuKeybind
MenuGroup:AddToggle("ShowKeybinds", { Text = "Show Keybinds Overlay", Default = false }):OnChanged(function()
Library.KeybindFrame.Visible = Toggles.ShowKeybinds.Value
end)
MenuGroup:AddToggle("ShowCustomCursor", {
Text = "Custom Cursor",
Default = true,
Callback = function(Value)
Library.ShowCustomCursor = Value
end,
})
MenuGroup:AddDivider()
MenuGroup:AddToggle('PlayNotifySound',{
Text = "Play Notification Sound",
Default = true,
Callback = function(Value)
PlaySound = Value
end
})
MenuGroup:AddDropdown("NotificationSide", {
Values = { "Left", "Right" },
Default = "Right",
Text = "Notification Side",
Callback = function(Value)
Library:SetNotifySide(Value)
end,
})
MenuGroup:AddButton('Test Notification',function()
Notify("Hello World",2)
end)
MenuGroup:AddDropdown("Library", {
Values = { "Obsidian", "Linoria" },
Default = getgenv().ScriptLibrary,
Text = "Library",
Callback = function(Value)
getgenv().ScriptLibrary = tostring(Value)
Notify('Please Unload Script and Execute Again to Take Effect',4)
end,
})
MenuGroup:AddDropdown("RenderESPSpeed", {
Values = { "10", "30", "60", "90", "120","144", "240"},
Default = Library.IsMobile and 2 or 6,
Text = "ESP Rendering Speed",
Callback = function(Value)
ESPLibrary:SetRenderingSpeed(Value)
end,
})
MenuGroup:AddDivider()
MenuGroup:AddDropdown("DPIDropdown", {
Values = { "50%", "75%", "100%", "125%", "150%", "175%", "200%" },
Default = "100%",
Text = "DPI Scale",
Callback = function(Value)
Value = Value:gsub("%%", "")
local DPI = tonumber(Value)
Library:SetDPIScale(DPI)
end,
})
UtilityBox:AddButton({
Text = "Unload Hub",
Func = function()
LocalPlayer:SetAttribute("NovaLoaded", nil)
for _, con in pairs(Connections) do con:Disconnect() end
if ESPHooks and ESPHooks.ClearAll then
ESPHooks.ClearAll()
end
local Dread = LocalPlayer:FindFirstChild("Dread",true) or LocalPlayer:FindFirstChild("_Dread",true)
if Dread then
Dread.Name = "Dread"
end
local Dread = ClientModules.EntityModules:FindFirstChild("Shade",true) or ClientModules.EntityModules:FindFirstChild("_Shade",true)
if Dread then
Dread.Name = "Shade"
end
FakeA90:Destroy()
FakeScreech:Destroy()
if ReplicatedStorage:FindFirstChild("Screech") then
ReplicatedStorage:FindFirstChild("Screech").Parent = RemotesFolder
end
local getcons = getconnections or get_signal_cons or get_relative_connections
if getcons then
for _, con in pairs(getcons(LocalPlayer.Idled)) do
if con.Enable then
con:Enable()
end
end
end
local fcPart = workspace:FindFirstChild("FreecamPart")
if fcPart then
fcPart:Destroy()
local root = LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("HumanoidRootPart")
if root then root.Anchored = false end
LocalPlayer.CameraMinZoomDistance = LocalPlayer:GetAttribute("fc_om") or 0.5
LocalPlayer.CameraMaxZoomDistance = LocalPlayer:GetAttribute("fc_ox") or 128
end
if ReplicatedStorage:FindFirstChild("A90") then
ReplicatedStorage:FindFirstChild("A90").Parent = RemotesFolder
end
for _, v in pairs(workspace:GetDescendants()) do
if v:IsA("BasePart") then
v.CanTouch = true
end
if v.Name == "BridgeBarrier" then
v:Destroy()
end
end
if LocalPlayer.Character then
LocalPlayer.Character.Humanoid.WalkSpeed = 16
LocalPlayer.Character:SetAttribute("CanJump",false)
for _, v in pairs(LocalPlayer.Character:GetChildren()) do
if not (v.Name == "CollisionClone") and v:IsA("BasePart") then
v.CanCollide  = true
end
end
if OldAccel then
LocalPlayer.Character.HumanoidRootPart.CustomPhysicalProperties = OldAccel
OldAccel = nil
end
end
for _, v in ipairs(workspace:GetDescendants()) do
if v:IsA("ProximityPrompt") then
v.HoldDuration = v:GetAttribute("Duration") or
v.HoldDuration
end
end
if OldFogEnd then
Lighting.FogEnd = OldFogEnd
OldFogEnd = nil
end
for _, v in pairs(Lighting:GetChildren()) do
if v:IsA("Atmosphere") then
v.Density = 0.94
end
end
if LocalPlayer.Character.HumanoidRootPart:FindFirstChild("VelocityMani") then
LocalPlayer.Character.HumanoidRootPart:FindFirstChild("VelocityMani"):Destroy()
end
Lighting.Ambient = Color3.fromRGB(0, 0, 0)
Lighting.GlobalShadows = true
for _, v in pairs(workspace.CurrentRooms:GetChildren()) do
v:SetAttribute("Ambient", v:GetAttribute("OldAmbient") and v:GetAttribute("OldAmbient") or Color3.new(0, 0, 0))
end
FakeScreech:Destroy()
FakeA90:Destroy()
task.wait()
if RemotesFolder:FindFirstChild("A90_") then
RemotesFolder:FindFirstChild("A90_").Name = "A90"
end
if RemotesFolder:FindFirstChild("Screech_") then
local Cutscene = RemoteListener:FindFirstChild("Cutscenes") or RemoteListener:FindFirstChild("Cutscenes_")
Cutscene.Name = "Cutscenes"
RemotesFolder:FindFirstChild("Screech_").Name = "Screech"
end
for _, v in pairs(workspace:GetDescendants()) do
if v:IsA("ProximityPrompt") then
v.MaxActivationDistance = v:GetAttribute("Range") or v.MaxActivationDistance
end
if v.Name == "SeekFloodline" then
v.CanCollide = false
end
end
for _, Prompt in pairs(workspace.CurrentRooms:GetDescendants()) do
if Prompt:IsA("ProximityPrompt") and Prompt:GetAttribute("InfItems") then
RestorePrompt(Prompt)
end
end
for _, v in workspace.CurrentRooms:GetDescendants() do
if v:IsA("BasePart") then
if v:GetAttribute("Mat") then
v.Material = v:GetAttribute("Mat") or "Plastic"
end
end
end
if CollisionClone then
CollisionClone:Destroy()
CollisionClone = nil
end
for _, v in pairs(workspace:GetDescendants()) do
if v:IsA("ProximityPrompt") then
v.RequiresLineOfSight = v:GetAttribute("Clip") or true
end
end
if PathFolder then
PathFolder:Destroy()
end
if LocalPlayer.Character then
LocalPlayer.Character.Humanoid:MoveTo(LocalPlayer.Character.HumanoidRootPart.Position)
LocalPlayer.Character.LowerTorso.Root.C1 = CFrame.new(Vector3.new(0, 0, 0))
end
if LocalPlayer.Character.HumanoidRootPart:FindFirstChild("FlightVelocity") then
LocalPlayer.Character.HumanoidRootPart:FindFirstChild("FlightVelocity"):Destroy()
end
if RemotesFolder:FindFirstChild("Crouch") then
RemotesFolder.Crouch:FireServer(false)
end
if LocalPlayer.Character then
LocalPlayer.Character.Collision.Position = LocalPlayer.Character.HumanoidRootPart.Position
LocalPlayer.Character.Humanoid.HipHeight =2.4
if RemotesFolder.Name ~= "RemotesFolder" then
LocalPlayer.Character.Collision.Position = LocalPlayer.Character.HumanoidRootPart.Position
end
end
if GodmodeFolder then Folder:Destroy()
end
if LocalPlayer.Character then
for _, v in pairs(LocalPlayer.Character:GetChildren()) do
if v.Name ~= "CollisionClone"  and v.Name ~= "Collision" and v.Name ~= "HumanoidRootPart" and v.Name ~= "CollisionPart" then
if v:IsA("BasePart") then
v.Transparency = 0
end
end
end
end
if  ReplicatedStorage:FindFirstChild("LiveModifiers") and ReplicatedStorage:FindFirstChild("LiveModifiers"):FindFirstChild("Jammin") then
local Jam = LocalPlayer.PlayerGui.MainUI.Initiator:FindFirstChild("Main_Game").Health.Jam
Jam.Playing = true
local Jamming = game:GetService("SoundService").Main.Jamming
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
ThemeManager:SetFolder("NovaHub")
end
if SaveManager then
SaveManager:SetLibrary(Library)
SaveManager:IgnoreThemeSettings()
SaveManager:SetIgnoreIndexes({'MenuKeybind'})
SaveManager:SetFolder("NovaHub/DOORSLOBBY")
SaveManager:BuildConfigSection(Tabs['Settings'])
end
if ThemeManager then
ThemeManager:ApplyToTab(Tabs['Settings'])
end
Notify("Successfully Loaded for Game |  DOORS ",4)
end

--==================================================================--
--  IRT | Тело Abysall Continued, перенесённое на базу IRTDoorsBETA
--  Совместимый слой: Linoria-база -> API тела скрипта
--==================================================================--


local LoadStart = tick()

local BaseUrl = "https://raw.githubusercontent.com/therealcookiemonsterof1966/AbysallContinued/main/"

-- Таблица IRT: Environment (функции исполнителя) и ESPLibrary (полный ESP-API)
getgenv().IRT = {
	Legit = true
}
-- Алиас: внешние компоненты (ESP.luau, STX и др.) читают старое имя getgenv().Abysall
getgenv().Abysall = getgenv().IRT

getgenv().IRT.Environment = loadstring(game:HttpGet(BaseUrl .. "Components/Environment.luau"))()
getgenv().IRT.ESPLibrary  = loadstring(game:HttpGet(BaseUrl .. "Components/ESP.luau"))()

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
		if type(Data) == "table" then
			return RealNotify(self, Data.Description or Data.Title or "...", Data.Time or Body or 5)
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
		if type(Icon) == "string" and not Icon:match("^rbxassetid") then
			Icon = nil
		end
		local Ok, Tab = pcall(RealAddTab, self, TabName, Icon)
		if not Ok or not Tab then
			Tab = RealAddTab(self, TabName)
		end
		if not Tab.UpdateWarningBox then
			function Tab:UpdateWarningBox(Warning)
				if type(Warning) ~= "table" then return end
				if not self._IRTWarningBox then
					self._IRTWarningBox = self:AddLeftGroupbox("⚠️ Warning")
					self._IRTWarningLabel = self._IRTWarningBox:AddLabel("")
				end
				local Text = (Warning.Title and (Warning.Title .. ": ") or "") .. (Warning.Text or "")
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

Globals.IncompatibleMessage = "Your executor doesn't support this feature."

Functions.CheckCompatability = function(Array)
	for _, Name in Array do
		if not IRT.Environment[Name] then
			return false
		end
	end
	return true
end



local LocalPlayer = Services.Players.LocalPlayer


local PortraitName = "MirrorRig_Portrait_" .. LocalPlayer.Name


local Entities = {
	["TV_Stand"] = {
		Alias = "Noise_TV",
		NotifyMessage = { Title = "Noise tv spawned.", Body = "Dont get near it" }
	},
	[PortraitName] = {
		Alias = "Portrait",
		NotifyMessage = { Title = "Portrait' has spawned.", Body = "Use him to duplicate items." }
	},
	["StemsEntity"] = {
	    Alias = 'Balls',
		NotifyMessage = { Title = "Balls", Body = "Balls."}
	},
	["NoiseModel"] = {
		Alias = 'Noise',
		NotifyMessage = { Title = "Entity 'Noise' has spawned.", Body = "Dont let it touch you." }
	},
	["Creak"] = {
		Alias = "Creak",
		NotifyMessage = { Title = "Entity 'Creak' has spawned.", Body = "Dont touch him." }
	},
	["DronesStampede"] = {
		Alias = "DronesStampede",
		NotifyMessage = { Title = "Entity 'Drones Stampede' has spawned.", Body = "Find a hiding spot." }
	},
	["TellerRig"] = {
		Alias = "Teller",
		NotifyMessage = { Title = "Entity 'Teller' has spawned.", Body = "Dont worry, hes only annoying." }
	},
	["Scribbles"] = {
		Alias = "Scribbles",
		NotifyMessage = { Title = "Entity 'Scribbles' has spawned.", Body = "Find a hiding spot." }
	},
	["BashMoving"] = {
		Alias = "Bash",
		NotifyMessage = { Title = "Entity 'Bash' has spawned.", Body = "Find a hiding spot."}
	},
	["RushMoving"] = {
		Alias = "Rush",
		NotifyMessage = { Title = "Entity 'Rush' has spawned.", Body = "Find a hiding spot." }
	},
	["AmbushMoving"] = {
		Alias = "Ambush",
		NotifyMessage = { Title = "Entity 'Ambush' has spawned.", Body = "Find a hiding spot." }
	},
	["Eyes"] = {
		Alias = "Eyes",
		NotifyMessage = { Title = "Entity 'Eyes' has spawned.", Body = "Avoid looking at it." }
	},
	["Lookman"] = {
		Alias = "Eyes",
		NotifyMessage = { Title = "Entity 'Eyes' has spawned.", Body = "Avoid looking at it." }
	},
	["BackdoorRush"] = {
		Alias = "Blitz",
		NotifyMessage = { Title = "Entity 'Blitz' has spawned.", Body = "Find a hiding spot." }
	},
	["BackdoorLookman"] = {
		Alias = "Lookman",
		NotifyMessage = { Title = "Entity 'Lookman' has spawned.", Body = "Avoid looking at its eyes." }
	},
	["Groundskeeper"] = {
		Alias = "Groundskeeper",
		NotifyMessage = { Title = "Entity 'Groundskeeper' has spawned.", Body = "Avoid stepping on the grass." }
	},
	["A60"] = {
		Alias = "A-60",
		NotifyMessage = { Title = "Entity 'A-60' has spawned.", Body = "Find a hiding spot." }
	},
	["A120"] = {
		Alias = "A-120",
		NotifyMessage = { Title = "Entity 'A-120' has spawned.", Body = "Find a hiding spot." }
	},
	["GloombatSwarm"] = {
		Alias = "Gloombat Swarm",
		NotifyMessage = { Title = "Entity 'Gloombat Swarm' has spawned.", Body = "Keep all light sources turned off." }
	},
	["GlitchRush"] = {
		Alias = "RNIUSHCG==",
		NotifyMessage = { Title = "Entity 'RNIUSHCG==' has spawned.", Body = "Find a hiding spot." }
	},
	["GlitchAmbush"] = {
		Alias = "AR0xMBUSH",
		NotifyMessage = { Title = "Entity 'AR0xMBUSH' has spawned.", Body = "Find a hiding spot." }
	},
	["MonumentEntity"] = {
		Alias = "Monument",
		NotifyMessage = { Title = "Entity 'Monument' has spawned.", Body = "It can't move while you are looking at it." }
	},
	["JeffTheKiller"] = {
		Alias = "Jeff the Killer",
		NotifyMessage = { Title = "Entity 'Jeff the Killer' has spawned.", Body = "Avoid touching him." }
	},
	["CustomEntity"] = {
		Alias = "Custom Entity",
		NotifyMessage = { Title = "Entity 'Custom Entity' has spawned.", Body = "Find a hiding spot." }
	},
	["FrozenAmbush"] = {
		Alias = "Frozen Ambush",
		NotifyMessage = { Title = "Entity 'Frozen Ambush' has spawned.", Body = "Find a hiding spot." }
	},
	["SallyMoving"] = {
		Alias = "Sally",
		NotifyMessage = { Title = "Entity 'Sally' has spawned.", Body = "Find her horse and rop it." }
	}
}

local EntityIcons = {
	["RushMoving"]      = "rbxassetid://10716032262",
	["AmbushMoving"]    = "rbxassetid://10110576663",
	["A60"]             = "rbxassetid://12571092295",
	["A120"]            = "rbxassetid://12711591665",
	["BackdoorRush"]    = "rbxassetid://16602023490",
	["Eyes"]            = "rbxassetid://10183704772",
	["Lookman"]         = "rbxassetid://10183704772",
	["BackdoorLookman"] = "rbxassetid://16764872677",
	["GloombatSwarm"]   = "rbxassetid://79221203116470",
	["Halt"]            = "rbxassetid://11331795398",
	["JeffTheKiller"]   = "rbxassetid://94479432156278",
	["GlitchRush"]      = "rbxassetid://73859273102919",
	["GlitchAmbush"]    = "rbxassetid://88369678433359",
	["SallyMoving"]     = "rbxassetid://10840888070",
	["MonumentEntity"]  = "rbxassetid://88933556873017",
	["Groundskeeper"]   = "rbxassetid://114991380115557"
}

local ItemNames = {
	["AbrahamHat"]        = "Hat",
	["LargeScrew"]        = "Screw",
	["DinkyLamp"]         = "Lamp",
	["BottleCrate"]       = "18+ Bottles",
	["GweenSodaPack"]     = "Gween Soda Pack",
	["BrokenMonitor"]     = "Broken Monitor",
	["JerryCan"]          = "Jerry Can",
 	["SallyToyObtain"]    = "Sally Toy",
	["Leftovers"]         = "Lunch Box",
	["HoneyPot"]          = "Honey Pot",
	["FihFlakes"]         = "Fih Food",
	["SecretCD"]          = "CD Disc",
	["Pizza"]             = "Pizza",
	["PaperPlanePickup"]  = "Paper Plane",
	["Lighter"]           = "Lighter",
	["Flashlight"]        = "Flashlight",
	["Lockpick"]          = "Lockpicks",
	["Vitamins"]          = "Vitamins",
	["Bandage"]           = "Bandage",
	["StarVial"]          = "Starlight Vial",
	["StarBottle"]        = "Starlight Bottle",
	["StarJug"]           = "Starlight Barrel",
	["Shakelight"]        = "Gummy Flashlight",
	["Straplight"]        = "Straplight",
	["Bulklight"]         = "Spotlight",
	["Battery"]           = "Battery",
	["Candle"]            = "Candle",
	["Crucifix"]          = "Crucifix",
	["CrucifixWall"]      = "Crucifix",
	["Glowsticks"]        = "Glowstick",
	["SkeletonKey"]       = "Skeleton Key",
	["Candy"]             = "Candy",
	["ShieldMini"]        = "Mini Shield Potion",
	["ShieldBig"]         = "Big Shield Potion",
	["BandagePack"]       = "Bandage Pack",
	["BatteryPack"]       = "Battery Pack",
	["RiftCandle"]        = "Moonlight Candle",
	["LaserPointer"]      = "Laser Pointer",
	["HolyGrenade"]       = "Holy Hand Grenade",
	["Shears"]            = "Shears",
	["Smoothie"]          = "Smoothie",
	["Cheese"]            = "Cheese",
	["Bread"]             = "Bread",
	["AlarmClock"]        = "Alarm Clock",
	["RiftSmoothie"]      = "Moonlight Smoothie",
	["GweenSoda"]         = "Gween Soda",
	["GlitchCube"]        = "Glitch Fragment",
	["Scanner"]           = "Tablet",
	["Bomb"]              = "Bomb",
	["Knockbomb"]         = "Knockbomb",
	["Nanner"]            = "Nanner",
	["BigBomb"]           = "Big Bomb",
	["SnakeBox"]          = "Hiding Box",
	["GoldGun"]           = "Golden Gun",
	["StopSign"]          = "Stop Sign",
	["TipJar"]            = "Tip Jar",
	["Lantern"]           = "Lantern",
	["IronKey"]           = "Iron Key",
	["LotusPetal"]        = "Lotus Petal",
	["Compass"]           = "Compass",
	["LotusPetalPickup"]  = "Lotus Petal",
	["LanternLitItem"]    = "Lantern",
	["KeyIron"]           = "Iron Key",
	["IronKeyForCrypt"]   = "Iron Key",
	["LotusHolder"]       = "Lotus Petal",
	["Multitool"]         = "Multitool",
	["RiftJar"]           = "Rift Jar",
	["AloeVera"]          = "Aloe Vera",
	["Donut"]             = "Donut",
	["Lotus"]             = "Lotus",
	["BoxingGloves"]      = "Boxing Gloves"
}

local CutsceneNames = {
    "Figure",
    "FigureEnd",
    "FigureHotelEnd",
    "FigureHotelFire",
    "SeekIntroFools",
    "SeekIntroHotel",
    "SeekIntroMines",
    "SeekIntroMines2",
    "SerewSeekDrain",
    "SewerSeekLower",
    "GrumbleNestEnd",
    "EyestalkIntro",
}

local Character
local Humanoid
local RootPart

local Collision
local CollisionClone
local CollisionPart
local CollisionPartClone

local Camera

local RemotesFolder   = Services.ReplicatedStorage:FindFirstChild("RemotesFolder")
local LiveModifiers   = Services.ReplicatedStorage:FindFirstChild("LiveModifiers")
local FloorReplicated = Services.ReplicatedStorage:FindFirstChild("FloorReplicated")
local CurrentRooms    = Services.Workspace:FindFirstChild("CurrentRooms")
local Drops           = Services.Workspace:FindFirstChild("Drops")
local GameData        = Services.ReplicatedStorage:WaitForChild("GameData")
local Floor           = GameData:WaitForChild("Floor").Value
local LatestRoom      = GameData:WaitForChild("LatestRoom")
local FinishedLoadingRoom = GameData:FindFirstChild("FinishedLoadingRoom")
local RunService = game:GetService("RunService")

if FinishedLoadingRoom then
	FinishedLoadingRoom:Destroy()
end

local function GetHiddenContainer()
	if Functions.CheckCompatability({"gethui"}) then
		return IRT.Environment.gethui()
	end
	return Services.CoreGui
end

local NotificationLibrary = {
	LiveNotifications = 0,
	Notifications = 1
}

local Container = Instance.new("ScreenGui")
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
		local Notification = Instance.new("Frame")
		local Line = Instance.new("Frame")
		local Warning = Instance.new("ImageLabel")
		local UICorner = Instance.new("UICorner")
		local UICorner2 = Instance.new("UICorner")
		local Title = Instance.new("TextLabel")
		local Description = Instance.new("TextLabel")

		Notification.Name = "Notification"
		Notification.Parent = Container
		Notification.BackgroundColor3 = Library.Scheme.BackgroundColor
		Notification.BackgroundTransparency = 0.4
		Notification.BorderSizePixel = 0
		Notification.Position = UDim2.new(1, 5, 0, 60 + (60 * NotificationLibrary.LiveNotifications))
		Notification.Size = UDim2.new(0, 420, 0, 50)
		Notification:SetAttribute("ID", NotificationLibrary.Notifications)
		Notification:SetAttribute("CurrentPosition", Notification.Position)

		Line.Name = "Line"
		Line.Parent = Notification
		Line.BackgroundColor3 = Library.Scheme.AccentColor
		Line.BorderSizePixel = 0
		Line.Position = UDim2.new(0, 0, 1, -3)
		Line.Size = UDim2.new(0, 0, 0, 3)

		Warning.Name = "Warning"
		Warning.Parent = Notification
		Warning.BackgroundTransparency = 1
		Warning.Position = UDim2.new(0, 10, 0, 5)
		Warning.Size = UDim2.new(0, 40, 0, 40)
		Warning.Image = "rbxassetid://3944668821"
		Warning.ImageColor3 = Library.Scheme.AccentColor
		Warning.ScaleType = Enum.ScaleType.Fit

		UICorner.CornerRadius = UDim.new(0, 20)
		UICorner.Parent = Warning

		UICorner2.CornerRadius = UDim.new(0, 4)
		UICorner2.Parent = Notification

		Title.Name = "Title"
		Title.Parent = Notification
		Title.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
		Title.BackgroundTransparency = 1
		Title.Position = UDim2.new(0, 60, 0.155, 0)
		Title.Size = UDim2.new(0, 205, 0, 15)
		Title.Text = TitleText or "..."
		Title.TextColor3 = Library.Scheme.FontColor
		Title.TextSize = 10
		Title.TextStrokeTransparency = 0.75
		Title.TextXAlignment = Enum.TextXAlignment.Left

		Description.Name = "Description"
		Description.Parent = Notification
		Description.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
		Description.BackgroundTransparency = 1
		Description.Position = UDim2.new(0, 60, 0.483, 0)
		Description.Size = UDim2.new(0, 205, 0, 18)
		Description.Text = Desc or "..."
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
		if typeof(Delay) == "Instance" then
			Delay.Destroying:Wait()
		else
			Services.TweenService:Create(
				Line,
				TweenInfo.new(Delay - 0.25, Enum.EasingStyle.Linear),
				{ Size = UDim2.new(0, 400, 0, 3) }
			):Play()
			task.wait(Delay - 0.25)
		end

		Notification:SetAttribute("Destroying", true)

		Services.TweenService:Create(
			Notification,
			TweenInfo.new(0.75, Enum.EasingStyle.Exponential, Enum.EasingDirection.In),
			{ Position = UDim2.new(1, 5, 0, Notification.Position.Y.Offset) }
		):Play()

		NotificationLibrary.LiveNotifications -= 1

		local NotifId = Notification:GetAttribute("ID")
		local NotifY = Notification:GetAttribute("CurrentPosition").Y.Offset

		for _, Object in Container:GetChildren() do
			if Object.Name == "Notification"
				and Object:GetAttribute("ID")
				and Object:GetAttribute("ID") > NotifId
				and Object:GetAttribute("Destroying") ~= true
				and Object.Position.Y.Offset ~= 60
			then
				local NewY = Object:GetAttribute("CurrentPosition").Y.Offset - 60
				Object:SetAttribute("CurrentPosition", UDim2.new(1, -450, 0, NewY))
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
		local Sound = Instance.new("Sound")
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

	local PlayerGui = LocalPlayer:WaitForChild("PlayerGui")
	local UIContainer = PlayerGui:FindFirstChild("GlobalUI") or PlayerGui:FindFirstChild("MainUI")
	if not UIContainer then return end

	local AchievementsHolder = UIContainer:FindFirstChild("AchievementsHolder")
	if not AchievementsHolder then return end

	local Achievement = AchievementsHolder.Achievement:Clone()
	Achievement.Size = UDim2.new(0, 0, 0, 0)
	Achievement.Frame.Position = UDim2.new(1.1, 0, 0, 0)
	Achievement.Name = "LiveAchievement"
	Achievement.Visible = true

	Achievement.Frame.TextLabel.Text = NotifyOptions.Style or "NOTIFICATION"
	Achievement.Frame.Details.Title.Text = NotifyOptions.Title or "Sem Título"
	Achievement.Frame.Details.Desc.Text = NotifyOptions.Description or "Sem Descrição"
	Achievement.Frame.Details.Reason.Text = NotifyOptions.Reason or ""
	Achievement.Frame.ImageLabel.Image = (NotifyOptions.Image ~= "" and NotifyOptions.Image) or "rbxassetid://6023426923"

	local Color = NotifyOptions.Color or Color3.new(1, 1, 1)
	Achievement.Frame.TextLabel.TextColor3 = Color
	Achievement.Frame.UIStroke.Color = Color
	Achievement.Frame.Glow.ImageColor3 = Color
	Achievement.Parent = AchievementsHolder

	PlaySound(AchievementsHolder, "rbxassetid://10469938989", 1)

	task.spawn(function()
		Achievement:TweenSize(UDim2.new(1, 0, 0.2, 0), "In", "Quad", 0.8, true)
		task.wait(0.8)
		Achievement.Frame:TweenPosition(UDim2.new(0, 0, 0, 0), "Out", "Quad", 0.5, true)
		Services.TweenService:Create(
			Achievement.Frame.Glow,
			TweenInfo.new(1, Enum.EasingStyle.Quad, Enum.EasingDirection.In),
			{ ImageTransparency = 1 }
		):Play()

		if typeof(NotifyOptions.Time) == "Instance" then
			NotifyOptions.Time.Destroying:Wait()
		else
			task.wait(NotifyOptions.Time or 5)
		end

		Achievement.Frame:TweenPosition(UDim2.new(1.1, 0, 0, 0), "In", "Quad", 0.5, true)
		task.wait(0.5)
		Achievement:TweenSize(UDim2.new(1, 0, -0.1, 0), "InOut", "Quad", 0.5, true)
		task.wait(0.5)
		Achievement:Destroy()
	end)
end

Globals.STX = loadstring(game:HttpGet("https://raw.githubusercontent.com/bocaj111004/Abysall/refs/heads/main/Components/STX.luau"))()
Functions.Notify = function(Settings)
	local HiddenContainer = GetHiddenContainer()

	if not Settings.Body then
		Settings.Body = "..."
	end

	if not Options.NotifyStyle or Options.NotifyStyle.Value == "IRT" then
		local Sound = Instance.new("Sound", HiddenContainer)
		Sound.SoundId = "rbxassetid://8784885431"
		Sound.Volume = (Toggles.NotifyPlaySound and Toggles.NotifyPlaySound.Value and Options.NotifySoundVolume.Value) or (Toggles.NotifyPlaySound and 0 or 3)
		Sound.PlayOnRemove = true
		Sound:Destroy()
		NotificationLibrary:Notify(Settings.Title, Settings.Body, Settings.Time or 5)
	elseif Options.NotifyStyle.Value == "Doors" then
		local IsEntity = false
		local EntityName = ""
		for Index, Object in pairs(Entities) do
			if Object.NotifyMessage.Title == Settings.Title or Object.NotifyMessage.Body == Settings.Body then
				IsEntity = true
				EntityName = Index
			end
		end
		Globals.DoorsNotify({
			Title = "IRT Hub",
			Description = Settings.Title,
			Reason = Settings.Body,
			Style = IsEntity and "WARNING" or "NOTIFICATION",
			Color = IsEntity and Color3.fromRGB(255, 0, 0) or Color3.fromRGB(255, 222, 189),
			Image = Settings.Image,
			Time = Settings.Time
		})
	elseif Options.NotifyStyle.Value == "STX" then
		local Sound = Instance.new("Sound", HiddenContainer)
		Sound.SoundId = "rbxassetid://4590657391"
		Sound.Volume = (Toggles.NotifyPlaySound and Toggles.NotifyPlaySound.Value and Options.NotifySoundVolume.Value) or (Toggles.NotifyPlaySound and 0 or 3)
		Sound.PlayOnRemove = true
		Sound:Destroy()

		if Settings.Image then
			Globals.STX:Notify(
				{Title = "IRT Hub", Description = Settings.Title .. "\n" .. Settings.Body},
				{OutlineColor = Library.Scheme.AccentColor,Time = Settings.Time or 5, Type = "image"},
				{Image = Settings.Image, ImageColor = Color3.fromRGB(255, 255, 255)}
			)
		else
			Globals.STX:Notify(
				{Title = "IRT Hub", Description = Settings.Title .. "\n" .. Settings.Body},
				{OutlineColor = Library.Scheme.AccentColor,Time = Settings.Time or 5, Type = "default"}
			)
		end
	else
		local Sound = Instance.new("Sound", HiddenContainer)
		Sound.SoundId = "rbxassetid://4590662766"
		Sound.Volume = (Toggles.NotifyPlaySound and Toggles.NotifyPlaySound.Value and Options.NotifySoundVolume.Value) or (Toggles.NotifyPlaySound and 0 or 3)
		Sound.PlayOnRemove = true
		Sound:Destroy()
		Library:OldNotify({ Title = Settings.Title, Description = Settings.Body, Time = Settings.Time })
	end
end

Functions.Caption = function(Text, PlaySound)
	if typeof(PlaySound) ~= "boolean" then
		PlaySound = true
	end
	local CaptionValue = Instance.new("NumberValue")
	local Caption = Globals.MainUI:WaitForChild("MainFrame"):WaitForChild("Caption"):Clone()
	local CaptionSound = Globals.MainUI:WaitForChild("Initiator"):WaitForChild("Main_Game"):WaitForChild("Reminder"):WaitForChild("Caption")
	local CaptionSoundClone = CaptionSound:Clone()
	CaptionSoundClone.Parent = CaptionSound.Parent
	CaptionSoundClone.Volume = 0.1

	Caption.Destroying:Connect(function()
		CaptionValue:Destroy()
	end)

	for _, Child in Globals.MainUI:GetChildren() do
		if Child.Name == "LiveCaption" then
			Child:Destroy()
		end
	end

	Caption.Parent = Globals.MainUI
	Caption.Visible = true
	Caption.Name = "LiveCaption"
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
	local MinutesText = Minutes < 10 and ("0" .. tostring(Minutes)) or tostring(Minutes)
	local SecondsText = Seconds < 10 and ("0" .. tostring(Seconds)) or tostring(Seconds)
	return MinutesText .. ":" .. SecondsText
end

Library.OldNotify = Library.Notify
Library.Notify = function(Data, Body, Time)
	Functions.Notify({ Title = Body, Time = Time or 5 })
end

if not CurrentRooms or not LocalPlayer.Character or not CurrentRooms:FindFirstChildOfClass("Model") then
	Functions.Notify({ Title = "Waiting for the game to load..." })
	while not CurrentRooms or not LocalPlayer.Character or not CurrentRooms:FindFirstChildOfClass("Model") do
		CurrentRooms = Services.Workspace:FindFirstChild("CurrentRooms") or CurrentRooms
		task.wait()
	end
	task.wait(4)
end
RemotesFolder = Services.ReplicatedStorage:FindFirstChild("EntityInfo")
	or Services.ReplicatedStorage:FindFirstChild("Bricks")
	or Services.ReplicatedStorage:FindFirstChild("RemotesFolder")
	or RemotesFolder
LiveModifiers = Services.ReplicatedStorage:FindFirstChild("LiveModifiers") or LiveModifiers
FloorReplicated = Services.ReplicatedStorage:FindFirstChild("FloorReplicated") or FloorReplicated
Drops = Services.Workspace:FindFirstChild("Drops") or Drops
Floor = GameData:WaitForChild("Floor").Value

if not RemotesFolder then
	if Services.ReplicatedStorage:FindFirstChild("EntityInfo") then
		RemotesFolder = Services.ReplicatedStorage:FindFirstChild("EntityInfo")
	elseif Services.ReplicatedStorage:FindFirstChild("Bricks") then
		RemotesFolder = Services.ReplicatedStorage:FindFirstChild("Bricks")
	end
end

if Floor == "Hotel" and RemotesFolder and RemotesFolder.Name == "Bricks" then
	Floor = "OldHotel"
end

if not LiveModifiers then
	LiveModifiers = Instance.new("Folder")
end

if not FloorReplicated then
	FloorReplicated = Instance.new("Folder")
end

local FakeEvents = {
	Screech = Instance.new("RemoteEvent"),
	Shade   = Instance.new("RemoteEvent"),
	A90     = Instance.new("RemoteEvent"),
	Surge   = Instance.new("RemoteEvent"),
}

FakeEvents.Screech.Name  = "Screech"
FakeEvents.Shade.Name    = "ShadeResult"
FakeEvents.A90.Name      = "A90"
FakeEvents.Surge.Name    = "SurgeRemote"

if RemotesFolder then
	FakeEvents.Screech_Real = RemotesFolder:WaitForChild("Screech")
	FakeEvents.Shade_Real   = RemotesFolder:WaitForChild("ShadeResult")
	FakeEvents.A90_Real     = RemotesFolder:FindFirstChild("A90")
	FakeEvents.Surge_Real   = RemotesFolder:FindFirstChild("SurgeRemote")
else
	FakeEvents.Screech_Real = Instance.new("RemoteEvent")
	FakeEvents.Shade_Real   = Instance.new("RemoteEvent")
end

if RemotesFolder and RemotesFolder:FindFirstChild("FootstepRemoteThatWeNeed") then
    local RealRemote = RemotesFolder:FindFirstChild("FootstepRemoteThatWeNeed")
    RealRemote:Destroy()

    local FakeRemote = Instance.new("RemoteEvent", RemotesFolder)
    FakeRemote.Name = "FootstepRemoteThatWeNeed"
end

Globals.FogInstances = {}
Globals.OldFog = Services.Lighting.FogEnd

for _, Object in Services.Lighting:GetChildren() do
	if Object:IsA("Atmosphere") then
		Object:SetAttribute("Density_Old", Object.Density)

		local AtmoConnection = Object:GetPropertyChangedSignal("Density"):Connect(function()
			if Object.Density ~= 0 then
				Object:SetAttribute("Density_Old", Object.Density)
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

Globals.SeekNodesFolder = Instance.new("Folder", Services.Workspace)
Globals.SeekNodesFolder.Name = IRT.ESPLibrary:GenerateRandomString()

Globals.RoomsNodesFolder = Instance.new("Folder", Services.Workspace)
Globals.RoomsNodesFolder.Name = IRT.ESPLibrary:GenerateRandomString()

Functions.SendChat = function(Message)
	local Folder = Services.ReplicatedStorage:FindFirstChild("DefaultChatSystemEvents") or Instance.new("Folder")
	local Event = Folder:FindFirstChild("SayMessageRequest") or Instance.new("RemoteEvent")
	Event:FireServer(Message, "All")
	local Channel = (Services.TextChatService:FindFirstChild("TextChannels") and Services.TextChatService.TextChannels:FindFirstChild("RBXGeneral")) or Instance.new("TextChannel")
	Channel:SendAsync(Message)
end

Functions.IsCrouching = function()
	if Floor == "Fools" or Floor == "OldHotel" then
		return Character:GetAttribute("Crouching")
	end
	return CollisionPart.CollisionGroup == "PlayerCrouching"
end

Functions.GetInjuriesSpeed = function()
	return 0.075 * (Humanoid.MaxHealth - Humanoid.Health)
end

Functions.GetCurrentSpeed = function()
	local Speed = 15
	Speed += Character:GetAttribute("SpeedBoost") or 0
	Speed += Character:GetAttribute("SpeedBoostBehind") or 0
	Speed += Character:GetAttribute("SpeedBoostExtra") or 0
	Speed += (Floor == "Party" and 10 or 0)
	Speed += (LiveModifiers:FindFirstChild("PlayerFast") and 3 or 0)
	Speed += (LiveModifiers:FindFirstChild("PlayerFaster") and 6 or 0)
	Speed += (LiveModifiers:FindFirstChild("PlayerFastest") and 20 or 0)
	Speed -= (LiveModifiers:FindFirstChild("PlayerSlow") and 3 or 0)
	Speed -= (LiveModifiers:FindFirstChild("PlayerSlowHealth") and Functions.GetInjuriesSpeed() or 0)
	if Functions.IsCrouching() then
		if LiveModifiers:FindFirstChild("PlayerCrouchSlow") then
			Speed -= 8
		elseif LiveModifiers:FindFirstChild("PlayerSlow") then
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
	return "Oxygen: " .. (math.floor(Oxygen * 10) / 10) .. "%"
end

Functions.IsHidePersistent = function()
	return Floor == "Mines"
		or Floor == "Ripple"
		or Floor == "Party"
		or LiveModifiers:FindFirstChild("HideLevel2") ~= nil
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
	["RushMoving"]    = 85,
	["Scribbles"]	  = 100,
	["BashMoving"]    = 150,
	["DronesStampede"] = 100,
	["AmbushMoving"]  = 150,
	["A60"]           = 125,
	["A120"]          = 85,
	["GlitchRush"]    = 90,
	["GlitchAmbush"]  = 175,
	["BackdoorRush"]  = 85,
	["CustomEntity"]  = 85,
}

Functions.GetNearestEntity = function(CheckDisabled, List, UseRaycasting)
	local Nearest = { Distance = math.huge, Object = nil }

	for _, Entity in Objects.Entities do
		if not Entity or not Entity:IsA("Model") or not Entity:IsDescendantOf(Services.Workspace) then continue end
		if not EntityDistances[Entity.Name] or not Entity.PrimaryPart then continue end

		local EntityData = Entities[Entity.Name]
		if not EntityData then continue end
		if List and List[EntityData.Alias] then continue end

		local Distance = LocalPlayer:DistanceFromCharacter(Entity.PrimaryPart.Position)
		if Distance < EntityDistances[Entity.Name] and Distance < Nearest.Distance then
			if not CheckDisabled or Entity:GetAttribute("Inactive") ~= true then
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
		if Object:IsA("Model") and Object.PrimaryPart and FigureNames[Object.Name] then
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
	local LastHideSpot = Character:FindFirstChild("LastHideSpot")

	local function IsHidingSpotName(Name)
		if typeof(Name) ~= "string" then return false end
		return string.find(string.lower(Name), "hidingspot") or string.find(string.lower(Name), "hiding_spot")
	end

	local function GetHidePrompt(Object)
	if not Object then return nil end

	local Prompt = Object:FindFirstChild("HidePrompt") or Object:FindFirstChild("HidingPrompt")
	if Prompt then return Prompt end

	for _, Child in Object:GetDescendants() do
		if (Child:IsA("ProximityPrompt") or Child:IsA("InteractPrompt"))
			and (Child.Name == "HidePrompt" or Child.Name == "HidingPrompt" or IsHidingSpotName(Child.Name))
		then
			return Child
		end
	end

	if IsHidingSpotName(Object.Name) or IsHidingSpotName(Object.Parent and Object.Parent.Name) then
		return Object:FindFirstChild("HidePrompt") or Object:FindFirstChild("HidingPrompt")
	end

	return nil
	end

	local function TryObject(Object)
		if not Object or not Object:IsDescendantOf(Services.Workspace) then return end
		if not Object.PrimaryPart and not Object:FindFirstChildOfClass("BasePart") then return end
		local Prompt = GetHidePrompt(Object)
		if not Prompt then return end
		local PrimaryPart = Object.PrimaryPart or Object:FindFirstChildOfClass("BasePart")
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
		if Anchor.Name == "MinesAnchor" and Anchor:FindFirstChild("Sign") then
			if Anchor.Sign.TextLabel.Text == AnchorCode then
				return Anchor
			end
		end
	end
end

Functions.GetMinecart = function()
	return Camera:FindFirstChild("MinecartRig") ~= nil
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

Globals.PromptContainer = Instance.new("Folder")
Globals.PromptContainer.Name = "PromptContainer"
Globals.PromptContainer.Parent = GetHiddenContainer()

local ESPBlacklist = {}

Functions.AddESP = function(ESPOptions, RoomBased)
	local Object = ESPOptions.Object

	if table.find(ESPBlacklist, Object) then
		return
	end

	if RoomBased then
		local CurrentRoom = tonumber(LocalPlayer:GetAttribute("CurrentRoom"))
		local ObjectRoom = tonumber(Object:GetAttribute("ParentRoom"))

		if ObjectRoom == CurrentRoom or (table.find(Objects.Doors, Object) and ObjectRoom == CurrentRoom + 1) then
			IRT.ESPLibrary:AddESP(ESPOptions)
		end

		local RoomConnection = LocalPlayer:GetAttributeChangedSignal("CurrentRoom"):Connect(function()
			if IRT.ESPLibrary.ColorTable[Object] then
				ESPOptions.Color = IRT.ESPLibrary.ColorTable[Object]
			end

			local NewCurrentRoom = tonumber(LocalPlayer:GetAttribute("CurrentRoom"))
			local ObjRoom = tonumber(Object:GetAttribute("ParentRoom"))

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
	if Floor == "Mines" then
		DoorNumber = DoorNumber + 100
	end
	if Floor == "Backdoor" then
		DoorNumber = DoorNumber - 50
	end

	return tostring(DoorNumber)
end

Functions.GetLibraryCode = function()
	local Paper = Character:FindFirstChild("LibraryHintPaper")
		or Character:FindFirstChild("LibraryHintPaperHard")
		or LocalPlayer.Backpack:FindFirstChild("LibraryHintPaper")
		or LocalPlayer.Backpack:FindFirstChild("LibraryHintPaperHard")

	if Paper and Paper:FindFirstChild("UI") then
		local Code = {}
		local CodeLength = Floor == "Fools" and 10 or 5
		for I = 1, CodeLength do Code[I] = "_" end

		local HintChildren = LocalPlayer.PlayerGui.PermUI.Hints:GetChildren()
		local UIChildren = Paper.UI:GetChildren()

		for _, Hint in HintChildren do
			for _, UIChild in UIChildren do
				if Hint:IsA("ImageLabel") and UIChild:IsA("ImageLabel")
					and Hint.ImageRectOffset == UIChild.ImageRectOffset
					and Code[tonumber(UIChild.Name)]
				then
					Code[tonumber(UIChild.Name)] = Hint.TextLabel.Text
				end
			end
		end
		return table.concat(Code)
	end
	return Floor == "Fools" and "__________" or "_____"
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
        NewCode = CodeTemplate:gsub("_", function()
            return tostring(math.random(0, 9))
        end)
        Tries = Tries + 1
    until not Globals.UsedRandomCodes[NewCode] or Tries >= 10

    Globals.UsedRandomCodes[NewCode] = true
    return NewCode
end





-- IRT.Interface.ApplyInfoTab — используется база (Game/Settings на Linoria)

local Tabs = {
Player = Window:AddTab("Player", "house"),
	Exploits = Window:AddTab("Exploits", "shield"),
	Visuals = Window:AddTab("Visuals", "eye"),
	Floors = Window:AddTab("Floors", "earth"),


}


Groupboxes.General_Character = Tabs.Player:AddLeftGroupbox("Character")
Groupboxes.General_Character:AddSlider("SpeedBoostSlider", {
	Text = "Speed Boost", Min = 0, Max = 100, Default = 0, Rounding = 0, Compact = true
})
Groupboxes.General_Character:AddToggle("SpeedBoostToggle", {
	Text = "Enable Speed Boost", Default = false, Tooltip = "Increases your walkspeed by the specified amount."
})
Groupboxes.General_Character:AddToggle("FlyToggle", {
	Text = "Fly", Default = false, Tooltip = "Allows you to freely fly around the map."
})
Toggles.FlyToggle:AddKeyPicker("FlyKeybind", {
	Text = "Fly", Default = "F", Mode = "Toggle", SyncToggleState = true
})
Groupboxes.General_Character:AddSlider("FlySpeed", {
	Text = "Fly Speed", Min = 0, Max = 115, Default = 20, Rounding = 0, Compact = true
})
Groupboxes.General_Character:AddDivider()
Groupboxes.General_Character:AddToggle("NoclipToggle", {
	Text = "Noclip", Default = false, Tooltip = "Allows your character to pass through solid objects."
})
Groupboxes.General_Character:AddToggle("RemoveClosetDelay", {
	Text = "Remove Closet Delay", Default = false,
	Tooltip = "Removes the short window where you can't exit out of a closet after the animation finishes."
})
Groupboxes.General_Character:AddToggle("RemoveAcceleration", {
	Text = "Remove Acceleration", Default = false, Tooltip = "Prevents your character from sliding while moving."
})

local CustomPhysics

Options.SpeedBoostSlider:OnChanged(function(Value)
	if RemotesFolder:FindFirstChild("Crouch") then
		RemotesFolder.Crouch:FireServer(Value and true or Functions.IsCrouching(), true)
	end
end)

Toggles.NoclipToggle:AddKeyPicker("NoclipKeybind2", {
	Text = "Noclip", Default = "N", Mode = "Toggle", SyncToggleState = true
})
Toggles.RemoveAcceleration:OnChanged(function(Value)
	for Index, Old in PartProperties do
		Index.CustomPhysicalProperties = Value and CustomPhysics or Old
	end
end)

Groupboxes.General_Character:AddDivider()
Groupboxes.General_Character:AddToggle("EnableCharacterJump", {
	Text = "Enable Jumping", Default = false, Tooltip = "Allows your character to jump."
})
Groupboxes.General_Character:AddToggle("EnableCharacterSlide", {
	Text = "Enable Sliding", Default = false, Tooltip = "Allows your character to slide."
})
Groupboxes.General_Character:AddToggle("InfiniteJumps", {
	Text = "Infinite Jumps", Default = false, Tooltip = "Allows you to jump while in the air."
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
		Character:SetAttribute("CanJump", Value and true or OldJump)
	end
end)
Toggles.EnableCharacterSlide:OnChanged(function(Value)
	if Character then
		Character:SetAttribute("CanSlide", Value and true or OldSlide)
	end
end)

Groupboxes.General_Self = Tabs.Player:AddLeftGroupbox("Self")
Groupboxes.General_Self:AddToggle("DoorReachToggle", {
	Text = "Door Reach", Default = false, Tooltip = "Allows you to open doors from further away."
})
Groupboxes.General_Self:AddToggle("DisableIdleKick", {
	Text = "Disable Idle Kick", Default = false, Tooltip = "Prevents the kick from being idle for 20 minutes."
})
Toggles.DisableIdleKick:OnChanged(function(Value)
	if Functions.CheckCompatability({"getconnections"}) then
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
Groupboxes.General_Self:AddSlider("PromptReachSlider", {
	Text = "Prompt Reach Multiplier", Min = 1, Max = 2, Default = 1, Rounding = 1, Compact = true
})
Groupboxes.General_Self:AddToggle("InstantPrompts", {
	Text = "Instant Prompts", Default = false, Tooltip = "Allows you to trigger all prompts instantly."
})
Groupboxes.General_Self:AddToggle("PromptClip", {
	Text = "Prompt Clip", Default = false, Tooltip = "Allows you to interact with prompts through walls."
})

Options.PromptReachSlider:OnChanged(function(Value)
	for _, Prompt in Objects.Prompts do
		Prompt.MaxActivationDistance = Prompt:GetAttribute("MaxActivationDistance_Old") * Value
	end
end)
Toggles.InstantPrompts:OnChanged(function(Value)
	for _, Prompt in Objects.Prompts do
		Prompt.HoldDuration = Value and 0 or Prompt:GetAttribute("HoldDuration_Old")
	end
end)
Toggles.PromptClip:OnChanged(function(Value)
	for _, Prompt in Objects.Prompts do
		Prompt.RequiresLineOfSight = Value and false or Prompt:GetAttribute("RequiresLineOfSight_Old")
	end
end)

Groupboxes.Self_Automation = Tabs.Player:AddRightGroupbox("Automation")
Groupboxes.Self_Automation:AddToggle("AutoBreakerBox", {
	Text = "Auto Breaker Box", Default = false, Tooltip = "Automatically solves the breaker box."
})
Groupboxes.Self_Automation:AddToggle("AutoSolveAnchors", {
	Text = "Auto Solve Anchors", Default = false,
	Tooltip = "Automatically enters the correct code into anchors when you are near them."
})
Toggles.AutoBreakerBox:OnChanged(function(Value)
	if Value and CurrentRooms:FindFirstChild("ElevatorBreaker", true) then
		if not Globals.BreakerBoxInteracted then
			if not Globals.BreakerBoxNotified then
				Functions.Notify({ Title = "Interact with the breaker box.", Body = "It will be automatically solved." })
				Globals.BreakerBoxInteracted = true
			end
		else
			RemotesFolder.EBF:FireServer()
		end
	end
end)

Groupboxes.Self_Automation:AddToggle("AutoHeartbeatMinigame", { Text = "Auto Heartbeat Minigame", Default = false, Tooltip = "Prevents the 'Figure' minigame from ever failing.", Disabled = not Functions.CheckCompatability({"hookmetamethod", "newcclosure", "getnamecallmethod"}), DisabledTooltip = Globals.IncompatibleMessage })
Groupboxes.Self_Automation:AddDivider()
Groupboxes.Self_Automation:AddToggle("AutoUnlockPadlockToggle", {
	Text = "Auto Unlock Padlock", Default = false, Tooltip = "Automatically enters the code into the library padlock."
})
Groupboxes.Self_Automation:AddSlider("AutoUnlockPadlockSlider", {
	Text = "Unlock Distance", Min = 1, Max = 50, Default = 10, Rounding = 0, Compact = true
})
Groupboxes.Self_Automation:AddToggle("AutoLibraryGuessCode", {
	Text = "Guess Library Code", Default = false,
	Tooltip = "Attempts to guess the library code, but collecting some books is also necessary."
})
Groupboxes.Self_Automation:AddDivider()
Groupboxes.Self_Automation:AddToggle("AutoLibrary", {
	Text = "Auto Library", Default = false,
	Tooltip = "Automatically gets books and paper."
})
Groupboxes.Self_Automation:AddToggle("SkipSeekHotel", {
	Text = "Skip Seek (Hotel)",
	Default = false,
	Tooltip = "Skips the entire Seek sections.",
})
Groupboxes.Self_Automation:AddToggle("AutoBreakerRoom", {
	Text = "Auto Breaker Room",
	Default = false,
	Tooltip = "Automatically completes the breaker sequence in Hotel Room 100.",
})
Groupboxes.Self_Automation:AddDivider()
Toggles.AutoHotel = Groupboxes.Self_Automation:AddToggle("AutoHotel", {
	Text = "Auto Hotel",
	Tooltip = "Automatically progresses through the hotel floor.",
	Risky = Floor ~= "Ballz",
	Default = false
})
Toggles.AutoHotelIgnoreEntities = Groupboxes.Self_Automation:AddToggle("AutoHotelIgnoreEntities", {
	Text = "Ignore Entities",
	Tooltip = "Skip all entity waits and pauses.",
	Default = false
})
Groupboxes.Self_Automation:AddSlider("AutoHotelRoomProcess", {
	Text = "Room Process Delay",
	Default = 0.5,
	Min = 0,
	Max = 5,
	Rounding = 1,
	Compact = false
})
Groupboxes.Self_Automation:AddDivider()
Groupboxes.Self_Automation:AddToggle("AutoInteractToggle", {
	Text = "Auto Interact", Default = false, Tooltip = "Automatically triggers nearby prompts."
})
Toggles.AutoInteractToggle:AddKeyPicker("AutoInteractKeybind2", {
    Text = "Auto Interact",
    Default = "R",
    Mode = "Toggle",
    SyncToggleState = true
})
Groupboxes.Self_Automation:AddDropdown("AutoInteractIgnoreList", {
	Text = "Ignore List",
	Values = { "Glitch Fragments", "Jeff Items", "Dropped Items", "Currency", "Minecarts", "Locks" },
	Default = { "Glitch Fragments", "Jeff Items", "Dropped Items" },
	Multi = true, AllowNull = true
})
Groupboxes.Self_Automation:AddDivider()
Groupboxes.Self_Automation:AddToggle("AutoClosetToggle", {
	Text = "Auto Closet", Default = false,
	Tooltip = "Automatically hides in a nearby closet when an entity is near."
})
Toggles.AutoClosetToggle:AddKeyPicker("AutoClosetKeybind", {
	Text = "Auto Closet", Default = "Q", Mode = "Toggle", SyncToggleState = true
})
Groupboxes.Self_Automation:AddDropdown("AutoClosetEntityList", {
	Text = "Ignore List",
	Values = { "Rush", "Ambush", "Blitz", "DronesStampede", "Scribbles", "A-60", "A-120", "AR0xMBUSH", "RNIUSHCG==" },
	Multi = true, AllowNull = true
})
Groupboxes.Self_Automation:AddToggle("SpectateEntityToggle", {
	Text = "Spectate Entity",
	Default = false,
	Tooltip = "Spectates the entity while auto hiding."
})
Groupboxes.Self_Automation:AddDropdown("SpecateEntityMode", {
	Values = {"Player to Entity", "Entity to Player"},
	Default = 1,
	AllowNull = true
})

Groupboxes.Self_Misc = Tabs.Player:AddRightGroupbox("Miscellaneous")
Groupboxes.Self_Misc:AddButton({
	Text = "Play Again", Tooltip = "Makes you join a new run, click again to cancel.", DoubleClick = true,
	Func = function() RemotesFolder.PlayAgain:FireServer() end
})
Groupboxes.Self_Misc:AddButton({
	Text = "Return to Lobby", Tooltip = "Makes you teleport back to the lobby.", DoubleClick = true,
	Func = function() RemotesFolder.Lobby:FireServer() end
})
Groupboxes.Self_Misc:AddButton({
	Text = "Revive",
	Tooltip = "Makes you revive, if you have a revive and haven't already revived in this run.",
	DoubleClick = true,
	Func = function() RemotesFolder.Revive:FireServer() end
})
Groupboxes.Self_Misc:AddButton({
	Text = "Reset Character",
	Tooltip = "Kills your character on the server. (takes around 20 seconds if replicatesignal isn't supported)",
	DoubleClick = true,
	Func = function()
		Globals.SelfKilled = true
		if Functions.CheckCompatability({"replicatesignal"}) then
			IRT.Environment.replicatesignal(LocalPlayer.Kill)
		else
			if RemotesFolder:FindFirstChild("Underwater") then
				RemotesFolder.Underwater:FireServer(true)
			else
				Humanoid.Health = 0
			end
		end
	end
})


Tabs.Player:UpdateWarningBox({
	Visible = true,
	Title = "Risk Warning",
	Text = "Features highlighted in red are risky.",
})


Toggles.SkipSeekHotel:OnChanged(function(Value)
	if not Value then return end
	if Floor ~= "Hotel" then return end

	task.spawn(function()
		print("started")

		local currentRooms

		repeat
			if not Toggles.SkipSeekHotel.Value or Floor ~= "Hotel" then
				return
			end
			currentRooms = workspace:FindFirstChild("CurrentRooms")
			task.wait()
		until currentRooms

		print("got currentrooms")

		local lastTriggerRoom = nil

		while Toggles.SkipSeekHotel.Value and Floor == "Hotel" do
			local triggerRoom = nil

			print("waiting for trigger")

			repeat
				if not Toggles.SkipSeekHotel.Value or Floor ~= "Hotel" then
					return
				end

				currentRooms = workspace:FindFirstChild("CurrentRooms")
				local currentRoomNum = tonumber(LocalPlayer:GetAttribute("CurrentRoom"))

				if currentRoomNum and currentRoomNum ~= lastTriggerRoom then
					local room = currentRooms and currentRooms:FindFirstChild(tostring(currentRoomNum))
					if room then
						local trigger = room:WaitForChild("TriggerEventCollision", 0.5)
						if trigger then
							triggerRoom = currentRoomNum
							print("found trigger in", triggerRoom)
						end
					end
				end

				task.wait()
			until triggerRoom

			lastTriggerRoom = triggerRoom

			local roomNum = triggerRoom

			while Toggles.SkipSeekHotel.Value and Floor == "Hotel" do
				roomNum += 1
				print("looking for room", roomNum)

				local room
				repeat
					if not Toggles.SkipSeekHotel.Value or Floor ~= "Hotel" then
						return
					end
					currentRooms = workspace:FindFirstChild("CurrentRooms")
					room = currentRooms and currentRooms:FindFirstChild(tostring(roomNum))
					task.wait()
				until room

				print("found room", roomNum)

				local hasSeekArm = false
				local assets = room:FindFirstChild("Assets")
				if assets then
					for _, child in ipairs(assets:GetChildren()) do
						if child.Name == "Seek_Arm" then
							hasSeekArm = true
							print("found seek arm")
							break
						end
					end
				end

				local door
				repeat
					if not Toggles.SkipSeekHotel.Value or Floor ~= "Hotel" then
						return
					end
					door = room:FindFirstChild("Door", true)
					task.wait()
				until door

				print("found door, teleporting")

				repeat
					if not Toggles.SkipSeekHotel.Value or Floor ~= "Hotel" then
						return
					end
					if Character then
						Character:PivotTo(door:GetPivot())
					end
					task.wait()
				until door:GetAttribute("Opened") == true

				print("door opened")

				if hasSeekArm then
					if not Character then
						return
					end

					print("voiding")

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

					print("done voiding")
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
		local AutoLibraryPlayers = game:GetService("Players")
		local AutoLibraryLocalPlayer = AutoLibraryPlayers.LocalPlayer
		local AutoLibraryCharacter = AutoLibraryLocalPlayer.Character or AutoLibraryLocalPlayer.CharacterAdded:Wait()
		local AutoLibraryHumanoidRootPart = AutoLibraryCharacter:WaitForChild("HumanoidRootPart")

		local AutoLibraryCurrentRooms = workspace:WaitForChild("CurrentRooms")
		local AutoLibraryRoom50 = AutoLibraryCurrentRooms:WaitForChild("50")
		local AutoLibraryLiveHintBooks = {}
		local AutoLibraryHintPaperObtained = false

		local function AutoLibraryIsInRoom50(AutoLibraryObject)
			return AutoLibraryObject
				and AutoLibraryObject:IsDescendantOf(AutoLibraryRoom50)
				and AutoLibraryObject:IsDescendantOf(AutoLibraryCurrentRooms)
				and AutoLibraryObject:IsDescendantOf(workspace)
		end

		local function AutoLibraryIsActuallyInRoom50()
			return tonumber(AutoLibraryLocalPlayer:GetAttribute("CurrentRoom")) == 50
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

			local AutoLibraryBackpackPaper = AutoLibraryLocalPlayer.Backpack:FindFirstChild("LibraryHintPaper", true)
			local AutoLibraryCharacterPaper = AutoLibraryCharacter:FindFirstChild("LibraryHintPaper", true)

			return AutoLibraryBackpackPaper ~= nil or AutoLibraryCharacterPaper ~= nil
		end

		local function AutoLibraryGetObjectCFrame(AutoLibraryObject)
			if not AutoLibraryIsActuallyInRoom50() then
				return nil
			end

			if not AutoLibraryIsInRoom50(AutoLibraryObject) then
				return nil
			end

			if AutoLibraryObject:IsA("Model") then
				return AutoLibraryObject:GetPivot()
			elseif AutoLibraryObject:IsA("BasePart") then
				return AutoLibraryObject.CFrame
			end

			local AutoLibraryObjectPart = AutoLibraryObject:FindFirstChildWhichIsA("BasePart", true)

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

			if AutoLibraryObject.Name == "LiveHintBook" then
				if not table.find(AutoLibraryLiveHintBooks, AutoLibraryObject) then
					table.insert(AutoLibraryLiveHintBooks, AutoLibraryObject)
				end
			end

			for _, AutoLibraryDescendant in ipairs(AutoLibraryObject:GetDescendants()) do
				if AutoLibraryDescendant.Name == "LiveHintBook"
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

			if AutoLibraryDescendant.Name == "LiveHintBook"
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

				if AutoLibraryDescendant.Name == "LiveHintBook"
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
					AutoLibraryHumanoidRootPart = AutoLibraryCharacter:FindFirstChild("HumanoidRootPart")

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
						if AutoLibraryPromptDescendant:IsA("ProximityPrompt")
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

			local AutoLibraryHintPaper = AutoLibraryRoom50:FindFirstChild("LibraryHintPaper", true)

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
					AutoLibraryHumanoidRootPart = AutoLibraryCharacter:FindFirstChild("HumanoidRootPart")

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
						if AutoLibraryPromptDescendant:IsA("ProximityPrompt")
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
		local AutoBreakerRoomPlayers = game:GetService("Players")
		local AutoBreakerRoomCurrentRooms = workspace:WaitForChild("CurrentRooms")
		local AutoBreakerRoom100 = AutoBreakerRoomCurrentRooms:WaitForChild("100")

		local function AutoBreakerRoomIsActuallyInRoom100()
			return tonumber(AutoBreakerRoomPlayers.LocalPlayer:GetAttribute("CurrentRoom")) == 100
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

			if AutoBreakerRoomObject:IsA("Model") then
				return AutoBreakerRoomObject:GetPivot()
			elseif AutoBreakerRoomObject:IsA("BasePart") then
				return AutoBreakerRoomObject.CFrame
			end

			local AutoBreakerRoomPart = AutoBreakerRoomObject:FindFirstChildWhichIsA("BasePart", true)
			return AutoBreakerRoomPart and AutoBreakerRoomPart.CFrame
		end
		local function AutoBreakerRoomGetHRP()
			local AutoBreakerRoomCharacter = AutoBreakerRoomPlayers.LocalPlayer.Character
			return AutoBreakerRoomCharacter and AutoBreakerRoomCharacter:FindFirstChild("HumanoidRootPart")
		end

		local function AutoBreakerRoomActivate(AutoBreakerRoomObject)
			if not AutoBreakerRoomObject then
				return
			end

			if AutoBreakerRoomObject:IsA("ProximityPrompt") then
				fireproximityprompt(AutoBreakerRoomObject)
				return
			end

			for _, AutoBreakerRoomDescendant in ipairs(AutoBreakerRoomObject:GetDescendants()) do
				if AutoBreakerRoomDescendant:IsA("ProximityPrompt") then
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
					if AutoBreakerRoomDescendant.Name == "LiveBreakerPolePickup" and AutoBreakerRoomIsInRoom100(AutoBreakerRoomDescendant) then
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

			local AutoBreakerRoomIndustrialGate = AutoBreakerRoom100:FindFirstChild("IndustrialGate")
			local AutoBreakerRoomBox = AutoBreakerRoomIndustrialGate and AutoBreakerRoomIndustrialGate:FindFirstChild("Box")
			local AutoBreakerRoomLever = AutoBreakerRoomBox and AutoBreakerRoomBox:FindFirstChild("Lever")
			local AutoBreakerRoomActivateEventPrompt = AutoBreakerRoomBox and AutoBreakerRoomBox:FindFirstChild("ActivateEventPrompt")

			if AutoBreakerRoomActivateEventPrompt and AutoBreakerRoomLever then
				local function AutoBreakerRoomGetLeverCFrame()
					if AutoBreakerRoomLever:IsA("Model") then
						return AutoBreakerRoomLever:GetPivot()
					elseif AutoBreakerRoomLever:IsA("BasePart") then
						return AutoBreakerRoomLever.CFrame
					end
					local AutoBreakerRoomPart = AutoBreakerRoomLever:FindFirstChildWhichIsA("BasePart", true)
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

			local AutoBreakerRoomElevatorBreakerEmpty = AutoBreakerRoom100:FindFirstChild("ElevatorBreakerEmpty")
			if not AutoBreakerRoomElevatorBreakerEmpty then
				continue
			end

			local AutoBreakerRoomBreakerPrompt = AutoBreakerRoomElevatorBreakerEmpty:FindFirstChild("Prompt")
			if not AutoBreakerRoomBreakerPrompt then
				continue
			end

			local AutoBreakerRoomBreakerOffset = CFrame.new(0, -1.8, 0)

			while AutoBreakerRoomEnabled and AutoBreakerRoomIsActuallyInRoom100() do
				if AutoBreakerRoomElevatorBreakerEmpty:FindFirstChild("BreakerSwitchInBox") then
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

			local AutoBreakerRoomElevatorCar = AutoBreakerRoom100:FindFirstChild("ElevatorCar")
			local AutoBreakerRoomWeb = AutoBreakerRoomElevatorCar and AutoBreakerRoomElevatorCar:FindFirstChild("Web", true)

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
	["RushMoving"] = true,
	["Scribbles"] = true,
	["BashMoving"] = true,
	["DronesStampede"] = true,
	["AmbushMoving"] = true,
	["A60"] = true,
	["A120"] = true,
	["GlitchRush"] = true,
	["GlitchAmbush"] = true,
	["BackdoorRush"] = true,
	["CustomEntity"] = true,
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

	local AutoHotelGameData = game:GetService("ReplicatedStorage"):FindFirstChild("GameData")
	if not AutoHotelGameData then return nil, nil end

	local AutoHotelLatestRoom = AutoHotelGameData:FindFirstChild("LatestRoom")
	if not AutoHotelLatestRoom then return nil, nil end

	local AutoHotelStartRoom = AutoHotelLatestRoom.Value
	local AutoHotelBestDoor, AutoHotelBestNumber = nil, math.huge
	local AutoHotelCurrentRooms = workspace:FindFirstChild("CurrentRooms")

	if AutoHotelCurrentRooms then
		for _, AutoHotelRoom in ipairs(AutoHotelCurrentRooms:GetChildren()) do
			local AutoHotelRoomNum = tonumber(AutoHotelRoom.Name)
			if AutoHotelRoomNum and AutoHotelRoomNum ~= 100 and AutoHotelRoomNum >= AutoHotelStartRoom and AutoHotelRoomNum < AutoHotelBestNumber then
				local AutoHotelDoor = AutoHotelRoom:FindFirstChild("Door")
				if AutoHotelDoor and AutoHotelDoor:IsA("Model") then
					local AutoHotelOpenAttr = AutoHotelDoor:GetAttribute("Open")
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
			if AutoHotelChild.Name == "KeyObtain" then
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
	local AutoHotelCurrentRooms = workspace:FindFirstChild("CurrentRooms")
	if not AutoHotelCurrentRooms then return false end

	local AutoHotelRoom = AutoHotelCurrentRooms:FindFirstChild(tostring(AutoHotelRoomNum))
	if not AutoHotelRoom then return false end

	local AutoHotelDoor = AutoHotelRoom:FindFirstChild("Door")
	if not AutoHotelDoor or not AutoHotelDoor:FindFirstChild("Lock") then
		return false
	end

	local AutoHotelKeyObtain = AutoHotelFindKeyObtain(AutoHotelRoom)
	if not AutoHotelKeyObtain then return false end

	local AutoHotelStart = tick()
	while tick() - AutoHotelStart < 12 do
		if LocalPlayer.Backpack:FindFirstChild("Key") or (Character and Character:FindFirstChild("Key")) then
			return true
		end

		if Character then
			Character:PivotTo(AutoHotelKeyObtain:GetPivot())
		end

		for _, AutoHotelDesc in ipairs(AutoHotelKeyObtain:GetDescendants()) do
			if AutoHotelDesc:IsA("ProximityPrompt") then
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
	local AutoHotelCurrentRooms = workspace:WaitForChild("CurrentRooms")
	local AutoHotelRoom50 = AutoHotelCurrentRooms:WaitForChild("50")
	local AutoHotelLiveHintBooks = {}
	local AutoHotelHintPaperObtained = false

	local function AutoHotelIsInRoom50(AutoHotelObj)
		return AutoHotelObj and AutoHotelObj:IsDescendantOf(AutoHotelRoom50)
	end

	local function AutoHotelIsActuallyInRoom50()
		return tonumber(LocalPlayer:GetAttribute("CurrentRoom")) == 50
	end

	while Toggles.AutoHotel.Value and not AutoHotelIsActuallyInRoom50() do
		task.wait(0.1)
	end
	if not Toggles.AutoHotel.Value then return end

	AutoHotelWaitForEntities(5)

	local function AutoHotelHasHintPaper()
		local AutoHotelChar = LocalPlayer.Character
		if not AutoHotelChar then return false end
		return LocalPlayer.Backpack:FindFirstChild("LibraryHintPaper", true) or AutoHotelChar:FindFirstChild("LibraryHintPaper", true)
	end

	local function AutoHotelGetCFrame(AutoHotelObj)
		if not AutoHotelIsActuallyInRoom50() or not AutoHotelIsInRoom50(AutoHotelObj) then return nil end
		if AutoHotelObj:IsA("Model") then return AutoHotelObj:GetPivot() end
		if AutoHotelObj:IsA("BasePart") then return AutoHotelObj.CFrame end
		local AutoHotelPart = AutoHotelObj:FindFirstChildWhichIsA("BasePart", true)
		return AutoHotelPart and AutoHotelPart.CFrame
	end

	local function AutoHotelCollectBooks()
		for _, AutoHotelDesc in ipairs(AutoHotelRoom50:GetDescendants()) do
			if AutoHotelDesc.Name == "LiveHintBook" and AutoHotelIsInRoom50(AutoHotelDesc) and not table.find(AutoHotelLiveHintBooks, AutoHotelDesc) then
				table.insert(AutoHotelLiveHintBooks, AutoHotelDesc)
			end
		end
	end

	AutoHotelCollectBooks()

	AutoHotelLibraryRoomConnection = AutoHotelRoom50.DescendantAdded:Connect(function(AutoHotelAdded)
		if Toggles.AutoHotel.Value and AutoHotelIsActuallyInRoom50() and AutoHotelIsInRoom50(AutoHotelAdded) then
			if AutoHotelAdded.Name == "LiveHintBook" and not table.find(AutoHotelLiveHintBooks, AutoHotelAdded) then
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
				local AutoHotelHRP = AutoHotelChar:FindFirstChild("HumanoidRootPart")
				if not AutoHotelHRP then
					task.wait()
					continue
				end

				local AutoHotelCF = AutoHotelGetCFrame(AutoHotelBook)
				if AutoHotelCF then
					AutoHotelHRP.CFrame = AutoHotelCF
				end

				for _, AutoHotelPrompt in ipairs(AutoHotelBook:GetDescendants()) do
					if AutoHotelPrompt:IsA("ProximityPrompt") then
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

		local AutoHotelPaper = AutoHotelRoom50:FindFirstChild("LibraryHintPaper", true)
		if AutoHotelPaper and AutoHotelIsInRoom50(AutoHotelPaper) then
			while Toggles.AutoHotel.Value and AutoHotelIsActuallyInRoom50() and not AutoHotelHintPaperObtained and AutoHotelPaper.Parent do
				if AutoHotelHasHintPaper() then
					AutoHotelHintPaperObtained = true
					break
				end

				local AutoHotelChar = LocalPlayer.Character or LocalPlayer.CharacterAdded:Wait()
				local AutoHotelHRP = AutoHotelChar:FindFirstChild("HumanoidRootPart")
				if AutoHotelHRP then
					local AutoHotelCF = AutoHotelGetCFrame(AutoHotelPaper)
					if AutoHotelCF then
						AutoHotelHRP.CFrame = AutoHotelCF * CFrame.new(0, 5, 0)
					end
				end

				for _, AutoHotelPrompt in ipairs(AutoHotelPaper:GetDescendants()) do
					if AutoHotelPrompt:IsA("ProximityPrompt") then
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
		local AutoHotelCurrentRooms = workspace:FindFirstChild("CurrentRooms")
		if not AutoHotelCurrentRooms then
			task.wait(0.2)
			continue
		end

		local TriggerRoomNum = nil

		for _, Room in ipairs(AutoHotelCurrentRooms:GetChildren()) do
			local Num = tonumber(Room.Name)
			if Num and Num ~= AutoHotelLastTriggerRoom then
				local Trigger = Room:FindFirstChild("TriggerEventCollision")
					or Room:FindFirstChild("TriggerEventCollision", true)

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

	local AutoHotelCurrentRooms = workspace:FindFirstChild("CurrentRooms")
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


Groupboxes.Debug = Tabs.Player:AddRightGroupbox("Debug")
Groupboxes.Debug:AddButton({
	Text = "Ladder Softlock Fix",
	Tooltip = "Ladder Softlock Fix.",
	Func = function()
   		LocalPlayer:SetAttribute("Climbing", false)
	end
})
Groupboxes.Debug:AddButton({
	Text = "Get Current Floor",
	Tooltip = "Prints the current floor to the console.",
	Func = function()
		print("Current Floor:", GameData:WaitForChild("Floor").Value)
	end
})
Groupboxes.Debug:AddButton({
	Text = "Get Current Room",
	Tooltip = "Prints the current room number to the console.",
	Func = function()
		print("Current Room:", LocalPlayer:GetAttribute("CurrentRoom"))
	end
})
Groupboxes.Debug:AddButton({
	Text = "Void",
	Tooltip = "Teleports your character to Y -120.",
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
	Text = "Death",
	Tooltip = "Death",
	Func = function()
		Globals.Deathing = true
		LocalPlayer.Character.Humanoid.Health = 0
	end
})
Groupboxes.Debug:AddButton({
	Text = "Exit Closet",
	Tooltip = "Exits the current closet.",
	Func = function()
		if RemotesFolder and RemotesFolder:FindFirstChild("CamLock") then
			RemotesFolder.CamLock:FireServer()
		end
	end
})
local TpNextDoorConnection

local function getNextClosedDoor()
	if not Character then return nil end

	local GameData = game:GetService("ReplicatedStorage"):FindFirstChild("GameData")
	if not GameData then return nil end

	local LatestRoom = GameData:FindFirstChild("LatestRoom")
	if not LatestRoom then return nil end

	local startRoom = LatestRoom.Value
	local bestDoor = nil
	local bestNumber = math.huge

	for _, obj in ipairs(workspace:GetDescendants()) do
		if obj.Name == "Door" and obj:IsA("Model") then
			local openAttr = obj:GetAttribute("Open")
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
	Text = "Tp Next Door",
	Tooltip = "Teleports you to the next sequential unopened door.",
	Func = function()
		local door = getNextClosedDoor()
		if door then
			Character:PivotTo(door:GetPivot() * CFrame.new(0, -1, 0))
		end
	end
})

Toggles.TpNextDoor = Groupboxes.Debug:AddToggle("TpNextDoor", {
	Text = "Auto Tp Next Door",
	Tooltip = "Continuously teleports you to the next sequential unopened door.",
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


Groupboxes.Exploits_Bypass = Tabs.Exploits:AddLeftGroupbox("Bypass / Solve")

Groupboxes.Exploits_Bypass:AddToggle("BypassGiggle",         { Text = "Bypass Giggle",           Default = false, Tooltip = "Prevents 'Giggle' from attacking you." })
Groupboxes.Exploits_Bypass:AddToggle("BypassDupe",           { Text = "Bypass Dupe",             Default = false, Tooltip = "Prevents you from open 'Dupe' fake doors." })
Groupboxes.Exploits_Bypass:AddToggle("BypassEyes",           { Text = "Bypass Eyes",             Default = false, Tooltip = "Prevents 'Eyes' from hurting you." })
Groupboxes.Exploits_Bypass:AddToggle("BypassLookman",        { Text = "Bypass Lookman",          Default = false, Tooltip = "Prevents 'Lookman' from hurting you." })
Groupboxes.Exploits_Bypass:AddToggle("BypassGloombatEggs",   { Text = "Bypass Gloombat Eggs",    Default = false, Tooltip = "Prevents taking damage from stepping on 'Gloombat' eggs." })
Groupboxes.Exploits_Bypass:AddToggle("BypassSeekObstructions", { Text = "Bypass Seek Obstructions", Default = false, Tooltip = "Prevents obstacles in the 'Seek' chase from harming you." })
Groupboxes.Exploits_Bypass:AddToggle("BypassVacuum",         { Text = "Bypass Vacuum",           Default = false, Tooltip = "Prevents you from falling into 'Vacuum' fake doors." })
Groupboxes.Exploits_Bypass:AddToggle("BypassKillbricks",     { Text = "Bypass Killbricks",       Default = false, Tooltip = "Prevents 'Lava' from hurting you." })
Groupboxes.Exploits_Bypass:AddToggle("BypassSeekingWall",    { Text = "Bypass Seeking Wall",     Default = false, Tooltip = "Prevents 'ScaryWall' from hurting you." })
Groupboxes.Exploits_Bypass:AddToggle("BypassSnare",          { Text = "Bypass Snare",            Default = false, Tooltip = "Prevents 'Snare' from trapping you." })
Groupboxes.Exploits_Bypass:AddToggle("BypassBanana",         { Text = "Bypass Banana",           Default = false, Tooltip = "Prevents 'Banana Peel' from slipping you up (sometimes doesn't work)." })
Groupboxes.Exploits_Bypass:AddToggle("BypassJeff",           { Text = "Bypass Jeff",             Default = false, Tooltip = "Prevents 'Jeff the Killer' from stabbing you (sometimes doesn't work)." })
Groupboxes.Exploits_Bypass:AddDivider()
Groupboxes.Exploits_Bypass:AddToggle("AntiLag", {
	Text = "Anti Lag",
	Default = false,
	Tooltip = "Replaces room materials with Plastic to reduce lag. Original materials are restored when disabled. Also applies to parts added while enabled.",
	Callback = function(Value)
		if Value then
			for _, v in workspace.CurrentRooms:GetDescendants() do
				if v:IsA("BasePart") then
					v:SetAttribute("Mat", v.Material)
					v.Material = "Plastic"
				end
			end
		else
			for _, v in workspace.CurrentRooms:GetDescendants() do
				if v:IsA("BasePart") then
					if v:GetAttribute("Mat") then
						v.Material = v:GetAttribute("Mat") or "Plastic"
					end
				end
			end
		end
	end
})


Toggles.BypassGiggle:OnChanged(function(Value)
	for _, Object in Objects.Entities do
		if Object.Name == "GiggleCeiling" then
			Object:WaitForChild("Hitbox").CanTouch = not Value
		end
	end
end)
Toggles.BypassDupe:OnChanged(function(Value)
	for _, Object in Objects.Entities do
		if Object.Name == "DoorFake" or Object.Name == "FakeDoor" then
			Object:WaitForChild("Hidden").CanTouch = not Value
			if Object:FindFirstChild("Lock") then
				Object.Lock.UnlockPrompt.Enabled = not Value
			end
		end
	end
end)
Toggles.BypassEyes:OnChanged(function(Value)
	if Value and Globals.IsEyes then
		if Floor == "Fools" or Floor == "OldHotel" then
			RemotesFolder.MotorReplication:FireServer(0, (Globals.SpoofOffset == 200 and 65 or -65), 0, false)
		else
			RemotesFolder.MotorReplication:FireServer(-650)
		end
	end
end)
Toggles.BypassLookman:OnChanged(function(Value)
	if Value and Globals.IsLookman then
		if Floor == "Fools" or Floor == "OldHotel" then
			RemotesFolder.MotorReplication:FireServer(0, (Globals.SpoofOffset == 200 and 65 or -65), 0, false)
		else
			RemotesFolder.MotorReplication:FireServer(-650)
		end
	end
end)
Toggles.BypassGloombatEggs:OnChanged(function(Value)
	for _, Object in Objects.Entities do
		for _, Part in Object:GetDescendants() do
			if Part:IsA("BasePart") then
				Part.CanTouch = not Value
			end
		end
	end
end)
Toggles.BypassSeekObstructions:OnChanged(function(Value)
	for _, Object in Objects.SeekObstructions do
		Object.CanTouch = not Value
		if Object.Name == "SeekFloodline" then
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
		if Object.Name == "SideroomSpace" then
			Object:WaitForChild("Collision").CanCollide = Value
			Object:WaitForChild("Collision").CanTouch = not Value
		end
	end
end)
Toggles.BypassKillbricks:OnChanged(function(Value)
	for _, Object in Objects.Obstructions do
		if Object.Name == "Lava" then Object.CanTouch = not Value end
	end
end)
Toggles.BypassSeekingWall:OnChanged(function(Value)
	for _, Object in Objects.Obstructions do
		if Object.Name == "ScaryWall" then
			for _, Part in Object:GetDescendants() do
				if Part:IsA("BasePart") then
					Part.CanTouch = not Value
					Part.CanCollide = not Value
				end
			end
		end
	end
end)
Toggles.BypassSnare:OnChanged(function(Value)
	for _, Object in Objects.Entities do
		if Object.Name == "Snare" then
			for _, Part in Object:GetDescendants() do
				if Part:IsA("BasePart") then Part.CanTouch = not Value end
			end
		end
	end
end)
Toggles.BypassBanana:OnChanged(function(Value)
	for _, Object in Objects.Entities do
		if Object.Name == "BananaPeel" then Object.CanTouch = not Value end
	end
end)
Toggles.BypassJeff:OnChanged(function(Value)
	for _, Object in Objects.Entities do
		if Object.Name == "JeffTheKiller" then
			for _, Part in Object:GetDescendants() do
				if Part:IsA("BasePart") then
					Part.CanCollide = not Value
					Part.CanTouch = not Value
				end
			end
			Object:WaitForChild("Humanoid").Health = 0
		end
	end
end)







-- Archives (перенесено во вкладку Floors)

Groupboxes.Archives_Misc = Tabs.Floors:AddRightGroupbox("Archives - Exploits / Anti")
Groupboxes.Archives_Misc:AddToggle("AntiRansom", { Text = "Anti Ransom", Default = false, Tooltip = "Prevents 'Ransom' from attacking you." })
Groupboxes.Archives_Misc:AddToggle("AntiClosetTrash", { Text = "Anti Closet Trash", Default = false, Tooltip = "Prevents 'Closet Trash' from spawning." })
Groupboxes.Archives_Misc:AddToggle("ForgetMeNotSolver", { Text = "Forget Me Not Skipper", Default = false, Tooltip = "Automatically Skippes Forget Me Not doors." })
Groupboxes.Archives_Misc:AddToggle("TimeShower", { Text = "Time Shower", Default = false, Tooltip = "Shows the Archives clock time." })
Groupboxes.Archives_Misc:AddToggle("BypassDronesStampede", { Text = "Stop Time/Anti Stampede", Default = false, Tooltip = "Prevents 'The Drones Stampede' from attacking you." })
Groupboxes.Archives_Misc:AddToggle("HonchoCorrectBoxESP", { Text = "Correct Box ESP/Auto Interact", Default = false, Tooltip = "ESP correct Archives boxes in the Honcho sequence and automatically interact with the correct deposit." })

TimeShowerLabel = Instance.new("TextLabel")
TimeShowerLabel.Name = "TimeShower"
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
TimeShowerLabel.Text = "Time: --:--"
TimeShowerLabel.Visible = false
TimeShowerLabel.Parent = Container



local function GetArchivesClockLabel(Room)
	local Assets = Room and Room:FindFirstChild("Assets", true)
	local Clock = Assets and Assets:FindFirstChild("ArchivesClock", true)
	local Time = Clock and Clock:FindFirstChild("Time", true)
	local TextLabel = Time and Time:FindFirstChild("TextLabel")
	return (TextLabel and TextLabel:IsA("TextLabel")) and TextLabel or nil
end

local function ResolveClockLabel()
	if TimeShowerSourceLabel and TimeShowerSourceLabel.Parent and TimeShowerSourceLabel:IsDescendantOf(game) then
		return TimeShowerSourceLabel
	end
	local currentRooms = workspace:FindFirstChild("CurrentRooms")
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
	local clock = label:FindFirstAncestor("ArchivesClock")
	if not clock then return nil end
	local remote = clock:FindFirstChild("LookedAtRemote", true)
	return (remote and remote:IsA("RemoteEvent")) and remote or nil
end

task.spawn(function()
	local lastCheckedRoomCount = 0
	while game:IsLoaded() do
		local currentRooms = workspace:FindFirstChild("CurrentRooms")
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
		TimeShowerLabel.Text = "Time: --:--"
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
		TimeShowerLabel.Text = TextLabel and ("Time: " .. TextLabel.Text) or "Time: --:--"
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
	local CurrentRooms = workspace:FindFirstChild("CurrentRooms")
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
		local HonchoRoom = Room:FindFirstChild("ArchivesHonchoRoom", true)
		if not HonchoRoom then
			HonchoProcessedRooms[Room] = nil
			return
		end
		local BoxIDs = {}
		local RoomNumber = tonumber(Room.Name)
		for _, Desc in ipairs(Room:GetDescendants()) do
			local name = Desc.Name
			if name == "ArchivesPackageDeposit" or name:match("^ArchivesPackageDeposit") then
				local id = Desc:GetAttribute("BoxID")
				if id ~= nil then
					local idStr = tostring(id)
					BoxIDs[idStr] = true
					HonchoDepositCache[idStr] = Desc
					AddHonchoESP(Desc, "Deposit (" .. idStr .. ")")
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
			if Child.Name == "ArchivesStorageBox" then
				local ToolBoxID = Child:GetAttribute("Tool_BoxID")
				if ToolBoxID ~= nil and BoxIDs[tostring(ToolBoxID)] then
					if not Child:GetAttribute("ParentRoom") then
						Child:SetAttribute("ParentRoom", RoomNumber)
					end
					Child.Name = "ArchivesStorageBoxCorrect"
					AddHonchoESP(Child, "Correct Box (" .. tostring(ToolBoxID) .. ")")
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
	HonchoAutoDepositConnection = game:GetService("RunService").Heartbeat:Connect(function()
		if not Toggles.HonchoCorrectBoxESP.Value then return end
		local now = os.clock()
		if now - lastCheck < 0.1 then return end
		lastCheck = now
		local Character = LocalPlayer and LocalPlayer.Character
		local HumanoidRootPart = Character and Character:FindFirstChild("HumanoidRootPart")
		if not Character or not HumanoidRootPart then return end
		local BoxCandidates = {}
		for _, Object in ipairs(Character:GetChildren()) do
			if (Object:IsA("Tool") or Object:IsA("Model")) and (Object.Name == "ArchivesStorageBox" or Object.Name == "ArchivesStorageBoxCorrect") then
				BoxCandidates[#BoxCandidates + 1] = Object
			end
		end
		local Drops = workspace:FindFirstChild("Drops")
		if Drops then
			for _, Object in ipairs(Drops:GetChildren()) do
				if Object.Name == "ArchivesStorageBox" or Object.Name == "ArchivesStorageBoxCorrect" then
					BoxCandidates[#BoxCandidates + 1] = Object
				end
			end
		end
		for _, Box in ipairs(BoxCandidates) do
			if not (Box and Box.Parent) then continue end
			local BoxID = Box:GetAttribute("Tool_BoxID") or Box:GetAttribute("BoxID")
			if BoxID == nil then continue end
			local Deposit = HonchoDepositCache[tostring(BoxID)]
			if not Deposit or not Deposit.Parent then continue end
			if Box.Parent == Drops and not Box:GetAttribute("HonchoCorrectESP") then
				Box:SetAttribute("HonchoCorrectESP", true)
				AddHonchoESP(Box, "Correct Box (" .. tostring(BoxID) .. ")")
			end
			if Box.Parent == Character then
				local DepositPart = Deposit:IsA("BasePart") and Deposit or Deposit:FindFirstChildWhichIsA("BasePart", true)
				if DepositPart and (HumanoidRootPart.Position - DepositPart.Position).Magnitude <= 10 then
					local Prompt = Deposit:FindFirstChildWhichIsA("ProximityPrompt", true)
					if Prompt then
						fireproximityprompt(Prompt)
					end
				end
			end
		end
	end)
end)


Groupboxes.Archives_Bypasses = Tabs.Floors:AddLeftGroupbox("Archives - Bypasses")
Groupboxes.Archives_Bypasses:AddToggle("BypassWater", { Text = "Bypass Electric Water", Default = false, Tooltip = "Prevents electric water from hurting you." })
Groupboxes.Archives_Bypasses:AddToggle("BypassAlma", { Text = "Bypass Alma", Default = false, Tooltip = "Prevents 'Alma' from spawning." })
Groupboxes.Archives_Bypasses:AddToggle("BypassDrones", { Text = "Bypass Drones", Default = false, Tooltip = "Prevents 'Drones' from attacking you." })
Groupboxes.Archives_Bypasses:AddToggle("AntiScribbles", { Text = "Bypass Scribbles", Default = false, Tooltip = "Prevents 'Scribbles' from attacking you." })

Groupboxes.Archives_Experimental = Tabs.Floors:AddLeftGroupbox("Archives - Experimental")

Toggles.AntiClosetTrash:OnChanged(function(Value)
	if AntiClosetTrash_Connection then
		AntiClosetTrash_Connection:Disconnect()
		AntiClosetTrash_Connection = nil
	end
	if not Value then return end
	AntiClosetTrash_Connection = workspace.ChildAdded:Connect(function(Child)
		if not Toggles.AntiClosetTrash.Value then return end
		local Name = Child.Name
		if Name:sub(1, 6) == "Binder" or Name:sub(1, 4) == "Shoe" or Name:sub(1, 5) == "Shelf" then
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
		if Child.Name == "Ransom" and Toggles.AntiRansom.Value then
			Child:Destroy()
			print("Ransom gone hehehehehehehehe")
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
				local LookAt = Obj:FindFirstChild("LookAt")
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

		if not Room:FindFirstChild("ForgetMeNotVineDoors", true) then
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

			local Door = NextRoom:FindFirstChild("Door")

			if not Door then
				local Character = GetCharacter()
				if Character then
					local Target = NextRoom:FindFirstChildWhichIsA("BasePart") or NextRoom
					if Target:IsA("BasePart") then
						Character:PivotTo(Target.CFrame + Vector3.new(0, 3, 0))
					elseif Target:IsA("Model") then
						Character:PivotTo(Target:GetPivot() + Vector3.new(0, 3, 0))
					else
						Character:PivotTo(CFrame.new(NextRoom:GetPivot().Position + Vector3.new(0, 5, 0)))
					end
				end
				break
			end

			if Door:GetAttribute("Opened") == true then
				VoidCharacter()
				break
			end

			local Hidden = Door:FindFirstChild("Hidden") or Door:WaitForChild("Hidden", 2)
			if not Hidden then
				task.wait(0.3)
				continue
			end

			while ForgetMeNotRunning and Room.Parent and NextRoom.Parent and Door.Parent and Door:GetAttribute("Opened") ~= true do
				local Character = GetCharacter()
				if Character then
					if Hidden:IsA("BasePart") then
						Character:PivotTo(Hidden.CFrame)
					elseif Hidden:IsA("Model") then
						Character:PivotTo(Hidden:GetPivot())
					end
				end
				pcall(function() Door.ClientOpen:Fire() end)
				pcall(function() Door.ClientOpen:FireServer() end)
				task.wait()
			end

			if ForgetMeNotRunning and Door.Parent and Door:GetAttribute("Opened") == true then
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
	Functions.Notify({ Title = "PositionSpoof Will Break This!." })

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

		local WaterBypassWater = WaterBypassRoom:FindFirstChild("Water")
		if not WaterBypassWater or WaterParts[WaterBypassWater] then return end

		local WaterBypassPart = Instance.new("Part")
		WaterBypassPart.Name = "WaterBypass"
		WaterBypassPart.Anchored = true
		WaterBypassPart.CanCollide = true
		WaterBypassPart.CanTouch = false
		WaterBypassPart.CanQuery = false
		WaterBypassPart.Transparency = 0.25
		WaterBypassPart.Color = Color3.fromRGB(0, 150, 255)
		WaterBypassPart.Material = Enum.Material.ForceField

		local WaterBypassSize, WaterBypassCFrame
		if WaterBypassWater:IsA("BasePart") then
			WaterBypassSize = WaterBypassWater.Size
			WaterBypassCFrame = WaterBypassWater.CFrame
		elseif WaterBypassWater:IsA("Model") then
			WaterBypassCFrame, WaterBypassSize = WaterBypassWater:GetBoundingBox()
		else
			WaterBypassSize = Vector3.new(10, 1.5, 10)
			WaterBypassCFrame = WaterBypassWater:GetPivot()
		end

		WaterBypassPart.Size = WaterBypassSize + Vector3.new(0, 0.5, 0)
		WaterBypassPart.CFrame = WaterBypassCFrame * CFrame.new(0, 0.25, 0)

		if WaterBypassPart.Size.Y > 3 then
			WaterBypassPart:Destroy()
			Functions.Notify({ Title = "Water Bypass removed: Softlock." })
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
			if child.Name == "Alma" then child:Destroy() end
		end
		AlmaConnection = workspace.ChildAdded:Connect(function(child)
			if child.Name == "Alma" then child:Destroy() end
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
		if Child.Name == "Scribbles" and Toggles.AntiScribbles.Value then
			local ExploitSribbleWarning = Child:FindFirstChild("IfYoureExploitingDeleteThis")
			if ExploitSribbleWarning then ExploitSribbleWarning:Destroy() end
		end
	end)
end)

Toggles.BypassDrones:OnChanged(function(Value)
	local RS = game:GetService("ReplicatedStorage")
	local function ProcessDrones(drones)
		local WalkedInto = drones:FindFirstChild("WalkedInto") or drones:WaitForChild("WalkedInto", 3)
		if WalkedInto and not DroneWalkedIntoParents[WalkedInto] then
			DroneWalkedIntoParents[WalkedInto] = drones
			WalkedInto.Parent = RS
		end
	end
	if Value then
		for _, child in ipairs(workspace:GetChildren()) do
			if child.Name == "Drones" then ProcessDrones(child) end
		end
		if DroneConnection then DroneConnection:Disconnect() end
		DroneConnection = workspace.ChildAdded:Connect(function(child)
			if child.Name == "Drones" then ProcessDrones(child) end
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

Groupboxes.Stairwell_Misc = Tabs.Floors:AddLeftGroupbox("Stairwell - Exploits / Anti / Misc")



Groupboxes.Stairwell_Misc:AddDivider()
Groupboxes.Stairwell_Misc:AddToggle("BypassNoise", { Text = "Noise Tv Breaker", Default = false, Tooltip = "Breaks the tv of noise while holding it." })


Groupboxes.Stairwell_Misc:AddToggle("DroppedItemValue", { Text = "Item Number", Default = false, Tooltip = "Shows the number of dropped items." })

Groupboxes.Stairwell_Misc:AddToggle("KillAllWithCart", {
	Text = "Kill All (Requires ≥1 Cart)",
	Default = false,
})
Groupboxes.Stairwell_Misc:AddToggle("FlingCreak", {
	Text = "Bug Out Creak (Requires ≥5 Cart)",
	Default = false,
	ToolTip = "DONT TOUCH THE CARTS URSELF, U WILL DIE"
})
Groupboxes.Stairwell_Misc:AddToggle("CreakAggressionMeter", {
    Text = "Creak Aggression Meter",
    Default = false,
    Tooltip = "Shows Creak's aggression above its head."
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
    local CreakAnimator = CreakModel:FindFirstChildOfClass("Animator")
        or (CreakModel:FindFirstChild("AnimationController") and CreakModel.AnimationController:FindFirstChildOfClass("Animator"))
        or CreakModel:FindFirstChildOfClass("AnimationController")

    if not CreakAnimator then return nil end

    for _, CreakAnimationTrack in ipairs(CreakAnimator:GetPlayingAnimationTracks()) do
        if CreakAnimationTrack.Name == "CreakGraph" or (CreakAnimationTrack.Animation and CreakAnimationTrack.Animation.Name == "CreakGraph") then
            local CreakSuccess, CreakAggressionValue = pcall(CreakAnimationTrack.GetParameter, CreakAnimationTrack, "Aggression")
            if CreakSuccess and typeof(CreakAggressionValue) == "number" then
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

    local CreakTitleText = CreateCreakDrawing("Text")
    CreakTitleText.Text = "Aggression --%"
    CreakTitleText.Size = 16
    CreakTitleText.Font = Drawing.Fonts.Plex
    CreakTitleText.Color = Color3.fromRGB(255, 255, 255)
    CreakTitleText.Center = true
    CreakTitleText.Outline = true
    CreakTitleText.Visible = false

    local CreakBarBackground = CreateCreakDrawing("Square")
    CreakBarBackground.Size = Vector2.new(112, 6)
    CreakBarBackground.Filled = true
    CreakBarBackground.Color = Color3.fromRGB(58, 58, 64)
    CreakBarBackground.Transparency = 0.15
    CreakBarBackground.Visible = false

    local CreakBarFill = CreateCreakDrawing("Square")
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
    if not Toggles.CreakAggressionMeter.Value or CreakModel.Name ~= "Creak" or CreakAggressionMetersTable[CreakModel] then
        return
    end

    local CreakHeadPart = CreakModel:FindFirstChild("Head")
    if not CreakHeadPart or not CreakHeadPart:IsA("BasePart") then return end

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
            CreakMeterData.TitleText.Text = "Aggression --%"
            CreakMeterData.TitleText.Color = Color3.fromRGB(200, 200, 200)
            CreakMeterData.BarFill.Size = Vector2.new(0, 6)
            CreakMeterData.TitleText.Visible = true
            CreakMeterData.BarBackground.Visible = true
            CreakMeterData.BarFill.Visible = false
            return
        end

        CreakMeterData.TitleText.Text = "Aggression " .. math.floor(CreakAggressionValue * 100 + 0.5) .. "%"
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

    local CreakLiveEntitiesFolder = Workspace:FindFirstChild("LiveEntities")
    if not CreakLiveEntitiesFolder then return end

    CreakAggressionChildAddedConnection = CreakLiveEntitiesFolder.ChildAdded:Connect(function(CreakNewChild)
        if CreakNewChild.Name == "Creak" then
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

        local CreakLiveEntitiesFolder = Workspace:FindFirstChild("LiveEntities")
        local CreakExistingModel = CreakLiveEntitiesFolder and CreakLiveEntitiesFolder:FindFirstChild("Creak")
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
				if KillAllWithCartModel.Name == "ShoppingCart" and KillAllWithCartModel:IsA("Model") then
					KillAllWithCartCarts[#KillAllWithCartCarts + 1] = KillAllWithCartModel
				end
			end

			local KillAllWithCartAlivePlayers = {}
			for _, KillAllWithCartPlayer in ipairs(game.Players:GetPlayers()) do
				if KillAllWithCartPlayer ~= game.Players.LocalPlayer and KillAllWithCartPlayer.Character then
					local KillAllWithCartHumanoid = KillAllWithCartPlayer.Character:FindFirstChildOfClass("Humanoid")
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
			local creak = workspace:FindFirstChild("LiveEntities") and workspace.LiveEntities:FindFirstChild("Creak")
			if creak then
				local targetCFrame = creak:GetPivot()
				for _, model in ipairs(workspace.Misc:GetChildren()) do
					if model.Name == "ShoppingCart" and model:IsA("Model") then
						model:PivotTo(targetCFrame)
					end
				end
			end
			task.wait(0.10)
		end
	end)
end)




Groupboxes.Stairwell_Misc:AddDivider()


Groupboxes.Stairwell_Misc:AddToggle("DisableStairwellCrusherCollision", {
	Text = "Disable Crushers",
	Default = false,
})
Groupboxes.Stairwell_Misc:AddToggle("DeleteStairwellCrusherExceptBasicWall", {
	Text = "Delete Crushers",
	Default = false,
})
Groupboxes.Stairwell_Misc:AddToggle("MeldRemover", {
	Text = "Remove Meld",
	Default = false,
})

Groupboxes.Stairwell_Misc:AddToggle("StairwellLandingSpam", {
	Text = "TP to trash and drop trash.",
	Tooltip = "Combine with orbit, or bring all dropped items.",
	Default = false,
})

Toggles.DisableStairwellCrusherCollision:OnChanged(function(DisableStairwellCrusherCollisionState)
	if not DisableStairwellCrusherCollisionState then return end

	task.spawn(function()
		while Toggles.DisableStairwellCrusherCollision.Value do
			for _, DisableStairwellCrusherRoom in ipairs(workspace.CurrentRooms:GetChildren()) do
				local DisableStairwellCrusherAssets = DisableStairwellCrusherRoom:FindFirstChild("Assets")
				if DisableStairwellCrusherAssets then
					for _, DisableStairwellCrusherContainer in ipairs(DisableStairwellCrusherAssets:GetChildren()) do
						if DisableStairwellCrusherContainer.Name == "StairwellCrusherContainer1" then
							for _, DisableStairwellCrusherDescendant in ipairs(DisableStairwellCrusherContainer:GetDescendants()) do
								if DisableStairwellCrusherDescendant:IsA("BasePart") and DisableStairwellCrusherDescendant.CanCollide then
									local DisableStairwellCrusherUnderBasicWall = false
									local DisableStairwellCrusherParent = DisableStairwellCrusherDescendant.Parent
									while DisableStairwellCrusherParent and DisableStairwellCrusherParent ~= DisableStairwellCrusherContainer do
										if DisableStairwellCrusherParent.Name == "BasicWall" then
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

						local DisableStairwellCrusher = DisableStairwellCrusherContainer:FindFirstChild("StairwellCrusher")
						if DisableStairwellCrusher then
							local DisableStairwellCrusherOuterTrigger = DisableStairwellCrusher:FindFirstChild("OuterTrigger")
							local DisableStairwellCrusherCoreTrigger = DisableStairwellCrusher:FindFirstChild("CoreTrigger")
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
				local DeleteStairwellCrusherAssets = DeleteStairwellCrusherRoom:FindFirstChild("Assets")
				if DeleteStairwellCrusherAssets then
					for _, DeleteStairwellCrusherContainer in ipairs(DeleteStairwellCrusherAssets:GetChildren()) do
						if DeleteStairwellCrusherContainer.Name == "StairwellCrusherContainer1" then
							local DeleteStairwellCrusherToDestroy = {}
							for _, DeleteStairwellCrusherDescendant in ipairs(DeleteStairwellCrusherContainer:GetDescendants()) do
								local DeleteStairwellCrusherUnderBasicWall = false
								local DeleteStairwellCrusherParent = DeleteStairwellCrusherDescendant.Parent
								while DeleteStairwellCrusherParent and DeleteStairwellCrusherParent ~= DeleteStairwellCrusherContainer do
									if DeleteStairwellCrusherParent.Name == "BasicWall" then
										DeleteStairwellCrusherUnderBasicWall = true
										break
									end
									DeleteStairwellCrusherParent = DeleteStairwellCrusherParent.Parent
								end
								if not DeleteStairwellCrusherUnderBasicWall and DeleteStairwellCrusherDescendant.Name ~= "BasicWall" then
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
				for _, folderName in ipairs({"Assets", "Parts"}) do
					local folder = room:FindFirstChild(folderName)
					if folder then
						for _, child in ipairs(folder:GetChildren()) do
							if child.Name == "MeldWall"
								or child.Name == "Boleahghth29tdgfhy2thuy2htuu259uhh3u" -- no qeustions asked
							then
								child:Destroy()
							end
						end
					end
				end
				for _, name in ipairs({"MeldData", "MeldPads", "Meldview", "Meld"}) do
					local obj = room:FindFirstChild(name)
					if obj and obj:IsA("Folder") then
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
				local StairwellLandingLogic = Room:FindFirstChild("StairwellLandingLogic")

				if StairwellLandingLogic then
					for _, Model in ipairs(StairwellLandingLogic:GetChildren()) do
						if Model:IsA("Model") then
							local Prompts = {}

							for _, Object in ipairs(Model:GetDescendants()) do
								if Object:IsA("ProximityPrompt") then
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
					local HumanoidRootPart = Character and Character:FindFirstChild("HumanoidRootPart")

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

Groupboxes.Stairwell_Misc:AddButton("TP Shopping Carts To Player", function()
	local ShoppingCartTargetName = Options.ShoppingCartTarget.Value
	local ShoppingCartTargetPlayer = game.Players:FindFirstChild(ShoppingCartTargetName)
	if not ShoppingCartTargetPlayer or not ShoppingCartTargetPlayer.Character then return end
	local ShoppingCartTargetCFrame = ShoppingCartTargetPlayer.Character:GetPivot()
	for _, ShoppingCartModel in ipairs(workspace.Misc:GetChildren()) do
		if ShoppingCartModel.Name == "ShoppingCart" and ShoppingCartModel:IsA("Model") then
			ShoppingCartModel:PivotTo(ShoppingCartTargetCFrame)
		end
	end
end)

Groupboxes.Stairwell_Misc:AddDropdown("ShoppingCartTarget", {
	Text = "Shopping Cart Target",
	Values = (function()
		local ShoppingCartPlayerNames = {}
		for _, ShoppingCartPlayer in ipairs(game.Players:GetPlayers()) do
			ShoppingCartPlayerNames[#ShoppingCartPlayerNames + 1] = ShoppingCartPlayer.Name
		end
		return ShoppingCartPlayerNames
	end)(),
	Default = game.Players.LocalPlayer.Name,
})

Groupboxes.Stairwell_Misc:AddButton("Refresh Players", function()
	local ShoppingCartPlayerNames = {}
	for _, ShoppingCartPlayer in ipairs(game.Players:GetPlayers()) do
		ShoppingCartPlayerNames[#ShoppingCartPlayerNames + 1] = ShoppingCartPlayer.Name
	end
	Options.ShoppingCartTarget:SetValues(ShoppingCartPlayerNames)
end)

Groupboxes.Stairwell_Experimental = Tabs.Floors:AddRightGroupbox("Stairwell - Experimental")


local function TPDropsToNearestGrinder()
    local TPDropsToNearestGrinderDropsFolder =
        workspace:FindFirstChild("Drops")

    local TPDropsToNearestGrinderRootPart =
        Character and Character:FindFirstChild("HumanoidRootPart")

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
                "StairwellScrapper",
                true
            )

        if TPDropsToNearestGrinderScrapper then
            for _, TPDropsToNearestGrinderObject in
                ipairs(TPDropsToNearestGrinderScrapper:GetDescendants()) do

                if TPDropsToNearestGrinderObject.Name == "Grinder1"
                    and (
                        TPDropsToNearestGrinderObject:IsA("Model")
                        or TPDropsToNearestGrinderObject:IsA("BasePart")
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

        if TPDropsToNearestGrinderDropItem:IsA("Model")
            or TPDropsToNearestGrinderDropItem:IsA("BasePart") then

            TPDropsToNearestGrinderDropItem:PivotTo(
                TPDropsToNearestGrinderCFrame
            )
        end
    end
end

Groupboxes.Stairwell_Experimental:AddButton({
    Text = "TP All Drops to Nearest Grinder",
    Func = TPDropsToNearestGrinder,
    DoubleClick = false,
    Tooltip = "Teleports every dropped item to the grinder closest to you",
})

local function BringDroppedItems()
	local workspaceDropsFolder = workspace:FindFirstChild("Drops")
	if LocalPlayer and LocalPlayer.Character then
		local playerHumanoidRootPart = LocalPlayer.Character:FindFirstChild("HumanoidRootPart")
		if playerHumanoidRootPart and workspaceDropsFolder then
			for _, itemToBring in ipairs(workspaceDropsFolder:GetChildren()) do
				if itemToBring:IsA("Model") then
					itemToBring:PivotTo(playerHumanoidRootPart.CFrame)
				elseif itemToBring:IsA("BasePart") then
					itemToBring.CFrame = playerHumanoidRootPart.CFrame
				end
			end
		end
	end
end

Groupboxes.Stairwell_Experimental:AddButton({
	Text = "Bring Dropped Items",
	Func = function() BringDroppedItems() end,
	DoubleClick = false,
	Tooltip = "Brings all dropped items."
})

Groupboxes.Stairwell_Experimental:AddToggle("EnableDroppedItemsInterval", {
	Text = "Enable Interval",
	Default = false,
	Tooltip = "Automatically brings dropped items at the selected interval."
})

Groupboxes.Stairwell_Experimental:AddSlider("DroppedItemsInterval", {
	Text = "Interval",
	Default = 1,
	Min = 0,
	Max = 60,
	Rounding = 1,
	Compact = false,
	Tooltip = "How often dropped items are brought."
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

Groupboxes.Stairwell_Experimental:AddToggle("OrbitDroppedItems", {
	Text = "Orbit Dropped Items",
	Default = false,
	Tooltip = "Orbits dropped items around you. Teleports them to you every 10s to prevent despawn."
})

Groupboxes.Stairwell_Experimental:AddSlider("OrbitDroppedItemsHeight", {
	Text = "Height",
	Default = 2,
	Min = -20,
	Max = 20,
	Rounding = 1,
	Compact = false,
	Tooltip = "The height of the orbit."
})

Groupboxes.Stairwell_Experimental:AddSlider("OrbitDroppedItemsDistance", {
	Text = "Distance",
	Default = 5,
	Min = 0,
	Max = 50,
	Rounding = 1,
	Compact = false,
	Tooltip = "The distance of the orbit."
})

Groupboxes.Stairwell_Experimental:AddSlider("OrbitDroppedItemsSpeed", {
	Text = "Speed",
	Default = 2,
	Min = 0,
	Max = 20,
	Rounding = 1,
	Compact = false,
	Tooltip = "The speed of the orbit."
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
		local OrbitDroppedItemsHumanoidRootPart = LocalPlayer.Character:FindFirstChild("HumanoidRootPart")
		local OrbitDroppedItemsDropsFolder = workspace:FindFirstChild("Drops")
		if not OrbitDroppedItemsHumanoidRootPart or not OrbitDroppedItemsDropsFolder then return end
		local OrbitDroppedItemsHeightValue = Options.OrbitDroppedItemsHeight.Value
		local OrbitDroppedItemsDistanceValue = Options.OrbitDroppedItemsDistance.Value
		local OrbitDroppedItemsSpeedValue = Options.OrbitDroppedItemsSpeed.Value
		local OrbitDroppedItemsCurrentTime = tick()
		local OrbitDroppedItemsList = {}
		for _, OrbitDroppedItemsObject in ipairs(OrbitDroppedItemsDropsFolder:GetChildren()) do
			if OrbitDroppedItemsObject:IsA("Model") or OrbitDroppedItemsObject:IsA("BasePart") then
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
				if OrbitDroppedItemsObject:IsA("Model") then
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
			if OrbitDroppedItemsObject:IsA("Model") then
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
		if not targetTvStand:IsA("Model") then return end
		if targetTvStand.Name ~= "TV_Stand" then return end

		local tvStandCurrentCFrame = targetTvStand:GetPivot()

		if tvStandCurrentCFrame.Position.Y > -119 then
			targetTvStand:PivotTo(CFrame.new(
				tvStandCurrentCFrame.Position.X,
				-120,
				tvStandCurrentCFrame.Position.Z
			))
		end
	end

	local bypassNoiseMiscFolder = workspace:FindFirstChild("Misc")
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
	local DroppedItemValueScreenGui = game:GetService("CoreGui"):FindFirstChild("DropsCoinCounter")
	if not DroppedItemValue then
		if DroppedItemValueScreenGui then DroppedItemValueScreenGui:Destroy() end
		return
	end
	local DroppedItemValueWorkspaceDrops = workspace:WaitForChild("Drops")
	if DroppedItemValueScreenGui then DroppedItemValueScreenGui:Destroy() end
	DroppedItemValueScreenGui = Instance.new("ScreenGui")
	DroppedItemValueScreenGui.Name = "DropsCoinCounter"
	DroppedItemValueScreenGui.ResetOnSpawn = false
	DroppedItemValueScreenGui.Parent = game:GetService("CoreGui")
	local DroppedItemValueCoinText = Instance.new("TextLabel")
	DroppedItemValueCoinText.Name = "CoinText"
	DroppedItemValueCoinText.AnchorPoint = Vector2.new(0.5, 0)
	DroppedItemValueCoinText.Position = UDim2.new(0.5, 0, 0.02, 0)
	DroppedItemValueCoinText.Size = UDim2.new(0, 250, 0, 40)
	DroppedItemValueCoinText.BackgroundTransparency = 1
	DroppedItemValueCoinText.Text = "Items: 0"
	DroppedItemValueCoinText.TextSize = 24
	DroppedItemValueCoinText.Font = Enum.Font.GothamBold
	DroppedItemValueCoinText.TextColor3 = Color3.fromRGB(255, 255, 255)
	DroppedItemValueCoinText.TextStrokeTransparency = 0.5
	DroppedItemValueCoinText.Parent = DroppedItemValueScreenGui
	local DroppedItemValueCountedDrops = {}
	task.spawn(function()
		while Toggles.DroppedItemValue.Value do
			for _, DroppedItemValueDrop in ipairs(DroppedItemValueWorkspaceDrops:GetChildren()) do
				if DroppedItemValueDrop:IsA("Model") and not DroppedItemValueCountedDrops[DroppedItemValueDrop] then
					DroppedItemValueDrop:SetAttribute("CoinsChecked", true)
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
			DroppedItemValueCoinText.Text = "Items: " .. DroppedItemValueTotalItems
			task.wait(1)
		end
		if DroppedItemValueScreenGui and DroppedItemValueScreenGui.Parent then
			DroppedItemValueScreenGui:Destroy()
		end
	end)
end)

-- hi

Groupboxes.Exploits_BypassRight = Tabs.Exploits:AddRightGroupbox("Bypass")
Groupboxes.Exploits_BypassRight:AddToggle("DisableAnticheat", {
	Text = "Anticheat Bypass", Default = false,
	Tooltip = "Completely disables the anticheat, after interacting with a ladder."
})
Groupboxes.Exploits_BypassRight:AddToggle("VelocityManipulationToggle", {
	Text = "Velocity Manipulation", Default = false,
	Tooltip = "Moves your character forward slowly, mitigating the game's anti-noclip."
})
Toggles.DisableAnticheat:OnChanged(function(Value)
	if Globals.AnticheatDisabled == true and not Value then
		RemotesFolder.ClimbLadder:FireServer()
		Globals.AnticheatDisabled = false
	end
end)
Toggles.VelocityManipulationToggle:AddKeyPicker("VelocityManipulationKeybind", {
	Text = "Velocity Manipulation", Default = "V",
	Mode = Library.IsMobile and "Toggle" or "Hold", SyncToggleState = true
})
Groupboxes.Exploits_BypassRight:AddDropdown("VelocityManipulationMode", {
	Values = {"Velocity", "Pivot"}, Text = "Manipulation Method",
	Default = 1,
})

Groupboxes.Exploits_BypassRight:AddDivider()
Groupboxes.Exploits_BypassRight:AddToggle("InfiniteItemsToggle", {
	Text = "Infinite Items", Default = false,
	Tooltip = "Allows certain items to be used without draining their uses.",
	Disabled = not Functions.CheckCompatability({"fireproximityprompt"}),
	DisabledTooltip = Globals.IncompatibleMessage
})
Groupboxes.Exploits_BypassRight:AddDropdown("InfiniteItemsList", {
	Text = "Item List",
	Values = { "Lockpicks", "Skeleton Key", "Shears", "Multitool" },
	Multi = true, AllowNull = true,
	Disabled = not Functions.CheckCompatability({"fireproximityprompt"}),
	DisabledTooltip = Globals.IncompatibleMessage
})

Groupboxes.Exploits_BypassRight:AddToggle("InfCrucifix", {
	Text = "Infinite Crucifix",
	Default = false,
	Tooltip = "Risky! You can die or lose the Crucifix. Recommended to have low ping and stable fps.",
	Risky = Floor ~= "Ballz",
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
	print("i allive")
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

		local InfCrucifixCollision = InfCrucifixCharacter:FindFirstChild("CollisionPart")
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

			local InfCrucifixTool = InfCrucifixCharacter:FindFirstChildOfClass("Tool")
			if not InfCrucifixTool or InfCrucifixTool.Name ~= "Crucifix" then
				continue
			end

			task.spawn(function()
				ReplicatedStorage.RemotesFolder.DropItem:FireServer(InfCrucifixTool)
				task.wait(0.54)
				print("hi")
				local InfCrucifixDrops = Workspace:FindFirstChild("Drops")
				if not InfCrucifixDrops then
					return
				end

				local InfCrucifixDropped = InfCrucifixDrops:FindFirstChild("Crucifix")
				if not InfCrucifixDropped then
					return
				end

				local InfCrucifixPrompt = InfCrucifixDropped:FindFirstChildOfClass("ProximityPrompt")
				if InfCrucifixPrompt then
					fireproximityprompt(InfCrucifixPrompt)
				end
			end)
			print ("hi")
			task.wait(0.6)
		end
	end)
end)


Groupboxes.Exploits_BypassRight:AddDivider()
Groupboxes.Exploits_BypassRight:AddToggle("PositionSpoof", {
	Text = "God Mode", Default = false,
	Tooltip = "Makes your character appear underground on the server, protecting you from rush-like entities."
})
Groupboxes.Exploits_BypassRight:AddToggle("CrouchSpoof", {
	Text = "Crouch Spoof", Default = false, Tooltip = "Makes the game think you are always crouching."
})
Toggles.PositionSpoof:OnChanged(function(Value)
	if Floor ~= "Fools" and Floor ~= "OldHotel" then
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
Toggles.PositionSpoof:AddKeyPicker("PositionSpoof", {
	Text = "God Mode", Default = "B", Mode = "Toggle", SyncToggleState = true
})
Toggles.CrouchSpoof:OnChanged(function(Value)
	if RemotesFolder:FindFirstChild("Crouch") then
		RemotesFolder.Crouch:FireServer(Value and true or Functions.IsCrouching(), true)
	end
end)

Groupboxes.Exploits_Remove = Tabs.Exploits:AddRightGroupbox("Remove")
Groupboxes.Exploits_Remove:AddToggle("RemoveScreech", { Text = "Remove Screech",  Default = false, Tooltip = "Prevents 'Screech' from spawning." })
Groupboxes.Exploits_Remove:AddToggle("RemoveHalt",    { Text = "Remove Halt",     Default = false, Tooltip = "Prevents 'Halt' from spawning." })
Groupboxes.Exploits_Remove:AddToggle("RemoveA90",     { Text = "Remove A-90",     Default = false, Tooltip = "Prevents 'A-90' from spawning." })
Groupboxes.Exploits_Remove:AddToggle("RemoveDread",   { Text = "Remove Dread",    Default = false, Tooltip = "Prevents 'Dread' from spawning." })
Groupboxes.Exploits_Remove:AddToggle("RemoveSurge", { Text = "Remove Surge", Default = false, Tooltip = "Prevents 'Surge' from spawning."})
Groupboxes.Exploits_Remove:AddDivider()
Groupboxes.Exploits_Remove:AddToggle("NoScreechDamage", { Text = "No Screech Damage", Default = false, Tooltip = "Prevents 'Screech' from hurting you." })
Groupboxes.Exploits_Remove:AddToggle("NoHaltDamage",    { Text = "No Halt Damage",    Default = false, Tooltip = "Prevents 'Halt' from hurting you." })
Groupboxes.Exploits_Remove:AddToggle("NoA90Damage",     { Text = "No A-90 Damage",    Default = false, Tooltip = "Prevents 'A-90' from hurting you." })
Groupboxes.Exploits_Remove:AddToggle("NoSurgeDamage",   { Text = "No Surge Damage",   Default = false, Tooltip = "Prevents 'Surge' from hurting you." })

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
	if RemotesFolder:FindFirstChild("A90") then
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
	if RemotesFolder:FindFirstChild("SurgeRemote") then
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
				local Camera = workspace:FindFirstChild("Camera")

				if Camera then
					local Screech = Camera:FindFirstChild("Screech")

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
	Modules.Shade.Name = Value and "Shade_Disabled" or "Shade"
end)
Toggles.RemoveA90:OnChanged(function(Value)
	if Modules.A90 then
		Modules.A90.Name = Value and "A90_Disabled" or "A90"
	end
end)
Toggles.RemoveDread:OnChanged(function(Value)
	if Modules.Dread then
		Modules.Dread.Name = Value and "Dread_Disabled" or "Dread"
	end
end)
Toggles.RemoveSurge:OnChanged(function(Value)
	if Globals.SurgeFrame then
		Globals.SurgeFrame.Name = (Value and "SurgeVignette_Disabled" or "SurgeVignette")
	end
end)

Groupboxes.Exploits_Audio = Tabs.Exploits:AddLeftGroupbox("Audio")
Globals.JamMuffle = Services.SoundService:WaitForChild("Main"):FindFirstChild("Jamming") or Instance.new("EqualizerSoundEffect")

Groupboxes.Exploits_Audio:AddToggle("RemoveFootstepSounds",    { Text = "Remove Footstep Sounds",    Default = false, Tooltip = "Removes the sounds when walking." })
Groupboxes.Exploits_Audio:AddToggle("RemoveJamminMusic",       { Text = "Remove Jammin Music",       Default = false, Tooltip = "Removes the music and muffle effect from the 'Jammin' modifier." })
Groupboxes.Exploits_Audio:AddToggle("RemoveInteractingSounds", { Text = "Remove Interacting Sounds", Default = false, Tooltip = "Removes the sounds when interacting with proximity prompts." })

Toggles.RemoveJamminMusic:OnChanged(function(Value)
	local Jam = Globals.MainUI.Initiator.Main_Game.Health:FindFirstChild("Jam")
	if Jam then
		Jam.Volume = Value and 0 or 0.45
		Globals.JamMuffle.Enabled = LiveModifiers:FindFirstChild("Jammin") and not Value or false
	end
end)
Toggles.RemoveInteractingSounds:OnChanged(function(Value)
	local PS = Globals.MainUI.Initiator.Main_Game.PromptService
	PS.Triggered.Volume   = Value and 0 or 0.04
	PS.Holding.Volume     = Value and 0 or 0.1
	PS.Notification.Volume = Value and 0 or 0.03
	Globals.MainUI.Initiator.Main_Game.Reminder.Caption.Volume = Value and 0 or 0.1
end)

Groupboxes.Visuals_LeftTab = Tabs.Visuals:AddLeftTabbox("Camera / Effects")
Groupboxes.Visuals_Camera = Groupboxes.Visuals_LeftTab:AddTab("Camera")
Groupboxes.Visuals_Camera:AddToggle("AmbientToggle", { Text = "Ambient", Default = false, Tooltip = "Changes the lighting color to the specified value." })
Groupboxes.Visuals_Camera:AddSlider("FieldOfView", { Text = "Field of View", Min = 1, Max = 120, Default = 70, Rounding = 0 })
Groupboxes.Visuals_Camera:AddToggle("FOVToggle", {    Text = "Custom FOV",    Default = false,    Tooltip = "Only applies the Field of View slider when enabled." })
Toggles.FOVToggle:AddKeyPicker("FovToggle", {Text = "Custom Fov", Default = "O", Mode = "Toggle", SyncToggleState = true})
Groupboxes.Visuals_Camera:AddDivider()
Groupboxes.Visuals_Camera:AddToggle("RemoveCameraShake", {
	Text = "Remove Camera Shake", Default = false, Tooltip = "Prevents the camera from shaking.",
	Disabled = not Functions.CheckCompatability({"require"}), DisabledTooltip = Globals.IncompatibleMessage
})
Groupboxes.Visuals_Camera:AddToggle("RemoveCameraBobbing", {
	Text = "Remove Camera Bobbing", Default = false, Tooltip = "Prevents the camera from bobbing when moving.",
	Disabled = not Functions.CheckCompatability({"require"}), DisabledTooltip = Globals.IncompatibleMessage
})
Groupboxes.Visuals_Camera:AddToggle("RemoveCutscenes", { Text = "Remove Cutscenes", Default = false, Tooltip = "Removes all non-necessary cutscenes." })
Groupboxes.Visuals_Camera:AddToggle("RemoveCameraFog", { Text = "Remove Fog", Default = false, Tooltip = "Removes all fog effects from the camera." })
Groupboxes.Visuals_Camera:AddDivider()
Groupboxes.Visuals_Camera:AddToggle("ThirdPersonToggle", { Text = "Third Person", Default = false, Tooltip = "Zooms out your camera, allowing you to see your character from behind." })
Toggles.ThirdPersonToggle:AddKeyPicker("ThirdPersonKeybind", { Text = "Third Person", Default = "T", Mode = "Toggle", SyncToggleState = true })
Groupboxes.Visuals_Camera:AddSlider("ThirdPersonOffsetX", { Text = "X Offset", Min = -10, Max = 10, Default = 1.5, Rounding = 1, Compact = true })
Groupboxes.Visuals_Camera:AddSlider("ThirdPersonOffsetY", { Text = "Y Offset", Min = -10, Max = 10, Default = 1,   Rounding = 1, Compact = true })
Groupboxes.Visuals_Camera:AddSlider("ThirdPersonOffsetZ", { Text = "Z Offset", Min = -10, Max = 10, Default = 5,   Rounding = 1, Compact = true })
Groupboxes.Visuals_Camera:AddToggle("ThirdPersonWallCheck", { Text = "Wall Check", Default = false, Tooltip = "Prevents third person from going through walls." })
Groupboxes.Visuals_Camera:AddDivider()
Groupboxes.Visuals_Camera:AddToggle("ViewmodelOffsetToggle", {
	Text = "Viewmodel Offset", Default = false, Tooltip = "Changes the offset of your viewmodel while holding an item.",
	Disabled = not Functions.CheckCompatability({"require"}), DisabledTooltip = Globals.IncompatibleMessage
})
Groupboxes.Visuals_Camera:AddSlider("ViewmodelOffsetX", { Text = "X Offset", Min = -10, Max = 10, Default = 0, Rounding = 1, Compact = true, Disabled = not Functions.CheckCompatability({"require"}), DisabledTooltip = Globals.IncompatibleMessage })
Groupboxes.Visuals_Camera:AddSlider("ViewmodelOffsetY", { Text = "Y Offset", Min = -10, Max = 10, Default = 0, Rounding = 1, Compact = true, Disabled = not Functions.CheckCompatability({"require"}), DisabledTooltip = Globals.IncompatibleMessage })
Groupboxes.Visuals_Camera:AddSlider("ViewmodelOffsetZ", { Text = "Z Offset", Min = -10, Max = 10, Default = 0, Rounding = 1, Compact = true, Disabled = not Functions.CheckCompatability({"require"}), DisabledTooltip = Globals.IncompatibleMessage })

Toggles.AmbientToggle:AddColorPicker("AmbientColor", { Text = "Ambient", Default = Color3.fromRGB(255, 255, 255), Transparency = 0 })
Toggles.AmbientToggle:OnChanged(function(Value)
	local OldAmbient = CurrentRooms:FindFirstChild(tostring(LocalPlayer:GetAttribute("CurrentRoom"))):GetAttribute("Ambient")
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
		Object.Density = Value and 0 or Object:GetAttribute("Density_Old")
	end
end)
Toggles.RemoveCutscenes:OnChanged(function(Value)
    local Cutscenes = Globals.MainUI.Initiator.Main_Game.RemoteListener.Cutscenes
    for _, Object in pairs(Cutscenes:GetChildren()) do
        if table.find(CutsceneNames, Object.Name) and Object:IsA("ModuleScript") or table.find(CutsceneNames, Object:GetAttribute("OriginalName")) and Object:IsA("ModuleScript") then
            Object.Name = (Value and Object.Name .. "_Disabled" or Object:GetAttribute("OriginalName"))
        end
    end
    for _, Object in pairs(FloorReplicated:GetChildren()) do
        if table.find(CutsceneNames, Object.Name) and Object:IsA("ModuleScript") or table.find(CutsceneNames, Object:GetAttribute("OriginalName")) and Object:IsA("ModuleScript") then
            Object.Name = (Value and Object.Name .. "_Disabled" or Object:GetAttribute("OriginalName"))
        end
    end
end)

Groupboxes.Visuals_Effects = Groupboxes.Visuals_LeftTab:AddTab("Effects")
Groupboxes.Visuals_Effects:AddToggle("TransparentHidingSpotsToggle", { Text = "Transparent Hiding Spots", Default = false, Tooltip = "Makes a hiding spot transparent when you enter it." })
Groupboxes.Visuals_Effects:AddSlider("TransparentHidingSpotsSlider", { Text = "Transparency", Min = 0, Max = 1, Default = 0.5, Rounding = 2, Compact = true })

local function ApplyHidingTransparency(Value, SliderValue)
	for _, Object in Objects.HidingSpots do
		local IsHiding = false
		for _, Child in Object:GetDescendants() do
			if Child.Name == "HiddenPlayer" and Child.Value == Character then
				IsHiding = true
				break
			end
		end
		for _, Part in Object:GetDescendants() do
			if Part:IsA("BasePart") and Part:GetAttribute("Transparency_Old") then
				Services.TweenService:Create(Part, TweenInfo.new(0.25, Enum.EasingStyle.Linear), {
					Transparency = (Value and IsHiding) and SliderValue or Part:GetAttribute("Transparency_Old")
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
Groupboxes.Visuals_Effects:AddToggle("DisableGlitchJumpscare",   { Text = "Disable Glitch Jumpscare",   Default = false, Tooltip = "Disables the jumpscare from 'Glitch'" })
Groupboxes.Visuals_Effects:AddToggle("DisableTimothyJumpscare",  { Text = "Disable Timothy Jumpscare",  Default = false, Tooltip = "Disables the jumpscare from 'Timothy'" })
Groupboxes.Visuals_Effects:AddToggle("DisableVoidJumpscare",     { Text = "Disable Void Jumpscare",     Default = false, Tooltip = "Disables the jumpscare from 'Void'" })
Groupboxes.Visuals_Effects:AddDivider()
Groupboxes.Visuals_Effects:AddToggle("DisableHideVignette",      { Text = "Disable Hide Vignette",      Default = false, Tooltip = "Disables the hiding screen effect." })
Groupboxes.Visuals_Effects:AddToggle("DisableFiredampEffect",    { Text = "Disable Firedamp Effect",    Default = false, Tooltip = "Disables the firedamp screen effect." })
Groupboxes.Visuals_Effects:AddToggle("DisableEntityJumpscares",  { Text = "Disable Entity Jumpscares",  Default = false, Tooltip = "Disables jumpscares from entities like Rush and Ambush." })

Toggles.DisableGlitchJumpscare:OnChanged(function(Value)
	Modules.Glitch.Name = Value and "Glitch_Disabled" or "Glitch"
end)
Toggles.DisableTimothyJumpscare:OnChanged(function(Value)
	Modules.SpiderJumpscare.Name = Value and "SpiderJumpscare_Disabled" or "SpiderJumpscare"
end)
Toggles.DisableVoidJumpscare:OnChanged(function(Value)
	if Modules.Void then Modules.Void.Name = Value and "Void_Disabled" or "Void" end
end)
Toggles.DisableHideVignette:OnChanged(function(Value)
	local Vignette = Globals.MainUI:FindFirstChild("HideVignette") or Globals.MainUI.MainFrame:FindFirstChild("HideVignette")
	if Vignette then Vignette.Image = Value and "Disabled" or "rbxassetid://6100076320" end
end)
Toggles.DisableFiredampEffect:OnChanged(function(Value)
	for _, Object in CurrentRooms:GetChildren() do
		if Value then
			Object:SetAttribute("Firedamp", false)
			for _, FiredampObj in Camera:GetChildren() do
				if FiredampObj.Name == "LiveFiredamp" then FiredampObj:Destroy() end
			end
		else
			Object:SetAttribute("Firedamp", Object:GetAttribute("Firedamp_Old"))
		end
	end
	local Old = LocalPlayer:GetAttribute("CurrentRoom")
	LocalPlayer:SetAttribute("CurrentRoom", 0)
	task.wait()
	LocalPlayer:SetAttribute("CurrentRoom", Old)
end)
Toggles.DisableEntityJumpscares:OnChanged(function(Value)
	local Jumpscares = Globals.MainUI.Initiator.Main_Game.RemoteListener:FindFirstChild("Jumpscares")
		or Globals.MainUI.Initiator.Main_Game.RemoteListener:FindFirstChild("Jumpscares_Disabled")
	if Jumpscares then
		Jumpscares.Name = Value and "Jumpscares_Disabled" or "Jumpscares"
		for _, Object in Objects.JumpscareModules do
			Object.Name = Value and (Object:GetAttribute("OriginalName") .. "_Disabled") or Object:GetAttribute("OriginalName")
		end
	end
end)

Groupboxes.Visuals_RightTab     = Tabs.Visuals:AddRightTabbox("Entities / Settings / Entity Nodes")
Groupboxes.Visuals_Entities     = Groupboxes.Visuals_RightTab:AddTab("Entities")
Groupboxes.Visuals_EntitySettings = Groupboxes.Visuals_RightTab:AddTab("Settings")

Groupboxes.Visuals_Entities:AddButton({
	Text = "All",
	Tooltip = "Selects every entity in the Entity List (ESP and notifications) and enables Notify Entities.",
	Func = function()
		local Dropdown = Options.EntityList
		if Dropdown then
			local AllValues = {}
			for _, Value in ipairs(Dropdown.Values or {}) do
				table.insert(AllValues, Value)
			end
			pcall(function() Dropdown:SetValue(AllValues) end)
			if not (type(Dropdown.Value) == "table" and next(Dropdown.Value)) then
				local Parsed = {}
				for _, Value in ipairs(Dropdown.Values or {}) do
					Parsed[Value] = true
				end
				pcall(function() Dropdown:SetValue(Parsed) end)
			end
		end
		local Toggle = Toggles.NotifyEntities
		if Toggle then pcall(function() Toggle:SetValue(true) end) end
		Library:Notify("Entity List: all selected", 3)
	end
})

Groupboxes.Visuals_Entities:AddDropdown("EntityList", {
	Text = "Entity List",
	Values = { "Rush","Bash","Scribbles","Teller","DronesStampede","Creak","Noise","Noise_TV","Balls","Portrait","Ambush","Eyes","Halt","Blitz","Lookman","Gloombat Swarm","A-60","A-120","Sally","Jeff the Killer","Groundskeeper","Monument","AR0xMBUSH","RNIUSHCG==" },
	Multi = true, AllowNull = true
})
Groupboxes.Visuals_Entities:AddToggle("NotifyEntities",    { Text = "Notify Entities",    Default = false, Tooltip = "Sends a notification when an entity spawns." })
Groupboxes.Visuals_Entities:AddDivider()
Groupboxes.Visuals_Entities:AddToggle("ShowEntityPath", {
    Text = "Show Entity Path",
    Default = false,
    Tooltip = "Shows the path of entitys."
})


-- i dont wanna hear it okay? i was sick okay let me be okay fuck u okay




Groupboxes.Visuals_Entities:AddToggle("ShowEntityPath", {
    Text = "Show Entity Path",
    Default = false,
    Tooltip = "Shows the path of entitys."
})

Groupboxes.Visuals_Entities:AddSlider("ShowEntityPathNodeTransparency", {
    Text = "Node Transparency",
    Default = 0,
    Min = 0,
    Max = 1,
    Rounding = 2,
    Compact = false,
    Tooltip = "Transparency of the path nodes when shown"
})

Groupboxes.Visuals_Entities:AddSlider("ShowEntityPathLineTransparency", {
    Text = "Line Transparency",
    Default = 0.15,
    Min = 0,
    Max = 1,
    Rounding = 2,
    Compact = false,
    Tooltip = "Transparency of the path lines"
})

Groupboxes.Visuals_Entities:AddSlider("ShowEntityPathLineThickness", {
    Text = "Line Thickness",
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

    local ShowEntityPathLinePart = Instance.new("Part")
    ShowEntityPathLinePart.Name = "PathLine"
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
        if ShowEntityPathNode:IsA("BasePart") then
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
        local ShowEntityPathNodes = ShowEntityPathRoom:FindFirstChild("PathfindNodes")
        if ShowEntityPathNodes then
            for _, ShowEntityPathNode in ipairs(ShowEntityPathNodes:GetChildren()) do
                if ShowEntityPathNode:IsA("BasePart") then
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
        if ShowEntityPathRoom:FindFirstChild("PathfindNodes") then
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
            if ShowEntityPathRoom:WaitForChild("PathfindNodes", 5) then
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
	Text = "All",
	Tooltip = "Selects every item in the Item List and enables Notify Items.",
	Func = function()
		local Dropdown = Options.NotifyItemList
		if Dropdown then
			local AllValues = {}
			for _, Value in ipairs(Dropdown.Values or {}) do
				table.insert(AllValues, Value)
			end
			pcall(function() Dropdown:SetValue(AllValues) end)
			if not (type(Dropdown.Value) == "table" and next(Dropdown.Value)) then
				local Parsed = {}
				for _, Value in ipairs(Dropdown.Values or {}) do
					Parsed[Value] = true
				end
				pcall(function() Dropdown:SetValue(Parsed) end)
			end
		end
		local Toggle = Toggles.NotifyItemsToggle
		if Toggle then pcall(function() Toggle:SetValue(true) end) end
		Library:Notify("Item List: all selected", 3)
	end
})

Groupboxes.Visuals_Entities:AddDropdown("NotifyItemList", {
	Text = "Item List",
	Values = ItemsToNotify,
	Multi = true, AllowNull = true
})
Groupboxes.Visuals_Entities:AddToggle("NotifyItemsToggle",    { Text = "Notify Items",    Default = false, Tooltip = "Sends a notification when an item spawns." })
Groupboxes.Visuals_Entities:AddToggle("NotifyItemsShowDistance",    { Text = "Show Distance",    Default = false, Tooltip = "Shows how far away the item is in the notification." })
Groupboxes.Visuals_Entities:AddDivider()
Groupboxes.Visuals_Entities:AddToggle("NotifyLibraryCode", { Text = "Notify Library Code", Default = false, Tooltip = "Automatically solves the code for the library padlock." })
Groupboxes.Visuals_Entities:AddToggle("NotifyOxygen",      { Text = "Notify Oxygen Level", Default = false, Tooltip = "Shows how much oxygen you have remaining." })
Groupboxes.Visuals_Entities:AddToggle("NotifyHasteTime",   { Text = "Notify Haste Time",   Default = false, Tooltip = "Shows how much time you have remaining before 'Haste' spawns." })

Globals.LibraryCodeFound = false
Toggles.NotifyLibraryCode:OnChanged(function(Value)
	if Value then
		local Code = Functions.GetLibraryCode()
		if Code and not Code:find("_") and not Globals.LibraryCodeFound and CurrentRooms:FindFirstChild("50") then
			local Lock = Services.Workspace:FindFirstChild("Padlock", true)
			Functions.Notify({ Title = "Padlock code found!", Body = "The code is: '" .. Code .. "'", Time = Toggles.NotifyKeepNotifications.Value and Lock or 15 })
			Globals.LibraryCodeFound = true
		end
	end
end)

Groupboxes.Visuals_EntitySettings:AddToggle("EntityChatToggle", { Text = "Notify Chat", Default = false, Tooltip = "Sends a message in the chat when an entity spawns." })
Groupboxes.Visuals_EntitySettings:AddInput("EntityChatMessage", { Text = "Message", Default = "spawned!", Numeric = false, Placeholder = "Message" })
Groupboxes.Visuals_EntitySettings:AddDivider()
Groupboxes.Visuals_EntitySettings:AddDropdown("NotifyStyle", { Text = "Notify Style", Values = { "IRT", "Doors", "STX", "Library" }, Default = 1 })
Groupboxes.Visuals_EntitySettings:AddSlider("NotifySoundVolume", { Text = "Sound Volume", Min = 0, Max = 10, Default = 3, Rounding = 1 })
Groupboxes.Visuals_EntitySettings:AddToggle("NotifyPlaySound", { Text = "Play Sound", Default = true, Tooltip = "Makes notifications play an alert sound." })
Groupboxes.Visuals_EntitySettings:AddToggle("NotifyKeepNotifications", { Text = "Keep Notifications", Default = false, Tooltip = "Certain notifications will stay on screen until they are no longer needed." })
Groupboxes.Visuals_EntitySettings:AddButton({ Text = "Test Notification", DoubleClick = false, Tooltip = "Sends a test notifcation, so you can see how your settings look.", Func = function()
	Functions.Notify({Title = "This is a test."})
end})

Groupboxes.Visuals_ESP          = Tabs.Visuals:AddRightTabbox("ESP/Settings")
Groupboxes.Visuals_ESP_Toggles  = Groupboxes.Visuals_ESP:AddTab("ESP")
Groupboxes.Visuals_ESP_Settings = Groupboxes.Visuals_ESP:AddTab("Settings")

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
	Text = "All",
	Tooltip = "Enables every ESP category and selects all entities in the Entity List.",
	Func = function()
		local ESPToggles = {
			"ObjectiveESPToggle", "DoorESPToggle", "HidingSpotESPToggle", "PlayerESPToggle",
			"ChestESPToggle", "ItemESPToggle", "CurrencyESPToggle", "LadderESPToggle",
			"MiscESPToggle", "EntityESPToggle",
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
			if not (Dropdown.Value and Dropdown.Value["Rush"]) then
				local Parsed = {}
				for _, Value in ipairs(Dropdown.Values or {}) do
					Parsed[Value] = true
				end
				pcall(function() Dropdown:SetValue(Parsed) end)
			end
		end
		Library:Notify("ESP: all categories enabled", 3)
	end
})
Groupboxes.Visuals_ESP_Toggles:AddDivider()

Groupboxes.Visuals_ESP_Toggles:AddToggle("ObjectiveESPToggle", { Text = "Objectives", Default = false, Tooltip = "Highlights all objects required to progress." })
Toggles.ObjectiveESPToggle:AddColorPicker("ObjectiveESPColor", { Text = "Objectives", Default = Color3.fromRGB(0, 255, 0), Transparency = 0 })

local ObjectiveLabels = {
	["StairwellLockpickDoor"]  = "Garage Door",
	["Mirror"]				   = "Mirror",
	["ShoppingCart"]		   = "Shopping Cart",
	["StairwellFireAlarm"]     = "Fire Alarm",
	["StairwellScrapper"]	   = "Scrapper",
	["ArchivesPackageDeposit"] = "BoxDeposit",
	["Cellar"] 				   = "Cellar",
	["ArchivesFihTank"]        = "Fih Tank",
	["KeyObtain"]              = "Door Key",
	["ElectricalKeyObtain"]    = "Electrical Key",
	["MinesGenerator"]         = "Generator",
	["FuseObtain"]             = "Generator Fuse",
	["LiveHintBook"]           = "Hint Book",
	["LiveBreakerPolePickup"]  = "Fuse Breaker",
	["LibraryHintPaper"]       = "Hint Paper",
	["PickupItem"]             = "Hint Paper",
	["CringlePresent"]         = "Present",
	["LeverForGate"]           = "Gate Lever",
	["MinesGateButton"]        = "Gate Button",
	["GardenGateButton"]       = "Gate Button",
}

Toggles.ObjectiveESPToggle:OnChanged(function(Value)
	for _, Object in Objects.Objectives do
		if Value then
			local Label = ObjectiveLabels[Object.Name]
			if Object.Name == "TimerLever" then
				Label = "Time Lever [+" .. Object:GetAttribute("AddTime") .. "s]"
			elseif Object.Name == "MinesAnchor" then
				Label = "Anchor [" .. Object:WaitForChild("Sign").TextLabel.Text .. "]"
			elseif Object.Name == "WaterPump" then
				Functions.AddESP({ Object = Object.Wheel, Text = "Water Pump", Color = Options.ObjectiveESPColor.Value }, true)
			elseif Object.Name == "VineGuillotine" then
				Functions.AddESP({ Object = Object.Lever, Text = "Vine Lever", Color = Options.ObjectiveESPColor.Value }, true)
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

Groupboxes.Visuals_ESP_Toggles:AddToggle("DoorESPToggle",       { Text = "Doors",        Default = false, Tooltip = "Highlights the next door." })
Groupboxes.Visuals_ESP_Toggles:AddToggle("HidingSpotESPToggle", { Text = "Hiding Spots", Default = false, Tooltip = "Highlights places where you can hide from entities" })
Groupboxes.Visuals_ESP_Toggles:AddToggle("PlayerESPToggle",     { Text = "Players",      Default = false, Tooltip = "Highlights other players." })
Groupboxes.Visuals_ESP_Toggles:AddToggle("ChestESPToggle",      { Text = "Chests",       Default = false, Tooltip = "Highlights objects that can contain loot." })
Groupboxes.Visuals_ESP_Toggles:AddToggle("ItemESPToggle",       { Text = "Items",        Default = false, Tooltip = "Highlights all collectable items/consumables." })
Groupboxes.Visuals_ESP_Toggles:AddToggle("CurrencyESPToggle",   { Text = "Currency",     Default = false, Tooltip = "Highlights all currency that spawns." })
Groupboxes.Visuals_ESP_Toggles:AddToggle("LadderESPToggle",     { Text = "Ladders",      Default = false, Tooltip = "Highlights ladders that can be used to disable the anticheat." })
Groupboxes.Visuals_ESP_Toggles:AddToggle("MiscESPToggle",       { Text = "Misc",         Default = false, Tooltip = "Highlights miscellaneous objects that can be used to disable the anticheat." })
Groupboxes.Visuals_ESP_Toggles:AddDivider()
Groupboxes.Visuals_ESP_Toggles:AddDropdown("EntityESPOptions",     { 
	Text = "Entity List",
	Values = { "Rush","Bash","Scribbles","Teller","DronesStampede","Creak","Noise","Noise_TV","Balls","Portrait","Ambush","Eyes","Dupe","Figure","Blitz","Lookman","Snare","Giggle","Gloombat Eggs","Grumble","A-60","A-120","Sally","Jeff the Killer","Groundskeeper","Mandrake Hole","Monument","Bramble","AR0xMBUSH","RNIUSHCG==" },
	Multi = true,
	AllowNull = true
})
Groupboxes.Visuals_ESP_Toggles:AddToggle("EntityESPToggle",     { Text = "Entities",      Default = false, Tooltip = "Highlights all entities that spawn." })

Toggles.DoorESPToggle:AddColorPicker("DoorESPColor",           { Text = "Doors",        Default = Color3.fromRGB(0, 200, 255),  Transparency = 0 })
Toggles.HidingSpotESPToggle:AddColorPicker("HidingSpotESPColor", { Text = "Hiding Spots", Default = Color3.fromRGB(255, 170, 0),  Transparency = 0 })
Toggles.PlayerESPToggle:AddColorPicker("PlayerESPColor",       { Text = "Players",      Default = Color3.fromRGB(255, 255, 255), Transparency = 0 })
Toggles.ChestESPToggle:AddColorPicker("ChestESPColor",         { Text = "Chests",       Default = Color3.fromRGB(255, 255, 0),   Transparency = 0 })
Toggles.ItemESPToggle:AddColorPicker("ItemESPColor",           { Text = "Items",        Default = Color3.fromRGB(170, 0, 255),   Transparency = 0 })
Toggles.CurrencyESPToggle:AddColorPicker("CurrencyESPColor",   { Text = "Currency",     Default = Color3.fromRGB(255, 255, 0),   Transparency = 0 })
Toggles.LadderESPToggle:AddColorPicker("LadderESPColor",       { Text = "Ladders",      Default = Color3.fromRGB(3, 67, 71), Transparency = 0 })
Toggles.MiscESPToggle:AddColorPicker("MiscESPColor",           { Text = "Misc",         Default = Color3.fromRGB(255, 255, 255), Transparency = 0 })
Toggles.EntityESPToggle:AddColorPicker("EntityESPColor",       { Text = "Entities",     Default = Color3.fromRGB(255, 0, 0),     Transparency = 0 })

local HidingSpotLabels = {
	Wardrobe = "Closet", ["Backdoor_Wardrobe"] = "Closet", Toolshed = "Closet",
	RetroWardrobe = "Closet", ["Wardrobe-FOOLS26"] = "Closet",
	Locker_Large = "Locker", Rooms_Locker = "Hiding_Spot", Rooms_Locker_Fridge = "Locker",
	Bed = "Bed", Double_Bed = "Double Bed", CircularVent = "Vent", Dumpster = "Dumpster"
}
local ChestLabels = {
	ChestBox = true, ChestBoxLocked = true, Toolbox = true, Toolbox_Locked = true,
	Chest_Vine = "Vine Chest", Toolshed_Small = "Toolshed", Locker_Small_Locked = "Locked Item Locker", MouseHole = "Mouse"
}
local EntityESPLabels = {
	JeffTheKiller = "Jeff the Killer", GiggleCeiling = "Giggle",
	Snare = "Snare", GrumbleRig = "Grumble",
	Drakobloxxer = "Drakobloxxer", Hole = "Mandrake Hole", Groundskeeper = "Groundskeeper",
	LiveEntityBramble = "Bramble", Figure = "Figure", FigureRig = "Figure", FigureRagdoll = "Figure",
	FakeDoor = "Dupe", DoorFake = "Dupe"
}

local NodeEntities = {
	Rush = true, Bash = true, Scribbles = true, DronesStampede = true, Ambush = true, Eyes = true, Blitz = true, Lookman = true, ["A-60"] = true, ["A-120"] = true, Sally = true, ["Jeff The Killer"] = true, Monument = true, ["AR0xMBUSH"] = true, ["RNIUSHCG=="] = true
}

Toggles.DoorESPToggle:OnChanged(function(Value)
	for _, Object in Objects.Doors do
		if Value then Functions.AddESP({ Object = Object, Text = "Door " .. Functions.GetDoorNumber(Object), Color = Options.DoorESPColor.Value }, true)
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
			if Value and Player:GetAttribute("Alive") == true then
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
			if Object.Name == "ChestBox" or Object.Name == "ChestBoxLocked" then
				Label = Object:GetAttribute("Locked") and "Locked Chest" or "Chest"
			elseif Object.Name == "Toolbox" or Object.Name == "Toolbox_Locked" then
				Label = Object:GetAttribute("Locked") and "Locked Toolbox" or "Toolbox"
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
			local Label = ItemNames[Object.Name] or (Object.Name == "Green_Herb" and "Green Herb")
			if Label then
				Functions.AddESP({ Object = Object, Text = Label, Color = Options.ItemESPColor.Value }, Object:GetAttribute("ParentRoom") ~= nil)
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
			if Object.Name == "GoldPile" and Object:GetAttribute("GoldValue") then
				Label = "Gold Pile [" .. Object:GetAttribute("GoldValue") .. "]"
			elseif Object.Name == "StardustPickup" then
				Label = "Stardust Pile"
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
		if Value then Functions.AddESP({ Object = Object, Text = "Ladder", Color = Options.LadderESPColor.Value }, true)
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
			if Object.Name == "StairwellLockpickDoor" or Object.Name == "StiarwellLockpickDoor" then
				Label = "Garage Door"
			elseif Object.Name == "StairwellFireAlarm" then
				Label = "Fire Alarm"
			elseif Object.Name == "ShoppingCart" then
				Label = "Shopping Cart"
			elseif Object.Name == "ArchivesFihTank" or Object.Name == "ArchivesFishTank" then
				Label = "Fish Tank"
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

Groupboxes.Visuals_ESP_Settings:AddToggle("ESPRainbow",     { Text = "Rainbow Effect", Default = false, Tooltip = "Makes the esp objects change colour like a rainbow." })
Groupboxes.Visuals_ESP_Settings:AddToggle("ESPShowDistance",{ Text = "Show Distance",  Default = true,  Tooltip = "Shows how far away your character is from the object." })
Groupboxes.Visuals_ESP_Settings:AddDivider()
Groupboxes.Visuals_ESP_Settings:AddSlider("ESPFillTransparency",        { Text = "Fill Transparency",         Min = 0, Max = 1, Default = 0.75, Rounding = 2, Compact = true })
Groupboxes.Visuals_ESP_Settings:AddSlider("ESPOutlineTransparency",     { Text = "Outline Transparency",      Min = 0, Max = 1, Default = 0,    Rounding = 2, Compact = true })
Groupboxes.Visuals_ESP_Settings:AddSlider("ESPTextTransparency",        { Text = "Text Transparency",         Min = 0, Max = 1, Default = 0,    Rounding = 2, Compact = true })
Groupboxes.Visuals_ESP_Settings:AddSlider("ESPTextOutlineTransparency", { Text = "Text Outline Transparency", Min = 0, Max = 1, Default = 0,    Rounding = 2, Compact = true })
Groupboxes.Visuals_ESP_Settings:AddSlider("ESPFadeTime",                { Text = "Fade Time",                 Min = 0, Max = 1, Default = 0.25, Rounding = 2, Compact = true })
Groupboxes.Visuals_ESP_Settings:AddSlider("ESPRenderLimit",             { Text = "Render Limit",              Min = 30, Max = 240, Default = 240, Rounding = 0, Compact = true })
Groupboxes.Visuals_ESP_Settings:AddSlider("ESPTextSize",                { Text = "Text Size",                 Min = 12, Max = 24, Default = 20, Rounding = 0, Compact = true })
Groupboxes.Visuals_ESP_Settings:AddDropdown("ESPTextFont", {
	Text = "Text Font",
	Values = { "Legacy","Arial","ArialBold","SourceSans","SourceSansBold","SourceSansLight","SourceSansItalic","Bodoni","Garamond","Cartoon","Code","Highway","SciFi","Arcade","Fantasy","Antique","SourceSansSemibold","Gotham","GothamMedium","GothamBold","GothamBlack","AmaticSC","Bangers","Creepster","DenkOne","Fondamento","FredokaOne","GrenzeGotisch","IndieFlower","JosefinSans","Jura","Kalam","LuckiestGuy","Merriweather","Michroma","Nunito","Oswald","PatrickHand","PermanentMarker","Roboto","RobotoCondensed","RobotoMono","Sarpanch","SpecialElite","TitilliumWeb","Ubuntu","BuilderSans","BuilderSansMedium","BuilderSansBold","BuilderSansExtraBold","Arimo","ArimoBold" },
	Default = 12
})
Groupboxes.Visuals_ESP_Settings:AddDivider()
Groupboxes.Visuals_ESP_Settings:AddDropdown("ESPTracersOrigin",  { Text = "Tracer Origin", Values = { "Bottom","Center","Top","Mouse" }, Default = 1 })
Groupboxes.Visuals_ESP_Settings:AddSlider("ESPTracerThickness",  { Text = "Tracer Thickness", Min = 0.5, Max = 2, Default = 0.75, Rounding = 2, Compact = true })
Groupboxes.Visuals_ESP_Settings:AddToggle("ESPTracersToggle",    { Text = "Enable Tracers", Default = false, Tooltip = "Draws a line to highlighted objects." })
Groupboxes.Visuals_ESP_Settings:AddDivider()
Groupboxes.Visuals_ESP_Settings:AddSlider("ESPArrowsRadius",     { Text = "Arrow Radius", Min = 100, Max = 500, Default = 250, Rounding = 0, Compact = true })
Groupboxes.Visuals_ESP_Settings:AddToggle("ESPArrowsToggle",     { Text = "Enable Arrows", Default = false, Tooltip = "Shows arrow that point to off-screen objects." })

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
IRT.ESPLibrary:SetTracerOrigin("Bottom")
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
	Title = "Compatability/Risk Warning",
	Text = "Features highlighted in red are risky / dont work in the current floor.",
})
Groupboxes.Floors_Automation = Tabs.Floors:AddRightGroupbox("Automation")

Groupboxes.Floors_Automation:AddToggle("SkipSeekMines", {
	Text = "Skip Seek (Mines)",
	Default = false,
	Tooltip = "Skips the entire Seek sections.",
	Risky = Floor ~= "Mines"
})

Toggles.SkipSeekMines:OnChanged(function(Value)
	if Value then
		if Floor ~= "Mines" then
			return
		end
		task.spawn(function()
			local MinesSkipSeekCurrentRooms

			repeat
				if not Toggles.SkipSeekMines.Value then
					return
				end

				MinesSkipSeekCurrentRooms = workspace:FindFirstChild("CurrentRooms")
				task.wait()
			until MinesSkipSeekCurrentRooms

			local MinesSkipSeekStartRoom

			repeat
				if not Toggles.SkipSeekMines.Value then
					return
				end

				MinesSkipSeekCurrentRooms = workspace:FindFirstChild("CurrentRooms")

				if MinesSkipSeekCurrentRooms then
					MinesSkipSeekStartRoom = MinesSkipSeekCurrentRooms:FindFirstChild("42")
				end

				task.wait()
			until MinesSkipSeekStartRoom

			local MinesSkipSeekStartDoor

			repeat
				if not Toggles.SkipSeekMines.Value then
					return
				end

				MinesSkipSeekStartDoor = MinesSkipSeekStartRoom:FindFirstChild("Door", true)
				task.wait()
			until MinesSkipSeekStartDoor

			repeat
				if not Toggles.SkipSeekMines.Value then
					return
				end

				task.wait()
			until MinesSkipSeekStartDoor:GetAttribute("Opened") == true

			if Character and Character:GetAttribute("Minecarting") == true then
				Character:SetAttribute("Minecarting", false)
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

					MinesSkipSeekCurrentRooms = workspace:FindFirstChild("CurrentRooms")

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

					MinesSkipSeekDoor = MinesSkipSeekRoom:FindFirstChild("Door", true)
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
				until MinesSkipSeekDoor:GetAttribute("Opened") == true

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

Groupboxes.Floors_Automation:AddToggle("AutoSteerMinecart", {
	Text = "Auto Steer Minecart", Default = false, Tooltip = "Automatically completes the minecart chase.",
	Disabled = not Functions.CheckCompatability({"require"}), DisabledTooltip = Globals.IncompatibleMessage
})
Groupboxes.Floors_Automation:AddSlider("AutoSteerMinecartTurnDistance", {
	Text = "Turn Distance", Min = 20, Max = 40, Default = 30, Rounding = 0,
	Disabled = not Functions.CheckCompatability({"require"}), DisabledTooltip = Globals.IncompatibleMessage
})
Groupboxes.Floors_Automation:AddSlider("AutoSteerMinecartDuckDistance", {
	Text = "Crouch Distance", Min = 20, Max = 40, Default = 30, Rounding = 0,
	Disabled = not Functions.CheckCompatability({"require"}), DisabledTooltip = Globals.IncompatibleMessage
})
Groupboxes.Floors_Automation:AddDivider()
Groupboxes.Floors_Automation:AddToggle("RoomsAutoWalk",             { Text = "Auto Rooms",       Default = false, Tooltip = "Automatically moves and hides from entities in The Rooms." })
Groupboxes.Floors_Automation:AddSlider("RoomsAutoWalkPathfindTimeout", { Text = "Pathfind Timeout", Min = 0.5, Max = 3, Default = 1, Rounding = 1 })
Groupboxes.Floors_Automation:AddToggle("RoomsAutoWalkIgnoreA60",    { Text = "Ignore A-60",      Default = false, Tooltip = "Continues to walk if entity 'A-60' is present, enables position spoof automatically." })
Groupboxes.Floors_Automation:AddToggle("RoomsAutoWalkShowPathToggle", { Text = "Show Path",       Default = false, Tooltip = "Shows the current path of rooms auto-walk." })
Groupboxes.Floors_Automation:AddToggle("RoomsAutoWalkSpoofFootsteps", {
    Text = "Spoof Footsteps", Default = false, Tooltip = "Makes it appear as if your character is walking normally.",
    Disabled = not Functions.CheckCompatability({"hookmetamethod", "newcclosure", "getnamecallmethod"}), DisabledTooltip = Globals.IncompatibleMessage
})

Toggles.RoomsAutoWalk:OnChanged(function()
	for _, Object in Globals.RoomsNodesFolder:GetChildren() do
		if Object.Name == "PathNode" then Object:Destroy() end
	end
end)
Toggles.RoomsAutoWalkShowPathToggle:AddColorPicker("RoomsAutoWalkShowPathColor", { Text = "Path", Default = Color3.fromRGB(0, 255, 0), Transparency = 0 })
Toggles.RoomsAutoWalkShowPathToggle:OnChanged(function(Value)
	for _, Object in Globals.RoomsNodesFolder:GetChildren() do
		if Object.Name == "PathNode" then Object.Transparency = Value and 0.5 or 1 end
	end
end)
Options.RoomsAutoWalkShowPathColor:OnChanged(function(Value)
	for _, Object in Globals.RoomsNodesFolder:GetChildren() do
		if Object.Name == "PathNode" then Object.Color = Value end
	end
end)

Functions.RoomsAutoWalk = {}
Functions.RoomsAutoWalk.GetNearestHidingSpot = function()
	local Nearest = { Distance = math.huge, Object = nil }
	for _, Object in Objects.HidingSpots do
		if Object.PrimaryPart and Object:FindFirstChild("HidePrompt") then
			local Distance = LocalPlayer:DistanceFromCharacter(Object.PrimaryPart.Position)
			if Distance < Nearest.Distance and Object.PrimaryPart.Position.Y > -10 then
				local HiddenPlayer = Object:FindFirstChild("HiddenPlayer", true)
				if HiddenPlayer and not HiddenPlayer.Value then
					Nearest.Distance = Distance
					Nearest.Object = Object
				end
			end
		end
	end
	return Nearest.Object
end

local RoomsEntityList = { "RushMoving","AmbushMoving","BackdoorRush","A60","A120","CustomEntity","GlitchRush","GlitchAmbush" }
Functions.RoomsAutoWalk.GetPathfindTarget = function()
	for _, Object in Services.Workspace:GetChildren() do
		if table.find(RoomsEntityList, Object.Name) and Object.PrimaryPart then
			local Y = Object.PrimaryPart.Position.Y
			if Y > -10 and Y < 150 then
				if Object.Name == "A60" and not Toggles.RoomsAutoWalkIgnoreA60.Value or Object.Name ~= "A60" then
					return Functions.RoomsAutoWalk.GetNearestHidingSpot() or CurrentRooms[tostring(LatestRoom.Value)]:FindFirstChild("RoomExit")
				end
			end
		end
	end
	return CurrentRooms[tostring(LatestRoom.Value)]:FindFirstChild("RoomExit")
end

Connections.RoomsAutoWalkHandler = Services.RunService.Heartbeat:Connect(function()
	if Floor ~= "Rooms" or not Toggles.RoomsAutoWalk.Value or Globals.RoomsAutoWalkActive or not CollisionPart or LatestRoom.Value >= 1000 then return end
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
	if TargetPart.Name == "RoomExit" then
		TargetPosition = TargetPart.Position
	elseif TargetPart:FindFirstChild("HidePrompt") then
		for _, Part in TargetPart:GetDescendants() do
			if Part:IsA("BasePart") then Part.CanCollide = false end
		end
		TargetPosition = TargetPart.PrimaryPart.Position
	end

	if CollisionPart.Anchored and not TargetPart:FindFirstChild("HidePrompt") then
		Character:SetAttribute("Hiding", true)
		RemotesFolder.CamLock:FireServer()
		Character:SetAttribute("Hiding", false)
	end

	local CurrentRoom = CurrentRooms[tostring(LatestRoom.Value)]
	if CurrentRoom:FindFirstChild("Door") then
		CurrentRoom.Door.Door.CanCollide = false
	end

	if not TargetPosition or LocalPlayer:DistanceFromCharacter(TargetPosition) >= 750 then
		Globals.RoomsAutoWalkActive = false
		return
	end

	Path:ComputeAsync(CollisionPart.Position, TargetPosition)
	local Waypoints = Path:GetWaypoints()

	if #Waypoints == 0 then
		local RoomExit = CurrentRoom:FindFirstChild("RoomExit")
		if RoomExit then Humanoid:MoveTo(RoomExit.Position) end
		Globals.RoomsAutoWalkActive = false
		return
	end

	for _, Node in Globals.RoomsNodesFolder:GetChildren() do
		if Node.Name == "PathNode" then Node:Destroy() end
	end

	for _, Waypoint in Waypoints do
		local Block = Instance.new("Part", Globals.RoomsNodesFolder)
		Block.Transparency = Toggles.RoomsAutoWalkShowPathToggle.Value and 0.5 or 1
		Block.Size = Vector3.one
		Block.Position = Waypoint.Position
		Block.Shape = Enum.PartType.Ball
		Block.CanCollide = false
		Block.Anchored = true
		Block.Name = "PathNode"
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
			if NewTarget and NewTarget:FindFirstChild("HidePrompt") and not TargetPart:FindFirstChild("HidePrompt") then
				Finished = true return
			end
			if TargetPart:FindFirstChild("HidePrompt") then
				local HidePrompt = TargetPart:FindFirstChild("HidePrompt")
				if LocalPlayer:DistanceFromCharacter(TargetPosition) < HidePrompt.MaxActivationDistance
					and Character:GetAttribute("Hiding") ~= true
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
				local StuckBlock = Instance.new("Part", Globals.RoomsNodesFolder)
				StuckBlock.Transparency = 1
				StuckBlock.Size = Vector3.one
				StuckBlock.CFrame = Collision.CFrame
				StuckBlock.Shape = Enum.PartType.Ball
				StuckBlock.CanCollide = false
				StuckBlock.Anchored = true
				StuckBlock.Name = "StuckPart"
				local Modifier = Instance.new("PathfindingModifier", StuckBlock)
				Modifier.Label = "StuckPart"
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
		if Object.Name == "StuckPart" then Object:Destroy() end
	end

	if Room:GetAttribute("RawName") and string.find(Room:GetAttribute("RawName"), "Eyestalk") then
        local PreviousNode = nil

		local function CreateEyestalkNode(WaypointPos)
			local NewNode = Instance.new("Part")
			NewNode.Size = Vector3.one
			NewNode.Transparency = 1
			NewNode.Parent = Globals.SeekNodesFolder
			NewNode.Anchored = true
			NewNode.Position = WaypointPos
			NewNode.CanCollide = false
			NewNode.Name = "SeekLightNode"

			local PrevNode = PreviousNode or NewNode
			PreviousNode = NewNode

			local NewBeam = Instance.new("Beam")
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

			local A0 = Instance.new("Attachment", NewNode)
			local A1 = Instance.new("Attachment", PrevNode)
			NewBeam.Attachment0 = A0
			NewBeam.Attachment1 = A1

			table.insert(Objects.EyestalkHighlights, NewBeam)
		end

		Room:WaitForChild("RoomEntrance", 9e9)
		Room:WaitForChild("RoomExit", 9e9)

		while not Room:GetAttribute("PathFound") do
			if Toggles.ShowEyestalkPathToggle.Value then
				local EyePath = game:GetService("PathfindingService"):CreatePath({
					AgentCanJump = false, AgentCanClimb = false, WaypointSpacing = 2, AgentRadius = 1, AgentHeight = 1
				})
				EyePath:ComputeAsync(RootPart.Position, Room.RoomExit.Position)
				if EyePath.Status == Enum.PathStatus.Success then
					Room:SetAttribute("PathFound", true)
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

Groupboxes.Floors_Completion = Tabs.Floors:AddRightGroupbox("Completion")
Groupboxes.Floors_Completion:AddButton({
    Text = "Auto Complete Dam Seek",
    Tooltip = "Automatically teleports to and interacts with each water pump.",
    Func = function()
        if LatestRoom.Value < 100 or Floor ~= "Mines" then
            Functions.Notify({Title = "You must be in Room 200 to do this."})
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
                if Object.Name == "WaterPump" and Object:GetAttribute("IRT_Completed") ~= true then
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

                local Prompt = Pump:FindFirstChild("ValvePrompt", true)
                if Prompt then
                    Functions.ForceFirePrompt(Prompt)
                end

                if Pump:GetAttribute("IRT_Completed") then
                    break
                end
            end
        end

        Functions.Notify({Title = "Attempting to complete the valves.", Body = "Please wait."})
        while task.wait(0.1) do
            local Pump = GetNextPump()
            if Pump then
                HandlePump(Pump)
            else
                break
            end
        end
        Functions.Notify({Title = "Successfully completed the valves."})
    end
})

Groupboxes.Floors_Completion:AddButton({
    Text = "Auto Complete Cringle",
    Tooltip = "Instantly completes the quest.",
    Func = function()
        local TouchPart = CurrentRooms:FindFirstChild("RippleExitDoor", true)
        if TouchPart then
            Character:PivotTo(TouchPart:GetPivot())
        end
    end
})

Groupboxes.Floors_Visuals = Tabs.Floors:AddLeftGroupbox("Visuals")
Groupboxes.Floors_Visuals:AddToggle("ShowSeekPathToggle", {
	Text = "Show Seek Path", Default = false, Tooltip = "Shows you the correct path in seek chases.",
	Risky = Floor ~= "Mines"
})
Toggles.ShowSeekPathToggle:AddColorPicker("ShowSeekPathColor", { Text = "Seek Path", Default = Color3.fromRGB(0, 255, 0), Transparency = 0 })

local function UpdateBeamVisibility(BeamTable, ColorKey, Visible)
	local Vis = Visible and 0 or 1
	local Seq = NumberSequence.new({ NumberSequenceKeypoint.new(0, Vis), NumberSequenceKeypoint.new(1, Vis) })
	for _, Beam in BeamTable do Beam.Transparency = Seq end
end
local function UpdateBeamColor(BeamTable, Value)
	local Seq = ColorSequence.new({ ColorSequenceKeypoint.new(0, Value), ColorSequenceKeypoint.new(1, Value) })
	for _, Beam in BeamTable do Beam.Color = Seq end
end

Toggles.ShowSeekPathToggle:OnChanged(function(V)  UpdateBeamVisibility(Objects.SeekHighlights, "ShowSeekPathColor", V) end)
Options.ShowSeekPathColor:OnChanged(function(V)   UpdateBeamColor(Objects.SeekHighlights, V) end)

Groupboxes.Floors_Visuals:AddToggle("ShowEyestalkPathToggle", {
	Text = "Show Eyestalk Path", Default = false, Tooltip = "Shows you the correct path in the eyestalk chase.",
	Risky = Floor ~= "Garden"
})
Toggles.ShowEyestalkPathToggle:AddColorPicker("ShowEyestalkPathColor", { Text = "Eyestalk Path", Default = Color3.fromRGB(0, 255, 0), Transparency = 0 })
Toggles.ShowEyestalkPathToggle:OnChanged(function(V) UpdateBeamVisibility(Objects.EyestalkHighlights, "ShowEyestalkPathColor", V) end)
Options.ShowEyestalkPathColor:OnChanged(function(V)  UpdateBeamColor(Objects.EyestalkHighlights, V) end)

Groupboxes.Floors_Bypass = Tabs.Floors:AddLeftGroupbox("Bypass")
Groupboxes.Floors_Bypass:AddToggle("RemoveSeekTrigger", {
	Text = "Delete Seek Trigger", Default = false, Tooltip = "Diables the 'Seek' chase trigger.",
	Risky = not (Floor == "Fools" or Floor == "OldHotel"),
	Disabled = not Functions.CheckCompatability({"firetouchinterest"}), DisabledTooltip = Globals.IncompatibleMessage
})
Groupboxes.Floors_Bypass:AddToggle("RemoveFigure", {
	Text = "Delete Figure", Default = false, Tooltip = "Completely removes the entity 'Figure' (doesn't always work).",
	Risky = not (Floor == "Fools" or Floor == "OldHotel" or Floor == "Mines"),
	Disabled = not Functions.CheckCompatability({"isnetworkowner"}), DisabledTooltip = Globals.IncompatibleMessage
})
Groupboxes.Floors_Bypass:AddToggle("AutoRevive", {
	Text = "Infinite Revives", Default = false, Tooltip = "Automatically revives after dying, with unlimited respawns.",
	Risky = not (Floor == "Fools" or Floor == "OldHotel")
})
Groupboxes.Floors_Bypass:AddToggle("FigureGodmode", {
	Text = "Figure Godmode", Default = false, Tooltip = "Prevents 'Figure' from hurting you.",
	Risky = not (Floor == "Fools" or Floor == "OldHotel")
})
Groupboxes.Floors_Bypass:AddDivider()
Groupboxes.Floors_Bypass:AddToggle("RemoveBasementGate",  { Text = "Remove Basement Gate",   Default = false, Tooltip = "Removes the gate from basement rooms.",            Risky = not (Floor == "Fools" or Floor == "OldHotel") })
Groupboxes.Floors_Bypass:AddToggle("RemovePaintingsDoor", { Text = "Remove Paintings Door",  Default = false, Tooltip = "Removes the fireplace doors from painting rooms.", Risky = not (Floor == "Fools" or Floor == "OldHotel") })
Groupboxes.Floors_Bypass:AddToggle("RemoveSkeletonDoor",  { Text = "Remove Skeleton Door",   Default = false, Tooltip = "Removes the skeleton door from the infirmary.",    Risky = Floor ~= "Fools" })

local ObstructionNames = { ThingToOpen = "RemoveBasementGate", MovingDoor = "RemovePaintingsDoor", Wax_Door = "RemoveSkeletonDoor" }
for ObjName, ToggleName in ObstructionNames do
	Toggles[ToggleName]:OnChanged(function(Value)
		for _, Object in Objects.Obstructions do
			if Object.Name == ObjName then
				Object:PivotTo(Value and CFrame.new(-10000, -10000, -10000) or Object:GetAttribute("OriginalPosition"))
			end
		end
	end)
end

Groupboxes.Floors_Farming = Tabs.Floors:AddLeftGroupbox("Farming")
Groupboxes.Floors_Farming:AddToggle("KnobFarm", {
    Text = "Knob Farm",
    Default = false,
    Tooltip = "Automatically gains knobs for you, dies and revives repeatedly.",
	Risky = Floor ~= "Ballz",
})

Groupboxes.Floors_Farming:AddButton({
    Text = "Start Knob Farm",
    Tooltip = "Starts farming knobs, click this when you have enough gold.",
    Func = function()
		if LatestRoom.Value ~= 0 then
			Functions.Notify({Title = "You must be in Room 0 to use this."})
			return
		end

		if LocalPlayer.PlayerGui:FindFirstChild("TopbarUI") then 
			local GoldCount = LocalPlayer.PlayerGui.TopbarUI.Topbar.StatsTopbarHandler.StatModules.Gold.GoldVal
			if GoldCount.Value <= 0 then
				Functions.Notify({Title = "You must have gold to do this."})
				return
			end
		end

        Globals.KnobFarmStarted = true
    end
})

Groupboxes.Floors_Farming:AddDivider()
Groupboxes.Floors_Farming:AddButton({
	Text = "Start Death Farm",
	DoubleClick = true,
	Tooltip = "Automatically farms deaths, joining new runs.",
	Func = function()
		loadstring(game:HttpGet("https://raw.githubusercontent.com/bocaj111004/Abysall/refs/heads/main/Scripts/DeathFarm.luau"))()
	end,

	Disabled = not Functions.CheckCompatability({"fireproximityprompt", "firesignal"}),
	DisabledTooltip = Globals.ImcompatibleMessage
})
Groupboxes.Floors_Farming:AddButton({
	Text = "Copy Death Farm Loadstring",
	DoubleClick = false,
	Tooltip = "Copies the death farm loadstring to your clipboard.",
	Func = function()
		toclipboard([==[
			loadstring(game:HttpGet("https://raw.githubusercontent.com/bocaj111004/Abysall/refs/heads/main/Scripts/DeathFarm.luau"))()
		]==])
		Library:Notify("Loadstring has been copied to your clipboard.")
	end,

	Disabled = not Functions.CheckCompatability({"fireproximityprompt", "firesignal"}),
	DisabledTooltip = Globals.ImcompatibleMessage
})

Toggles.KnobFarm:OnChanged(function(Value)
    if Value then
        Functions.Notify({Title = "Please collect some gold to earn knobs.", Body = "Click 'Start Knob Farm' when you're ready."})
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
			if Functions.CheckCompatability({"replicatesignal"}) then
				IRT.Environment.replicatesignal(LocalPlayer.Kill)
			else
				LocalPlayer.Character.Humanoid.Health = 0
			end
			while task.wait() do
				if LocalPlayer:GetAttribute("Alive") then
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
if Functions.CheckCompatability({"hookmetamethod", "newcclosure", "getnamecallmethod"}) then
	MainHook = IRT.Environment.hookmetamethod(game, "__namecall", IRT.Environment.newcclosure(function(Self, ...)
		local Args = { ... }
		if IRT and IRT.Environment then
			local Method = IRT.Environment.getnamecallmethod()

			if Self.Name == "Crouch" and Method == "FireServer" then
				if Toggles.CrouchSpoof.Value or Toggles.PositionSpoof.Value then
					Args[1] = true
				end
				Args[2] = true
			end

			if Self.Name == "ClutchHeartbeat" and Method == "FireServer" and Toggles.AutoHeartbeatMinigame.Value or Self.Name == "HideMonster" and Method == "FireServer" and Toggles.AutoHeartbeatMinigame.Value then
				return
			end

			if Self.Name == "MotorReplication" and Method == "FireServer" then
				local DoBypass = (Toggles.BypassEyes.Value and Globals.IsEyes) or (Toggles.BypassLookman.Value and Globals.IsLookman)
				if DoBypass then
					if Floor == "Fools" or Floor == "OldHotel" then
						Args[1] = 0 Args[2] = (Globals.SpoofOffset == 200 and 65 or -65) Args[3] = 0 Args[4] = false
					else
						Args[1] = -650
					end
				end
			end
		end
		return MainHook(Self, table.unpack(Args))
	end))

    OtherHook = IRT.Environment.hookmetamethod(game, "__index", IRT.Environment.newcclosure(function(Self, Property)
        local Real = OtherHook(Self, Property)

        if Property == "MoveDirection" and Self == Humanoid and Globals.RoomsAutoWalkActive and Toggles.RoomsAutoWalkSpoofFootsteps.Value and Floor == "Rooms" and not Character:GetAttribute("Hiding") then
            return RootPart.CFrame.LookVector
        end
        
        return Real
    end))
end

if Services.ReplicatedStorage:FindFirstChild("ModulesClient") then
	ClientModules = Services.ReplicatedStorage.ModulesClient
else
	ClientModules = Services.ReplicatedStorage.ClientModules
end

Modules = {
	Glitch         = ClientModules.EntityModules.Glitch,
	Shade          = ClientModules.EntityModules.Shade,
	Void           = ClientModules.EntityModules:FindFirstChild("Void"),
	SpiderJumpscare = nil,
	A90            = nil,
	Screech        = nil,
	Dread          = nil,
	GlitchScreech  = nil,
}

local CharacterOldConnectionKeys = {
	"MainHandler", "JumpHandler", "SlideHandler", "LibraryCodeHandler1", "LibraryCodeHandler2",
	"OxygenConnection", "AnimationHandler", "AutoHideConnection", "AutoReviveHandler",
	"SHMFixer", "AnticheatDisabler", "AnticheatEnableDetector1", "AnticheatEnableDetector2",
	"AutoSteerMinecartDuckHandler", "AutoSolveAnchorsConnection", "InfiniteJumpsConnection1", "InfiniteJumpsConnection2",
	"FootstepHandler"
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

	while not LocalPlayer.PlayerGui:FindFirstChild("MainUI") do
		task.wait()
	end

	Character = NewCharacter
	Humanoid = NewCharacter:WaitForChild("Humanoid", 9e9)
	RootPart = NewCharacter:FindFirstChild("HumanoidRootPart")
	Camera   = Services.Workspace.CurrentCamera

	Globals.OldCamera = Camera
	Globals.MainUI = LocalPlayer.PlayerGui.MainUI

	Collision = NewCharacter:WaitForChild("Collision")
	CollisionPart  = NewCharacter:FindFirstChild("CollisionPart") or NewCharacter:FindFirstChild("Collision")
	CollisionClone = Collision:Clone()
	CollisionClone.Parent = NewCharacter
	CollisionClone.Name = "CollisionClone"
	CollisionClone.Massless = true

	CollisionPartClone = CollisionPart:Clone()
	CollisionPartClone.Parent = NewCharacter
	CollisionPartClone.Name = "CollisionPartClone"
	CollisionPartClone.CanCollide = false
	CollisionPartClone.Massless = true

	if CollisionPartClone:FindFirstChild("CollisionCrouch") then
		CollisionPartClone.CollisionCrouch:Destroy()
	end

	Character:SetAttribute("SpeedBoost", 0)
	Character:SetAttribute("SpeedBoostBehind", 0)
	Character:SetAttribute("SpeedBoostExtra", 0)

	OldJump  = NewCharacter:GetAttribute("CanJump")
	OldSlide = NewCharacter:GetAttribute("CanSlide")

	if Toggles.EnableCharacterJump.Value  then Character:SetAttribute("CanJump",  true) end
	if Toggles.EnableCharacterSlide.Value then Character:SetAttribute("CanSlide", true) end

	if Functions.CheckCompatability({"require"}) then
		Main_Game = IRT.Environment.require(Globals.MainUI.Initiator.Main_Game)
	end

	if Main_Game and Toggles.RemoveCameraBobbing.Value then
		Main_Game.spring.Speed = 9e9
	end

	if Main_Game and Functions.CheckCompatability({"require"}) then
		local Controls = require(LocalPlayer.PlayerScripts.PlayerModule):GetControls()
		local OriginalGetMoveVector = Controls.GetMoveVector
		Globals.OriginalGetMoveVector = OriginalGetMoveVector
		Controls.GetMoveVector = function(...)
			if Toggles.AutoSteerMinecart.Value and Floor == "Mines" then
				local Node = Globals.NearestTurnNode
				if Node and Functions.GetMinecart() then
					local Turn = Node:GetAttribute("Turn")
					return Turn == "Left" and Vector3.new(-1, 0, 0) or Turn == "Right" and Vector3.new(1, 0, 0) or Vector3.zero
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
	Modules.A90             = UIModules:FindFirstChild("A90")
	Modules.Screech         = UIModules.Screech
	Modules.Dread           = UIModules:FindFirstChild("Dread")
	Modules.SpiderJumpscare = UIModules.SpiderJumpscare

	if Toggles.RemoveScreech.Value    then Modules.Screech.Name = "Screech_Disabled" print ("screech gone") end
	if Toggles.RemoveA90.Value and Modules.A90   then Modules.A90.Name = "A90_Disabled" end
	if Toggles.RemoveDread.Value and Modules.Dread then Modules.Dread.Name = "Dread_Disabled" end
	if Toggles.DisableTimothyJumpscare.Value then Modules.SpiderJumpscare.Name = "SpiderJumpscare_Disabled" end

	if Toggles.DisableHideVignette.Value then
		local Vignette = Globals.MainUI:FindFirstChild("HideVignette") or Globals.MainUI.MainFrame:FindFirstChild("HideVignette")
		if Vignette then Vignette.Image = "Disabled" end
	end
	if Toggles.RemoveInteractingSounds.Value then
		local PS = Globals.MainUI.Initiator.Main_Game.PromptService
		PS.Triggered.Volume = 0
		PS.Holding.Volume   = 0
		PS.Notification.Volume = 0
		Globals.MainUI.Initiator.Main_Game.Reminder.Caption.Volume = 0
	end
	if Toggles.DisableEntityJumpscares.Value then
		local JS = Globals.MainUI.Initiator.Main_Game.RemoteListener:FindFirstChild("Jumpscares")
		if JS then JS.Name = "Jumpscares_Disabled" end
	end
    local Cutscenes = Globals.MainUI.Initiator.Main_Game.RemoteListener.Cutscenes
    for _, Object in pairs(Cutscenes:GetChildren()) do
        if table.find(CutsceneNames, Object.Name) and Object:IsA("ModuleScript") then
            Object:SetAttribute("OriginalName", Object.Name)
            if Toggles.RemoveCutscenes.Value then
                Object.Name = Object.Name .. "_Disabled"
            end
        end
    end
    for _, Object in pairs(FloorReplicated:GetChildren()) do
        if table.find(CutsceneNames, Object.Name) and Object:IsA("ModuleScript") then
            Object:SetAttribute("OriginalName", Object.Name)
            if Toggles.RemoveCutscenes.Value then
                Object.Name = Object.Name .. "_Disabled"
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
		if Part:IsA("BasePart") then
			PartProperties[Part] = Part.CustomPhysicalProperties
			if Toggles.RemoveAcceleration.Value then
				Part.CustomPhysicalProperties = CustomPhysics
			end
		end
	end

	Connections.LibraryCodeHandler1 = LocalPlayer.PlayerGui.PermUI.Hints.ChildAdded:Connect(function()
		if Toggles.NotifyLibraryCode.Value then
			local Code = Functions.GetLibraryCode()
			if Code and not Code:find("_") and not Globals.LibraryCodeFound then
				local Lock = Services.Workspace:FindFirstChild("Padlock", true)
				Functions.Notify({ Title = "Padlock code found!", Body = "The code is: '" .. Code .. "'", Time = Toggles.NotifyKeepNotifications.Value and Lock or 15 })
				Globals.LibraryCodeFound = true
			end
		end
	end)

	Connections.LibraryCodeHandler2 = Character.ChildAdded:Connect(function(Child)
		if (Child.Name == "LibraryHintPaper" or Child.Name == "LibraryHintPaperHard") and Toggles.NotifyLibraryCode.Value then
			local Code = Functions.GetLibraryCode()
			if Code and not Code:find("_") and not Globals.LibraryCodeFound then
				local Lock = Services.Workspace:FindFirstChild("Padlock", true)
				Functions.Notify({ Title = "Padlock code found!", Body = "The code is: '" .. Code .. "'", Time = Toggles.NotifyKeepNotifications.Value and Lock or 15 })
				Globals.LibraryCodeFound = true
			end
		end
	end)

	Connections.FootstepHandler = Character.ChildAdded:Connect(function(Object)
		if Object:IsA("Sound") and Object.Name == "Sound" and Toggles.RemoveFootstepSounds.Value then
			Object.Volume = 0
		end
	end)

	Globals.OldOxygen = Character:GetAttribute("Oxygen")
	Connections.OxygenConnection = Character:GetAttributeChangedSignal("Oxygen"):Connect(function()
		local NewOxy = Character:GetAttribute("Oxygen")
		if NewOxy < Globals.OldOxygen and Toggles.NotifyOxygen.Value then
			Functions.Caption(Functions.FormatOxygen(NewOxy), true)
		end
		Globals.OldOxygen = NewOxy
	end)

	Connections.AutoReviveHandler = LocalPlayer:GetAttributeChangedSignal("Alive"):Connect(function()
		if LocalPlayer:GetAttribute("Alive") == false and Toggles.AutoRevive.Value then
			if Floor == "Fools" or Floor == "OldHotel" then
				while LocalPlayer:GetAttribute("Alive") ~= true do
					RemotesFolder.Revive:FireServer()
					task.wait(0.5)
				end
			end
		end
	end)

	Connections.SHMFixer = RootPart:GetPropertyChangedSignal("Anchored"):Connect(function()
		task.wait()
		if Floor == "Fools" and RootPart.Anchored and Character:GetAttribute("Hiding") ~= true then
			RootPart.Anchored = false
		end
	end)

	Connections.AnticheatDisabler = Character:GetAttributeChangedSignal("Climbing"):Connect(function()
		if Character:GetAttribute("Climbing") == true and Toggles.DisableAnticheat.Value and not Globals.AnticheatDisabled then
			task.wait(0.25)
			Character:SetAttribute("Climbing", false)
			Functions.Notify({ Title = "Successfully disabled the anticheat.", Body = "It will be re-enabled after a cutscene or halt room." })
			Globals.AnticheatDisabled = true
		end
	end)

	Connections.AnticheatEnableDetector1 = RemotesFolder:WaitForChild("Cutscene").OnClientEvent:Connect(function(CutsceneName)
		if Globals.AnticheatDisabled and not CutsceneName:find("SewerSeek") then
			Globals.AnticheatDisabled = false
			Functions.Notify({ Title = "The anticheat has been re-enabled.", Body = "Interact with a ladder to disable it again." })
		end
	end)

	Connections.AnticheatEnableDetector2 = RemotesFolder:WaitForChild("UseEnemyModule").OnClientEvent:Connect(function(ModuleName)
		if ModuleName == "Void" or ModuleName == "Glitch" then
			if Globals.AnticheatDisabled then
				Globals.AnticheatDisabled = false
				Functions.Notify({ Title = "The anticheat has been re-enabled.", Body = "Interact with a ladder to disable it again." })
			end
			LocalPlayer:SetAttribute("CurrentRoom", LatestRoom.Value)
		end
	end)

	Connections.AnimationHandler = Character.ChildAdded:Connect(function()
		local ToolNames = { "Lockpick","Shears","SkeletonKey","Key","GeneratorFuse","KeyElectrical","KeyBackdoor","KeyIron", "Multitool" }
		local Tool
		for _, Name in ToolNames do
			Tool = Character:FindFirstChild(Name)
			if Tool then break end
		end
		if not Tool then return end

		local UseAnim = Tool:FindFirstChild("use", true) or Tool:FindFirstChild("promptanim", true)
		if UseAnim then
			UseAnim = Humanoid:LoadAnimation(UseAnim)
			UseAnim.Priority = Enum.AnimationPriority.Action4
			Globals.UseAnimation = UseAnim
		end
		local UseAnimBreak = Tool:FindFirstChild("usefinish", true) or Tool:FindFirstChild("promptanimend", true) or Tool:FindFirstChild("lockpickuse", true)
		if UseAnimBreak then
			UseAnimBreak = Humanoid:LoadAnimation(UseAnimBreak)
			UseAnimBreak.Priority = Enum.AnimationPriority.Action4
			Globals.UseAnimationBreak = UseAnimBreak
		end
	end)

	Connections.JumpHandler = Character:GetAttributeChangedSignal("CanJump"):Connect(function()
		local Val = Character:GetAttribute("CanJump")
		if Toggles.EnableCharacterJump.Value and Val ~= true or not Toggles.EnableCharacterJump.Value then
			OldJump = Val
		end
		if Toggles.EnableCharacterJump.Value then Character:SetAttribute("CanJump", true) end
	end)

	Connections.SlideHandler = Character:GetAttributeChangedSignal("CanSlide"):Connect(function()
		local Val = Character:GetAttribute("CanSlide")
		if Toggles.EnableCharacterSlide.Value and Val ~= true or not Toggles.EnableCharacterSlide.Value then
			OldSlide = Val
		end
		if Toggles.EnableCharacterSlide.Value then Character:SetAttribute("CanSlide", true) end
	end)

	Connections.InfiniteJumpsConnection1 = Services.UserInputService.InputBegan:Connect(function(Input)
		if Input.KeyCode == Enum.KeyCode.Space and Toggles.InfiniteJumps.Value and not Globals.IsTyping then
			Humanoid:ChangeState(Enum.HumanoidStateType.Jumping)
		end
	end)

	local JumpButton = Globals.MainUI.MainFrame.MobileButtons:FindFirstChild("JumpButton")
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
		if Character:GetAttribute("Hiding") == true then
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
		if Character:GetAttribute("Hiding") ~= true and Closet then
			local Prompt = Closet:FindFirstChild("HidePrompt")
				or Closet:FindFirstChild("HidingPrompt")
				or Closet:FindFirstChild("HidePrompt", true)
				or Closet:FindFirstChild("HidingPrompt", true)

			if not Prompt then
				for _, Child in Closet:GetDescendants() do
					if (Child:IsA("ProximityPrompt") or Child:IsA("InteractPrompt"))
						and (Child.Name == "HidePrompt" or Child.Name == "HidingPrompt")
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
		if Character:GetAttribute("Hiding") then
			if Toggles.SpectateEntityToggle.Value and Entity.PrimaryPart then
				Globals.SpectateEntity = Entity
			end
		end
		Globals.LastAutoHide = tick()
	end)

	Globals.LastAutoAnchor = tick()
	Connections.AutoSolveAnchorsConnection = Services.RunService.Heartbeat:Connect(function()
		if not Toggles.AutoSolveAnchors.Value then return end
		if not Globals.MainUI:FindFirstChild("AnchorHintFrame") then return end
		if tick() - Globals.LastAutoAnchor <= 0.1 then return end
		local Anchor = Functions.GetCurrentAnchor()
		if Anchor and LocalPlayer:DistanceFromCharacter(Anchor.PrimaryPart.Position) < Anchor.ActivateEventPrompt.MaxActivationDistance and not Anchor:GetAttribute("Activated") then
			Anchor:WaitForChild("AnchorRemote"):InvokeServer(Globals.MainUI.AnchorHintFrame.Code.Text)
		end
		Globals.LastAutoAnchor = tick()
	end)

	Globals.ManipulateBody = Instance.new("BodyVelocity")
	Globals.ManipulateBody.MaxForce = Vector3.new(9e9, 9e9, 9e9)

	Globals.FlyBody = Instance.new("BodyVelocity")
	Globals.FlyBody.MaxForce = Vector3.new(9e9, 9e9, 9e9)

	Globals.SelfKilled = false
	Globals.ThirdPersonParts = {}
	for _, Object in Character:GetDescendants() do
		if Object:IsA("Accessory") and Object:FindFirstChild("Handle") then
			table.insert(Globals.ThirdPersonParts, Object.Handle)
		end
	end
	table.insert(Globals.ThirdPersonParts, Character:WaitForChild("Head"))

	Globals.LastAnimationCheck = tick()
	Globals.LastCrouchFire = tick()
	Globals.OriginalC1 = Character.LowerTorso.Root.C1

	local RayParams = RaycastParams.new()
	RayParams.FilterType = Enum.RaycastFilterType.Exclude

	local MainFrame = Globals.MainUI:FindFirstChild("MainFrame")
	if MainFrame and MainFrame:FindFirstChild("SurgeVignette") then
		Globals.SurgeFrame = MainFrame.SurgeVignette
		if Toggles.RemoveSurge.Value then
			Globals.SurgeFrame.Name = "SurgeVignette_Disabled"
		end
	end

	Connections.MainHandler = Services.RunService.RenderStepped:Connect(function()
		if Services.Workspace:FindFirstChild("Camera") then
			Camera = Services.Workspace:FindFirstChild("Camera")
		end

		if Toggles.SpeedBoostToggle.Value then
			Humanoid.WalkSpeed = Functions.GetCurrentSpeed() + Options.SpeedBoostSlider.Value
		end

		if Globals.Lagging or (Options.SpeedBoostSlider.Value <= 6 and Options.FlySpeed.Value <= 21) then
			CollisionPartClone.Massless = true
		end

		Globals.IsEyes    = Services.Workspace:FindFirstChild("Eyes") ~= nil or Services.Workspace:FindFirstChild("Lookman") ~= nil
		Globals.IsLookman = Services.Workspace:FindFirstChild("BackdoorLookman") ~= nil

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

		if Globals.SelfKilled and Globals.MainUI:FindFirstChild("Statistics") then
			Globals.MainUI.Statistics.Death.Text = "Died to IRT Hub"
		end

		if Globals.Deathing and Globals.MainUI:FindFirstChild("Statistics") then
			Globals.MainUI.Statistics.Death.Text = "Died to Verity"
		end

		local MainFrame = Globals.MainUI:FindFirstChild("MainFrame")
		if MainFrame then
			local Effects = MainFrame.Healthbar:FindFirstChild("Effects")
			if Effects and Effects:FindFirstChild("Crouching") then
				Effects.Crouching.Visible = Functions.IsCrouching()
			end
		end

		if (Toggles.CrouchSpoof.Value or Toggles.PositionSpoof.Value) and RemotesFolder:FindFirstChild("Crouch") then
			RemotesFolder.Crouch:FireServer(true, true)
		end

		if Floor ~= "Fools" and Floor ~= "OldHotel" and not Camera:FindFirstChild("MinecartRig") then
			RootPart.CanCollide = false
		end

		for _, Part in Character:GetChildren() do
			if Part:IsA("BasePart") then Part.CanCollide = false end
		end

		if LocalPlayer:GetAttribute("Alive") == true then
			Services.SoundService:WaitForChild("Main").Volume = 1
		end

		if Floor == "OldHotel" or Floor == "Fools" then
			local SpoofOffset = Toggles.PositionSpoof.Value and Functions.GetNearestEntity() and 200 or Toggles.FigureGodmode.Value and Functions.GetNearestFigure() and 200 or 0
			Globals.SpoofOffset = SpoofOffset
			Collision.Position = RootPart.Position + Vector3.new(0, SpoofOffset, 0)
			Collision.CanCollide = false
			if Floor == "Fools" then
				Collision.CollisionCrouch.CanCollide = false
				CollisionClone.CollisionCrouch.CanCollide = false
			end
			RootPart.CanCollide = not (Toggles.NoclipToggle.Value or Toggles.VelocityManipulationToggle.Value)
		else
			Collision.CanCollide = false
			if Collision:FindFirstChild("CollisionCrouch") then Collision.CollisionCrouch.CanCollide = false end

			if CollisionClone:FindFirstChild("CollisionCrouch") then
				local IsCrouch = Functions.IsCrouching()
				CollisionClone.CanCollide = not (Toggles.NoclipToggle.Value or Toggles.VelocityManipulationToggle.Value or IsCrouch)
				CollisionClone.CollisionCrouch.CanCollide = not (Toggles.NoclipToggle.Value or Toggles.VelocityManipulationToggle.Value or not IsCrouch)
			else
				RootPart.CanCollide = not (Toggles.NoclipToggle.Value or Toggles.VelocityManipulationToggle.Value)
			end

			if Character:FindFirstChild("LowerTorso") and Character.LowerTorso:FindFirstChild("Root") then
				Character.LowerTorso.Root.C1 = Globals.OriginalC1 * CFrame.new(0, Toggles.PositionSpoof.Value and -2.346 or 0, 0)
			end

			local SpoofY = Toggles.PositionSpoof.Value and 2.328 or 0.18
			Collision.Position     = RootPart.Position + Vector3.new(0, SpoofY, 0)
			CollisionPart.Position = RootPart.Position + Vector3.new(0, SpoofY, 0)

			if Collision:FindFirstChild("CollisionCrouch") and CollisionClone:FindFirstChild("CollisionCrouch") then
				local CrouchY = Toggles.PositionSpoof.Value and 1.328 or -0.982
				Collision.CollisionCrouch.Position = RootPart.Position + Vector3.new(0, CrouchY, 0)
				CollisionClone.CollisionCrouch.CollisionGroup = Collision.CollisionCrouch.CollisionGroup
			end
			if CollisionClone:FindFirstChild("CollisionCrouch") then
				CollisionClone.CollisionCrouch.Position = RootPart.Position + Vector3.new(0, Toggles.PositionSpoof.Value and 0.75 or -0.982, 0)
			end
		end

		CollisionClone.CollisionGroup = Collision.CollisionGroup
		CollisionClone.Position = RootPart.Position + Vector3.new(0, Toggles.PositionSpoof.Value and 1.75 or 0.18, 0)

		if Toggles.VelocityManipulationToggle.Value and Options.VelocityManipulationMode.Value == "Velocity" then
			Globals.ManipulateBody.Parent = RootPart
			Globals.ManipulateBody.Velocity = RootPart.CFrame.LookVector * 2.25
		else
			Globals.ManipulateBody.Parent = nil
		end

		if Toggles.VelocityManipulationToggle.Value and Options.VelocityManipulationMode.Value == "Pivot" and Floor ~= "Fools" and Floor ~= "OldHotel" then
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
			if Floor == "Fools" or Floor == "OldHotel" then
				RemotesFolder.MotorReplication:FireServer(0, (Globals.SpoofOffset == 200 and 65 or -65), 0, false)
			else
				RemotesFolder.MotorReplication:FireServer(-650)
			end
		end

		if RemotesFolder:FindFirstChild("Crouch") and tick() - Globals.LastCrouchFire > 0.1 then
			local IsCrouch = Functions.IsCrouching()
			if Toggles.CrouchSpoof.Value or Toggles.PositionSpoof.Value then IsCrouch = true end
			RemotesFolder.Crouch:FireServer(IsCrouch, true)
			Globals.LastCrouchFire = tick()
		end

		if tick() - Globals.LastAnimationCheck > 0.1 then
			local Sliding = false
			for _, Anim in Humanoid:GetPlayingAnimationTracks() do
				if Anim.Name == "Slide" then Sliding = true break end
			end
			Globals.Sliding = Sliding
			Globals.LastAnimationCheck = tick()
		end

		Character:SetAttribute("Sliding", Globals.Sliding)
		if Character:GetAttribute("Crouching") ~= Functions.IsCrouching() then
			Character:SetAttribute("Crouching", Functions.IsCrouching())
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
			if Options.SpecateEntityMode.Value == "Player to Entity" then
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
			and Character:GetAttribute("AnimatingClient") ~= true
			and Character:GetAttribute("Hiding") == true
		then
			RemotesFolder.CamLock:FireServer()
		end

		local ClosestPlayer = { Distance = math.huge, Object = nil }
		for _, Player in Services.Players:GetPlayers() do
			if Player.Character and Player ~= LocalPlayer then
				local Root = Player.Character:FindFirstChild("HumanoidRootPart")
				if Root then
					local D = (Camera.CFrame.Position - Root.Position).Magnitude
					if D < ClosestPlayer.Distance then
						ClosestPlayer.Distance = D
						ClosestPlayer.Object = Player
					end
				end
			end
		end
		if ClosestPlayer.Object and LocalPlayer:GetAttribute("Alive") ~= true then
			LocalPlayer:SetAttribute("CurrentRoom", ClosestPlayer.Object:GetAttribute("CurrentRoom"))
		end
	end)

	task.wait(1)
	if Toggles.PositionSpoof.Value and Floor ~= "Fools" and Floor ~= "OldHotel" then
		RootPart.CFrame = RootPart.CFrame * CFrame.new(0, -2.346, 0)
		Humanoid.HipHeight = 0.05
		RemotesFolder.Crouch:FireServer(true, true)
	end

	local Jam = Globals.MainUI.Initiator.Main_Game.Health:FindFirstChild("Jam")
	if Jam and Toggles.RemoveJamminMusic.Value then
		Jam.Volume = 0
		Globals.JamMuffle.Enabled = false
	end
end

Functions.HandleHidingTransparency = function(Model)
	local Parts = {}
	for _, Part in Model:GetDescendants() do
		if Part:IsA("BasePart") then
			Part:SetAttribute("Transparency_Old", Part.Transparency)
			table.insert(Parts, Part)
		end
		if Part.Name == "HiddenPlayer" then
			local HideConn = Part:GetPropertyChangedSignal("Value"):Connect(function()
				for _, P in Parts do
					if P:GetAttribute("Transparency_Old") then
						Services.TweenService:Create(P, TweenInfo.new(0.25, Enum.EasingStyle.Linear), {
							Transparency = (Part.Value == Character and Toggles.TransparentHidingSpotsToggle.Value)
								and Options.TransparentHidingSpotsSlider.Value
								or P:GetAttribute("Transparency_Old")
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
			Object:SetAttribute("ParentRoom", tonumber(Room.Name))
			break
		end
		task.wait()
	end

	if Object.Parent == CurrentRooms then
		local FiredampVal = Object:GetAttribute("Firedamp")
		Object:SetAttribute("Firedamp_Old", FiredampVal ~= nil and FiredampVal or false)
		if Toggles.DisableFiredampEffect.Value then
			Object:SetAttribute("Firedamp", false)
		end
	end

	local Name = Object.Name

	if Name == "KeyObtain" then
		task.spawn(function()
			task.wait(0.5)
			if Object.Parent then
				if Toggles.ObjectiveESPToggle.Value then Functions.AddESP({ Object = Object, Text = "Door Key", Color = Options.ObjectiveESPColor.Value }, true) end
				table.insert(Objects.Objectives, Object)
			end
		end)
	elseif Name == "ElectricalKeyObtain" then
		task.spawn(function()
			task.wait(0.5)
			if Object.Parent then
				if Toggles.ObjectiveESPToggle.Value then Functions.AddESP({ Object = Object, Text = "Electrical Key", Color = Options.ObjectiveESPColor.Value }, true) end
				table.insert(Objects.Objectives, Object)
			end
		end)
	elseif Name == "TimerLever" then
		task.spawn(function()
			task.wait(0.5)
			if Object.Parent then
				Object:SetAttribute("AddTime", Object.TakeTimer.TextLabel.Text == "01:00" and 60 or 30)
				if Toggles.ObjectiveESPToggle.Value then Functions.AddESP({ Object = Object, Text = "Time Lever [+" .. Object:GetAttribute("AddTime") .. "s]", Color = Options.ObjectiveESPColor.Value }, true) end
				Object:WaitForChild("Main").SoundToPlay.Played:Once(function()
					Functions.RemoveESP(Object)
					Functions.BlacklistESP(Object)
				end)
				table.insert(Objects.Objectives, Object)
			end
		end)
	elseif Name == "StairwellLockpickDoor" then
		if Toggles.MiscESPToggle.Value then Functions.AddESP({ Object = Object, Text = "Garage Door", Color = Options.MiscESPColor.Value }, true) end
		table.insert(Objects.Misc, Object)
	elseif Name == "Mirror" then
		if Toggles.MiscESPToggle.Value then Functions.AddESP({ Object = Object, Text = "Mirror", Color = Options.MiscESPColor.Value }, true) end
		table.insert(Objects.Misc, Object)
	elseif Name == "StairwellFireAlarm" then
		if Toggles.MiscESPToggle.Value then Functions.AddESP({ Object = Object, Text = "Fire Alarm", Color = Options.MiscESPColor.Value }, true) end
		table.insert(Objects.Misc, Object)
	elseif Name == "ShoppingCart" then
		if Toggles.MiscESPToggle.Value then Functions.AddESP({ Object = Object, Text = "Shopping Cart", Color = Options.MiscESPColor.Value }, true) end
		table.insert(Objects.Misc, Object)
	elseif Name == "StairwellScrapper" then
		if Toggles.ObjectiveESPToggle.Value then Functions.AddESP({ Object = Object, Text = "Scrapper", Color = Options.ObjectiveESPColor.Value }, true) end
		table.insert(Objects.Objectives, Object)
	elseif Name == "ArchivesPackageDeposit" then
		if Toggles.ObjectiveESPToggle.Value then Functions.AddESP({ Object = Object, Text = "Package Deposit", Color = Options.ObjectiveESPColor.Value }, true) end
		table.insert(Objects.Objectives, Object)
	elseif Name == "Cellar" then
		if Toggles.ObjectiveESPToggle.Value then Functions.AddESP({ Object = Object, Text = "Cellar", Color = Options.ObjectiveESPColor.Value }, true) end
		table.insert(Objects.Objectives, Object)
	elseif Name == "ArchivesFihTank" then
		if Toggles.MiscESPToggle.Value then Functions.AddESP({ Object = Object, Text = "Fih Tank", Color = Options.MiscESPColor.Value }, true) end
		table.insert(Objects.Misc, Object)
	elseif Name == "LiveHintBook" then
		if Toggles.ObjectiveESPToggle.Value then Functions.AddESP({ Object = Object, Text = "Hint Book", Color = Options.ObjectiveESPColor.Value }, true) end
		table.insert(Objects.Objectives, Object)
	elseif Name == "LiveBreakerPolePickup" then
		if Toggles.ObjectiveESPToggle.Value then Functions.AddESP({ Object = Object, Text = "Fuse Breaker", Color = Options.ObjectiveESPColor.Value }, true) end
		for _, Child in Object:GetChildren() do
			if Child.Name == "ActivateEventPrompt" and (Child.MaxActivationDistance == 5 or Child:GetAttribute("MaxActivationDistance_Old") == 5) then
				Child:Destroy()
			end
		end
		table.insert(Objects.Objectives, Object)
	elseif Name == "LibraryHintPaper" or Name == "PickupItem" then
		if Toggles.ObjectiveESPToggle.Value then Functions.AddESP({ Object = Object, Text = "Hint Paper", Color = Options.ObjectiveESPColor.Value }, true) end
		table.insert(Objects.Objectives, Object)
	elseif Name == "MinesAnchor" then
		if Toggles.ObjectiveESPToggle.Value then Functions.AddESP({ Object = Object, Text = "Anchor [" .. Object:WaitForChild("Sign").TextLabel.Text .. "]", Color = Options.ObjectiveESPColor.Value }, true) end
		Object:GetAttributeChangedSignal("Activated"):Once(function()
			Functions.RemoveESP(Object)
			Functions.BlacklistESP(Object)
		end)
		table.insert(Objects.Objectives, Object)
	elseif Name == "WaterPump" then
		if Toggles.ObjectiveESPToggle.Value then Functions.AddESP({ Object = Object:WaitForChild("Wheel"), Text = "Water Pump", Color = Options.ObjectiveESPColor.Value }, true) end
		Object:WaitForChild("Wheel").Sound.Played:Once(function()
			Object:SetAttribute("IRT_Completed", true)

			Functions.RemoveESP(Object.Wheel)
			Functions.BlacklistESP(Object.Wheel)
		end)
		table.insert(Objects.Objectives, Object)
	elseif Name == "CringlePresent" then
		if Toggles.ObjectiveESPToggle.Value then Functions.AddESP({ Object = Object, Text = "Present", Color = Options.ObjectiveESPColor.Value }, true) end
		Object:WaitForChild("ToolProp").Highlight:Destroy()
		table.insert(Objects.Objectives, Object)
	elseif Name == "LeverForGate" then
		if Toggles.ObjectiveESPToggle.Value then Functions.AddESP({ Object = Object, Text = "Gate Lever", Color = Options.ObjectiveESPColor.Value }, true) end
		Object:WaitForChild("Main").SoundToPlay.Played:Once(function()
			Functions.RemoveESP(Object)
			Functions.BlacklistESP(Object)
		end)
		table.insert(Objects.Objectives, Object)
	elseif Name == "VineGuillotine" then
		if Toggles.ObjectiveESPToggle.Value then Functions.AddESP({ Object = Object.Lever, Text = "Vine Lever", Color = Options.ObjectiveESPColor.Value }, true) end
		Object.Lever:WaitForChild("ActivateEventPrompt"):GetAttributeChangedSignal("Interactions"):Once(function()
			Functions.RemoveESP(Object)
			Functions.BlacklistESP(Object)
		end)
		table.insert(Objects.Objectives, Object)
	elseif Name == "MandrakeLive" then
		if Toggles.ObjectiveESPToggle.Value and Options.EntityESPOptions.Value["Mandrake Hole"] then Functions.AddESP({ Object = Object.Hole, Text = "Mandrake Hole", Color = Options.EntityESPColor.Value }, true) end
		table.insert(Objects.Entities, Object.Hole)
	elseif Name == "MinesGenerator" then
		task.spawn(function()
			task.wait(0.75)
			if Object.Parent then
				if Toggles.ObjectiveESPToggle.Value then Functions.AddESP({ Object = Object, Text = "Generator", Color = Options.ObjectiveESPColor.Value }, true) end
				Object:WaitForChild("Lever").Sound.Played:Once(function()
					Functions.RemoveESP(Object)
					Functions.BlacklistESP(Object)
				end)
				table.insert(Objects.Objectives, Object)
			end
		end)
	elseif Name == "FuseObtain" then
		if Toggles.ObjectiveESPToggle.Value then Functions.AddESP({ Object = Object, Text = "Generator Fuse", Color = Options.ObjectiveESPColor.Value }, true) end
		Object:WaitForChild("Hitbox").FuseModel:GetPropertyChangedSignal("LocalTransparencyModifier"):Once(function()
			Functions.RemoveESP(Object)
			Functions.BlacklistESP(Object)
		end)
		table.insert(Objects.Objectives, Object)
	elseif Name == "MinesGateButton" then
		if Toggles.ObjectiveESPToggle.Value then Functions.AddESP({ Object = Object, Text = "Gate Button", Color = Options.ObjectiveESPColor.Value }, true) end
		Object.Parent:WaitForChild("MinesGate").Main.SoundOpen.Played:Once(function()
			Functions.RemoveESP(Object)
			Functions.BlacklistESP(Object)
		end)
		table.insert(Objects.Objectives, Object)
	elseif Name == "GardenGateButton" then
		if Toggles.ObjectiveESPToggle.Value then Functions.AddESP({ Object = Object, Text = "Gate Button", Color = Options.ObjectiveESPColor.Value }, true) end
		Object.Parent:WaitForChild("GardenGate").Collision.Sound.Played:Once(function()
			Functions.RemoveESP(Object)
			Functions.BlacklistESP(Object)
		end)
		table.insert(Objects.Objectives, Object)
	elseif Name == "Ladder" then
		if Toggles.LadderESPToggle.Value then Functions.AddESP({ Object = Object, Text = "Ladder", Color = Options.LadderESPColor.Value }, true) end
		table.insert(Objects.Ladders, Object)
	elseif Name == "Door" and Object.Parent and tonumber(Object.Parent.Name) then
		local DoorParts = {}
		for _, Child in Object:GetChildren() do
			if Child.Name == "Door" and Child:IsA("BasePart") then
				table.insert(DoorParts, Child)
			end
		end

		if #DoorParts == 2 then
			local HighlightModel = Instance.new("Model", Object)
			HighlightModel.Name = "HighlightModel"
			Instance.new("Humanoid", HighlightModel).Name = "HighlightHumanoid"
			HighlightModel:SetAttribute("ParentRoom", tonumber(Object.Parent.Name))

			for _, DoorPart in DoorParts do
				local HP = Instance.new("Part", HighlightModel)
				HP.Transparency = 0.999
				HP.Size = DoorPart.Size
				HP.CanCollide = false
				HP.CFrame = DoorPart.CFrame
				HP.Name = "HighlightPart"
				HP.Material = Enum.Material.Plastic
				HP:SetAttribute("ParentRoom", tonumber(Object.Parent.Name))
				local W = Instance.new("WeldConstraint", HP)
				W.Part0 = HP W.Part1 = DoorPart W.Enabled = true
			end
			table.insert(Objects.Doors, HighlightModel)
			if Toggles.DoorESPToggle.Value then Functions.AddESP({ Object = HighlightModel, Text = "Door " .. Functions.GetDoorNumber(Object), Color = Options.DoorESPColor.Value }, true) end
		else
			local Root = Object:WaitForChild("Door", 9e9)
			local HP = Instance.new("Part", Object)
			HP.Transparency = 0.999
			HP.Size = Root.Size
			HP.CanCollide = false
			HP.CFrame = Root.CFrame
			HP.Name = "HighlightPart"
			HP.Material = Enum.Material.Plastic
			HP:SetAttribute("ParentRoom", tonumber(Object.Parent.Name))
			local W = Instance.new("WeldConstraint", HP)
			W.Part0 = HP W.Part1 = Root W.Enabled = true
			Instance.new("Humanoid", Object).Name = "HighlightHumanoid"
			table.insert(Objects.Doors, HP)
			if Toggles.DoorESPToggle.Value then Functions.AddESP({ Object = HP, Text = "Door " .. Functions.GetDoorNumber(Object), Color = Options.DoorESPColor.Value }, true) end
		end

		local LastDoorFire = tick()
		local DoorConn = Services.RunService.Heartbeat:Connect(function()
			if Object:FindFirstChild("Door") and Object:FindFirstChild("ClientOpen") then
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
		Object:WaitForChild("Door"):WaitForChild("Open").Played:Once(function()
			DoorConn:Disconnect()
		end)
		table.insert(Connections, DoorConn)

	elseif Name == "PathLights" then
		local ObjectsToHighlight = {}
		local PLConn = Object.ChildAdded:Connect(function(Child)
			table.insert(ObjectsToHighlight, Child)
		end)
		for _, Child in Object:GetChildren() do
			table.insert(ObjectsToHighlight, Child)
		end

		local function CreateSeekNode(Light)
			if Light.Name ~= "SeekGuidingLight" or Light:GetAttribute("Highlighted") then return end
			Light:SetAttribute("Highlighted", true)

			local NewNode = Instance.new("Part")
			NewNode.Size = Vector3.one
			NewNode.Transparency = 1
			NewNode.Parent = Globals.SeekNodesFolder
			NewNode.Anchored = true
			NewNode.CFrame = Light.CFrame
			NewNode.CanCollide = false
			NewNode.Name = "SeekLightNode"

			local PrevNode2 = PreviousNode or NewNode
			PreviousNode = NewNode

			local Beam = Instance.new("Beam")
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
			local A0 = Instance.new("Attachment", NewNode)
			local A1 = Instance.new("Attachment", PrevNode2)
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
	elseif Name == "SeekMovingNewClone" then
		local Connection = Object.Destroying:Connect(function()
			for _, Folder in pairs(Objects.PathLights) do
				Folder:ClearAllChildren()
			end
			Globals.SeekNodesFolder:ClearAllChildren()
		end)
		table.insert(Connections, Connection)
	elseif Name == "Bridge" then
		for _, Child in Object:GetChildren() do
			if Child.Name == "PlayerBarrier" and Child.Size.Y == 2.75 and (Child.Rotation.X == 0 or Child.Rotation.X == 180) then
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
    elseif Name == "MinecartRig" then
        Globals.Minecart = Object
	elseif Name == "RunnerNodes" then
		local function IsBehind(Part1, Part2)
			local P1 = (Part1.CFrame + Part1.CFrame.LookVector).Position
			local P2 = (Part1.CFrame + Part1.CFrame.LookVector * -1).Position
			return (P1 - Part2.Position).Magnitude > (P2 - Part2.Position).Magnitude
		end
		local function GetDirection(Part1, Part2)
			local RightDist = Part1.CFrame.RightVector:Dot(Part1.Position - Part2.Position)
			if RightDist > 0.5    then return IsBehind(Part1, Part2) and "Right" or "Left" end
			if RightDist < -0.5   then return IsBehind(Part1, Part2) and "Left" or "Right" end
			return "Straight"
		end
		local function GetClosestNode(Node)
			local Best, BestDist = nil, math.huge
			local NodeID2 = tonumber(Node.Name:split("MinecartNode")[2])
			for _, OtherNode in Object:GetChildren() do
				local OtherID = tonumber(OtherNode.Name:split("MinecartNode")[2])
				if OtherNode ~= Node and OtherID and NodeID2 and OtherID > NodeID2 then
					local D = (Node.Position - OtherNode.Position).Magnitude
					if D < BestDist and OtherNode:GetAttribute("DistanceBlacklist") ~= true then
						BestDist = D Best = OtherNode
					end
				end
			end
			return Best
		end

		for _, Node in Object:GetChildren() do
			local NodeID = tonumber(Node.Name:split("MinecartNode")[2])
			if Node:GetAttribute("DeathType") then Node:SetAttribute("DistanceBlacklist", true) end
			for I = 1, 20 do
				local NextNode = NodeID and Object:FindFirstChild("MinecartNode" .. NodeID + I)
				if NextNode and NextNode:GetAttribute("DeathType") ~= nil then
					Node:SetAttribute("DistanceBlacklist", true)
				end
			end
			local PrevNode3 = NodeID and Object:FindFirstChild("MinecartNode" .. NodeID - 1)
			if PrevNode3 and PrevNode3:GetAttribute("ForceConnect") then
				Node:SetAttribute("DistanceBlacklist", nil)
			end
			task.wait()
		end

		for _, Node in Object:GetChildren() do
			if Node:GetAttribute("ForceConnect") then
				local NextNode = GetClosestNode(Node)
				if NextNode then
					Node:SetAttribute("Turn", GetDirection(Node, NextNode))
					table.insert(Objects.SeekNodes, Node)
				end
			end
			task.wait()
		end

	elseif Name == "EyestalkEndCutscene" then
		Object.Name = "_EyestalkEndCutscene"
	elseif Name == "DuckBoard" then
		table.insert(Objects.SeekDuckBoards, Object)
	elseif HidingSpotLabels[Name] or string.find(string.lower(Name), "hidingspot") then
		local Label = HidingSpotLabels[Name] or (string.find(string.lower(Name), "hidingspot") and "Hiding Spot" or nil)
		if Label and Toggles.HidingSpotESPToggle.Value then Functions.AddESP({ Object = Object, Text = Label, Color = Options.HidingSpotESPColor.Value }, true) end
		Functions.HandleHidingTransparency(Object)
		table.insert(Objects.HidingSpots, Object)
	elseif Object:FindFirstChild("HidingPrompt") or Object:FindFirstChild("HidePrompt") then
		Functions.HandleHidingTransparency(Object)
		table.insert(Objects.HidingSpots, Object)
	elseif Name == "Lava" then
		if Toggles.BypassKillbricks.Value then Object.CanTouch = false end
		table.insert(Objects.Obstructions, Object)
	elseif Name == "ScaryWall" then
		for _, Part in Object:GetDescendants() do
			if Part:IsA("BasePart") then
				Part.CanTouch = not Toggles.BypassSeekingWall.Value
				Part.CanCollide = not Toggles.BypassSeekingWall.Value

                local Connection1 = Part:GetPropertyChangedSignal("CanTouch"):Connect(function()
                    if Part.CanTouch == Toggles.BypassSeekingWall.Value then
                        Part.CanTouch = not Toggles.BypassSeekingWall.Value
                    end
                end)
                local Connection2 = Part:GetPropertyChangedSignal("CanCollide"):Connect(function()
                    if Part.CanCollide == Toggles.BypassSeekingWall.Value then
                        Part.CanCollide = not Toggles.BypassSeekingWall.Value
                    end
                end)

                table.insert(Connections, Connection1)
                table.insert(Connections, Connection2)
            end
		end
		table.insert(Objects.Obstructions, Object)
	elseif Name == "ChestBox" or Name == "ChestBoxLocked" then
		if Toggles.ChestESPToggle.Value then Functions.AddESP({ Object = Object, Text = Object:GetAttribute("Locked") and "Locked Chest" or "Chest", Color = Options.ChestESPColor.Value }, true) end
		table.insert(Objects.Chests, Object)
	elseif Name == "Toolbox" or Name == "Toolbox_Locked" then
		if Toggles.ChestESPToggle.Value then Functions.AddESP({ Object = Object, Text = Object:GetAttribute("Locked") and "Locked Toolbox" or "Toolbox", Color = Options.ChestESPColor.Value }, true) end
		table.insert(Objects.Chests, Object)
	elseif Name == "Chest_Vine" then
		if Toggles.ChestESPToggle.Value then Functions.AddESP({ Object = Object, Text = "Vine Chest", Color = Options.ChestESPColor.Value }, true) end
		table.insert(Objects.Chests, Object)
	elseif Name == "Toolshed_Small" then
		if Toggles.ChestESPToggle.Value then Functions.AddESP({ Object = Object, Text = "Toolshed", Color = Options.ChestESPColor.Value }, true) end
		table.insert(Objects.Chests, Object)
	elseif Name == "Locker_Small_Locked" then
		if Toggles.ChestESPToggle.Value then Functions.AddESP({ Object = Object, Text = "Locked Item Locker", Color = Options.ChestESPColor.Value }, true) end
		table.insert(Objects.Chests, Object)
	elseif Name == "MouseHole" then
		if Toggles.ChestESPToggle.Value then Functions.AddESP({ Object = Object, Text = "Mouse", Color = Options.ChestESPColor.Value }, true) end
		table.insert(Objects.Chests, Object)
	elseif ItemNames[Name] and Object:FindFirstChild("ModulePrompt") then
		if Toggles.ItemESPToggle.Value then Functions.AddESP({ Object = Object, Text = ItemNames[Name], Color = Options.ItemESPColor.Value }, Object:GetAttribute("ParentRoom") ~= nil) end
		if Name == "LotusHolder" or Name == "LotusPetalPickup" then
			Object.Handle:GetPropertyChangedSignal("LocalTransparencyModifier"):Connect(function()
				IRT.ESPLibrary:RemoveESP(Object)
				Functions.BlacklistESP(Object)
			end)
		end

		if Toggles.NotifyItemsToggle.Value and Options.NotifyItemList.Value[ItemNames[Name]] and Object.Parent.Name ~= "Drops" then
			if Toggles.NotifyItemsShowDistance.Value then
				Functions.Notify({ Title = "Item '" .. ItemNames[Name] .. "' has spawned.", Body = "It is '" .. math.round(LocalPlayer:DistanceFromCharacter(Object.PrimaryPart.Position)) .. "' studs away from you." })
			else
				Functions.Notify({ Title = "Item '" .. ItemNames[Name] .. "' has spawned."})
			end
		end

		table.insert(Objects.Items, Object)
	elseif Name == "Green_Herb" then
		if Toggles.ItemESPToggle.Value then Functions.AddESP({ Object = Object, Text = "Green Herb", Color = Options.ItemESPColor.Value }, true) end
		table.insert(Objects.Items, Object)
	elseif Name == "GoldPile" and Object:GetAttribute("GoldValue") then
		if Toggles.CurrencyESPToggle.Value then Functions.AddESP({ Object = Object, Text = "Gold Pile [" .. Object:GetAttribute("GoldValue") .. "]", Color = Options.CurrencyESPColor.Value }, true) end
		table.insert(Objects.Currency, Object)
	elseif Name == "StardustPickup" then
		if Toggles.CurrencyESPToggle.Value then Functions.AddESP({ Object = Object, Text = "Stardust Pile", Color = Options.CurrencyESPColor.Value }, true) end
		table.insert(Objects.Currency, Object)
	elseif Name == "GiggleCeiling" then
		if Toggles.EntityESPToggle.Value and Options.EntityESPOptions.Value["Giggle"] then Functions.AddESP({ Object = Object, Text = "Giggle", Color = Options.EntityESPColor.Value }, true) end
		if Toggles.BypassGiggle.Value then Object:WaitForChild("Hitbox").CanTouch = false end
		table.insert(Objects.Entities, Object)
	elseif Name == "GloomPile" then
		if Toggles.BypassGloombatEggs.Value then
			for _, Part in Object:GetDescendants() do
				if Part:IsA("BasePart") then Part.CanTouch = false
				end
			end
		end
		local Connection = Object.DescendantAdded:Connect(function(Part)
			if Part:IsA("BasePart") then Part.CanTouch = false end
		end)

		if Toggles.EntityESPToggle.Value and Options.EntityESPOptions.Value["Gloombat Eggs"] then
			Functions.AddESP({ Object = Object, Text = "Gloombat Eggs", Color = Options.EntityESPColor.Value })
		end

		table.insert(Connections, Connection)
		table.insert(Objects.Entities, Object)
	elseif Name == "TriggerEventCollision" and Functions.CheckCompatability({"firetouchinterest"}) then
		if (Floor == "Fools" or Floor == "OldHotel") and Toggles.RemoveSeekTrigger.Value then
			task.spawn(function()
				while Object:IsDescendantOf(game) do
					for _, Part in Object:GetChildren() do
						if Part:IsA("BasePart") then
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
	elseif Name == "DoorFake" or Name == "FakeDoor" then
		if Object.Parent and Object:FindFirstChild("Hidden") then
			if Toggles.BypassDupe.Value then
				Object:WaitForChild("Hidden").CanTouch = false
				local Lock = Object:FindFirstChild("Lock")
				if Lock and Lock:FindFirstChild("UnlockPrompt") then Lock.UnlockPrompt.Enabled = false end
			end
			if Toggles.EntityESPToggle.Value and Options.EntityESPOptions.Value["Dupe"] then
				Functions.AddESP({ Object = Object, Text = "Dupe", Color = Options.EntityESPColor.Value }, true)
			end
			table.insert(Objects.Entities, Object)
		end
	elseif Name == "SideroomSpace" then
		if Toggles.BypassVacuum.Value then
			Object:WaitForChild("Collision").CanCollide = true
			Object:WaitForChild("Collision").CanTouch = false
		end
		table.insert(Objects.Entities, Object)
	elseif Name == "Snare" then
		if Toggles.EntityESPToggle.Value and Options.EntityESPOptions.Value["Snare"] then Functions.AddESP({ Object = Object, Text = "Snare", Color = Options.EntityESPColor.Value }, true) end
		for _, Part in Object:GetDescendants() do
			if Part:IsA("BasePart") then Part.CanTouch = not Toggles.BypassSnare.Value end
		end
		local Connection = Object.DescendantAdded:Connect(function(Part)
			if Part:IsA("BasePart") then Part.CanTouch = not Toggles.BypassSnare.Value end
		end)
		table.insert(Connections, Connection)
		table.insert(Objects.Entities, Object)

		if Object:FindFirstChild("Snare") then
			Object:WaitForChild("Snare"):WaitForChild("Roots").Transparency = 1
			Object:WaitForChild("Snare"):WaitForChild("SnareBase").Transparency = 1
		end
		if Object:FindFirstChild("Void") then
			Object.Void.Transparency = 0
			Object.Void.Color = Color3.fromRGB(76, 67, 55)
		end
	elseif Name == "Seek_Arm" or Name == "ChandelierObstruction" then
		for _, Part in Object:GetDescendants() do
			if Part:IsA("BasePart") then
				Part.CanTouch = not Toggles.BypassSeekObstructions.Value
				table.insert(Objects.SeekObstructions, Part)
			end
		end
	elseif Name == "SeekFloodline" then
		Object.CanCollide = Toggles.BypassSeekObstructions.Value
		local FloodConn = Object:GetPropertyChangedSignal("CanCollide"):Connect(function()
			if Object.CanCollide ~= Toggles.BypassSeekObstructions.Value then
				Object.CanCollide = Toggles.BypassSeekObstructions.Value
			end
		end)
		Object.Destroying:Once(function() FloodConn:Disconnect() end)
		table.insert(Objects.SeekObstructions, Object)
	elseif Object:GetAttribute("RawName") and Object:GetAttribute("RawName"):find("Halt") or Object:GetAttribute("Shade") == true then
		if Toggles.NotifyEntities.Value and Options.EntityList.Value["Halt"] then
			Functions.Notify({ Title = "Entity 'Halt' will spawn in the next room.", Image = EntityIcons["Halt"] })
			if Toggles.EntityChatToggle.Value then Functions.SendChat("Halt next room!") end
		end
		local HaltLogConn
		HaltLogConn = Services.LogService.MessageOut:Connect(function(Message)
			if Message == "client teleporting" then
				if Globals.AnticheatDisabled then
					Globals.AnticheatDisabled = false
					Functions.Notify({ Title = "The anticheat has been re-enabled.", Body = "Interact with a ladder to disable it again." })
				end
				HaltLogConn:Disconnect()
			end
		end)
	elseif Name == "BananaPeel" then
		if Toggles.BypassBanana.Value then Object.CanTouch = false end
		table.insert(Objects.Entities, Object)
	elseif Name == "JeffTheKiller" then
		if Toggles.BypassJeff.Value then
			for _, Part in Object:GetDescendants() do
				if Part:IsA("BasePart") then Part.CanCollide = false Part.CanTouch = false end
			end
			Object:WaitForChild("Humanoid").Health = 0
		end
	elseif Name == "GrumbleRig" then
		if Toggles.EntityESPToggle.Value and Options.EntityESPOptions.Value["Grumble"] then Functions.AddESP({ Object = Object, Text = "Grumble", Color = Options.EntityESPColor.Value }, true) end
		table.insert(Objects.Entities, Object)
	elseif Name == "LiveEntityBramble" then
		if Toggles.EntityESPToggle.Value and Options.EntityESPOptions.Value["Bramble"] then Functions.AddESP({ Object = Object, Text = "Bramble", Color = Options.EntityESPColor.Value }, true) end
		table.insert(Objects.Entities, Object)
	elseif Name == "Groundskeeper" then
		if Toggles.EntityESPToggle.Value and Options.EntityESPOptions.Value["Groundskeeper"] then Functions.AddESP({ Object = Object, Text = "Groundskeeper", Color = Options.EntityESPColor.Value }, true) end
		if Toggles.NotifyEntities.Value and Options.EntityList.Value["Groundskeeper"] then
			local ED = Entities["Groundskeeper"]
			Functions.Notify({ Title = ED.NotifyMessage.Title, Body = ED.NotifyMessage.Body, Image = EntityIcons["Groundskeeper"] })
		end
		table.insert(Objects.Entities, Object)
	elseif Name == "Figure" or Name == "FigureRig" or Name == "FigureRagdoll" then
		for _, Part in Object:GetDescendants() do
			if Part:IsA("BasePart") then
				Part.CanTouch = false
			end
		end
		if Toggles.EntityESPToggle.Value and Options.EntityESPOptions.Value["Figure"] then Functions.AddESP({ Object = Object, Text = "Figure", Color = Options.EntityESPColor.Value }, true) end
		table.insert(Objects.Entities, Object)
		if Toggles.RemoveFigure.Value and Functions.CheckCompatability({"isnetworkowner"}) then
			if Floor == "Mines" then
				for _, Part in Object:GetDescendants() do
					if Part:IsA("BasePart") then
						task.spawn(function()
							if IRT.Environment.isnetworkowner(Part) then
								Part.Position = Vector3.new(-49999, -49999, -49999)
							end
						end)
					end
				end
			elseif Floor == "OldHotel" or Floor == "Fools" then
				CurrentRooms.ChildAdded:Wait()
				for _, Part in Object:GetDescendants() do
					if Part:IsA("BasePart") then
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
	elseif (Name == "ThingToOpen" or Name == "MovingDoor") and (Floor == "Fools" or Floor == "OldHotel")
		or Name == "Wax_Door" and Floor == "Fools"
	then
		Object:SetAttribute("OriginalPosition", Object:GetPivot())
		local ToggleMap = { ThingToOpen = "RemoveBasementGate", MovingDoor = "RemovePaintingsDoor", Wax_Door = "RemoveSkeletonDoor" }
		if ToggleMap[Name] and Toggles[ToggleMap[Name]].Value then
			Object:PivotTo(CFrame.new(-10000, -10000, -10000))
		end
		table.insert(Objects.Obstructions, Object)
	elseif Name == "ElevatorBreaker" then
		if Toggles.AutoBreakerBox.Value and not Globals.BreakerBoxNotified then
			Functions.Notify({ Title = "Interact with the breaker box.", Body = "It will be automatically solved." })
			Globals.BreakerBoxNotified = true
		end
		Connections.BreakerConnection = Object:WaitForChild("SurfaceGui").Frame.Code:GetPropertyChangedSignal("Text"):Connect(function()
			if Toggles.AutoBreakerBox.Value then
				if not Globals.BreakerBoxStartNotified and (Floor == "Fools" or Floor == "OldHotel") then
					Functions.Notify({ Title = "Attempting to solve the breaker box.", Body = "Please wait." })
					Globals.BreakerBoxStartNotified = true
				end
				RemotesFolder.EBF:FireServer()
			end
			Globals.BreakerBoxInteracted = true
		end)
	elseif Name == "ElevatorCar" then
		local ElevConn = Object.DescendantAdded:Connect(function(Desc)
			if Toggles.AutoBreakerBox.Value and Desc.Name == "TouchInterest" and not Globals.BreakerBoxFinishedNotified then
				Functions.Notify({ Title = "Successfully solved the breaker box.", Body = "Try going to the elevator!" })
				Globals.BreakerBoxFinishedNotified = true
			end
		end)
		Object.Destroying:Once(function() ElevConn:Disconnect() end)
	elseif Object.ClassName == "ProximityPrompt" and not Object:GetAttribute("FakePrompt") then
		if Object:HasTag("DisableWhenEnabledOnClient") then Object:RemoveTag("DisableWhenEnabledOnClient") end

		Object:SetAttribute("HoldDuration_Old", Object.HoldDuration)
		Object:SetAttribute("RequiresLineOfSight_Old", Object.RequiresLineOfSight)
		Object:SetAttribute("MaxActivationDistance_Old", Object.MaxActivationDistance)

		if Toggles.InstantPrompts.Value    then Object.HoldDuration = 0 end
		if Toggles.PromptClip.Value        then Object.RequiresLineOfSight = false end
		Object.MaxActivationDistance = Object:GetAttribute("MaxActivationDistance_Old") * Options.PromptReachSlider.Value

		local LockPromptNames = { UnlockPrompt=true, SkullPrompt=true, LockPrompt=true, ThingToEnable=true, FusesPrompt=true }

		if Functions.CheckCompatability({"fireproximityprompt"}) and Floor ~= "OldHotel" and Floor ~= "Fools" then
			local IsLockPrompt = LockPromptNames[Object.Name]
				or (Object.Parent and Object.Parent:GetAttribute("Locked") == true)
				or (Object.Parent and Object.Parent.Parent and Object.Parent.Parent.Name == "Locker_Small_Locked" and Object.Name == "ActivateEventPrompt")

			if IsLockPrompt then
				local FakePrompt = Object:Clone()
				FakePrompt:SetAttribute("FakePrompt", true)
				task.wait()
				FakePrompt.Parent = Object.Parent

				FakePrompt:SetAttribute("HoldDuration_Old", Object:GetAttribute("HoldDuration_Old"))
				FakePrompt:SetAttribute("RequiresLineOfSight_Old", Object:GetAttribute("RequiresLineOfSight_Old"))
				FakePrompt:SetAttribute("MaxActivationDistance_Old", Object:GetAttribute("MaxActivationDistance_Old"))

				FakePrompt.HoldDuration = Object.HoldDuration
				FakePrompt.RequiresLineOfSight = Object.RequiresLineOfSight
				FakePrompt.MaxActivationDistance = Object.MaxActivationDistance

				if Toggles.InstantPrompts.Value    then FakePrompt.HoldDuration = 0 end
				if Toggles.PromptClip.Value        then FakePrompt.RequiresLineOfSight = false end
				FakePrompt.MaxActivationDistance = FakePrompt:GetAttribute("MaxActivationDistance_Old") * Options.PromptReachSlider.Value

				FakePrompts[FakePrompt] = Object
				pcall(function() Object.Parent = Globals.PromptContainer end)

				local FPEnabledConn = Object:GetPropertyChangedSignal("Enabled"):Connect(function()
					FakePrompt.Enabled = Object.Enabled
				end)
				Object:GetPropertyChangedSignal("ActionText"):Once(function()
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
	elseif Name == "Padlock" then
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
	if not Object:GetAttribute("FakePrompt") then return end
	local ToolNames = { "Lockpick","Shears","SkeletonKey","Key","GeneratorFuse","KeyElectrical","KeyBackdoor","KeyIron", "Multitool" }
	local AnimateToolNames = { "Lockpick","Shears","SkeletonKey","Key","KeyElectrical","KeyBackdoor","KeyIron", "Multitool" }
	local Tool
	for _, N in ToolNames do Tool = Character:FindFirstChild(N) if Tool then break end end

	local Prompt = Object
	local LockPromptNames = { UnlockPrompt=true, SkullPrompt=true, LockPrompt=true, ThingToEnable=true, FusesPrompt=true }
	local IsLockPrompt = LockPromptNames[Object.Name]
		or (Object.Parent and Object.Parent:GetAttribute("Locked") == true)
		or (Object.Parent and Object.Parent.Parent and Object.Parent.Parent.Name == "Locker_Small_Locked" and Object.Name == "ActivateEventPrompt")
	if IsLockPrompt then
		if Options.AutoInteractIgnoreList.Value["Locks"] then return end
		local KeyItems = { "Key","GeneratorFuse","KeyBackdoor","KeyElectrical","KeyIron","Lockpick","SkeletonKey","Shears","Multitool" }
		local OffhandKeyItems = { "Key","GeneratorFuse","KeyElectrical","KeyIron" }
		local HasKey = false
		for _, K in KeyItems do if Functions.HasItem(K, true) then HasKey = true break end end
		for _, K in OffhandKeyItems do if Functions.HasItem(K) then HasKey = true break end end
		if not HasKey then return end
	end

	if Prompt.Parent.Name == "CuttableVines" and not Functions.HasItem("Shears", true) and not Functions.HasItem("Multitool", true) or Prompt.Parent.Name == "Chest_Vine" and not Functions.HasItem("Shears", true) and not Functions.HasItem("Multitool", true) or Prompt.Parent.Name == "Cellar" and not Functions.HasItem("Shears", true) and not Functions.HasItem("Multitool", true) then return end
	if Prompt.Parent.Name == "SkullLock" and not Functions.HasItem("SkeletonKey", true) then return end
	if Prompt.Parent.Name == "Lock1" and not Functions.HasItem("Lockpick", true) and not Functions.HasItem("Multitool", true) or Prompt.Parent.Name == "Lock2" and not Functions.HasItem("Lockpick", true) and not Functions.HasItem("Multitool", true) then return end
	if Functions.HasItem("Shears", true) and IsLockPrompt and Prompt.Parent.Name ~= "CuttableVines" and Prompt.Parent.Name ~= "Chest_Vine" and Prompt.Parent.Name ~= "Cellar" then return end
	
	if Tool and table.find(AnimateToolNames, Tool.Name) and Globals.UseAnimation then
		Globals.UseAnimationBreak:Stop()
		Globals.UseAnimation:Stop()
		Globals.UseAnimation:Play()
		if Tool.Name == "Shears" then Tool:WaitForChild("Handle"):WaitForChild("sound_prompt"):Play() end
	end
end)

Globals.ObjectQueue = {}
local AllowedInstances = {
	Lava=true, GoldPile=true, KeyObtain=true, Drakobloxxer=true, FuseObtain=true,
	MinesGenerator=true, JeffTheKiller=true, Snare=true, FakeDoor=true, DoorFake=true, SideroomSpace=true,
	ChestBox=true, ChestBoxLocked=true, Chest_Vine=true, Locker_Small_Locked=true, Toolbox=true,
	Toolbox_Locked=true, Wardrobe=true, ["Wardrobe-FOOLS26"]=true, Toolshed=true, Toolshed_Small=true,
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
	local IsHidingSpot = typeof(Object.Name) == "string" and string.find(string.lower(Object.Name), "hidingspot")
	if not AllowedInstances[Object.Name] and not IsHidingSpot and Object.ClassName ~= "ProximityPrompt" and Object.Parent ~= CurrentRooms and not ItemNames[Object.Name] then
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
		local DeadConn = Player:GetAttributeChangedSignal("Alive"):Connect(function()
			if Player:GetAttribute("Alive") ~= true and Player.Character then
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
	local DeadConn = Player:GetAttributeChangedSignal("Alive"):Connect(function()
		if Player:GetAttribute("Alive") ~= true and Player.Character then
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
		if not Prompt:IsA("ProximityPrompt") or PromptCooldown[Prompt] or table.find(PromptsToFire, Prompt) or not Camera then return end
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

			local TempPart = Instance.new("Part")
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
	while Model and not Model:IsA("Model") do
		Model = Model.Parent
	end
	if not Model then return nil end

	local Name = string.lower(Model.Name)
	if not string.find(Name, "hidingspot") and not string.find(Name, "hiding_spot") then
		return nil
	end
	return Model
end

local function HasHidePrompt(Model)
	return Model and (Model:FindFirstChild("HidePrompt") or Model:FindFirstChild("HidingPrompt")) ~= nil
end

local function IsHidingSpotPrompt(Prompt)
	if not Prompt or not Prompt.Parent then return false end
	if Prompt.Name ~= "HidePrompt" and Prompt.Name ~= "HidingPrompt" then return false end
	return HasHidePrompt(GetHidingSpotModel(Prompt))
end

Functions.TriggerPrompt = function(Prompt)
	if not Prompt or not Prompt.Parent then return end
	if Character:GetAttribute("Hiding") == true then return end
	local HidingSpot = GetHidingSpotModel(Prompt)
	if HidingSpot and Prompt.Name ~= "InteractPrompt" then return end
	local IsHidingSpotInteractPrompt = HidingSpot and Prompt.Name == "InteractPrompt"
	if AutoInteractBlacklist[Prompt.Name] and not IsHidingSpotPrompt(Prompt) and not IsHidingSpotInteractPrompt then return end
	if (Prompt.Name == "HidePrompt" or Prompt.Name == "HidingPrompt") and not IsHidingSpotPrompt(Prompt) then return end
	if (Prompt.Name == "HidePrompt" or Prompt.Name == "HidingPrompt" or IsHidingSpotPrompt(Prompt)) then
		if not Toggles.AutoClosetToggle.Value then return end
		local Entity = Functions.GetNearestEntity(true, Options.AutoClosetEntityList.Value)
		if not Entity then return end
		local EntityDistance = LocalPlayer:DistanceFromCharacter(Entity.PrimaryPart.Position)
		if EntityDistance > (EntityDistances[Entity.Name] or 150) then return end
	end
	if TriggerDebounce then return end

	local ParentItem = Functions.HasItem(Prompt.Parent.Name)
	if ParentItem and ParentItem:GetAttribute("Durability") and ParentItem:GetAttribute("DurabilityMax")
		and ParentItem:GetAttribute("Durability") >= ParentItem:GetAttribute("DurabilityMax")
	then return end

	local LockPromptNames = { UnlockPrompt=true, SkullPrompt=true, LockPrompt=true, ThingToEnable=true, FusesPrompt=true }
	local IsLockPrompt = LockPromptNames[Prompt.Name]
		or (Prompt.Parent and Prompt.Parent:GetAttribute("Locked") == true)
		or (Prompt.Parent and Prompt.Parent.Parent and Prompt.Parent.Parent.Name == "Locker_Small_Locked" and Prompt.Name == "ActivateEventPrompt")

	if IsLockPrompt then
		if Options.AutoInteractIgnoreList.Value["Locks"] then return end
		local KeyItems = { "Key","GeneratorFuse","KeyBackdoor","KeyElectrical","KeyIron","Lockpick","SkeletonKey","Shears","Multitool" }
		local OffhandKeyItems = { "Key","GeneratorFuse","KeyElectrical","KeyIron" }
		local HasKey = false
		for _, K in KeyItems do if Functions.HasItem(K, true) then HasKey = true break end end
		for _, K in OffhandKeyItems do if Functions.HasItem(K) then HasKey = true break end end
		if not HasKey then return end
	end

	if Prompt.Parent.Name == "CuttableVines" and not Functions.HasItem("Shears", true) and not Functions.HasItem("Multitool", true) or Prompt.Parent.Name == "Chest_Vine" and not Functions.HasItem("Shears", true) and not Functions.HasItem("Multitool", true) or Prompt.Parent.Name == "Cellar" and not Functions.HasItem("Shears", true) and not Functions.HasItem("Multitool", true) then return end
	if Prompt.Parent.Name == "SkullLock" and not Functions.HasItem("SkeletonKey", true) then return end
	if Prompt.Parent.Name == "Lock1" and not Functions.HasItem("Lockpick", true) and not Functions.HasItem("Multitool", true) or Prompt.Parent.Name == "Lock2" and not Functions.HasItem("Lockpick", true) and not Functions.HasItem("Multitool", true) then return end
	if Functions.HasItem("Shears", true) and IsLockPrompt and Prompt.Parent.Name ~= "CuttableVines" and Prompt.Parent.Name ~= "Chest_Vine" and Prompt.Parent.Name ~= "Cellar" then return end

	if Prompt.Parent.Name == "GlitchCube" and Options.AutoInteractIgnoreList.Value["Glitch Fragments"] then return end

	if (Prompt.Parent.Name == "KeyObtain" and (Functions.HasItem("Key") or Functions.HasItem("KeyBackdoor")))
		or (Prompt.Parent.Name == "ElectricalKeyObtain" and Functions.HasItem("KeyElectrical"))
	then return end

	if Prompt:IsDescendantOf(Drops) and Options.AutoInteractIgnoreList.Value["Dropped Items"] then return end
	if Prompt.Parent.Name == "TrackLever" then return end
	if Prompt.Name == "ActivateEventPrompt" and (Prompt.ActionText == "Close"
		or Prompt.Parent.Name == "ElevatorBreaker"
		or (Prompt.Parent.Parent and Prompt.Parent.Parent.Name == "IndustrialGate"))
	then return end
	if Prompt.Name == "ActivateEventPrompt" and (Prompt.Parent.Name == "Padlock" or Prompt.Parent.Name == "MinesAnchor") then return end
	if Prompt.Parent.Name == "LeverForGate" and Prompt:GetAttribute("Interactions") then return end
	if Prompt.Parent.Parent and (Prompt.Parent.Parent.Name == "DoorFake" or Prompt.Parent.Parent.Name == "FakeDoor") then return end
	if Prompt.Parent:GetAttribute("JeffShop") and Options.AutoInteractIgnoreList.Value["Jeff Items"] then return end
	if Prompt:GetAttribute("AutoInteractIgnore") then return end
	if Prompt.Name == "PushPrompt" and Options.AutoInteractIgnoreList.Value["Minecarts"] then return end
	if (Prompt.Parent.Name == "GoldPile" or Prompt.Parent.Name == "StardustPickup") and Options.AutoInteractIgnoreList.Value["Currency"] then return end

	if Prompt.Parent.Name == "Bandage" then
		local BPack = Functions.HasItem("BandagePack")
		if Humanoid.Health >= Humanoid.MaxHealth and not BPack then return end
		if BPack and BPack:GetAttribute("Durability") >= BPack:GetAttribute("DurabilityMax") then return end
	end

	if Prompt.Parent.Name == "Battery" then
		local Tool = Character:FindFirstChildOfClass("Tool")
		local BPack = Functions.HasItem("BatteryPack")
		if not Tool and not BPack then return end
		if Tool and Tool:GetAttribute("LightSource") then
			if Tool:GetAttribute("Durability") and Tool:GetAttribute("DurabilityMax")
				and Tool:GetAttribute("Durability") > Tool:GetAttribute("DurabilityMax")
			then return end
		elseif not BPack then
			return
		end
		if BPack and BPack:GetAttribute("Durability") >= BPack:GetAttribute("DurabilityMax") then return end
	end

	if Prompt.Name == "HerbPrompt" then
		local Effects = Globals.MainUI.MainFrame.Healthbar:FindFirstChild("Effects")
		if Effects and Effects.HerbGreenEffect.Visible then return end
	end

	if (Prompt.Parent.Name == "LibraryHintPaper" or Prompt.Parent.Name == "PickupItem") and (Functions.HasItem("LibraryHintPaper") or Functions.HasItem("LibraryHintPaperHard")) then return end
	if Prompt.Parent.Name == "AlarmClock" and Functions.HasItem("AlarmClock") then return end
	if Prompt.Parent.Name == "KeyObtainFake" or Prompt.Parent.Name == "TithingPlate" then return end
	if Prompt.Parent.Name == "StarBottle" then return end
    -- archives
	if Prompt.parent.Name == "ArchivesStorageBox" then return end
	if Prompt.Parent.Name == "Briefcase" then return end
	if Prompt.Name == "SinkPrompt" or Prompt.Parent.Name == "Faucet" then return end
	if Prompt.Parent.Name == "PaperPlanePickup" or Prompt.Parent.Name == "PaperPlane" then return end
	if Prompt.Name == "ManualOpenPrompt" or Prompt.Name == "EntryPrompt" then return end
	if Prompt.Parent.Parent.Name == "ArchivesLargePrinter" then return end
	if Prompt.Name == "TrashcanPrompt" then return end
	if Prompt.Parent.Name == "Keyboard" then return end
	if Prompt.Name == "CartPrompt" or Prompt.Parent.Parent.Name == "ArchivesOfficeChair" then return end
	if Prompt.Parent.Name == "ArchivesTerminal" then return end
	if Prompt.Name == "VendorPrompt" then return end
    if Prompt.Parent.Name == "SeatPart" or Prompt.Name == "SeatPrompt" then return end


	-- Stairwell
	if Prompt.Parent.Name == "StairwellScrapper" then return end
	if Prompt.Name == "PortraitDupePrompt" or Prompt.Parent.Name == "MirrorTool" then return end
	if Prompt.Name == "LaptopPrompt" or Prompt.Parent.Name == "SecretLaptop" then return end
	if Prompt.Parent.Name == "StairwellFireAlarm" or Prompt.Parent.Parent.Name == "StairwellFireAlarm" then return end
	if Prompt.Parent.name == "CobblerFriendly" then return end
	if Prompt.Parent.Name == "StairwellTerminal" then return end
	if Prompt.Parent.Parent.Name == "MeldChord" then return end

	Functions.FirePrompt(Prompt)
	TriggerDebounce = true
	if Floor == "OldHotel" then task.wait() end
	TriggerDebounce = false
end

Globals.LastAutoInteractFire = tick()
Connections.AutoInteract = Services.RunService.Heartbeat:Connect(function()
	local Active = Toggles.AutoInteractToggle.Value or Options.AutoInteractKeybind2:GetState()
    if not Active then return end
    if tick() - Globals.LastAutoInteractFire < 1/60 then return end

	for _, Prompt in Objects.Prompts do
        if Prompt:GetAttribute("ParentRoom") and tonumber(Prompt:GetAttribute("ParentRoom")) ~= tonumber(LocalPlayer:GetAttribute("CurrentRoom")) then continue end

		if Prompt.Parent and (Prompt.Parent:IsA("BasePart") or Prompt.Parent:IsA("Model")) then
			local Distance
			if Prompt.Parent:IsA("BasePart") then
				Distance = LocalPlayer:DistanceFromCharacter(Prompt.Parent.Position)
			else
				Distance = LocalPlayer:DistanceFromCharacter(Prompt.Parent:GetPivot().Position)
			end
			if Distance <= Prompt.MaxActivationDistance and Prompt.Enabled or Distance <= Prompt.MaxActivationDistance and Prompt.Name == "LongPushPrompt" or Distance <= Prompt.MaxActivationDistance and Prompt.Name == "BigPropPrompt" then
				task.spawn(Functions.TriggerPrompt, Prompt)
			end
		end
	end
    Globals.LastAutoInteractFire = tick()
end)

Connections.InfiniteItemsHandler = Services.ProximityPromptService.PromptTriggered:Connect(function(Object)
	if not Object:GetAttribute("FakePrompt") then return end

	local ToolNames = { "Lockpick","Shears","SkeletonKey","Key","GeneratorFuse","KeyElectrical","KeyBackdoor","KeyIron", "Multitool" }
	local AnimateToolNames = { "Lockpick","Shears","SkeletonKey","Key","KeyElectrical","KeyBackdoor","KeyIron", "Multitool" }
	local Tool
	for _, N in ToolNames do Tool = Character:FindFirstChild(N) if Tool then break end end

	local Prompt = Object
	local LockPromptNames = { UnlockPrompt=true, SkullPrompt=true, LockPrompt=true, ThingToEnable=true, FusesPrompt=true }
	local IsLockPrompt = LockPromptNames[Object.Name]
		or (Object.Parent and Object.Parent:GetAttribute("Locked") == true)
		or (Object.Parent and Object.Parent.Parent and Object.Parent.Parent.Name == "Locker_Small_Locked" and Object.Name == "ActivateEventPrompt")
	if IsLockPrompt then
		if Options.AutoInteractIgnoreList.Value["Locks"] then return end
		local KeyItems = { "Key","GeneratorFuse","KeyBackdoor","KeyElectrical","KeyIron","Lockpick","SkeletonKey","Shears","Multitool" }
		local OffhandKeyItems = { "Key","GeneratorFuse","KeyElectrical","KeyIron" }
		local HasKey = false
		for _, K in KeyItems do if Functions.HasItem(K, true) then HasKey = true break end end
		for _, K in OffhandKeyItems do if Functions.HasItem(K) then HasKey = true break end end
		if not HasKey then return end
	end

	if Prompt.Parent.Name == "CuttableVines" and not Functions.HasItem("Shears", true) and not Functions.HasItem("Multitool", true) or Prompt.Parent.Name == "Chest_Vine" and not Functions.HasItem("Shears", true) and not Functions.HasItem("Multitool", true) or Prompt.Parent.Name == "Cellar" and not Functions.HasItem("Shears", true) and not Functions.HasItem("Multitool", true) then return end
	if Prompt.Parent.Name == "SkullLock" and not Functions.HasItem("SkeletonKey", true) then return end
	if Prompt.Parent.Name == "Lock1" and not Functions.HasItem("Lockpick", true) and not Functions.HasItem("Multitool", true) or Prompt.Parent.Name == "Lock2" and not Functions.HasItem("Lockpick", true) and not Functions.HasItem("Multitool", true) then return end
	if Functions.HasItem("Shears", true) and IsLockPrompt and Prompt.Parent.Name ~= "CuttableVines" and Prompt.Parent.Name ~= "Chest_Vine" and Prompt.Parent.Name ~= "Cellar" then return end

	if Tool and table.find(AnimateToolNames, Tool.Name) and Globals.UseAnimation and Globals.UseAnimationBreak then
		Globals.UseAnimation:Stop()
		Globals.UseAnimationBreak:Stop()
		Globals.UseAnimationBreak:Play()
		if Tool.Name == "Shears" then Tool:WaitForChild("Handle"):WaitForChild("sound_prompt"):Play() end
	end

	local AnyTool = Character:FindFirstChildOfClass("Tool")
	local ToolData = AnyTool and ItemNames[AnyTool.Name]
	if AnyTool and ToolData and Toggles.InfiniteItemsToggle.Value and Options.InfiniteItemsList.Value[ToolData] then
		Drops.ChildAdded:Once(function(NewTool)
			local Prompt = NewTool:FindFirstChild("ModulePrompt")
			local RealPrompt = FakePrompts[Object]
			Functions.FirePrompt(Prompt)
			Functions.FirePrompt(RealPrompt)
		end)
		Character.ChildAdded:Once(function(NewTool)
			if NewTool.Name == "Shears" then NewTool:WaitForChild("Handle"):WaitForChild("sound_promptend"):Play() end
		end)
		RemotesFolder.DropItem:FireServer(AnyTool)
	else
		local RealPrompt = FakePrompts[Object]
		Functions.FirePrompt(RealPrompt)
	end
end)

Connections.FloorReplicatedHandler = FloorReplicated.DescendantAdded:Connect(function(Object)
	if Object.Name == "GlitchScreech" then
		Modules.GlitchScreech = Object
		if Toggles.RemoveScreech.Value then Object.Name = "GlitchScreech_Disabled" end
	end
	if Object.Name:find("Jumpscare") and Object:IsA("ModuleScript")
		and not Object.Name:find("Eyestalk") and not Object.Name:find("Groundskeeper") and not Object.Name:find("Monument")
	then
		Object:SetAttribute("OriginalName", Object.Name)
		if Toggles.DisableEntityJumpscares.Value then Object.Name = Object.Name .. "_Disabled" end
		table.insert(Objects.JumpscareModules, Object)
	end
end)

if FloorReplicated:FindFirstChild("DigitalTimer") then
	Connections.HasteTimerConnection = FloorReplicated.DigitalTimer:GetPropertyChangedSignal("Value"):Connect(function()
		if Toggles.NotifyHasteTime.Value then Functions.Caption(Functions.GetHasteTime(), true) end
	end)
end

Connections.FogHandler = Services.Lighting:GetPropertyChangedSignal("FogEnd"):Connect(function()
	if Services.Lighting.FogEnd ~= 10000000 then
		Globals.OldFog = Services.Lighting.FogEnd
	end
	if Toggles.RemoveCameraFog.Value then
		Services.Lighting.FogEnd = 10000000
	end
end)

Connections.FogHandler2 = Services.Lighting.DescendantAdded:Connect(function(Object)
	if not Object:IsA("Atmosphere") then return end
	Object:SetAttribute("Density_Old", Object.Density)
	if Toggles.RemoveCameraFog.Value then Object.Density = 0 end

	local AtmoConn2 = Object:GetPropertyChangedSignal("Density"):Connect(function()
		if Object.Density ~= 0 then Object:SetAttribute("Density_Old", Object.Density) end
		if Toggles.RemoveCameraFog.Value then Object.Density = 0 end
	end)
	Object.Destroying:Once(function() AtmoConn2:Disconnect() end)
	table.insert(Connections, AtmoConn2)
	table.insert(Globals.FogInstances, Object)
end)

local RusherAliases = { Rush=true, Bash=true, Scribbles=true, DronesStampede=true, Ambush=true, Eyes=true, Lookman=true, Blitz=true, ["A-60"]=true, ["A-120"]=true, AR0xMBUSH=true, ["RNIUSHCG=="]=true, ["Custom Entity"]=true }

local function HandleEntitySpawn(Entity)
	if not Entity or typeof(Entity) ~= "Instance" then return end

	local Model = Entity
	if Entity:IsA("Humanoid") then
		Model = Entity.Parent
	end
	if not Model or not Model:IsA("Model") then return end

	local EntityData = Entities[Model.Name]
	if not EntityData then return end
	if Model:GetAttribute("IRT_EntityHandled") then return end
	Model:SetAttribute("IRT_EntityHandled", true)

	while not Model.PrimaryPart do
		for _, Child in Model:GetChildren() do
			if Child:IsA("BasePart") then Model.PrimaryPart = Child end
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

		if Model.Name == "RushMoving" and Model.PrimaryPart.Name ~= "RushNew" then
			NotifyTitle = NotifyTitle:gsub("Rush", Model.PrimaryPart.Name)
			NotifyImage = Model.PrimaryPart:WaitForChild("Attachment").ParticleEmitter.Texture
			Alias = Model.PrimaryPart.Name
		end

		Functions.Notify({ Title = NotifyTitle, Body = NotifyBody, Image = NotifyImage, Time = Toggles.NotifyKeepNotifications.Value and Model or nil })

		if Toggles.EntityChatToggle.Value then
			Functions.SendChat(Alias .. " " .. Options.EntityChatMessage.Value)
		end
	end

	if Model.Name ~= "GloombatSwarm" then
		if Toggles.EntityESPToggle.Value and Options.EntityESPOptions.Value[RealAlias] then
			if Model.Name == "MonumentEntity" then
				Functions.AddESP({ Object = Model.Top, Text = Alias, Color = Options.EntityESPColor.Value })
			else
				Functions.AddESP({ Object = Model, Text = Alias, Color = Options.EntityESPColor.Value })
			end
		end
		table.insert(Objects.Entities, Model)
	end

	if RusherAliases[EntityData.Alias] then
		Instance.new("Humanoid", Model).Name = "HighlightHumanoid"
		local Root = Model.PrimaryPart
		if Root then Root.Transparency = 0.999 Root.Material = Enum.Material.Plastic end
	end

	if Model.Name == "Lookman" then
		CurrentRooms.ChildAdded:Wait()
		task.wait(10)
		Model:Destroy()
	end
end

Connections.EntityHandler = Services.Workspace.ChildAdded:Connect(HandleEntitySpawn)
Connections.EntityDescendantHandler = Services.Workspace.DescendantAdded:Connect(function(Descendant)
	local EntityModel = Descendant:IsA("Humanoid") and Descendant.Parent or Descendant
	if EntityModel and EntityModel:IsA("Model") and Entities[EntityModel.Name] then
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
		if Prompt:HasTag("DisableWhenEnabledOnClient") then
			Prompt:RemoveTag("DisableWhenEnabledOnClient")
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
		if type(Key) == "string" then
			pcall(function() Connection:Disconnect() end)
		else
			pcall(function() Key:Disconnect() end)
			pcall(function() Connection:Disconnect() end)
		end
	end

	for _, Object in Objects.Entities do
		if Object.Name == "Snare" or Object.Name == "GiggleCeiling" then
			local Hitbox = Object:FindFirstChild("Hitbox")
			if Hitbox then Hitbox.CanTouch = true end
		end
		if Object.Name == "GloomPile" then
			for _, Part in Object:GetDescendants() do
				if Part:IsA("BasePart") then Part.CanTouch = true end
			end
		end
		if Object.Name == "FakeDoor" or Object.Name == "DoorFake" then
			local Hidden = Object:FindFirstChild("Hidden")
			if Hidden then Hidden.CanTouch = true end
			local Lock = Object:FindFirstChild("Lock")
			if Lock and Lock:FindFirstChild("UnlockPrompt") then Lock.UnlockPrompt.Enabled = true end
		end
		if Object.Name == "SideroomSpace" then
			local Coll = Object:FindFirstChild("Collision")
			if Coll then Coll.CanCollide = false Coll.CanTouch = true end
		end
	end

	for _, Object in Objects.SeekBridges do Object:Destroy() end

	for _, Fog in Globals.FogInstances do
		Fog.Density = Fog:GetAttribute("Density_Old")
	end
	Services.Lighting.FogEnd = Globals.OldFog

	local Vignette = Globals.MainUI:FindFirstChild("HideVignette") or Globals.MainUI.MainFrame:FindFirstChild("HideVignette")
	if Vignette then Vignette.Image = "rbxassetid://6100076320" end

	local ModuleRestores = {
		Screech = "Screech", Glitch = "Glitch", Shade = "Shade",
		SpiderJumpscare = "SpiderJumpscare", A90 = "A90", Dread = "Dread", Void = "Void"
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

	local OldAmbient = CurrentRooms:FindFirstChild(tostring(LocalPlayer:GetAttribute("CurrentRoom"))):GetAttribute("Ambient")
	Services.TweenService:Create(Services.Lighting, TweenInfo.new(0.2, Enum.EasingStyle.Exponential), { Ambient = OldAmbient }):Play()

	for _, Prompt in Objects.Prompts do
		if FakePrompts[Prompt] then
			FakePrompts[Prompt].Parent = Prompt.Parent
			Prompt:Destroy()
		end
		if Prompt.Parent then
			Prompt.HoldDuration = Prompt:GetAttribute("HoldDuration_Old") or Prompt.HoldDuration
			Prompt.RequiresLineOfSight = Prompt:GetAttribute("RequiresLineOfSight_Old") or Prompt.RequiresLineOfSight
			Prompt.MaxActivationDistance = Prompt:GetAttribute("MaxActivationDistance_Old") or Prompt.MaxActivationDistance
		end
	end

	Character:SetAttribute("CanJump",  OldJump)
	Character:SetAttribute("CanSlide", OldSlide)

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

	if Character:FindFirstChild("LowerTorso") and Character.LowerTorso:FindFirstChild("Root") then
		Character.LowerTorso.Root.C1 = Globals.OriginalC1
	end
	if Collision:FindFirstChild("CollisionCrouch") then
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
Functions.Notify({ Title = "Successfully loaded in " .. math.floor((tick() - LoadStart) * 1000) / 1000 .. " seconds." , Body = "Press '" .. tostring(Options.MenuKeybind and Options.MenuKeybind.Value or "RightControl") .. "' to toggle the UI."})
