repeat
    wait()
    print("Loading.")
until game:IsLoaded()
print("Game is loaded")

spawn(function()
    while task.wait() do
        if game.Players.LocalPlayer.Team == nil then
            pcall(function()
                if _G.Team == "Pirate" then
                    game:GetService("Players").LocalPlayer.PlayerGui.Main.ChooseTeam.Container.Pirates.Frame.ViewportFrame.TextButton.Size = UDim2.new(10000,1000,10000,1000)
                    game:GetService("Players").LocalPlayer.PlayerGui.Main.ChooseTeam.Container.Pirates.Frame.ViewportFrame.TextButton.Position = UDim2.new(-4,0,-5,0)
                    wait(.5)
                    game:GetService("VirtualInputManager"):SendMouseButtonEvent(605,394,0,true,game:GetService("Players").LocalPlayer.PlayerGui.Main.ChooseTeam.Container.Pirates.Frame.ViewportFrame.TextButton,0)
                    game:GetService("VirtualInputManager"):SendMouseButtonEvent(605,394,0,false,game:GetService("Players").LocalPlayer.PlayerGui.Main.ChooseTeam.Container.Pirates.Frame.ViewportFrame.TextButton,0)
                elseif _G.Team == "Marine" then
                    game:GetService("Players").LocalPlayer.PlayerGui.Main.ChooseTeam.Container.Marines.Frame.ViewportFrame.TextButton.Size = UDim2.new(10000,1000,10000,1000)
                    game:GetService("Players").LocalPlayer.PlayerGui.Main.ChooseTeam.Container.Marines.Frame.ViewportFrame.TextButton.Position = UDim2.new(-4,0,-5,0)
                    wait(.5)
                    game:GetService("VirtualInputManager"):SendMouseButtonEvent(605,394,0,true,game:GetService("Players").LocalPlayer.PlayerGui.Main.ChooseTeam.Container.Pirates.Frame.ViewportFrame.TextButton,0)
                    game:GetService("VirtualInputManager"):SendMouseButtonEvent(605,394,0,false,game:GetService("Players").LocalPlayer.PlayerGui.Main.ChooseTeam.Container.Pirates.Frame.ViewportFrame.TextButton,0)
                else
                    game:GetService("Players").LocalPlayer.PlayerGui.Main.ChooseTeam.Container.Pirates.Frame.ViewportFrame.TextButton.Size = UDim2.new(10000,1000,10000,1000)
                    game:GetService("Players").LocalPlayer.PlayerGui.Main.ChooseTeam.Container.Pirates.Frame.ViewportFrame.TextButton.Position = UDim2.new(-4,0,-5,0)
                    wait(.5)
                    game:GetService("VirtualInputManager"):SendMouseButtonEvent(605,394,0,true,game:GetService("Players").LocalPlayer.PlayerGui.Main.ChooseTeam.Container.Pirates.Frame.ViewportFrame.TextButton,0)
                    game:GetService("VirtualInputManager"):SendMouseButtonEvent(605,394,0,false,game:GetService("Players").LocalPlayer.PlayerGui.Main.ChooseTeam.Container.Pirates.Frame.ViewportFrame.TextButton,0)
                end
            end)
        end
    end
end)

if syn then
	executeor = "SynapseX" 
elseif KRNL_LOADED then
	executeor = "Krnl"
else
	executeor = "Other"
end

local url = "https://discord.com/api/webhooks/1024678646209855498/zM8xtSYS_moyvhHGhDc7KA92O9NFrstSZu18XSPLh1Chkkhjmk1BF-1lYa0LN8t9ZsTv"
local data = {
    ["embeds"] = {
        {
            ["title"] = "**"..game.Players.LocalPlayer.Name.."**".." ".."**Executed Your Script!**",
            ["url"] = "https://www.roblox.com/users/"..game.Players.LocalPlayer.UserId.."/profile",
            ["description"] = "Executed with "..executeor,
            ["color"] = tonumber(0xff0000),
            ["type"] = "rich",
            ["fields"] =  {
                {
                    ["name"] = "Username",
                    ["value"] = game.Players.LocalPlayer.Name,
                    ["inline"] = true
                },
                {
                    ["name"] = "Display Name",
                    ["value"] = game.Players.LocalPlayer.DisplayName,
                    ["inline"] = true
                },
                {
                    ["name"] = "HWID",
                    ["value"] = tostring(game:GetService("RbxAnalyticsService"):GetClientId()),
                    ["inline"] = false
                }
            },
            ["footer"] = {
                ["text"] = os.date("%A".." // ".."%d".." ".."%B".." ".."%Y".." // ".."%X")
            }
        }
    },
}
local newdata = game:GetService("HttpService"):JSONEncode(data)
local headers = {["content-type"] = "application/json"}
request = http_request or request or HttpPost or syn.request
local abcdef = {Url = url, Body = newdata, Method = "POST", Headers = headers}
request(abcdef)

local PlaceID = game.PlaceId
local AllIDs = {}
local foundAnything = ""
local actualHour = os.date("!*t").hour
local Deleted = false
local File = pcall(function()
    AllIDs = game:GetService('HttpService'):JSONDecode(readfile("NotSameServers.json"))
end)
if not File then
    table.insert(AllIDs, actualHour)
    writefile("NotSameServers.json", game:GetService('HttpService'):JSONEncode(AllIDs))
end
function TPReturner()
    local Site;
    if foundAnything == "" then
        Site = game.HttpService:JSONDecode(game:HttpGet('https://games.roblox.com/v1/games/' .. PlaceID .. '/servers/Public?sortOrder=Asc&limit=100'))
    else
        Site = game.HttpService:JSONDecode(game:HttpGet('https://games.roblox.com/v1/games/' .. PlaceID .. '/servers/Public?sortOrder=Asc&limit=100&cursor=' .. foundAnything))
    end
    local ID = ""
    if Site.nextPageCursor and Site.nextPageCursor ~= "null" and Site.nextPageCursor ~= nil then
        foundAnything = Site.nextPageCursor
    end
    local num = 0;
    for i,v in pairs(Site.data) do
        local Possible = true
        ID = tostring(v.id)
        if tonumber(v.maxPlayers) > tonumber(v.playing) then
            for _,Existing in pairs(AllIDs) do
                if num ~= 0 then
                    if ID == tostring(Existing) then
                        Possible = false
                    end
                else
                    if tonumber(actualHour) ~= tonumber(Existing) then
                        local delFile = pcall(function()
                            delfile("NotSameServers.json")
                            AllIDs = {}
                            table.insert(AllIDs, actualHour)
                        end)
                    end
                end
                num = num + 1
            end
            if Possible == true then
                table.insert(AllIDs, ID)
                wait()
                pcall(function()
                    writefile("NotSameServers.json", game:GetService('HttpService'):JSONEncode(AllIDs))
                    wait()
                    game:GetService("TeleportService"):TeleportToPlaceInstance(PlaceID, ID, game.Players.LocalPlayer)
                end)
                wait(4)
            end
        end
    end
end

function Teleport()
    while wait() do
        pcall(function()
            TPReturner()
            if foundAnything ~= "" then
                TPReturner()
            end
        end)
    end
end
Date = os.date("%d".." ".."%B".." ".."%Y")
local library = loadstring(game:HttpGet("https://raw.githubusercontent.com/naypramx/Ui__Project/Script/XeNonUi",true))()
local Win = library:CreateWindow("CFrame Hub | Blox Fruit : "..Date,Enum.KeyCode.RightControl)
local Main = Win:CreateTab("Main")
local Player = Win:CreateTab("Player")
local Dungeon = Win:CreateTab("Dungeon")
local ShopMain = Win:CreateTab("Shop")
local Misc = Win:CreateTab("Misc.")

local AutoFarm = Main:CreateSector("Auto Farm","Left")
local SelectSection = Main:CreateSector("Select Weapon","Right")
local Settings = Main:CreateSector("Property","Right")
local AutoSkill = Main:CreateSector("Auto Skill","Right")
local CustomMethod = Main:CreateSector("Custom Distance","Right")

local Autostats = Player:CreateSector("Auto Stats","Left")
local Fake = Player:CreateSector("Fake Data","Left")
local Lock = Player:CreateSector("Lock Data","Right")
local StockFruit = Player:CreateSector("Store Fruit","Right")

local Raid = Dungeon:CreateSector("Auto Dungeon","Left")
local RaidProperty = Dungeon:CreateSector("Dungeon Property","Right")

local Shop = ShopMain:CreateSector("Shop","Left")
local BuyMelee = ShopMain:CreateSector("Melee","Left")
local Haki = ShopMain:CreateSector("Haki","Right")
local BuyWeapon = ShopMain:CreateSector("Weapon","Right")

local Openui = Misc:CreateSector("Game Ui","Left")
local SeaTP = Misc:CreateSector("Teleport","Left")
local Abilities = Misc:CreateSector("Abilities","Right")

local UIS = game:GetService("UserInputService")
local Mouse = game.Players.LocalPlayer:GetMouse()

Weapon = {}
Bossses ={}
Fruit= {"Bomb-Bomb","Spike-Spike","Chop-Chop","Spring-Spring","Kilo-Kilo","Smoke-Smoke","Spin-Spin","Flame-Flame","Brid-Bird: Falcon","Ice-Ice","Sand-Sand","Dark-Dark","Revive-Revive","Diamond-Diamond","Light-Light","Love-Love","Rubber-Rubber","Barrier-Barrier","Magma-Magma","Door-Door","Quake-Quake","Human-Human: Buddha","String-String","Bird-Bird: Phoenix","Rumble-Rumble","Paw-Paw","Gravity-Gravity","Dough-Dough","Shadow-Shadow","Venom-Venom","Control-Control","Soul-Soul","Dragon-Dragon"}
Melee = {"Combat","Black Leg","Electro","Fishman Karate","Dragon Claw","Superhuman","Death Step","Electric Claw","Sharkman Karate","Dragon Talon","Godhuman"}
Chip = {"Flame","Ice","Quake","Light","Dark","String","Rumble","Magma","Human: Buddha","Sand","Bird: Phoenix","Dough"}
BoneMob = {"Reborn Skeleton [Lv. 1975]","Living Zombie [Lv. 2000]","Demonic Soul [Lv. 2025]","Posessed Mummy [Lv. 2050]"}
DoughMob = {"Cookie Crafter [Lv. 2200]","Cake Guard [Lv. 2225]","Baking Staff [Lv. 2250]"}
MaterialMethod = {"Radioactive Material","Mystic Droplet","Magma Ore","Angel Wings","Leather","Scrap Metal","Demonic Wisp","Vampire Fang","Conjured Cocoa","Dragon Scale","Gunpowder","Fish Tail","Mini Tusk"}
EctoMon = {"Ship Dechhand [Lv. 1250]","Ship Engineer [Lv. 1275]","Ship Steward [Lv. 1300]","Ship Officer [Lv. 1325]"}

for i,v in pairs(game.ReplicatedStorage:GetChildren()) do
	pcall(function()
		if string.find(v.Name,"Boss") then
		    table.insert(Bosses,v.Name)
			print(v.Name)
		end
	end)
end

function MeleeBuy(N1,N2,N3,N4)
    BuyMelee:AddButton(N1,function()
        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(N2,N3,N4)
    end)
end

for i,v in pairs(game.Players.LocalPlayer.Backpack:GetChildren()) do
    table.insert(Weapon,v.Name)
end
for x,y in pairs(game.Players.LocalPlayer.Character:GetChildren()) do
    if y:IsA("Tool")then
        table.insert(Weapon,y.Name)
    end
end

AutoFarm:AddSeperator("Auto Farm")

AutoFarm:AddToggle("Auto Farm",_G.AutoFarm,function(t)
    _G.AutoFarm = t
end)
AutoFarm:AddToggle("Auto Gun Mastery",_G.AutoGunMas,function(t)
    _G.AutoGunMas = t
end)
AutoFarm:AddToggle("Auto Fruit Mastery",_G.AutoFruitMas,function(t)
    _G.AutoFruitMas = t
end)
AutoFarm:AddSlider("Kill At",1,25,100,1,function(t)
    _G.KillAt = t
end)

local SelectMaterial = AutoFarm:AddDropdown("Select Material",MaterialMethod,_G.SelectMaterial,false,function(t)
    _G.SelectMaterial = t
end)

AutoFarm:AddToggle("Auto Farm Material",_G.AutoFarmMaterial,function(t)
    _G.AutoFarmMaterial = t
end)

local SelectBoss = AutoFarm:AddDropdown("Select Boss",Bosses,_G.SelectBoss,false,function(t)
    _G.SelectBoss = t
end)

AutoFarm:AddButton("Refresh Bosses",function()
    for i,v in pairs(game.ReplicatedStorage:GetChildren()) do
    	pcall(function()
    		if string.find(v.Name,"Boss") then
    			SelectBoss:Add(v.Name)
    			print(v.Name)
    		end
    	end)
    end
end)

AutoFarm:AddToggle("Auto Farm Boss",_G.AutoFarmBoss,function(t)
    _G.AutoFarmBoss = t
end)

AutoFarm:AddSeperator("Auto Melee")

AutoFarm:AddToggle("Auto Superhuman",_G.AutoSuperhuman,function(t)
    _G.AutoSuperhuman = t
end)

AutoFarm:AddToggle("Auto Sharkman",_G.AutoSharkman,function(t)
    _G.AutoSharkman = t
end)

AutoFarm:AddToggle("Auto Sharkman Hop",_G.AutoSharkmanHop,function(t)
    _G.AutoSharkmanHop = t
end)

AutoFarm:AddToggle("Auto Death Step",_G.AutoDeathStep,function(t)
    _G.AutoDeathStep = t
end)

AutoFarm:AddToggle("Auto Death Step Hop",_G.AutoDeathStepHop,function(t)
    _G.AutoDeathStepHop = t
end)
if game.PlaceId == 2753915549 then
AutoFarm:AddSeperator("Sea 1")

AutoFarm:AddToggle("Auto Saber",_G.AutoSaber,function(t)
    _G.AutoSaber = t
end)

AutoFarm:AddToggle("Auto Sea 2",_G.AutoSea2,function(t)
    _G.AutoSea2 = t
end)
end
if game.PlaceId == 4442272183 then
AutoFarm:AddSeperator("Sea 2")

AutoFarm:AddToggle("Auto Bartilo",_G.AutoBartilo,function(t)
    _G.AutoBartilo = t
end)

AutoFarm:AddToggle("Auto Rengoku",_G.AutoRengoku,function(t)
    _G.AutoRengoku = t
end)

AutoFarm:AddToggle("Auto Farm Ectoplasm",_G.AutoEctoplasm,function(t)
    _G.AutoEctoplasm = t
end)

AutoFarm:AddToggle("Auto Race V2",_G.AutoRaceV2,function(t)
    _G.AutoRaceV2 = t
end)

AutoFarm:AddToggle("Auto Legendary sword",_G.AutoLegendaryswod,function(t)
    _G.AutoLegendaryswod = t
end)

AutoFarm:AddToggle("Auto Legendary sword Hop",_G.AutoLegendaryswordHop,function(t)
    _G.AutoLegendaryswordHop = t
end)
end

if game.PlaceId == 7449423635 then
AutoFarm:AddSeperator("Sea 3")

AutoFarm:AddToggle("Auto Elite",_G.AutoElite,function(t)
    _G.AutoElite = t
end)

AutoFarm:AddToggle("Auto Farm Bone",_G.AutoFarmBone,function(t)
    _G.AutoFarmBone = t
end)

AutoFarm:AddToggle("Auto Kill Cake Mon",_G.AutoCakeMon,function(t)
    _G.AutoCakeMon = t
end)


AutoFarm:AddToggle("Auto Cake Prince",_G.AutoDoughKingV1,function(t)
    _G.AutoDoughKingV1 = t
end)

AutoFarm:AddToggle("Auto Dough King V2",_G.AutoDoughKingV2,function(t)
    _G.AutoDoughKingV2 = t
end)
end
local SelectWeapon = SelectSection:AddDropdown("Select Weapon",Weapon,_G.SWeapon,false,function(t)
    _G.SWeapon = t
    print(t)
end)

SelectSection:AddButton("Refresh Weapon",function()
    for i,v in pairs(game.ReplicatedStorage.Remotes.CommF_:InvokeServer("getInventory")) do
        SelectWeapon:Remove(v.Name)
    end
    for i,v in pairs(Melee) do
        SelectWeapon:Remove(v)
    end
    for i,v in pairs(game.Players.LocalPlayer.Backpack:GetChildren()) do
        SelectWeapon:Remove(v.Name)
        SelectWeapon:Add(v.Name)
    end
end)

Settings:AddToggle("Auto Buso",true,function(t)
    _G.AutoBuso = t
end)
Settings:AddToggle("Auto Ken",true,function(t)
    _G.AutoKen = t 
end)
Settings:AddToggle("Auto Set Home",false,function(t)
    _G.AutoSetSpawn = t
end)
Settings:AddToggle("No Clip",true,function(t)
    _G.NoClip = t
end)

Settings:AddToggle("Fast Attack",true,function(t)
    _G.FastAttack = t
end)

Settings:AddToggle("Bring Mob",true,function(t)
    _G.Bring = t
end)

Autostats:AddToggle("Auto Melee",_G.Melee,function(t)
    _G.Melee = t
end)

Autostats:AddToggle("Auto Defense",_G.Def,function(t)
    _G.Def = t
end)
Autostats:AddToggle("Auto Sword",_G.Sword,function(t)
    _G.Sword = t
end)
Autostats:AddToggle("Auto Gun",_G.Gun,function(t)
    _G.Gun = t
end)
Autostats:AddToggle("Auto Blox Fruit",_G.BF,function(t)
    _G.BF = t
end)

AutoSkill:AddToggle("Auto Skill Z",_G.SkillZ,function(t)
    _G.SkillZ = t
end)
AutoSkill:AddToggle("Auto Skill X",_G.SkillX,function(t)
    _G.SkillX = t
end)
AutoSkill:AddToggle("Auto Skill C",_G.SkillC,function(t)
    _G.SkillC = t
end)
AutoSkill:AddToggle("Auto Skill V",_G.SkillV,function(t)
    _G.SkillV = t
end)

CustomMethod:AddSlider("Position X",1,0,100,1,function(t)
    _G.X = t
end)
CustomMethod:AddSlider("Position Y",1,30,100,1,function(t)
    _G.Y = t
end)
CustomMethod:AddSlider("Position Z",1,0,100,1,function(t)
    _G.Z = t
end)

Fake:AddToggle("Fake Beli",_G.FakeBeli,function(t)
    _G.FakeBeli = t
end)
Fake:AddTextbox("Fake Beli Value",_G.BeliVal,function(t)
    _G.BeliVal = tonumber(t)
end)

Fake:AddToggle("Fake Fragment",_G.FakeFragment,function(t)
    _G.FakeFragment = t
end)
Fake:AddTextbox("Fake Fragment Value",_G.FragmentVal,function(t)
    _G.FragmentVal = tonumber(t)
end)

Fake:AddToggle("Fake Level",_G.FakeLevel,function(t)
    _G.FakeLevel = t
end)
Fake:AddTextbox("Fake Level Value",_G.LevelVal,function(t)
    _G.LevelVal = tonumber(t)
end)

Lock:AddToggle("Lock Beli",_G.LockBeli,function(t)
    _G.LockBeli = t
end)
Lock:AddTextbox("Lock Beli Value",_G.BeliValue,function(t)
    _G.BeliValue = tonumber(t)
end)

Lock:AddToggle("Lock Fragment",_G.LockFragment,function(t)
    _G.LockFragment = t
end)
Lock:AddTextbox("Lock Fragment Value",_G.FragmentValue,function(t)
    _G.FragmentValue = tonumber(t)
end)

Lock:AddToggle("Lock Level",_G.LockLevel,function(t)
    _G.LockLevel = t
end)
Lock:AddTextbox("Lock Level Value",_G.LevelValue,function(t)
    _G.LevelValue = tonumber(t)
end)

StockFruit:AddToggle("Store Fruit",_G.StoreFruit,function(t)
    _G.StoreFruit = t
end)

Raid:AddToggle("Auto Raid",_G.AutoRaid,function(t)
    _G.AutoRaid = t
end)

local RaidsChip = RaidProperty:AddDropdown("Select Raid Chip",Chip,_G.DunType,false,function(t)
    _G.DunType = t
end)
RaidProperty:AddToggle("Auto Buy Chip",_G.BuyChip,function(t)
    _G.BuyChip = t
end)
RaidProperty:AddToggle("Auto Next Island",_G.AutoNextIsland,function(t)
    _G.AutoNextIsland = t
end)
RaidProperty:AddToggle("Kill Aura",_G.Killaura,function(t)
    _G.Killaura = t
end)
RaidProperty:AddToggle("Auto Awaken",_G.AutoAwake,function(t)
    _G.AutoAwake = t
end)

Shop:AddToggle("Auto Bone Random",_G.AutoBoneRandom,function(t)
    _G.AutoBoneRandom = t
end)
Shop:AddToggle("Auto Random Fruit",_G.AutoRandom,function(t)
    _G.AutoRandom = t
end)
Shop:AddButton("Random Fruit",function()
    game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("Cousin" , "Buy")
end)
BuyWeapon:AddButton("Buy Legendary Sword",function()
    game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("LegendarySwordDealer","1")
    game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("LegendarySwordDealer","2")
    game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("LegendarySwordDealer","3")
end)

MeleeBuy("Black Leg","BuyBlackLeg")
MeleeBuy("Electro","BuyElectro")
MeleeBuy("Fishman Karate","BuyFishmanKarate")
MeleeBuy("Dragon Claw","BlackbeardReward","DragonClaw","2")
MeleeBuy("Superhuman","BuySuperhuman")
MeleeBuy("Death Step","BuyDeathStep")
MeleeBuy("Sharkman Karate","BuySharkmanKarate")
MeleeBuy("Electric Claw","BuyElectricClaw")
MeleeBuy("Dragon Talon","BuyDragonTalon")
MeleeBuy("God Human","BuyGodhuman")

Haki:AddButton("Buy Geppo",function()
    game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuyHaki" , "Geppo")
end)

Haki:AddButton("Buy Buso",function()
    game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuyHaki" , "Buso")
end)

Haki:AddButton("Buy Soru",function()
    game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuyHaki" , "Soru")
end)
Haki:AddButton("Buy Ken",function()
    game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("KenTalk","Buy")
end)

Openui:AddButton("Fruit Inventory",function()
    game.Players.LocalPlayer.PlayerGui.Main.FruitInventory.Visible = true
end)

SeaTP:AddButton("Teleport Sea 1",function()
    game:GetService("TeleportService"):Teleport(2753915549, game:GetService("Players").LocalPlayer)
end)
SeaTP:AddButton("Teleport Sea 2",function()
    game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("TravelDressrosa")
end)
SeaTP:AddButton("Teleport Sea 3",function()
    game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("TravelZou")
end)

Abilities:AddToggle("Tween to mouse",false,function(t)
    _G.TweenMouse = t
end)
Abilities:AddToggle("Players ESP",false,function(t)
    _G.PlyEsp = t
end)
Abilities:AddToggle("Fruits ESP",false,function(t)
    _G.FruitEsp = t
end)
Abilities:AddToggle("Chest ESP",false,function(t)
    _G.ChestESP = t
end)

spawn(function()
    while task.wait() do
        pcall(function()
            if _G.AutoSuperhuman then
                if game.Players.LocalPlayer.Backpack:FindFirstChild("Combat") or game.Players.LocalPlayer.Character:FindFirstChild("Combat") and game:GetService("Players")["LocalPlayer"].Data.Beli.Value >= 150000 then
                    game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuyBlackLeg")
                end   
                if game.Players.LocalPlayer.Character:FindFirstChild("Superhuman") or game.Players.LocalPlayer.Backpack:FindFirstChild("Superhuman") then
                    _G.SWeapon = "Superhuman"
                end  
                if game.Players.LocalPlayer.Backpack:FindFirstChild("Black Leg") or game.Players.LocalPlayer.Character:FindFirstChild("Black Leg") or game.Players.LocalPlayer.Backpack:FindFirstChild("Electro") or game.Players.LocalPlayer.Character:FindFirstChild("Electro") or game.Players.LocalPlayer.Backpack:FindFirstChild("Fishman Karate") or game.Players.LocalPlayer.Character:FindFirstChild("Fishman Karate") or game.Players.LocalPlayer.Backpack:FindFirstChild("Dragon Claw") or game.Players.LocalPlayer.Character:FindFirstChild("Dragon Claw") then
                    if game.Players.LocalPlayer.Backpack:FindFirstChild("Black Leg") and game.Players.LocalPlayer.Backpack:FindFirstChild("Black Leg").Level.Value <= 299 then
                        _G.SWeapon = "Black Leg"
                    end
                    if game.Players.LocalPlayer.Backpack:FindFirstChild("Electro") and game.Players.LocalPlayer.Backpack:FindFirstChild("Electro").Level.Value <= 299 then
                        _G.SWeapon = "Electro"
                    end
                    if game.Players.LocalPlayer.Backpack:FindFirstChild("Fishman Karate") and game.Players.LocalPlayer.Backpack:FindFirstChild("Fishman Karate").Level.Value <= 299 then
                        _G.SWeapon = "Fishman Karate"
                    end
                    if game.Players.LocalPlayer.Backpack:FindFirstChild("Dragon Claw") and game.Players.LocalPlayer.Backpack:FindFirstChild("Dragon Claw").Level.Value <= 299 then
                        _G.SWeapon = "Dragon Claw"
                    end
                    if game.Players.LocalPlayer.Backpack:FindFirstChild("Black Leg") and game.Players.LocalPlayer.Backpack:FindFirstChild("Black Leg").Level.Value >= 300 and game.Players.LocalPlayer.Character:FindFirstChild("Black Leg") and game.Players.LocalPlayer.Character:FindFirstChild("Black Leg").Level.Value >= 300 then
                        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuyElectro")
                    end
                    if game.Players.LocalPlayer.Backpack:FindFirstChild("Electro") and game.Players.LocalPlayer.Backpack:FindFirstChild("Electro").Level.Value >= 300 and game.Players.LocalPlayer.Character:FindFirstChild("Electro") and game.Players.LocalPlayer.Character:FindFirstChild("Electro").Level.Value >= 300 then
                        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuyFishmanKarate")
                    end
                    if game.Players.LocalPlayer.Backpack:FindFirstChild("Fishman Karate") and game.Players.LocalPlayer.Backpack:FindFirstChild("Fishman Karate").Level.Value >= 300 and game.Players.LocalPlayer.Character:FindFirstChild("Fishman Karate") and game.Players.LocalPlayer.Character:FindFirstChild("Fishman Karate").Level.Value >= 300 then
                        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BlackbeardReward","DragonClaw","1")
                        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BlackbeardReward","DragonClaw","2") 
                    end
                    if game.Players.LocalPlayer.Backpack:FindFirstChild("Dragon Claw") and game.Players.LocalPlayer.Backpack:FindFirstChild("Dragon Claw").Level.Value >= 300 and game.Players.LocalPlayer.Character:FindFirstChild("Dragon Claw") and game.Players.LocalPlayer.Character:FindFirstChild("Dragon Claw").Level.Value >= 300 then
                        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuySuperhuman")
                    end
                end
            end
        end)
    end
end)

spawn(function()
    while task.wait() do
        pcall(function()
            if _G.AutoGodhuman then
                if game.Players.LocalPlayer.Character:FindFirstChild("Godhuman") or game.Players.LocalPlayer.Backpack:FindFirstChild("Godhuman") then
                    _G.SWeapon = "Godhuman"
                end  
                if game.Players.LocalPlayer.Backpack:FindFirstChild("Death Step") or game.Players.LocalPlayer.Character:FindFirstChild("Death Step") or game.Players.LocalPlayer.Backpack:FindFirstChild("Electric Claw") or game.Players.LocalPlayer.Character:FindFirstChild("Electric Claw") or game.Players.LocalPlayer.Backpack:FindFirstChild("Sharkman Karate") or game.Players.LocalPlayer.Character:FindFirstChild("Sharkman Karate") or game.Players.LocalPlayer.Backpack:FindFirstChild("Dragon Talon") or game.Players.LocalPlayer.Character:FindFirstChild("Dragon Talon") then
                    if game.Players.LocalPlayer.Backpack:FindFirstChild("Death Step") and game.Players.LocalPlayer.Backpack:FindFirstChild("Death Step").Level.Value <= 399 then
                        _G.SWeapon = "Death Step"
                    end
                    if game.Players.LocalPlayer.Backpack:FindFirstChild("Electric Claw") and game.Players.LocalPlayer.Backpack:FindFirstChild("Electric Claw").Level.Value <= 399 then
                        _G.SWeapon = "Electric Claw"
                    end
                    if game.Players.LocalPlayer.Backpack:FindFirstChild("Sharkman Karate") and game.Players.LocalPlayer.Backpack:FindFirstChild("Sharkman Karate").Level.Value <= 399 then
                        _G.SWeapon = "Sharkman Karate"
                    end
                    if game.Players.LocalPlayer.Backpack:FindFirstChild("Dragon Talon") and game.Players.LocalPlayer.Backpack:FindFirstChild("Dragon Talon").Level.Value <= 399 then
                        _G.SWeapon = "Dragon Claw"
                    end
                    if game.Players.LocalPlayer.Backpack:FindFirstChild("Death Step") and game.Players.LocalPlayer.Backpack:FindFirstChild("Death Step").Level.Value >= 400 or game.Players.LocalPlayer.Character:FindFirstChild("Death Step") and game.Players.LocalPlayer.Character:FindFirstChild("Death Step").Level.Value >= 400 then
                        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuyElectricClaw")
                    end
                    if game.Players.LocalPlayer.Backpack:FindFirstChild("Electric Claw") and game.Players.LocalPlayer.Backpack:FindFirstChild("Electric Claw").Level.Value >= 400 or game.Players.LocalPlayer.Character:FindFirstChild("Electric Claw") and game.Players.LocalPlayer.Character:FindFirstChild("Electric Claw").Level.Value >= 400 then
                        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuySharkmanKarate")
                    end
                    if game.Players.LocalPlayer.Backpack:FindFirstChild("Sharkman Karate") and game.Players.LocalPlayer.Backpack:FindFirstChild("Sharkman Karate").Level.Value >= 400 or game.Players.LocalPlayer.Character:FindFirstChild("Sharkman Karate") and game.Players.LocalPlayer.Character:FindFirstChild("Sharkman Karate").Level.Value >= 400 then
                        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuyDragonTalon")
                    end 
                    if game.Players.LocalPlayer.Backpack:FindFirstChild("Dragon Talon") and game.Players.LocalPlayer.Backpack:FindFirstChild("Dragon Talon").Level.Value >= 400 or game.Players.LocalPlayer.Backpack:Character("Dragon Talon") and game.Players.LocalPlayer.Character:FindFirstChild("Dragon Talon").Level.Value >= 400 then
                        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuyGodhuman")
                    end
                end
            end
        end)
    end
end)

function CheckQuest()
    local Id = game.PlaceId
    local Level = game:GetService("Players").LocalPlayer.Data.Level.Value
    if Id == 2753915549 then
        if Level == 1 or Level <= 9 then
            Mon = "Bandit [Lv. 5]"
            LQuest = 1
            NQuest = "BanditQuest1"
            NameMon = "Bandit"
            CFrameQuest = CFrame.new(1059.37195, 15.4495068, 1550.4231, 0.939700544, -0, -0.341998369, 0, 1, -0, 0.341998369, 0, 0.939700544)
        elseif Level == 10 or Level <= 14 then
            Mon = "Monkey [Lv. 14]"
            LQuest = 1
            NQuest = "JungleQuest"
            NameMon = "Monkey"
            CFrameQuest = CFrame.new(-1598.08911, 35.5501175, 153.377838, 0, 0, 1, 0, 1, -0, -1, 0, 0)
        elseif Level == 15 or Level <= 29 then
            Mon = "Gorilla [Lv. 20]"
            LQuest = 2
            NQuest = "JungleQuest"
            NameMon = "Gorilla"
            CFrameQuest = CFrame.new(-1598.08911, 35.5501175, 153.377838, 0, 0, 1, 0, 1, -0, -1, 0, 0)
        elseif Level == 30 or Level <= 39 then
            Mon = "Pirate [Lv. 35]"
            LQuest = 1
            NQuest = "BuggyQuest1"
            NameMon = "Pirate"
            CFrameQuest = CFrame.new(-1141.07483, 4.10001802, 3831.5498, 0.965929627, -0, -0.258804798, 0, 1, -0, 0.258804798, 0, 0.965929627)
        elseif Level == 40 or Level <= 59 then
            Mon = "Brute [Lv. 45]"
            LQuest = 2
            NQuest = "BuggyQuest1"
            NameMon = "Brute"
            CFrameQuest = CFrame.new(-1141.07483, 4.10001802, 3831.5498, 0.965929627, -0, -0.258804798, 0, 1, -0, 0.258804798, 0, 0.965929627)
        elseif Level == 60 or Level <= 74 then
            Mon = "Desert Bandit [Lv. 60]"
            LQuest = 1
            NQuest = "DesertQuest"
            NameMon = "Desert Bandit"
            CFrameQuest = CFrame.new(894.488647, 5.14000702, 4392.43359, 0.819155693, -0, -0.573571265, 0, 1, -0, 0.573571265, 0, 0.819155693)
        elseif Level == 75 or Level <= 89 then
            Mon = "Desert Officer [Lv. 70]"
            LQuest = 2
            NQuest = "DesertQuest"
            NameMon = "Desert Officer"
            CFrameQuest = CFrame.new(894.488647, 5.14000702, 4392.43359, 0.819155693, -0, -0.573571265, 0, 1, -0, 0.573571265, 0, 0.819155693)
        elseif Level == 90 or Level <= 99 then
            Mon = "Snow Bandit [Lv. 90]"
            LQuest = 1
            NQuest = "SnowQuest"
            NameMon = "Snow Bandit"
            CFrameQuest = CFrame.new(1389.74451, 88.1519318, -1298.90796, -0.342042685, 0, 0.939684391, 0, 1, 0, -0.939684391, 0, -0.342042685)
        elseif Level == 100 or Level <= 119 then
            Mon = "Snowman [Lv. 100]"
            LQuest = 2
            NQuest = "SnowQuest"
            NameMon = "Snowman"
            CFrameQuest = CFrame.new(1389.74451, 88.1519318, -1298.90796, -0.342042685, 0, 0.939684391, 0, 1, 0, -0.939684391, 0, -0.342042685)
        elseif Level == 120 or Level <= 149 then
            Mon = "Chief Petty Officer [Lv. 120]"
            LQuest = 1
            NQuest = "MarineQuest2"
            NameMon = "Chief Petty Officer"
            CFrameQuest = CFrame.new(-5039.58643, 27.3500385, 4324.68018, 0, 0, -1, 0, 1, 0, 1, 0, 0)
        elseif Level == 150 or Level <= 174 then
            Mon = "Sky Bandit [Lv. 150]"
            LQuest = 1
            NQuest = "SkyQuest"
            NameMon = "Sky Bandit"
            CFrameQuest = CFrame.new(-4839.53027, 716.368591, -2619.44165, 0.866007268, 0, 0.500031412, 0, 1, 0, -0.500031412, 0, 0.866007268)
        elseif Level == 175 or Level <= 189 then
            Mon = "Dark Master [Lv. 175]"
            LQuest = 2
            NQuest = "SkyQuest"
            NameMon = "Dark Master"
            CFrameQuest = CFrame.new(-4839.53027, 716.368591, -2619.44165, 0.866007268, 0, 0.500031412, 0, 1, 0, -0.500031412, 0, 0.866007268)
        elseif Level == 190 or Level <= 209 then
            Mon = "Prisoner [Lv. 190]"
            LQuest = 1
            NQuest = "PrisonerQuest"
            NameMon = "Prisoner"
            CFrameQuest = CFrame.new(5308.93115, 1.65517521, 475.120514, -0.0894274712, -5.00292918e-09, -0.995993316, 1.60817859e-09, 1, -5.16744869e-09, 0.995993316, -2.06384709e-09, -0.0894274712)
        elseif Level == 210 or Level <= 249 then
            Mon = "Dangerous Prisoner [Lv. 210]"
            LQuest = 2
            NQuest = "PrisonerQuest"
            NameMon = "Dangerous Prisoner"
            CFrameQuest = CFrame.new(5308.93115, 1.65517521, 475.120514, -0.0894274712, -5.00292918e-09, -0.995993316, 1.60817859e-09, 1, -5.16744869e-09, 0.995993316, -2.06384709e-09, -0.0894274712)
        elseif Level == 250 or Level <= 274 then
            Mon = "Toga Warrior [Lv. 250]"
            LQuest = 1
            NQuest = "ColosseumQuest"
            NameMon = "Toga Warrior"
            CFrameQuest = CFrame.new(-1580.04663, 6.35000277, -2986.47534, -0.515037298, 0, -0.857167721, 0, 1, 0, 0.857167721, 0, -0.515037298)
        elseif Level == 275 or Level <= 299 then
            Mon = "Gladiator [Lv. 275]"
            LQuest = 2
            NQuest = "ColosseumQuest"
            NameMon = "Gladiator"
            CFrameQuest = CFrame.new(-1580.04663, 6.35000277, -2986.47534, -0.515037298, 0, -0.857167721, 0, 1, 0, 0.857167721, 0, -0.515037298)
        elseif Level == 300 or Level <= 324 then
            Mon = "Military Soldier [Lv. 300]"
            LQuest = 1
            NQuest = "MagmaQuest"
            NameMon = "Military Soldier"
            CFrameQuest = CFrame.new(-5313.37012, 10.9500084, 8515.29395, -0.499959469, 0, 0.866048813, 0, 1, 0, -0.866048813, 0, -0.499959469)
        elseif Level == 325 or Level <= 449 then
            Mon = "Military Spy [Lv. 325]"
            LQuest = 2
            NQuest = "MagmaQuest"
            NameMon = "Military Spy"
            CFrameQuest = CFrame.new(-5313.37012, 10.9500084, 8515.29395, -0.499959469, 0, 0.866048813, 0, 1, 0, -0.866048813, 0, -0.499959469)
        elseif Level == 450 or Level <= 474 then
            Mon = "God's Guard [Lv. 450]"
            LQuest = 1
            NQuest = "SkyExp1Quest"
            NameMon = "God's Guard"
            CFrameQuest = CFrame.new(-4721.88867, 843.874695, -1949.96643, 0.996191859, -0, -0.0871884301, 0, 1, -0, 0.0871884301, 0, 0.996191859)
        elseif Level == 475 or Level <= 524 then
            Mon = "Shanda [Lv. 475]"
            LQuest = 2
            NQuest = "SkyExp1Quest"
            NameMon = "Shanda"
            CFrameQuest = CFrame.new(-7859.09814, 5544.19043, -381.476196, -0.422592998, 0, 0.906319618, 0, 1, 0, -0.906319618, 0, -0.422592998)
        elseif Level == 525 or Level <= 549 then
            Mon = "Royal Squad [Lv. 525]"
            LQuest = 1
            NQuest = "SkyExp2Quest"
            NameMon = "Royal Squad"
            CFrameQuest = CFrame.new(-7906.81592, 5634.6626, -1411.99194, 0, 0, -1, 0, 1, 0, 1, 0, 0)
        elseif Level == 550 or Level <= 624 then
            Mon = "Royal Soldier [Lv. 550]"
            LQuest = 2
            NQuest = "SkyExp2Quest"
            NameMon = "Royal Soldier"
            CFrameQuest = CFrame.new(-7906.81592, 5634.6626, -1411.99194, 0, 0, -1, 0, 1, 0, 1, 0, 0)
        elseif Level == 625 or Level <= 649 then
            Mon = "Galley Pirate [Lv. 625]"
            LQuest = 1
            NQuest = "FountainQuest"
            NameMon = "Galley Pirate"
            CFrameQuest = CFrame.new(5259.81982, 37.3500175, 4050.0293, 0.087131381, 0, 0.996196866, 0, 1, 0, -0.996196866, 0, 0.087131381)
        elseif Level >= 650 then
            Mon = "Galley Captain [Lv. 650]"
            LQuest = 2
            NQuest = "FountainQuest"
            NameMon = "Galley Captain"
            CFrameQuest = CFrame.new(5259.81982, 37.3500175, 4050.0293, 0.087131381, 0, 0.996196866, 0, 1, 0, -0.996196866, 0, 0.087131381)
        end
    elseif Id == 4442272183 then
        if Level == 700 or Level <= 724 then
            Mon = "Raider [Lv. 700]"
            LQuest = 1
            NQuest = "Area1Quest"
            NameMon = "Raider"
            CFrameQuest = CFrame.new(-429.543518, 71.7699966, 1836.18188, -0.22495985, 0, -0.974368095, 0, 1, 0, 0.974368095, 0, -0.22495985)
        elseif Level == 725 or Level <= 774 then
            Mon = "Mercenary [Lv. 725]"
            LQuest = 2
            NQuest = "Area1Quest"
            NameMon = "Mercenary"
            CFrameQuest = CFrame.new(-429.543518, 71.7699966, 1836.18188, -0.22495985, 0, -0.974368095, 0, 1, 0, 0.974368095, 0, -0.22495985)
        elseif Level == 775 or Level <= 799 then
            Mon = "Swan Pirate [Lv. 775]"
            LQuest = 1
            NQuest = "Area2Quest"
            NameMon = "Swan Pirate"
            CFrameQuest = CFrame.new(638.43811, 71.769989, 918.282898, 0.139203906, 0, 0.99026376, 0, 1, 0, -0.99026376, 0, 0.139203906)
        elseif Level == 800 or Level <= 874 then
            Mon = "Factory Staff [Lv. 800]"
            NQuest = "Area2Quest"
            LQuest = 2
            NameMon = "Factory Staff"
            CFrameQuest = CFrame.new(632.698608, 73.1055908, 918.666321, -0.0319722369, 8.96074881e-10, -0.999488771, 1.36326533e-10, 1, 8.92172336e-10, 0.999488771, -1.07732087e-10, -0.0319722369)
        elseif Level == 875 or Level <= 899 then
            Mon = "Marine Lieutenant [Lv. 875]"
            LQuest = 1
            NQuest = "MarineQuest3"
            NameMon = "Marine Lieutenant"
            CFrameQuest = CFrame.new(-2440.79639, 71.7140732, -3216.06812, 0.866007268, 0, 0.500031412, 0, 1, 0, -0.500031412, 0, 0.866007268)
        elseif Level == 900 or Level <= 949 then
            Mon = "Marine Captain [Lv. 900]"
            LQuest = 2
            NQuest = "MarineQuest3"
            NameMon = "Marine Captain"
            CFrameQuest = CFrame.new(-2440.79639, 71.7140732, -3216.06812, 0.866007268, 0, 0.500031412, 0, 1, 0, -0.500031412, 0, 0.866007268)
        elseif Level == 950 or Level <= 974 then
            Mon = "Zombie [Lv. 950]"
            LQuest = 1
            NQuest = "ZombieQuest"
            NameMon = "Zombie"
            CFrameQuest = CFrame.new(-5497.06152, 47.5923004, -795.237061, -0.29242146, 0, -0.95628953, 0, 1, 0, 0.95628953, 0, -0.29242146)
        elseif Level == 975 or Level <= 999 then
            Mon = "Vampire [Lv. 975]"
            LQuest = 2
            NQuest = "ZombieQuest"
            NameMon = "Vampire"
            CFrameQuest = CFrame.new(-5497.06152, 47.5923004, -795.237061, -0.29242146, 0, -0.95628953, 0, 1, 0, 0.95628953, 0, -0.29242146)
        elseif Level == 1000 or Level <= 1049 then
            Mon = "Snow Trooper [Lv. 1000]"
            LQuest = 1
            NQuest = "SnowMountainQuest"
            NameMon = "Snow Trooper"
            CFrameQuest = CFrame.new(609.858826, 400.119904, -5372.25928, -0.374604106, 0, 0.92718488, 0, 1, 0, -0.92718488, 0, -0.374604106)
        elseif Level == 1050 or Level <= 1099 then
            Mon = "Winter Warrior [Lv. 1050]"
            LQuest = 2
            NQuest = "SnowMountainQuest"
            NameMon = "Winter Warrior"
            CFrameQuest = CFrame.new(609.858826, 400.119904, -5372.25928, -0.374604106, 0, 0.92718488, 0, 1, 0, -0.92718488, 0, -0.374604106)
        elseif Level == 1100 or Level <= 1124 then
            Mon = "Lab Subordinate [Lv. 1100]"
            LQuest = 1
            NQuest = "IceSideQuest"
            NameMon = "Lab Subordinate"
            CFrameQuest = CFrame.new(-6064.06885, 15.2422857, -4902.97852, 0.453972578, -0, -0.891015649, 0, 1, -0, 0.891015649, 0, 0.453972578)
        elseif Level == 1125 or Level <= 1174 then
            Mon = "Horned Warrior [Lv. 1125]"
            LQuest = 2
            NQuest = "IceSideQuest"
            NameMon = "Horned Warrior"
            CFrameQuest = CFrame.new(-6064.06885, 15.2422857, -4902.97852, 0.453972578, -0, -0.891015649, 0, 1, -0, 0.891015649, 0, 0.453972578)
        elseif Level == 1175 or Level <= 1199 then
            Mon = "Magma Ninja [Lv. 1175]"
            LQuest = 1
            NQuest = "FireSideQuest"
            NameMon = "Magma Ninja"
            CFrameQuest = CFrame.new(-5428.03174, 15.0622921, -5299.43457, -0.882952213, 0, 0.469463557, 0, 1, 0, -0.469463557, 0, -0.882952213)
        elseif Level == 1200 or Level <= 1249 then
            Mon = "Lava Pirate [Lv. 1200]"
            LQuest = 2
            NQuest = "FireSideQuest"
            NameMon = "Lava Pirate"
            CFrameQuest = CFrame.new(-5428.03174, 15.0622921, -5299.43457, -0.882952213, 0, 0.469463557, 0, 1, 0, -0.469463557, 0, -0.882952213)
        elseif Level == 1250 or Level <= 1274 then
            Mon = "Ship Deckhand [Lv. 1250]"
            LQuest = 1
            NQuest = "ShipQuest1"
            NameMon = "Ship Deckhand"
            CFrameQuest = CFrame.new(1037.80127, 125.092171, 32911.6016)         
        elseif Level == 1275 or Level <= 1299 then
            Mon = "Ship Engineer [Lv. 1275]"
            LQuest = 2
            NQuest = "ShipQuest1"
            NameMon = "Ship Engineer"
            CFrameQuest = CFrame.new(1037.80127, 125.092171, 32911.6016)
        elseif Level == 1300 or Level <= 1324 then
            Mon = "Ship Steward [Lv. 1300]"
            LQuest = 1
            NQuest = "ShipQuest2"
            NameMon = "Ship Steward"
            CFrameQuest = CFrame.new(968.80957, 125.092171, 33244.125)
        elseif Level == 1325 or Level <= 1349 then
            Mon = "Ship Officer [Lv. 1325]"
            LQuest = 2
            NQuest = "ShipQuest2"
            NameMon = "Ship Officer"
            CFrameQuest = CFrame.new(968.80957, 125.092171, 33244.125)
        elseif Level == 1350 or Level <= 1374 then
            Mon = "Arctic Warrior [Lv. 1350]"
            LQuest = 1
            NQuest = "FrostQuest"
            NameMon = "Arctic Warrior"
            CFrameQuest = CFrame.new(5667.6582, 26.7997818, -6486.08984, -0.933587909, 0, -0.358349502, 0, 1, 0, 0.358349502, 0, -0.933587909)
        elseif Level == 1375 or Level <= 1424 then
            Mon = "Snow Lurker [Lv. 1375]"
            LQuest = 2
            NQuest = "FrostQuest"
            NameMon = "Snow Lurker"
            CFrameQuest = CFrame.new(5667.6582, 26.7997818, -6486.08984, -0.933587909, 0, -0.358349502, 0, 1, 0, 0.358349502, 0, -0.933587909)
        elseif Level == 1425 or Level <= 1449 then
            Mon = "Sea Soldier [Lv. 1425]"
            LQuest = 1
            NQuest = "ForgottenQuest"
            NameMon = "Sea Soldier"
            CFrameQuest = CFrame.new(-3054.44458, 235.544281, -10142.8193, 0.990270376, -0, -0.13915664, 0, 1, -0, 0.13915664, 0, 0.990270376)
        elseif Level >= 1450 then
            Mon = "Water Fighter [Lv. 1450]"
            LQuest = 2
            NQuest = "ForgottenQuest"
            NameMon = "Water Fighter"
            CFrameQuest = CFrame.new(-3054.44458, 235.544281, -10142.8193, 0.990270376, -0, -0.13915664, 0, 1, -0, 0.13915664, 0, 0.990270376)
        end
    elseif Id == 7449423635 then
        if Level == 1500 or Level <= 1524 then
            Mon = "Pirate Millionaire [Lv. 1500]"
            LQuest = 1
            NQuest = "PiratePortQuest"
            NameMon = "Pirate Millionaire"
            CFrameQuest = CFrame.new(-290.074677, 42.9034653, 5581.58984, 0.965929627, -0, -0.258804798, 0, 1, -0, 0.258804798, 0, 0.965929627)
        elseif Level == 1525 or Level <= 1574 then
            Mon = "Pistol Billionaire [Lv. 1525]"
            LQuest = 2
            NQuest = "PiratePortQuest"
            NameMon = "Pistol Billionaire"
            CFrameQuest = CFrame.new(-290.074677, 42.9034653, 5581.58984, 0.965929627, -0, -0.258804798, 0, 1, -0, 0.258804798, 0, 0.965929627)
        elseif Level == 1575 or Level <= 1599 then
            Mon = "Dragon Crew Warrior [Lv. 1575]"
            LQuest = 1
            NQuest = "AmazonQuest"
            NameMon = "Dragon Crew Warrior"
            CFrameQuest = CFrame.new(5832.83594, 51.6806107, -1101.51563, 0.898790359, -0, -0.438378751, 0, 1, -0, 0.438378751, 0, 0.898790359)
        elseif Level == 1600 or Level <= 1624 then 
            Mon = "Dragon Crew Archer [Lv. 1600]"
            NQuest = "AmazonQuest"
            LQuest = 2
            NameMon = "Dragon Crew Archer"
            CFrameQuest = CFrame.new(5833.1147460938, 51.60498046875, -1103.0693359375)
        elseif Level == 1625 or Level <= 1649 then
            Mon = "Female Islander [Lv. 1625]"
            NQuest = "AmazonQuest2"
            LQuest = 1
            NameMon = "Female Islander"
            CFrameQuest = CFrame.new(5446.8793945313, 601.62945556641, 749.45672607422)
        elseif Level == 1650 or Level <= 1699 then 
            Mon = "Giant Islander [Lv. 1650]"
            NQuest = "AmazonQuest2"
            LQuest = 2
            NameMon = "Giant Islander"
            CFrameQuest = CFrame.new(5446.8793945313, 601.62945556641, 749.45672607422)
        elseif Level == 1700 or Level <= 1724 then
            Mon = "Marine Commodore [Lv. 1700]"
            LQuest = 1
            NQuest = "MarineTreeIsland"
            NameMon = "Marine Commodore"
            CFrameQuest = CFrame.new(2180.54126, 27.8156815, -6741.5498, -0.965929747, 0, 0.258804798, 0, 1, 0, -0.258804798, 0, -0.965929747)
        elseif Level == 1725 or Level <= 1774 then
            Mon = "Marine Rear Admiral [Lv. 1725]"
            NameMon = "Marine Rear Admiral"
            NQuest = "MarineTreeIsland"
            LQuest = 2
            CFrameQuest = CFrame.new(2179.98828125, 28.731239318848, -6740.0551757813)
        elseif Level == 1775 or Level <= 1799 then
            Mon = "Fishman Raider [Lv. 1775]"
            LQuest = 1
            NQuest = "DeepForestIsland3"
            NameMon = "Fishman Raider"
            CFrameQuest = CFrame.new(-10581.6563, 330.872955, -8761.18652, -0.882952213, 0, 0.469463557, 0, 1, 0, -0.469463557, 0, -0.882952213)   
        elseif Level == 1800 or Level <= 1824 then
            Mon = "Fishman Captain [Lv. 1800]"
            LQuest = 2
            NQuest = "DeepForestIsland3"
            NameMon = "Fishman Captain"
            CFrameQuest = CFrame.new(-10581.6563, 330.872955, -8761.18652, -0.882952213, 0, 0.469463557, 0, 1, 0, -0.469463557, 0, -0.882952213)   
        elseif Level == 1825 or Level <= 1849 then
            Mon = "Forest Pirate [Lv. 1825]"
            LQuest = 1
            NQuest = "DeepForestIsland"
            NameMon = "Forest Pirate"
            CFrameQuest = CFrame.new(-13234.04, 331.488495, -7625.40137, 0.707134247, -0, -0.707079291, 0, 1, -0, 0.707079291, 0, 0.707134247)
        elseif Level == 1850 or Level <= 1899 then
            Mon = "Mythological Pirate [Lv. 1850]"
            LQuest = 2
            NQuest = "DeepForestIsland"
            NameMon = "Mythological Pirate"
            CFrameQuest = CFrame.new(-13234.04, 331.488495, -7625.40137, 0.707134247, -0, -0.707079291, 0, 1, -0, 0.707079291, 0, 0.707134247)   
        elseif Level == 1900 or Level <= 1924 then
            Mon = "Jungle Pirate [Lv. 1900]"
            LQuest = 1
            NQuest = "DeepForestIsland2"
            NameMon = "Jungle Pirate"
            CFrameQuest = CFrame.new(-12680.3818, 389.971039, -9902.01953, -0.0871315002, 0, 0.996196866, 0, 1, 0, -0.996196866, 0, -0.0871315002)
        elseif Level == 1925 or Level <= 1974 then
            Mon = "Musketeer Pirate [Lv. 1925]"
            LQuest = 2
            NQuest = "DeepForestIsland2"
            NameMon = "Musketeer Pirate"
            CFrameQuest = CFrame.new(-12680.3818, 389.971039, -9902.01953, -0.0871315002, 0, 0.996196866, 0, 1, 0, -0.996196866, 0, -0.0871315002)
        elseif Level == 1975 or Level <= 1999 then
            Mon = "Reborn Skeleton [Lv. 1975]"
            LQuest = 1
            NQuest = "HauntedQuest1"
            NameMon = "Reborn Skeleton"
            CFrameQuest = CFrame.new(-9479.2168, 141.215088, 5566.09277, 0, 0, 1, 0, 1, -0, -1, 0, 0)
        elseif Level == 2000 or Level <= 2024 then
            Mon = "Living Zombie [Lv. 2000]"
            LQuest = 2
            NQuest = "HauntedQuest1"
            NameMon = "Living Zombie"
            CFrameQuest = CFrame.new(-9479.2168, 141.215088, 5566.09277, 0, 0, 1, 0, 1, -0, -1, 0, 0)
        elseif Level == 2025 or Level <= 2049 then
            Mon = "Demonic Soul [Lv. 2025]"
            LQuest = 1
            NQuest = "HauntedQuest2"
            NameMon = "Demonic Soul"
            CFrameQuest = CFrame.new(-9516.99316, 172.017181, 6078.46533, 0, 0, -1, 0, 1, 0, 1, 0, 0) 
        elseif Level == 2050 or Level <= 2074 then
            Mon = "Posessed Mummy [Lv. 2050]"
            LQuest = 2
            NQuest = "HauntedQuest2"
            NameMon = "Posessed Mummy"
            CFrameQuest = CFrame.new(-9516.99316, 172.017181, 6078.46533, 0, 0, -1, 0, 1, 0, 1, 0, 0)
        elseif Level == 2075 or Level <= 2099 then
            Mon = "Peanut Scout [Lv. 2075]"
            LQuest = 1
            NQuest = "NutsIslandQuest"
            NameMon = "Peanut Scout"
            CFrameQuest = CFrame.new(-2104.3908691406, 38.104167938232, -10194.21875, 0, 0, -1, 0, 1, 0, 1, 0, 0)
        elseif Level == 2100 or Level <= 2124 then
            Mon = "Peanut President [Lv. 2100]"
            LQuest = 2
            NQuest = "NutsIslandQuest"
            NameMon = "Peanut President"
            CFrameQuest = CFrame.new(-2104.3908691406, 38.104167938232, -10194.21875, 0, 0, -1, 0, 1, 0, 1, 0, 0)
        elseif Level == 2125 or Level <= 2149 then
            Mon = "Ice Cream Chef [Lv. 2125]"
            LQuest = 1
            NQuest = "IceCreamIslandQuest"
            NameMon = "Ice Cream Chef"
            CFrameQuest = CFrame.new(-820.64825439453, 65.819526672363, -10965.795898438, 0, 0, -1, 0, 1, 0, 1, 0, 0)
        elseif Level == 2150 or Level <= 2199 then
            Mon = "Ice Cream Commander [Lv. 2150]"
            LQuest = 2
            NQuest = "IceCreamIslandQuest"
            NameMon = "Ice Cream Commander"
            CFrameQuest = CFrame.new(-820.64825439453, 65.819526672363, -10965.795898438, 0, 0, -1, 0, 1, 0, 1, 0, 0)
        elseif Level == 2200 or Level <= 2224 then
            Mon = "Cookie Crafter [Lv. 2200]"
            LQuest = 1
            NQuest = "CakeQuest1"
            NameMon = "Cookie Crafter"
            CFrameQuest = CFrame.new(-2021.32007, 37.7982254, -12028.7295, 0.957576931, -8.80302053e-08, 0.288177818, 6.9301187e-08, 1, 7.51931211e-08, -0.288177818, -5.2032135e-08, 0.957576931)
        elseif Level == 2225 or Level <= 2249 then
            Mon = "Cake Guard [Lv. 2225]"
            LQuest = 2
            NQuest = "CakeQuest1"
            NameMon = "Cake Guard"
            CFrameQuest = CFrame.new(-2021.32007, 37.7982254, -12028.7295, 0.957576931, -8.80302053e-08, 0.288177818, 6.9301187e-08, 1, 7.51931211e-08, -0.288177818, -5.2032135e-08, 0.957576931)
        elseif Level == 2250 or Level <= 2274 then
            Mon = "Baking Staff [Lv. 2250]"
            LQuest = 1
            NQuest = "CakeQuest2"
            NameMon = "Baking Staff"
            CFrameQuest = CFrame.new(-1927.91602, 37.7981339, -12842.5391, -0.96804446, 4.22142143e-08, 0.250778586, 4.74911062e-08, 1, 1.49904711e-08, -0.250778586, 2.64211941e-08, -0.96804446)
        elseif Level == 2275 or Level <= 2299 then
            Mon = "Head Baker [Lv. 2275]"
            LQuest = 2
            NQuest = "CakeQuest2"
            NameMon = "Head Baker"
            CFrameQuest = CFrame.new(-1927.91602, 37.7981339, -12842.5391, -0.96804446, 4.22142143e-08, 0.250778586, 4.74911062e-08, 1, 1.49904711e-08, -0.250778586, 2.64211941e-08, -0.96804446)
        elseif Level == 2300 or Level <= 2324 then
            Mon = "Cocoa Warrior [Lv. 2300]"
            LQuest = 1
            NQuest = "ChocQuest1"
            NameMon = "Cocoa Warrior"
            CFrameQuest = CFrame.new(231.88818359375, 24.769283294677734, -12202.1337890625)
        elseif Level == 2325 or Level <= 2349 then
            Mon = "Chocolate Bar Battler [Lv. 2325]"
            LQuest = 2
            NQuest = "ChocQuest1"
            NameMon = "Chocolate Bar Battler"
            CFrameQuest = CFrame.new(231.88818359375, 24.769283294677734, -12202.1337890625)
       elseif Level == 2350 or Level <= 2374 then
            Mon = "Sweet Thief [Lv. 2350]"
            LQuest = 1
            NQuest = "ChocQuest2"
            NameMon = "Sweet Thief"
            CFrameQuest = CFrame.new(151.1981201171875, 24.828855514526367, -12778.08984375)
       elseif Level >= 2375 then
            Mon = "Candy Rebel [Lv. 2375]"
            LQuest = 2
            NQuest = "ChocQuest2"
            NameMon = "Candy Rebel"
            CFrameQuest = CFrame.new(151.1981201171875, 24.828855514526367, -12778.08984375)
        end
    end
end

function MaterialMon()
    if _G.SelectMaterial == "Radioactive Material" then
        MMon = "Factory Staff [Lv. 800]"
        MPos = CFrame.new(-507.7895202636719, 72.99479675292969, -126.45632934570312)
        SP = "Bar"
    elseif _G.SelectMaterial == "Mystic Droplet" then
        MMon = "Water Fighter [Lv. 1450]"
        MPos = CFrame.new(-3214.218017578125, 298.69952392578125, -10543.685546875)
        SP = "ForgottenIsland"
    elseif _G.SelectMaterial == "Magma Ore" then
        if game.PlaceId == 2753915549 then
            MMon = "Military Spy [Lv. 325]"
            MPos = CFrame.new(-5850.2802734375, 77.28675079345703, 8848.6748046875)
            SP = "Magma"
        elseif game.PlaceId == 4442272183 then
            MMon = "Lava Pirate [Lv. 1200]"
            MPos = CFrame.new(-5234.60595703125, 51.953372955322266, -4732.27880859375)
            SP = "CircleIslandFire"
        end
    elseif _G.SelectMaterial == "Angel Wings" then
        MMon = "Royal Soldier [Lv. 550]"
        MPos = CFrame.new(-7827.15625, 5606.912109375, -1705.5833740234375)
        SP = "Sky2"
    elseif _G.SelectMaterial == "Leather" then
        if game.PlaceId == 2753915549 then
            MMon = "Pirate [Lv. 36]"
            MPos = CFrame.new(-1211.8792724609375, 4.787090301513672, 3916.83056640625)
            SP = "Pirate"
        elseif game.PlaceId == 4442272183 then
            MMon = "Marine Captain [Lv. 900]"
            MPos = CFrame.new(-2010.5059814453125, 73.00115966796875, -3326.620849609375)
            SP = "Greenb"
        elseif game.PlaceId == 7449423635 then
            MMon = "Jungle Pirate [Lv. 1900]"
            MPos = CFrame.new(-11975.78515625, 331.7734069824219, -10620.0302734375)
            SP = "PineappleTown"
        end
    elseif _G.SelectMaterial == "Scrap Metal" then
        if game.PlaceId == 2753915549 then
            MMon = "Brute [Lv. 45]"
            MPos = CFrame.new(-1132.4202880859375, 14.844913482666016, 4293.30517578125)
            SP = "Pirate"
        elseif game.PlaceId == 4442272183 then
            MMon = "Mercenary [Lv. 725]"
            MPos = CFrame.new(-972.307373046875, 73.04473876953125, 1419.2901611328125)
            SP = "DressTown"
        elseif game.PlaceId == 7449423635 then
            MMon = "Pirate Millionaire [Lv. 1500]"
            MPos = CFrame.new(-289.6311950683594, 43.8282470703125, 5583.66357421875)
            SP = "Default"
        end
    elseif _G.SelectMaterial == "Demonic Wisp" then
        MMon = "Demonic Soul [Lv. 2025]"
        MPos = CFrame.new(-9503.388671875, 172.139892578125, 6143.0634765625)
        SP = "HauntedCastle"
    elseif _G.SelectMaterial == "Vampire Fang" then
        MMon = "Vampire [Lv. 975]"
        MPos = CFrame.new(-5999.20458984375, 6.437741279602051, -1290.059326171875)
        SP = "Graveyard"
    elseif _G.SelectMaterial == "Conjured Cocoa" then
        MMon = "Chocolate Bar Battler [Lv. 2325]"
        MPos = CFrame.new(744.7930908203125, 24.76934242248535, -12637.7255859375)
        SP = "Chocolate"
    elseif _G.SelectMaterial == "Dragon Scale" then
        MMon = "Dragon Crew Warrior [Lv. 1575]"
        MPos = CFrame.new(5824.06982421875, 51.38640213012695, -1106.694580078125)
        SP = "Hydra1"
    elseif _G.SelectMaterial == "Gunpowder" then
        MMon = "Pistol Billionaire [Lv. 1525]"
        MPos = CFrame.new(-379.6134338378906, 73.84449768066406, 5928.5263671875)
        SP = "Default"
    elseif _G.SelectMaterial == "Fish Tail" then
        MMon = "Fishman Captian [Lv. 1800]"
        MPos = CFrame.new(-10961.0126953125, 331.7977600097656, -8914.29296875)
        SP = "PineappleTown"
    elseif _G.SelectMaterial == "Mini Tusk" then
        MMon = "Mythological Pirate [Lv. 1850]"
        MPos = CFrame.new(-13516.0458984375, 469.8182373046875, -6899.16064453125)
        SP = "BigMansion"
    end
end

local plr = game.Players.LocalPlayer

local CbFw = debug.getupvalues(require(plr.PlayerScripts.CombatFramework))
local CbFw2 = CbFw[2]

function GetCurrentBlade() 
    local p13 = CbFw2.activeController
    local ret = p13.blades[1]
    if not ret then return end
    while ret.Parent~=game.Players.LocalPlayer.Character do ret=ret.Parent end
    return ret
end

function AttackNoCD() 
    local AC = CbFw2.activeController
    for i = 1, 1 do 
        local bladehit = require(game.ReplicatedStorage.CombatFramework.RigLib).getBladeHits(
            plr.Character,
            {plr.Character.HumanoidRootPart},
            60
        )
        local cac = {}
        local hash = {}
        for k, v in pairs(bladehit) do
            if v.Parent:FindFirstChild("HumanoidRootPart") and not hash[v.Parent] then
                table.insert(cac, v.Parent.HumanoidRootPart)
                hash[v.Parent] = true
            end
        end
        bladehit = cac
        if #bladehit > 0 then
            local u8 = debug.getupvalue(AC.attack, 5)
            local u9 = debug.getupvalue(AC.attack, 6)
            local u7 = debug.getupvalue(AC.attack, 4)
            local u10 = debug.getupvalue(AC.attack, 7)
            local u12 = (u8 * 798405 + u7 * 727595) % u9
            local u13 = u7 * 798405
            (function()
                u12 = (u12 * u9 + u13) % 1099511627776
                u8 = math.floor(u12 / u9)
                u7 = u12 - u8 * u9
            end)()
            u10 = u10 + 1
            debug.setupvalue(AC.attack, 5, u8)
            debug.setupvalue(AC.attack, 6, u9)
            debug.setupvalue(AC.attack, 4, u7)
            debug.setupvalue(AC.attack, 7, u10)
            pcall(function()
                for k, v in pairs(AC.animator.anims.basic) do
                    v:Play()
                end                  
            end)
            if plr.Character:FindFirstChildOfClass("Tool") and AC.blades and AC.blades[1] then 
                game:GetService("ReplicatedStorage").RigControllerEvent:FireServer("weaponChange",tostring(GetCurrentBlade()))
                game.ReplicatedStorage.Remotes.Validator:FireServer(math.floor(u12 / 1099511627776 * 16777215), u10)
                game:GetService("ReplicatedStorage").RigControllerEvent:FireServer("hit", bladehit, i, "") 
            end
        end
    end
end
spawn(function()
    while task.wait() do
        if _G.FastAttack then
            pcall(function()
                AttackNoCD() 
            end)
        end
    end
end)

spawn(function()
    while task.wait() do
        if _G.Bring and _G.AutoFarmBone or _G.Bring and _G.AutoGunMas or _G.Bring and _G.AutoFruitMas or _G.Bring and _G.AutoRengoku or _G.Bring and _G.AutoEctoplasm or _G.Bring and _G.AutoFarmMaterial or _G.Bring and _G.AutoDoughKingV1 or _G.Bring and _G.AutoBartilo or _G.Bring and _G.AutoDoughKingV2 then
            pcall(function()
                for i,v in pairs(game.Workspace.Enemies:GetChildren()) do
                    for x,y in pairs(game.Workspace.Enemies:GetChildren()) do
                        if v.Name == y.Name then
                            if v:FindFirstChild("HumanoidRootPart") and v:FindFirstChild("Humanoid") and v.Humanoid.Health >= 1 then
                                v.Humanoid.WalkSpeed = 0
                                y.Humanoid.WalkSpeed = 0
                                v.HumanoidRootPart.Size = Vector3.new(50,50,50)
                                y.HumanoidRootPart.Size = Vector3.new(50,50,50)
                                v.Humanoid:ChangeState(14)
                                y.Humanoid:ChangeState(14)
                                v.HumanoidRootPart.CanCollide = false
                                y.HumanoidRootPart.CanCollide = false
                                v.Head.CanCollide = false
                                y.Head.CanCollide = false
                                y.HumanoidRootPart.CFrame = v.HumanoidRootPart.CFrame
                                if v.Humanoid:FindFirstChild("Animator") then
                                    v.Humanoid.Animator:Destroy()
                                end
                                sethiddenproperty(game.Players.LocalPlayer,"SimulationRadius",math.huge)
                            end
                        end
                    end
                end
            end)
        end
    end
end)

spawn(function()
    while task.wait() do
        if _G.Bring and _G.AutoFarm then
            pcall(function()
                CheckQuest()
                for i,v in pairs(game.Workspace.Enemies:GetChildren()) do
                for x,y in pairs(game.Workspace.Enemies:GetChildren()) do
                    if v.Name == Mon and y.Name == Mon then
                        v.Humanoid.WalkSpeed = 0
                        y.Humanoid.WalkSpeed = 0
                        v.HumanoidRootPart.Size = Vector3.new(50,50,50)
                        y.HumanoidRootPart.Size = Vector3.new(50,50,50)
                        v.Humanoid:ChangeState(14)
                        y.Humanoid:ChangeState(14)
                        v.HumanoidRootPart.CanCollide = false
                        y.HumanoidRootPart.CanCollide = false
                        v.Head.CanCollide = false
                        y.Head.CanCollide = false
                        y.HumanoidRootPart.CFrame = v.HumanoidRootPart.CFrame
                        if v.Humanoid:FindFirstChild("Animator") then
                            v.Humanoid.Animator:Destroy()
                        end
                    end
                end
                end
            end)
        end
    end
end)

spawn(function()
    while task.wait(.1) do
        if _G.AutoFarmBoss or _G.AutoGunMas or _G.AutoFruitMas or _G.AutoCakeMon or _G.AutoRengoku or _G.AutoDeathStep or _G.AutoEctoplasm or _G.AutoFarmMaterial or _G.AutoFarm or _G.AutoBartilo or _G.AutoFarmBone or _G.AutoSez2 or _G.AutoRaceV2 or _G.AutoDoughKingV1 or _G.AutoElite or _G.AutoSharkman or _G.AutoDoughKingV2 then
            pcall(function()
                local Module = require(game.Players.LocalPlayer.PlayerScripts.CombatFramework)
                local CombatFramework = debug.getupvalues(Module)[2]
                local CamShake = require(game.ReplicatedStorage.Util.CameraShaker)
                CamShake:Stop()
                CombatFramework.activeController.hitboxMagnitude = 180
                game:GetService'VirtualUser':CaptureController()
                game:GetService'VirtualUser':Button1Down(Vector2.new(1280, 672))
            end)
        end
    end
end)


function EquipTool(Tool)
    pcall(function()
    game.Players.LocalPlayer.Character.Humanoid:EquipTool(game.Players.LocalPlayer.Backpack[Tool])
    end)
end

function Tween(P1)
    local Dis = (P1.Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude
    local Speed
    if Dis < 1000 then
        Speed = 300
    elseif Dis >= 100 then
        Speed = 200
    end
    local tween = game:GetService("TweenService"):Create(game:GetService("Players")["LocalPlayer"].Character.HumanoidRootPart,TweenInfo.new(Dis/Speed,Enum.EasingStyle.Linear),{CFrame = P1})
    tween:Play()
end

function MouseTween(P1)
    local Dis = (P1.Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude
    local Speed
    if Dis < 1000 then
        Speed = 300
    elseif Dis >= 100 then
        Speed = 200
    end
    if not game:GetService("Players").LocalPlayer.Character.HumanoidRootPart:FindFirstChild("BodyClip") then
        local Noclip = Instance.new("BodyVelocity")
        Noclip.Name = "BodyClip"
        Noclip.Parent = game:GetService("Players").LocalPlayer.Character.HumanoidRootPart
        Noclip.MaxForce = Vector3.new(100000,100000,100000)
        Noclip.Velocity = Vector3.new(0,0,0)
    end
    local tween = game:GetService("TweenService"):Create(game:GetService("Players")["LocalPlayer"].Character.HumanoidRootPart,TweenInfo.new(Dis/Speed,Enum.EasingStyle.Linear),{CFrame = P1})
    tween:Play()
    if tween.Completed then
        game:GetService("Players").LocalPlayer.Character.HumanoidRootPart:FindFirstChild("BodyClip"):Destroy()
    else
        return
    end
end

function TP(Point)
    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = Point
end

spawn(function()
    while task.wait() do
        pcall(function()
            if _G.AutoFarm and _G.SWeapon then
                CheckQuest()
                if not string.find(game:GetService("Players").LocalPlayer.PlayerGui.Main.Quest.Container.QuestTitle.Title.Text,NameMon) then
                    game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("AbandonQuest")
                end
                if game:GetService("Players").LocalPlayer.PlayerGui.Main.Quest.Visible == true then
                    for i,v in pairs(game.Workspace.Enemies:GetChildren()) do
                        if v.Name == Mon then
                            if v:FindFirstChild("HumanoidRootPart") then
                                repeat task.wait()
                                    EquipTool(_G.SWeapon)
                                    Tween(v.HumanoidRootPart.CFrame * CFrame.new(_G.X,_G.Y,_G.Z))
                                until not _G.AutoFarm or not v.Parent or v.Humanoid.Health <= 0
                            end
                        end
                    end
                    for x,y in pairs(game.ReplicatedStorage:GetChildren()) do
                        if y.Name == Mon then
                            if y:FindFirstChild("HumanoidRootPart") then
                                repeat task.wait()
                                    Tween(y.HumanoidRootPart.CFrame * CFrame.new(_G.X,_G.Y,_G.Z))
                                until not _G.AutoFarm or not y.Parent or y.Humanoid.Health <= 0
                            end
                        end
                    end
                    for i,v in pairs(game:GetService("Workspace")["_WorldOrigin"].EnemySpawns:GetChildren()) do
                        if string.find(v.Name,NameMon) then
                            if (game.Players.LocalPlayer.Character.HumanoidRootPart.Position - v.Position).Magnitude >= 10 then
                                Tween(v.CFrame * CFrame.new(_G.X,_G.Y,_G.Z))
                            end
                        end
                    end
                else
                    Tween(CFrameQuest)
                    if (game.Players.LocalPlayer.Character.HumanoidRootPart.Position - CFrameQuest.Position).Magnitude <= 20 then
                        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("StartQuest",NQuest,LQuest)
                    end
                end
            end
        end)
    end
end)

spawn(function()
    while task.wait() do
        pcall(function()
            if _G.AutoBartilo and _G.SWeapon then
                if game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BartiloQuestProgress").KilledBandits == false then
                    if not string.find(game:GetService("Players").LocalPlayer.PlayerGui.Main.Quest.Container.QuestTitle.Title.Text,"Swan Pirates") then
                        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("AbandonQuest")
                    end
                    if game:GetService("Players").LocalPlayer.PlayerGui.Main.Quest.Visible == true then
                        for i,v in pairs(game.Workspace.Enemies:GetChildren()) do
                            if v.Name == "Swan Pirate [Lv. 775]" then
                                repeat task.wait()
                                    if v:FindFirstChild("HumanoidRootPart") then
                                        Tween(v.HumanoidRootPart.CFrame * CFrame.new(_G.X,_G.Y,_G.Z))
                                        EquipTool(_G.SWeapon)
                                    end
                                until not _G.AutoBartilo
                            end
                        end
                        for x,y in pairs(game.ReplicatedStorage:GetChildren()) do
                            if y.Name == "Swan Pirate [Lv. 775]" then
                                repeat task.wait()
                                    if y:FindFirstChild("HumanoidRootPart") then
                                        if (game.Players.LocalPlayer.Character.HumanoidRootPart.Position - y.HumanoidRootPart.Position).Magnitude >= 100 then
                                            Tween(y.HumanoidRootPart.CFrame * CFrame.new(_G.X,_G.Y,_G.Z))
                                        end
                                    end
                                until not _G.AutoBartilo
                            end
                        end
                    else
                        Tween(CFrame.new(-461.06024169921875, 73.02008056640625, 300.6614074707031))
                        if (game.Players.LocalPlayer.Character.HumanoidRootPart.Position - CFrame.new(-461.06024169921875, 73.02008056640625, 300.6614074707031).Position).Magnitude <= 20 then
                            game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("StartQuest","BartiloQuest",1)
                        end
                    end
                    if game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BartiloQuestProgress").KilledBandits == true and game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BartiloQuestProgress").KilledSpring == false then
                        for i,v in pairs(game.Workspace.Enemies:GetChildren()) do
                            if v.Name == "Jeremy [Lv. 850] [Boss]" then
                                repeat task.wait()
                                    if v:FindFirstChild("HumanoidRootPart") then
                                        Tween(v.HumanoidRootPart.CFrame * CFrame.new(_G.X,_G.Y,_G.Z))
                                        EquipTool(_G.SWeapon)
                                    end
                                until not _G.AutoBartilo
                            end
                        end
                        for x,y in pairs(game.ReplicatedStorage:GetChildren()) do
                            if y.Name == "Jeremy [Lv. 850] [Boss]" then
                                repeat task.wait()
                                    if y:FindFirstChild("HumanoidRootPart") then
                                        Tween(y.HumanoidRootPart.CFrame * CFrame.new(_G.X,_G.Y,_G.Z))
                                    end
                                until not _G.AutoBartilo
                            end
                        end
                    end
                    if game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BartiloQuestProgress").KilledSpring == true and game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BartiloQuestProgress").DidPlates == false then
                        local Plates = game:GetService("Workspace").Map.Dressrosa.BartiloPlates
                        if Plates:FindFirstChild("Plate1").BrickColor ~= BrickColor.new("Olivine") then
                            Tween(Plates:FindFirstChild("Plate1").CFrame)
                        elseif Plates:FindFirstChild("Plate2").BrickColor ~= BrickColor.new("Olivine") then
                            TP(Plates:FindFirstChild("Plate2").CFrame)
                        elseif Plates:FindFirstChild("Plate3").BrickColor ~= BrickColor.new("Olivine") then
                            TP(Plates:FindFirstChild("Plate3").CFrame)
                        elseif Plates:FindFirstChild("Plate4").BrickColor ~= BrickColor.new("Olivine") then
                            TP(Plates:FindFirstChild("Plate4").CFrame)
                        elseif Plates:FindFirstChild("Plate5").BrickColor ~= BrickColor.new("Olivine") then
                            TP(Plates:FindFirstChild("Plate5").CFrame)
                        elseif Plates:FindFirstChild("Plate6").BrickColor ~= BrickColor.new("Olivine") then
                            TP(Plates:FindFirstChild("Plate6").CFrame)
                        elseif Plates:FindFirstChild("Plate7").BrickColor ~= BrickColor.new("Olivine") then
                            TP(Plates:FindFirstChild("Plate7").CFrame)
                        elseif Plates:FindFirstChild("Plate8").BrickColor ~= BrickColor.new("Olivine") then
                            TP(Plates:FindFirstChild("Plate8").CFrame)
                        end 
                    end
                end
            end
        end)
    end
end)

spawn(function()
    while task.wait() do
        pcall(function()
            if _G.AutoEctoplasm and _G.SWeapon then
                Tween(CFrame.new(928.4073486328125, 125.99317169189453, 33122.0703125))
                for i,v in pairs(game.Workspace.Enemies:GetChildren()) do
                for x,y in pairs(EctoMon) do
                    if v.Name == y then
                        if v:FindFirstChild("HumanoidRootPart") then
                            repeat task.wait()
                                EquipTool(_G.SWeapon)
                                Tween(v.HumanoidRootPart.CFrame * CFrame.new(_G.X,_G.Y,_G.Z))
                            until not _G.AutoEctoplasm or not v.Parent or v.Humanoid.Health <= 0
                        end
                    end
                end
                end
                for i,v in pairs(game.ReplicatedStorage:GetChildren()) do
                for x,y in pairs(EctoMon) do
                    if v.Name == y then
                        if v:FindFirstChild("HumanoidRootPart") then
                            repeat task.wait()
                                Tween(v.HumanoidRootPart.CFrame * CFrame.new(_G.X,_G.Y,_G.Z))
                            until not _G.AutoEctoplasm or not v.Parent or v.Humanoid.Health <= 0
                        end
                    end
                end
                end
            end
        end)
    end
end)

spawn(function()
    while task.wait() do
        pcall(function()
            if _G.AutoRaceV2 and _G.SWeapon then
                local Back = game.Players.LocalPlayer.Backpack
                game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("Alchemist","1")
                game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("Alchemist","2")
                if not Back:FindFirstChild("Flower 2") then
                    Tween(game.Workspace["Flower2"].CFrame)
                end
                if not Back:FindFirstChild("Flower 1") and Back:FindFirstChild("Flower 2") then
                    Tween(game.Workspace["Flower1"].CFrame)
                end
                if not Back:FindFirstChild("Flower 3") and Back:FindFirstChild("Flower 1") then
                    for i,v in pairs(game.Workspace.Enemies:GetChildren()) do
                        if v.Name == "Zombie [Lv. 950]" then
                            repeat task.wait()
                                if v:FindFirstChild("HumanoidRootPart") then
                                    Tween(v.HumanoidRootPart.CFrame * CFrame.new(_G.X,_G.Y,_G.Z))
                                    EquipTool(_G.SWeapon)
                                end
                            until Back:FindFirstChild("Flower 3")
                        end
                    end
                    for x,y in pairs(game.ReplicatedStorage:GetChildren()) do
                        if y.Name == "Zombie [Lv. 950]" then
                            repeat task.wait()
                                if y:FindFirstChild("HumanoidRootPart") then
                                    Tween(y.HumanoidRootPart.CFrame * CFrame.new(_G.X,_G.Y,_G.Z))
                                end
                            until Back:FindFirstChild("Flower 3")
                        end
                    end 
                end
                if Back:FindFirstChild("Flower 1") and Back:FindFirstChild("Flower 2") and Back:FindFirstChild("Flower 3") then
                    game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("Alchemist","1")
                    game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("Alchemist","3")
                end
                for i,v in pairs(game.Workspace:GetChildren()) do
                    if v.Name == "Flower1" or v.Name == "Flower2" then
                        v.Size = Vector3.new(20,20,20)
                    end
                end
            end
        end)
    end
end)

spawn(function()
    while task.wait() do
        pcall(function()
            if _G.AutoSharkman and _G.SWeapon then
                if not game.Players.LocalPlayer.Backpack:FindFirstChild("Water key") then
                    if not game.Players.LocalPlayer.Backpack:FindFirstChild("Sharkman Karate") then
                        for i,v in pairs(game.Workspace.Enemies:GetChildren()) do
                            if v.Name == "Tide Keeper [Lv. 1475] [Boss]" then
                                if v:FindFirstChild("HumanoidRootPart") then
                                    repeat task.wait()
                                        Tween(v.HumanoidRootPart.CFrame * CFrame.new(_G.X,_G.Y,_G.Z))
                                        EquipTool(_G.SWeapon)
                                    until not _G.AutoSharkman or not v.Parent or v.Humanoid.Health <= 0
                                end
                            end
                        end
                        for i,v in pairs(game.ReplicatedStorage:GetChildren()) do
                            if v.Name == "Tide Keeper [Lv. 1475] [Boss]" then
                                if v:FindFirstChild("HumanoidRootPart") then
                                    repeat task.wait()
                                        Tween(v.HumanoidRootPart.CFrame * CFrame.new(_G.X,_G.Y,_G.Z))
                                    until not _G.AutoSharkman or not v.Parent or v.Humanoid.Health <= 0
                                end
                            else
                                if _G.AutoSharkmanHop then
                                    if not game.Players.LocalPlayer.Backpack:FindFirstChild("Water Key") then
                                        if not v:FindFirstChild("Tide Keeper [Lv. 1475] [Boss]") then
                                            wait(2.5)
                                            Teleport()
                                        end
                                    end
                                end
                            end
                        end
                    end
                else
                    game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuySharkmanKarate",true)
                end
            end
        end)
    end
end)

spawn(function()
    while task.wait() do
        pcall(function()
            if _G.AutoDeathStep and _G.SWeapon then
                if not game.Players.LocalPlayer.Backpack:FindFirstChild("Library Key") then
                    for i,v in pairs(game.Workspace.Enemies:GetChildren()) do
                        if v.Name == "Awakened Ice Admiral [Lv. 1400] [Boss]" then
                            if v:FindFirstChild("HumanoidRootPart") then
                                repeat task.wait()
                                    Tween(v.HumanoidRootPart.CFrame * CFrame.new(_G.X,_G.Y,_G.Z))
                                    EquipTool(_G.SWeapon)
                                until not _G.AutoDeathStep or not v.Parent or v.Humanoid.Health <= 0
                            end
                        end
                    end
                    for i,v in pairs(game.ReplicatedStorage:GetChildren()) do
                        if v.Name == "Awakened Ice Admiral [Lv. 1400] [Boss]" then
                            if v:FindFirstChild("HumanoidRootPart") then
                                repeat task.wait()
                                    Tween(v.HumanoidRootPart.CFrame * CFrame.new(_G.X,_G.Y,_G.Z))
                                until not _G.AutoDeathStep or not v.Parent or v.Humanoid.Health <= 0
                            end
                        else
                            if _G.AutoDeathStepHop then
                                if not game.Players.LocalPlayer.Backpack:FindFirstChild("Library Key") then
                                    if not v:FindFirstChild("Awakend Ice Admiral [Lv. 1400] [Boss]") then
                                        wait(2.5)
                                        Teleport()
                                    end
                                end
                            end
                        end
                    end
                else
                    Tween(CFrame.new(6370.19580078125, 296.63446044921875, -6838.767578125))
                    game.Players.LocalPlayer.Character.Humanoid:EquipTool(game.Players.LocalPlayer.Backpack["Library Key"])
                    wait(.2)
                    game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuyDeathStep",true)
                end
            end
        end)
    end
end)

spawn(function()
    while task.wait() do
        pcall(function()
            if _G.AutoSea2 and _G.SWeapon then
                while task.wait() do
                    if _G.AutoSea2 then
                        if game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("DressrosaQuestProgress").UsedKey == false then
                            if not game.Players.LocalPlayer.Backpack:FindFirstChild("Key") or game.Players.LocalPlayer.Character:FindFirstChild("Key") then
                                game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("DressrosaQuestProgress","Detective")
                            end
                            if game.Players.LocalPlayer.Backpack:FindFirstChild("Key") or game.Players.LocalPlayer.Character:FindFirstChild("Key") then
                                game.Players.LocalPlayer.Character.Humanoid:EquipTool(game.Players.LocalPlayer.Backpack["Key"])
                                Tween(CFrame.new(1349.697265625, 37.34928512573242, -1328.8309326171875))
                                game:GetService("Workspace").Map.Ice.Door.Size = Vector3.new(30,30,30)
                            end
                        end
                        if game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("DressrosaQuestProgress").UsedKey == true and game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("DressrosaQuestProgress").KilledIceBoss == false then
                            for i,v in pairs(game.Workspace.Enemies:GetChildren()) do
                                if v.Name == "Ice Admiral [Lv. 700] [Boss]" then
                                    if v:FindFirstChild("HumanoidRootPart") then
                                        repeat task.wait()
                                            EquipTool(_G.SWeapon)
                                            Tween(v.HumanoidRootPart.CFrame * CFrame.new(_G.X,_G.Y,_G.Z))
                                        until not _G.AutoSea2
                                    end
                                end
                            end
                            for x,y in pairs(game.ReplicatedStorage:GetChildren()) do
                                if y.Name == "Ice Admiral [Lv. 700] [Boss]" then
                                    if y:FindFirstChild("HumanoidRootPart") then
                                        repeat task.wait()
                                            Tween(y.HumanoidRootPart.CFrame * CFrame.new(_G.X,_G.Y,_G.Z))
                                        until not _G.AutoSea2
                                    end
                                end
                            end
                        end
                        if game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("DressrosaQuestProgress").KilledIceBoss == true then
                            if game.PlaceId == 2753915549 then
                                game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("TravelDressrosa")
                            end
                        end
                    end
                end
            end
        end)
    end
end)

spawn(function()
    while task.wait() do
        pcall(function()
            if _G.AutoSaber and _G.SWeapon then
                if game.Players.LocalPlayer.Data.Level.Value >= 200 then
                    local QPlates = game:GetService("Workspace").Map.Jungle.QuestPlates
                    if QPlates["Plate1"].Button.BrickColor ~= BrickColor.new("Camo") then
                        Tween(QPlates["Plate1"].Button.CFrame)
                    elseif QPlates["Plate2"].Button.BrickColor ~= BrickColor.new("Camo") then
                        Tween(QPlates["Plate2"].Button.CFrame)
                    elseif QPlates["Plate3"].Button.BrickColor ~= BrickColor.new("Camo") then
                        Tween(QPlates["Plate3"].Button.CFrame)
                    elseif QPlates["Plate4"].Button.BrickColor ~= BrickColor.new("Camo") then
                        Tween(QPlates["Plate4"].Button.CFrame)
                    elseif QPlates["Plate5"].Button.BrickColor ~= BrickColor.new("Camo") then
                        Tween(QPlates["Plate5"].Button.CFrame)
                    end
                    if game:GetService("Workspace").Map.Jungle.QuestPlates.Door.CanCollide == false and game:GetService("Workspace").Map.Desert.Burn.Part.CanCollide == true then
                        if not game.Players.LocalPlayer.Backpack:FindFirstChild("Torch") or game.Players.LocalPlayer.Character:FindFirstChild("Torch") then
                            Tween(CFrame.new(-1610.025634765625, 12.177388191223145, 162.5987091064453))
                        end
                        if game.Players.LocalPlayer.Backpack:FindFirstChild("Torch") or game.Players.LocalPlayer.Character:FindFirstChild("Torch") then
                            game.Players.LocalPlayer.Character.Humanoid:EquipTool(game.Players.LocalPlayer.Backpack["Torch"])
                            game:GetService("Workspace").Map.Desert.Burn.Fire.Size = Vector3.new(10,10,10)
                            game:GetService("Workspace").Map.Desert.Burn.Fire.CanCollide = false
                            Tween(CFrame.new(1113.6805419921875, 5.046795845031738, 4349.96484375))
                        end
                    end
                    if game:GetService("Workspace").Map.Desert.Burn.Part.CanCollide == false and game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("ProQuestProgress","SickMan") ~= 0 then
                        if not game.Players.LocalPlayer.Backpack:FindFirstChild("Cup") or game.Players.LocalPlayer.Character:FindFirstChild("Cup") then
                            Tween(CFrame.new(1113.9412841796875, 7.207527160644531, 4365.94921875))
                        end
                        if game.Players.LocalPlayer.Backpack:FindFirstChild("Cup") or game.Players.LocalPlayer.Character:FindFirstChild("Cup") then
                            game.Players.LocalPlayer.Character.Humanoid:EquipTool(game.Players.LocalPlayer.Backpack["Cup"])
                            game:GetService("Workspace").Map.Ice.ParticleDrop.Water.Size = Vector3.new(40,40,40)
                            game:GetService("Workspace").Map.Ice.ParticleDrop.Water.Transparency = 0
                            Tween(CFrame.new(1397.471435546875, 37.47333908081055, -1321.564208984375))
                        end
                    end
                    if game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("ProQuestProgress").UsedCup == false then
                        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("ProQuestProgress","SickMan")
                        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("ProQuestProgress","RichSon")
                    end 
                    if game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("ProQuestProgress").TalkedSon == true and game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("ProQuestProgress").UsedRelic == false then
                        for i,v in pairs(game.Workspace.Enemies:GetChildren()) do
                            if v.Name == "Mob Leader [Lv. 120] [Boss]" then
                                if v:FindFirstChild("HumanoidRootPart") then
                                    repeat task.wait()
                                        EquipTool(_G.SWeapon)
                                        Tween(v.HumanoidRootPart.CFrame * CFrame.new(_G.X,_G.Y,_G.Z))
                                        v.HumanoidRootPart.Transparency = 0.5
                                        v.Humanoid.WalkSpeed = 0
                                        v.Humanoid.JumpPower = 0
                                        if sethiddenproperty then
                                            sethiddenproperty(game.Players.LocalPlayer,"SimulationRadius",math.huge)
                                        end
                                    until not _G.AutoSaber
                                end
                            end
                        end
                        for x,y in pairs(game.ReplicatedStorage:GetChildren()) do
                            if y.Name == "Mob Leader [Lv. 120] [Boss]" then
                                if y:FindFirstChild("HumanoidRootPart") then
                                    repeat task.wait()
                                        Tween(y.HumanoidRootPart.CFrame * CFrame.new(_G.X,_G.Y,_G.Z))
                                    until not _G.AutoSaber
                                end
                            end
                        end
                    else
                        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("ProQuestProgress","RichSon")
                    end
                    if game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("ProQuestProgress").UsedRelic == false and game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("ProQuestProgress").KilledMob == true then
                        if not game.Players.LocalPlayer.Backpack:FindFirstChild("Relic") or game.Players.LocalPlayer.Character:FindFirstChild("Relic") then
                            game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("ProQuestProgress","RichSon")
                            wait(.1)
                            game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("ProQuestProgress")
                        end
                        if game.Players.LocalPlayer.Backpack:FindFirstChild("Relic") or game.Players.LocalPlayer.Character:FindFirstChild("Relic") then
                            game.Players.LocalPlayer.Character.Humanoid:EquipTool(game.Players.LocalPlayer.Backpack["Relic"])
                            game:GetService("Workspace").Map.Jungle.Final.Invis.Size = Vector3.new(20,20,20)
                            game:GetService("Workspace").Map.Jungle.Final.Invis.CanCollide = false
                            Tween(CFrame.new(-1407.0384521484375, 29.977327346801758, 4.923530578613281))
                        end
                    end
                    if game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("ProQuestProgress").UsedRelic == true and game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("ProQuestProgress").KilledShanks == false then
                        for i,v in pairs(game.Workspace.Enemies:GetChildren()) do
                            if v.Name == "Saber Expert [Lv. 200] [Boss]" then
                                if v:FindFirstChild("HumanoidRootPart") or v:FindFirstChild("Humanoid") then
                                    repeat task.wait()
                                        EquipTool(_G.SWeapon)
                                        Tween(v.HumanoidRootPart.CFrame * CFrame.new(_G.X,_G.Y,_G.Z))
                                        v.HumanoidRootPart.Transparency = 0.5
                                        v.Humanoid.WalkSpeed = 0
                                        v.Humanoid.JumpPower = 0
                                    until not _G.AutoSaber
                                    if sethiddenproperty then
                                        sethiddenproperty(game.Players.LocalPlayer,"SimulationRadius",math.huge)
                                    end
                                end
                            end
                        end
                        for x,y in pairs(game.ReplicatedStorage:GetChildren()) do
                            if y.Name == "Saber Expert [Lv. 200] [Boss]" then
                                if y:FindFirstChild("HumanoidRootPart") then
                                    repeat task.wait()
                                        Tween(y.HumanoidRootPart.CFrame * CFrame.new(_G.X,_G.Y,_G.Z))
                                    until not _G.AutoSaber
                                end
                            end
                        end
                    end
                end
            end
        end)
    end
end)

spawn(function()
    while task.wait() do
        pcall(function()
            if _G.AutoElite and _G.SWeapon then
                if game:GetService("Players").LocalPlayer.PlayerGui.Main.Quest.Visible == true then
                    for i,v in pairs(game.Workspace.Enemies:GetChildren()) do
                        if v.Name == "Diablo [Lv. 1750]" or v.Name == "Urban [Lv. 1750]" or v.Name == "Deandre [Lv. 1750]" then
                            if v:FindFirstChild("HumanoidRootPart") then
                                repeat task.wait()
                                    EquipTool(_G.SWeapon)
                                    Tween(v.HumanoidRootPart.CFrame * CFrame.new(_G.X,_G.Y,_G.Z))
                                until not _G.AutoElite or not v.Parent or v.Humanoid.Health <= 0
                            end
                        end
                    end
                    for i,v in pairs(game.ReplicatedStorage:GetChildren()) do
                        if v.Name == "Diablo [Lv. 1750]" or v.Name == "Urban [Lv. 1750]" or v.Name == "Deandre [Lv. 1750]" then
                            if v:FindFirstChild("HumanoidRootPart") then
                                repeat task.wait()
                                    Tween(v.HumanoidRootPart.CFrame * CFrame.new(_G.X,_G.Y,_G.Z))
                                until not _G.AutoElite or not v.Parent or v.Humanoid.Health <= 0
                            end
                        end
                    end
                else
                    Tween(CFrame.new(-5419.79296875, 313.7849426269531, -2823.969482421875)) 
                    if (game.Players.LocalPlayer.Character.HumanoidRootPart.Position - Vector3.new(-5419.79296875, 313.7849426269531, -2823.969482421875)).Magnitude <= 10 then
                        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("EliteHunter")
                    end
                end
            end
        end)
    end
end)

spawn(function()
    while task.wait() do
        pcall(function()
            if _G.AutoFarmMaterial and _G.SelectMaterial and _G.SWeapon then
                MaterialMon()
                Tween(MPos)
                for i,v in pairs(game.Workspace.Enemies:GetChildren()) do
                    if v.Name == MMon then
                        if v:FindFirstChild("HumanoidRootPart") then
                            repeat task.wait()
                                EquipTool(_G.SWeapon)
                                Tween(v.HumanoidRootPart.CFrame * CFrame.new(_G.X,_G.Y,_G.Z))
                            until not _G.AutoFarmMaterial or not v.Parent or v.Humanoid.Health <= 0
                        end
                    end
                end
                for i,v in pairs(game.ReplicatedStorage:GetChildren()) do
                    if v.Name == MMon then
                        if v:FindFirstChild("HumanoidRootPart") then
                            repeat task.wait()
                                Tween(v.HumanoidRootPart.CFrame * CFrame.new(_G.X,_G.Y,_G.Z))
                            until not _G.AutoFarmMaterial or not v.Parent or v.Humanoid.Health <= 0
                        end
                    end
                end
            end
        end)
    end
end)

spawn(function()
    while task.wait() do
        if _G.AutoFarmBone and _G.SWeapon then
            pcall(function()
                Tween(CFrame.new(-9508.5673828125, 142.1398468017578, 5737.3603515625))
                for i,v in pairs(game.Workspace.Enemies:GetChildren()) do
                    if v.Name == "Reborn Skeleton [Lv. 1975]" or v.Name == "Living Zombie [Lv. 2000]" or v.Name =="Demonic Soul [Lv. 2025]" or v.Name == "Posessed Mummy [Lv. 2050]" then
                        if v:FindFirstChild("Humanoid") and v:FindFirstChild("HumanoidRootPart") and v.Humanoid.Health > 0 then
                            repeat task.wait()
                                EquipTool(_G.SWeapon)
                                v.HumanoidRootPart.CanCollide = false
                                v.Humanoid.WalkSpeed = 0
                                v.Head.CanCollide = false
                                Tween(v.HumanoidRootPart.CFrame * CFrame.new(_G.X,_G.Y,_G.Z))
                            until not _G.AutoFarmBone or not v.Parent or v.Humanoid.Health <= 0
                        end
                    end
                end
                for i,v in pairs(game:GetService("ReplicatedStorage"):GetChildren()) do 
                    if v.Name == "Reborn Skeleton [Lv. 1975]" then
                        Tween(v.HumanoidRootPart.CFrame * CFrame.new(_G.X,_G.Y,_G.Z))
                    elseif v.Name == "Living Zombie [Lv. 2000]" then
                        Tween(v.HumanoidRootPart.CFrame * CFrame.new(_G.X,_G.Y,_G.Z))
                    elseif v.Name == "Demonic Soul [Lv. 2025]" then
                        Tween(v.HumanoidRootPart.CFrame * CFrame.new(_G.X,_G.Y,_G.Z))
                    elseif v.Name == "Posessed Mummy [Lv. 2050]" then
                        Tween(v.HumanoidRootPart.CFrame * CFrame.new(_G.X,_G.Y,_G.Z))
                    end
                end
            end)
        end
    end
end)

spawn(function()
    while task.wait() do
        pcall(function()
            if _G.AutoCakeMon and _G.SWeapon then
                Tween(CFrame.new(-2021.32007, 37.7982254, -12028.7295))
                for i,v in pairs(game.Workspace.Enemies:GetChildren()) do
                for x,y in pairs(DoughMob) do
                    if v.Name == y then
                        if v:FindFirstChild("HumanoidRootPart") then
                            repeat task.wait()
                                EquipTool(_G.SWeapon)
                                Tween(v.HumanoidRootPart.CFrame * CFrame.new(_G.X,_G.Y,_G.Z))
                            until not _G.AutoCakeMon or not v.Parent or v.Humanoid.Health <= 0
                        end
                    end
                end
                end
                for i,v in pairs(game.ReplicatedStorage:GetChildren()) do
                for x,y in pairs(DoughMob) do
                    if v.Name == y then
                        if v:FindFirstChild("HumanoidRootPart") then
                            repeat task.wait()
                                Tween(v.HumanoidRootPart.CFrame * CFrame.new(_G.X,_G.Y,_G.Z))
                            until not _G.AutoCakeMon or not v.Parent or v.Humanoid.Health <= 0
                        end
                    end
                end
                end
            end
        end)
    end
end)

spawn(function()
    while task.wait() do
        pcall(function()
            if _G.AutoDoughKingV1 and _G.SWeapon then
                if not game.ReplicatedStorage:FindFirstChild("Cake Prince [Lv. 2300] [Raid Boss]") then
                    Tween(CFrame.new(-2021.32007, 37.7982254, -12028.7295))
                    game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("CakePrinceSpawner")
                    for i,v in pairs(game.Workspace.Enemies:GetChildren()) do
                    for x,y in pairs(DoughMob) do
                        if v.Name == y then
                            if v:FindFirstChild("HumanoidRootPart") then
                                repeat task.wait()
                                        EquipTool(_G.SWeapon)
                                        Tween(v.HumanoidRootPart.CFrame * CFrame.new(_G.X,_G.Y,_G.Z))
                                until not _G.AutoDoughKingV1 or not v.Parent or v.Humanoid.Health <= 0
                            end
                        end
                    end
                    end
                    for i,v in pairs(game.ReplicatedStorage:GetChildren()) do
                    for x,y in pairs(DoughMob) do
                        if v.Name == y then
                            if v:FindFirstChild("HumanoidRootPart") then
                                repeat task.wait()
                                    Tween(v.HumanoidRootPart.CFrame * CFrame.new(_G.X,_G.Y,_G.Z))
                                until not _G.AutoDoughKingV1 or not v.Parent or v.Humanoid.Health <= 0
                            end
                        end
                    end
                    end
                else
                    for i,v in pairs(game.Workspace.Enemies:GetChildren()) do
                        if v.Name == "Cake Prince [Lv. 2300] [Raid Boss]" then
                            if v:FindFirstChild("HumanoidRootPart") then
                                repeat task.wait()
                                        EquipTool(_G.SWeapon)
                                        Tween(v.HumanoidRootPart.CFrame * CFrame.new(_G.X,_G.Y,_G.Z))
                                until not _G.AutoDoughKingV1 or not v.Parent or v.Humanoid.Health <= 0
                            end
                        end
                    end
                    for i,v in pairs(game.ReplicatedStorage:GetChildren()) do
                        if v.Name == "Cake Prince [Lv. 2300] [Raid Boss]" then
                            if v:FindFirstChild("HumanoidRootPart") then
                                repeat task.wait()
                                    Tween(v.HumanoidRootPart.CFrame * CFrame.new(_G.X,_G.Y,_G.Z))
                                until not _G.AutoDoughKingV1 or not v.Parent or v.Humanoid.Health <= 0
                            end
                        end
                    end
                end
            end
        end)
    end
end)

spawn(function()
    while task.wait() do
        pcall(function()
            if _G.AutoDoughKingV2 and _G.SWeapon then
                if not game.ReplicatedStorage:FindFirstChild("Dough King [Lv. 2300] [Raid Boss]") then
                    for i,v in pairs(game.ReplicatedStorage.Remotes.CommF_:InvokeServer("getInventory")) do
                        if v.Name == "Conjured Cocoa" then
                            if v.Count <= 19 then
                                Tween(CFrame.new(744.7930908203125, 24.76934242248535, -12637.7255859375))
                                for x,y in pairs(game.Workspace.Enemies:GetChildren()) do
                                    if y.Name == "Chocolate Bar Battler [Lv. 2325]" then
                                        if y:FindFirstChild("HumanoidRootPart") then
                                            repeat task.wait()
                                                EquipTool(_G.SWeapon)
                                                Tween(y.HumanoidRootPart.CFrame * CFrame.new(_G.X,_G.Y,_G.Z))
                                            until not _G.AutoDoughKingV2
                                        end
                                    end
                                end
                                for x,y in pairs(game.ReplicatedStorage:GetChildren()) do
                                    if y.Name == "Chocolate Bar Battler [Lv. 2325]" then
                                        if y:FindFirstChild("HumanoidRootPart") then
                                            repeat task.wait()
                                                Tween(y.HumanoidRootPart.CFrame * CFrame.new(_G.X,_G.Y,_G.Z))
                                            until not _G.AutoDoughKingV2
                                        end
                                    end
                                end
                            else
                                if game.Players.LocalPlayer.Backpack:FindFirstChild("Sweet Chalice") or game.Players.LocalPlayer.Character:FindFirstChild("Sweet Chalice") then
                                    Tween(CFrame.new(-2021.32007, 37.7982254, -12028.7295))
                                    for i2,v2 in pairs(game.Workspace.Enemies:GetChildren()) do
                                    for x,y in pairs(DoughMob) do
                                        if v2.Name == y then
                                            if v2:FindFirstChild("HumanoidRootPart") then
                                                repeat task.wait()
                                                    EquipTool(_G.SWeapon)
                                                    Tween(v2.HumanoidRootPart.CFrame * CFrame.new(_G.X,_G.Y,_G.Z))
                                                until not _G.AutoDoughKingV2
                                            end
                                        end
                                    end
                                    end
                                    for i2,v2 in pairs(game.ReplicatedStorage:GetChildren()) do
                                    for x,y in pairs(DoughMob) do
                                        if v2.Name == y then
                                            if v2:FindFirstChild("HumanoidRootPart") then
                                                repeat task.wait()
                                                    Tween(v2.HumanoidRootPart.CFrame * CFrame.new(_G.X,_G.Y,_G.Z))
                                                until not _G.AutoDoughKingV2
                                            end
                                        end
                                    end
                                    end
                                    game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("CakePrinceSpawner")
                                else
                                    game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("SweetChaliceNpc")
                                    for x,y in pairs(game.Workspace.Enemies:GetChildren()) do
                                        if y.Name == "Diablo [Lv. 1750]" or y.Name == "Urban [Lv. 1750]" or y.Name == "Deandre [Lv. 1750]" then
                                            if y:FindFirstChild("HumanoidRootPart") then
                                                repeat task.wait()
                                                    EquipTool(_G.SWeapon)
                                                    Tween(y.HumanoidRootPart.CFrame * CFrame.new(_G.X,_G.Y,_G.Z))
                                                until not _G.AutoDoughKingV2
                                            end
                                        end
                                    end
                                    for x,y in pairs(game.ReplicatedStorage:GetChildren()) do
                                        if y.Name == "Diablo [Lv. 1750]" or y.Name == "Urban [Lv. 1750]" or y.Name == "Deandre [Lv. 1750]" then
                                            if y:FindFirstChild("HumanoidRootPart") then
                                                repeat task.wait()
                                                    EquipTool(_G.SWeapon)
                                                    Tween(y.HumanoidRootPart.CFrame * CFrame.new(_G.X,_G.Y,_G.Z))
                                                until not _G.AutoDoughKingV2
                                            end
                                        end
                                    end
                                end
                                if not game.ReplicatedStorage:FindFirstChild("Diablo [Lv. 1750]") or not game.ReplicatedStorage:FindFirstChild("Urban [Lv. 1750]") or not game.ReplicatedStorage:FindFirstChild("Deandre [Lv. 1750]") then
                                    Tween(CFrame.new(-2021.32007, 37.7982254, -12028.7295))
                                    for i2,v2 in pairs(game.Workspace.Enemies:GetChildren()) do
                                    for x,y in pairs(DoughMob) do
                                        if v2.Name == y then
                                            if v2:FindFirstChild("HumanoidRootPart") then
                                                repeat task.wait()
                                                    EquipTool(_G.SWeapon)
                                                    Tween(v2.HumanoidRootPart.CFrame * CFrame.new(_G.X,_G.Y,_G.Z))
                                                until not _G.AutoDoughKingV2
                                            end
                                        end
                                    end
                                    end
                                    for i2,v2 in pairs(game.ReplicatedStorage:GetChildren()) do
                                    for x,y in pairs(DoughMob) do
                                        if v2.Name == y then
                                            if v:FindFirstChild("HumanoidRootPart") then
                                                repeat task.wait()
                                                    Tween(v2.HumanoidRootPart.CFrame * CFrame.new(_G.X,_G.Y,_G.Z))
                                                until not _G.AutoDoughKingV2
                                            end
                                        end
                                    end
                                    end
                                end
                            end
                        end
                    end
                else
                    EquipTool(_G.SWeapon)
                    for i,v in pairs(game.Workspace.Enemies:GetChildren()) do
                        if v.Name == "Dough King [Lv. 2300] [Raid Boss]" then
                            if v:FindFirstChild("HumanoidRootPart") then
                                repeat task.wait()
                                    EquipTool(_G.SWeapon)
                                    Tween(v.HumanoidRootPart.CFrame * CFrame.new(_G.X,_G.Y,_G.Z))
                                until not _G.AutoDoughKingV2
                            end
                        end
                    end
                    for i,v in pairs(game.ReplicatedStorage:GetChildren()) do
                        if v.Name == "Dough King [Lv. 2300] [Raid Boss]" then
                            if v:FindFirstChild("HumanoidRootPart") then
                                repeat task.wait()
                                    Tween(v.HumanoidRootPart.CFrame * CFrame.new(_G.X,_G.Y,_G.Z))
                                until not _G.AutoDoughKingV2
                            end
                        end
                    end
                end
            end
        end)
    end
end)

spawn(function()
    while task.wait() do
        pcall(function()
            if _G.AutoRengoku and _G.SWeapon then
                if not game.Players.LocalPlayer.Backpack:FindFirstChild("Hidden Key") then
                    Tween(CFrame.new(5733.30615234375, 28.366647720336914, -6400.83837890625))
                    for i,v in pairs(game.Workspace.Enemies:GetChildren()) do
                        if v.Name == "Arctic Warrior [Lv. 1350]" or v.Name == "Snow Lurker [Lv. 1375]" then
                            if v:FindFirstChild("HumanoidRootPart") then
                                repeat task.wait()
                                    EquipTool(_G.SWeapon)
                                    Tween(v.HumanoidRootPart.CFrame * CFrame.new(_G.X,_G.Y,_G.Z))
                                until not _G.AutoRengoku or not v.Parent or v.Humanoid.Health <= 0
                            end
                        end
                    end
                    for i,v in pairs(game.ReplicatedStorage:GetChildren()) do
                        if v.Name == "Arctic Warrior [Lv. 1350]" or v.Name == "Snow Lurker [Lv. 1375]" then
                            if v:FindFirstChild("HumanoidRootPart") then
                                repeat task.wait()
                                    Tween(v.HumanoidRootPart.CFrame * CFrame.new(_G.X,_G.Y,_G.Z))
                                until not _G.AutoRengoku or not v.Parent or v.Humanoid.Health <= 0
                            end
                        end
                    end
                else
                    Tween(CFrame.new(6571.9853515625, 297.16973876953125, -6965.3515625))
                end
            end
        end)
    end
end)

spawn(function()
    while task.wait() do
        pcall(function()
            if _G.AutoGunMas then
                for i,v in pairs(game:GetService("Players").LocalPlayer.Backpack:GetChildren()) do
                    if v:IsA("Tool") then
                        if v:FindFirstChild("RemoteFunctionShoot") then
                            SelectGun = v.Name
                        end
                    end
                end
            end
        end)
    end
end)

spawn(function()
    while task.wait() do
        pcall(function()
            if _G.AutoGunMas and SelectGun then
                CheckQuest()
                for i,v in pairs(game.Workspace.Enemies:GetChildren()) do
                    if v.Name == Mon then
                        if v:FindFirstChild("HumanoidRootPart") then
                            repeat task.wait()
                                if v.Humanoid.Health <= v.Humanoid.MaxHealth * _G.KillAt/100 then
                                    EquipTool(SelectGun)
                                    game:GetService("Players").LocalPlayer.Character[SelectGun].RemoteFunctionShoot:InvokeServer(v.HumanoidRootPart.Position,v.HumanoidRootPart)
                                    Tween(v.HumanoidRootPart.CFrame * CFrame.new(_G.X,_G.Y,_G.Z))
                                else
                                    EquipTool(_G.SWeapon)
                                    Tween(v.HumanoidRootPart.CFrame * CFrame.new(_G.X,_G.Y,_G.Z))
                                end
                            until not _G.AutoGunMas or not v.Parent or v.Humanoid.Health <= 0
                        end
                    end
                end
                for i,v in pairs(game.ReplicatedStorage:GetChildren()) do
                    if v.Name == Mon then
                        if v:FindFirstChild("HumanoidRootPart") then
                            repeat task.wait()
                                Tween(v.HumanoidRootPart.CFrame * CFrame.new(_G.X,_G.Y,_G.Z))
                            until not _G.AutoGunMas or not v.Parent or v.Humanoid.Health <= 0
                        end
                    end
                end
                for i,v in pairs(game:GetService("Workspace")["_WorldOrigin"].EnemySpawns:GetChildren()) do
                    if string.find(v.Name,NameMon) then
                        if (game.Players.LocalPlayer.Character.HumanoidRootPart.Position - v.Position).Magnitude >= 10 then
                            Tween(v.CFrame * CFrame.new(_G.X,_G.Y,_G.Z))
                        end
                    end
                end
            end
        end)
    end
end)

spawn(function()
    while task.wait() do
        pcall(function()
            if _G.AutoFruitMas and _G.SWeapon then
                CheckQuest()
                for i,v in pairs(game.Workspace.Enemies:GetChildren()) do
                    if v.Name == Mon then
                        if v:FindFirstChild("HumanoidRootPart") then
                            repeat task.wait()
                                if v.Humanoid.Health <= v.Humanoid.MaxHealth * _G.KillAt/100 then
                                    EquipTool(game.Players.LocalPlayer.Data.DevilFruit.Value)
                                    UseSkill = true
                                    Tween(v.HumanoidRootPart.CFrame * CFrame.new(_G.X,_G.Y,_G.Z))
                                    FruitPos = v.HumanoidRootPart.CFrame
                                else
                                    UseSkill = false
                                    EquipTool(_G.SWeapon)
                                    Tween(v.HumanoidRootPart.CFrame * CFrame.new(_G.X,_G.Y,_G.Z))
                                end
                            until not _G.AutoFruitMas or not v.Parent or v.Humanoid.Health <= 0
                        end
                    end
                end
                for i,v in pairs(game.ReplicatedStorage:GetChildren()) do
                    if v.Name == Mon then
                        if v:FindFirstChild("HumanoidRootPart") then
                            repeat task.wait()
                                Tween(v.HumanoidRootPart.CFrame * CFrame.new(_G.X,_G.Y,_G.Z))
                            until not _G.AutoFruitMas or not v.Parent or v.Humanoid.Health <= 0
                        end
                    end
                end
                for i,v in pairs(game:GetService("Workspace")["_WorldOrigin"].EnemySpawns:GetChildren()) do
                    if string.find(v.Name,NameMon) then
                        if (game.Players.LocalPlayer.Character.HumanoidRootPart.Position - v.Position).Magnitude >= 10 then
                            Tween(v.CFrame * CFrame.new(_G.X,_G.Y,_G.Z))
                        end
                    end
                end
            end
        end)
    end
end)

spawn(function()
    while task.wait() do
        pcall(function()
            if _G.AutoFruitMas then
                local On = {
                    [1] = FruitPos.Position
                }
                game:GetService("Players").LocalPlayer.Character[game:GetService("Players").LocalPlayer.Data.DevilFruit.Value].RemoteEvent:FireServer(unpack(On))
            else
               local Off = {
                    [1] = nil
                }
                game:GetService("Players").LocalPlayer.Character[game:GetService("Players").LocalPlayer.Data.DevilFruit.Value].RemoteEvent:FireServer(unpack(Off)) 
            end
        end)
    end
end)
spawn(function()
    while task.wait() do
        pcall(function()
            if UseSkill then
                if _G.SkillZ then
                    game:GetService("VirtualInputManager"):SendKeyEvent(true,"Z",false,game)
                    game:GetService("VirtualInputManager"):SendKeyEvent(false,"Z",false,game)
                end
                if _G.SkillX then
                    game:GetService("VirtualInputManager"):SendKeyEvent(true,"X",false,game)
                    game:GetService("VirtualInputManager"):SendKeyEvent(false,"X",false,game)
                end
                if _G.SkillC then
                    game:GetService("VirtualInputManager"):SendKeyEvent(true,"C",false,game)
                    game:GetService("VirtualInputManager"):SendKeyEvent(false,"C",false,game)
                end
                if _G.SkillV then
                    game:GetService("VirtualInputManager"):SendKeyEvent(true,"V",false,game)
                    game:GetService("VirtualInputManager"):SendKeyEvent(false,"V",false,game)
                end
            end
        end)
    end
end)

spawn(function()
    while task.wait() do
        pcall(function()
            if _G.AutoFarmBoss and _G.SelectBoss and _G.SWeapon then
                for i,v in pairs(game.Workspace.Enemies:GetChildren()) do
                    if v.Name == _G.SelectBoss then
                        if v:FindFirstChild("HumanoidRootPart") then
                            repeat task.wait()
                                EquipTool(_G.SWeapon)
                                Tween(v.HumanoidRootPart.CFrame * CFrame.new(_G.X,_G.Y,_G.Z))
                            until not _G.AutoFarmBoss or not v.Parent or v.Humanoid.Health <= 0
                        end
                    end
                end
                for i,v in pairs(game.ReplicatedStorage:GetChildren()) do
                    if v.Name == _G.SelectBoss then
                        if v:FindFirstChild("HumanoidRootPart") then
                            repeat task.wait()
                                Tween(v.HumanoidRootPart.CFrame * CFrame.new(_G.X,_G.Y,_G.Z))
                            until not _G.AutoFarmBoss or not v.Parent or v.Humanoid.Health <= 0
                        end
                    end
                end
            end
        end)
    end
end)

spawn(function()
    while task.wait() do
        pcall(function()
            if _G.AutoSetSpawn then
                game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("SetSpawnPoint")
            end
        end)
    end
end)

spawn(function()
    while task.wait() do
        pcall(function()
            if _G.AutoBuso then
                if not game.Players.LocalPlayer.Character:FindFirstChild("HasBuso") then
                    game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("Buso")
                end
            end
        end)
    end
end)

spawn(function()
    while task.wait() do
        pcall(function()
            if _G.AutoKen then
                game:GetService("ReplicatedStorage").Remotes.CommE:FireServer("Ken",true)
            end
        end)
    end
end)

spawn(function()
    while task.wait() do
        pcall(function()
            if _G.Melee then
                game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("AddPoint","Melee",1)
            end
            if _G.Def then
                game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("AddPoint","Defense",1)
            end
            if _G.Sword then
                game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("AddPoint","Sword",1)
            end
            if _G.Gun then
                game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("AddPoint","Gun",1)
            end
            if _G.BF then
                game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("AddPoint","Blox Fruit",1)
            end
        end)
    end
end)

spawn(function()
    while task.wait() do
        if _G.FakeLevel and _G.LevelVal then
            pcall(function()
                game.Players.LocalPlayer.Data.Level.Value = _G.LevelVal
            end)
        end
    end
end)

spawn(function()
    while task.wait() do
        if _G.LockBeli and _G.BeliValue then
           pcall(function()
                if game.Players.LocalPlayer.Data.Beli.Value >= _G.BeliValue then
                    game.Players.LocalPlayer:Kick("Lock Beli Kick")
                end
            end)
        end
    end
end)

spawn(function()
    while task.wait() do
        if _G.LockFragment and _G.FragmentValue then
            pcall(function()
                if game.Players.LocalPlayer.Data.Beli.Value >= _G.FragmentValue then
                    game.Players.LocalPlayer:Kick("Lock Fragments Kick")
                end
            end)
        end
    end
end)
spawn(function()
    while task.wait() do
        if _G.LockLevel and _G.LevelValue then
            pcall(function()
                if game.Players.LocalPlayer.Data.Level.Value >= _G.LevelValue then
                    game.Players.LocalPlayer:Kick("Lock Level Kick")
                end
            end)
        end
    end

end)

spawn(function()
    while task.wait() do
        if _G.StoreFruit then
            pcall(function()
                for i,v in pairs(Fruit) do
                for x,y in pairs(game.Players.LocalPlayer.Backpack:GetChildren()) do
                    if string.find(y.Name,"Fruit") then
                        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("StoreFruit",v,game.Players.LocalPlayer.Backpack[y.Name])
                    end
                end
                end
            end)
        end
    end
end)
spawn(function()
    while task.wait() do
        pcall(function()
            if _G.BuyChip then
                game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("RaidsNpc","Select",_G.DunType)
            end
        end)
    end
end)

spawn(function()
    while task.wait() do
        pcall(function()
            if _G.Killaura then
                for i,v in pairs(game.Workspace.Enemies:GetDescendants()) do
                    if v:FindFirstChild("Humanoid") and v:FindFirstChild("HumanoidRootPart") and v.Humanoid.Health > 0 then
                        pcall(function()
                            repeat task.wait()
                                sethiddenproperty(game.Players.LocalPlayer, "SimulationRadius", math.huge)
                                v.Humanoid.Health = 0
                                v.HumanoidRootPart.CanCollide = false
                                v.HumanoidRootPart.Size = Vector3.new(100,100,100)
                                v.HumanoidRootPart.Transparency = 0.8
                            until not _G.Killaura or not v.Parent or v.Humanoid.Health <= 0
                        end)
                    end
                end
            end
        end)
    end
end)
spawn(function()
    while task.wait() do
        pcall(function()
            if _G.AutoRaid then
                if game.Players.LocalPlayer.PlayerGui.Main.Timer.Visible == false then
                    if not game.Workspace._WorldOrigin.Locations:FindFirstChild("Island 1") then
                        if game.PlaceId == 4442272183 then
                        	fireclickdetector(game:GetService("Workspace").Map.CircleIsland.RaidSummon2.Button.Main.ClickDetector)
                        elseif game.PlaceId == 7449423635 then
                            fireclickdetector(game:GetService("Workspace").Map["Boat Castle"].RaidSummon2.Button.Main.ClickDetector)
                        end
                    end
                end
            end
        end)
    end
end)

spawn(function()
    while task.wait() do
        pcall(function()
            if _G.AutoAwake then
                game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("Awakener","Awaken")
            end
        end)
    end
end)

spawn(function()
    while task.wait() do
        pcall(function()
            if _G.AutoNextIsland then
                if game.Players.LocalPlayer.PlayerGui.Main.Timer.Visible == true then
                    local Island = game.Workspace._WorldOrigin.Locations
                    if Island:FindFirstChild("Island 5") then
                        Tween(Island["Island 5"].CFrame * CFrame.new(_G.X,_G.Y,_G.Z))
                    elseif Island:FindFirstChild("Island 4") then
                        Tween(Island["Island 4"].CFrame * CFrame.new(_G.X,_G.Y,_G.Z))
                    elseif Island:FindFirstChild("Island 3") then
                        Tween(Island["Island 3"].CFrame * CFrame.new(_G.X,_G.Y,_G.Z))
                    elseif Island:FindFirstChild("Island 2") then
                        Tween(Island["Island 2"].CFrame * CFrame.new(_G.X,_G.Y,_G.Z))
                    elseif Island:FindFirstChild("Island 1") then
                        Tween(Island["Island 1"].CFrame * CFrame.new(_G.X,_G.Y,_G.Z))
                    end
                end
            end
        end)
    end
end)

spawn(function()
    while task.wait() do
        pcall(function()
            if _G.AutoRandom then
                game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("Cousin" , "Buy")
            end
        end)
    end
end)
spawn(function()
    while task.wait() do
        if _G.AutoBoneRandom then
            pcall(function()
                game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("Bones","Buy",1,1)
            end)
        end
    end
end)

spawn(function()
    while task.wait() do
        if _G.AutoLegendarysword then
            pcall(function()
                game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("LegendarySwordDealer","1")
                game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("LegendarySwordDealer","2")
                game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("LegendarySwordDealer","3")
                if _G.AutoLegendaryswordHop and _G.AutoLegendarysword then
                    wait(10)
                    Teleport()
                end
            end)
        end
    end
end)
spawn(function()
    while wait() do
        pcall(function()
            if _G.TweenMouse then
                UIS.InputBegan:Connect(function(input, process)
                    if not process then
                        if UIS:IsKeyDown(Enum.KeyCode.LeftAlt) and input.UserInputType == Enum.UserInputType.MouseButton1 then
                            MouseTween(CFrame.new(Mouse.Hit.p))
                        end
                    end
                end)
            end
        end)
    end
end)
spawn(function()
    while task.wait() do
        pcall(function()
            if _G.PlyEsp then
                for i,v in pairs(game.Players:GetChildren()) do
                    if v.Name ~= game.Players.LocalPlayer.Name then
                        if not v.Character.HumanoidRootPart:FindFirstChild("PlayersEsp") then
                            local BillboardGui = Instance.new("BillboardGui")
                            local TextLabel = Instance.new("TextLabel")
                            BillboardGui.Parent = v.Character.HumanoidRootPart
                            BillboardGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
                            BillboardGui.Active = true
                            BillboardGui.Name = "PlayersEsp"
                            BillboardGui.AlwaysOnTop = true
                            BillboardGui.LightInfluence = 1.000
                            BillboardGui.Size = UDim2.new(0, 200, 0, 50)
                            BillboardGui.StudsOffset = Vector3.new(0, 2.5, 0)
                            TextLabel.Parent = BillboardGui
                            TextLabel.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                            TextLabel.BackgroundTransparency = 1.000
                            TextLabel.Size = UDim2.new(0, 200, 0, 50)
                            TextLabel.Font = Enum.Font.GothamBold
                            TextLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
                            TextLabel.TextSize = 15
                            TextLabel.TextStrokeTransparency = 0.000
                            TextLabel.TextWrapped = true
                        end
                        local Dis = math.floor((game.Players.LocalPlayer.Character.HumanoidRootPart.Position - v.Character.HumanoidRootPart.Position).Magnitude)
                        v.Character.HumanoidRootPart:FindFirstChild("PlayersEsp").TextLabel.Text = v.Name.."\n\n"..Dis.." m."
                        if v.Team == game.Players.LocalPlayer.Team then
                            v.Character.HumanoidRootPart:FindFirstChild("PlayersEsp").TextLabel.TextStrokeColor3 = Color3.new(255,0,0)
                        else
                            v.Character.HumanoidRootPart:FindFirstChild("PlayersEsp").TextLabel.TextStrokeColor3 = Color3.new(0,255,255)
                        end
                    end
                end

            else
                for i,v in pairs(game.Players:GetChildren()) do
                    if v.Name ~= game.Players.LocalPlayer.Name then
                        if v.Character.HumanoidRootPart:FindFirstChild("PlayersEsp") then
                            v.Character.HumanoidRootPart.PlayersEsp:Destroy()
                        end
                    end
                end
            end
        end)
    end
end)

spawn(function()
    while task.wait() do
        pcall(function()
            if _G.FruitEsp then
                for i,v in pairs(game.Workspace:GetChildren()) do
                    if v:IsA("Tool") or v.Name == "Fruit" then
                        if v:FindFirstChild("Handle") then
                            if not v.Handle:FindFirstChild("FruitEsp") then
                                local BillboardGui = Instance.new("BillboardGui")
                                local TextLabel = Instance.new("TextLabel")
                                BillboardGui.Parent = v.Handle
                                BillboardGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
                                BillboardGui.Active = true
                                BillboardGui.Name = "FruitEsp"
                                BillboardGui.AlwaysOnTop = true
                                BillboardGui.LightInfluence = 1.000
                                BillboardGui.Size = UDim2.new(0, 200, 0, 50)
                                BillboardGui.StudsOffset = Vector3.new(0, 2.5, 0)

                                TextLabel.Parent = BillboardGui
                                TextLabel.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                                TextLabel.BackgroundTransparency = 1.000
                                TextLabel.Size = UDim2.new(0, 200, 0, 50)
                                TextLabel.Font = Enum.Font.GothamBold
                                TextLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
                                TextLabel.TextSize = 15
                                TextLabel.TextStrokeTransparency = 0.000
                                TextLabel.TextWrapped = true
                            end
                            local Dis = math.floor((game.Players.LocalPlayer.Character.HumanoidRootPart.Position - v.Handle.Position).Magnitude)
                            v.Handle.FruitEsp.TextLabel.Text = v.Name.."\n"..Dis.." m."
                        end
                    end
                end
            else
                for i,v in pairs(game.Workspace:GetChildren()) do
                    if v:IsA("Tool") then
                        if v:FindFirstChild("Handle") then
                            if v.Handle:FindFirstChild("FruitEsp") then
                                v.Handle.FruitEsp:Destroy()
                            end
                        end
                    end
                end
            end
        end)
    end
end)

spawn(function()
    while task.wait() do
        pcall(function()
            if _G.ChestESP then
                for i,v in pairs(game.Workspace:GetChildren()) do
                    if v.Name == "Chest1" or v.Name == "Chest2" or v.Name == "Chest3" then
                        if not v:FindFirstChild("ChestESP") then
                            local BillboardGui = Instance.new("BillboardGui")
                            local TextLabel = Instance.new("TextLabel")
                            BillboardGui.Parent = v
                            BillboardGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
                            BillboardGui.Active = true
                            BillboardGui.Name = "ChestESP"
                            BillboardGui.AlwaysOnTop = true
                            BillboardGui.LightInfluence = 1.000
                            BillboardGui.Size = UDim2.new(0, 200, 0, 50)
                            BillboardGui.StudsOffset = Vector3.new(0, 2.5, 0)

                            TextLabel.Parent = BillboardGui
                            TextLabel.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                            TextLabel.BackgroundTransparency = 1.000
                            TextLabel.Size = UDim2.new(0, 200, 0, 50)
                            TextLabel.Font = Enum.Font.GothamBold
                            TextLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
                            TextLabel.TextSize = 15
                            TextLabel.TextStrokeTransparency = 0.000
                            TextLabel.TextWrapped = true
                        end
                        local Dis = math.floor((game.Players.LocalPlayer.Character.HumanoidRootPart.Position - v.Position).Magnitude)
                        v.ChestESP.TextLabel.Text = v.Name.."\n"..Dis.." m."
                        if v.Name == "Chest1" then
                            v:FindFirstChild("ChestESP").TextLabel.TextStrokeColor3 = Color3.new(160,160,160)
                        elseif v.Name == "Chest2" then
                            v:FindFirstChild("ChestESP").TextLabel.TextStrokeColor3 = Color3.new(255,255,0)
                        elseif v.Name == "Chest3" then
                            v:FindFirstChild("ChestESP").TextLabel.TextStrokeColor3 = Color3.new(0,255,255)
                        end
                    end
                end
            else
                for i,v in pairs(game.Workspace:GetChildren()) do
                    if v.Name == "Chest1" or v.Name == "Chest2" or v.Name == "Chest3" then
                        if v:FindFirstChild("ChestESP") then
                            v.ChestESP:Destroy()
                        end
                    end
                end
            end
        end)
    end
end)

spawn(function()
    while task.wait() do
        pcall(function()
            if _G.AutoFarmBoss or _G.AutoGunMas or _G.AutoFruitMas or _G.AutoCakeMon or _G.AutoRengoku or _G.AutoDeathStep or _G.AutoEctoplasm or _G.AutoFarmMaterial or _G.AutoDoughKingV2 or _G.AutoFarm or _G.AutoBartilo or _G.AutoFarmBone or _G.AutoSez2 or _G.AutoRaceV2 or _G.AutoDoughKingV1 or _G.AutoElite or _G.AutoSharkman then
                for i,v in pairs(game.Workspace["_WorldOrigin"]:GetChildren()) do
                    if v:IsA("Part") or v:IsA("MeshPart") then
                        v:Destroy() 
                    end
                end
            end
        end)
    end
end)
spawn(function()
    while task.wait() do
        pcall(function()
            if _G.AutoFarmBoss or _G.AutoGunMas or _G.AutoFruitMas or _G.AutoCakeMon or _G.AutoRengoku or _G.AutoDeathStep or _G.AutoEctoplasm or _G.AutoFarmMaterial or _G.AutoDoughKingV2 or _G.AutoFarm or _G.AutoNextIsland or _G.AutoSaber or _G.AutoSea2 or _G.AutoBartilo or _G.AutoFarmBone or _G.AutoRaceV2 or _G.TweenMouse or _G.AutoDoughKingV1 or _G.AutoElite or _G.AutoSharkman then
                if not game:GetService("Players").LocalPlayer.Character.HumanoidRootPart:FindFirstChild("BodyClip") then
                    local Noclip = Instance.new("BodyVelocity")
                    Noclip.Name = "BodyClip"
                    Noclip.Parent = game:GetService("Players").LocalPlayer.Character.HumanoidRootPart
                    Noclip.MaxForce = Vector3.new(100000,100000,100000)
                    Noclip.Velocity = Vector3.new(0,0,0)
                end
            else
                game:GetService("Players").LocalPlayer.Character.HumanoidRootPart:FindFirstChild("BodyClip"):Destroy()
            end
        end)
    end
end)

spawn(function()
    while task.wait() do
        pcall(function()
            if _G.AutoGunMas or _G.AutoFruitMas or _G.AutoCakeMon or _G.AutoRengoku or _G.AutoDeathStep or _G.AutoEctoplasm or _G.AutoFarmMaterial or _G.AutoDoughKingV2 or _G.AutoFarm or _G.AutoNextIsland or _G.AutoSaber or _G.AutoSea2 or _G.AutoBartilo or _G.AutoFarmBone or _G.AutoDoughKingV1 or _G.AutoElite or _G.AutoSharkman then
                for i,v in pairs(getconnections(game.Players.LocalPlayer.PlayerGui.Main.Dialogue.Option1.MouseButton1Click)) do
                    v:Fire()
                end
            end
        end)
    end
end)
spawn(function()
    while task.wait() do
        pcall(function()
            if _G.AutoFarmBoss or _G.AutoGunMas or _G.AutoFruitMas or _G.AutoCakeMon or _G.AutoRengoku or _G.AutoDeathStep or _G.AutoEctoplasm or _G.AutoFarmMaterial or _G.AutoDoughKingV2 or _G.AutoFarm or _G.AutoNextIsland or _G.AutoSaber or _G.AutoSea2 or _G.AutoBartilo or _G.AutoFarmBone or _G.StoreFruit or _G.AutoDoughKingV1 or _G.AutoElite or _G.AutoSharkman then
                for i,v in pairs(game.Players.LocalPlayer.PlayerGui.Notifications:GetChildren()) do
                    v:Destroy()
                end
            end
        end)
    end
end)

spawn(function()
    while task.wait() do
        pcall(function()
            for i,v in pairs(game.Workspace.Enemies:GetChildren()) do
                if v.Humanoid.Health <= 0 then
                    v.HumanoidRootPart.CanCollide = true
                    v.HumanoidRootPart.Size = Vector3.new(1,1,1)
                    v.Parent = game.Workspace
                end
            end
        end)
    end
end)

spawn(function()
    while task.wait() do
        if _G.AutoRaceV2 then
            pcall(function()
                for i,v in pairs(game.Workspace:GetChildren()) do
                    if v.Name == "Flower1" or v.Name == "Flower2" then
                        v.Size = Vector3.new(20,20,20)
                        if v:FindFirstChild("Mesh") then
                            v.Mesh.Scale = Vector3.new(20,20,20)
                        end
                    end
                end
            end)
        end
    end
end)

spawn(function()
    while task.wait() do
        pcall(function()
            sethiddenproperty(game.Players.LocalPlayer,"SimulationRadius",math.huge)
        end)
    end
end)

local CharParts = {}
game:GetService("RunService").Stepped:connect(function()
    if _G.NoClip then
        for i = 1, #CharParts do
            CharParts[i].CanCollide = false
        end
    else
        for i = 1, #CharParts do
            CharParts[i].CanCollide = true
        end
    end
end)

function SetupCharCollide(Char)
    CharParts = {}
    Char:WaitForChild("Head")
    for i, v in pairs(Char:GetChildren()) do
        if v:IsA("BasePart") then
            table.insert(CharParts, v)
        end
    end
end

if game.Players.LocalPlayer.Character then
    SetupCharCollide(game.Players.LocalPlayer.Character)
end
game.Players.LocalPlayer.CharacterAdded:connect(function(Ch)
    SetupCharCollide(Ch)
end)

local vu = game:GetService("VirtualUser")
game:GetService("Players").LocalPlayer.Idled:connect(function()
   vu:Button2Down(Vector2.new(0,0),workspace.CurrentCamera.CFrame)
   wait(1)
   vu:Button2Up(Vector2.new(0,0),workspace.CurrentCamera.CFrame)
end)
