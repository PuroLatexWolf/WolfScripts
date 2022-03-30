local me = game.Players.LocalPlayer

local main = game.Lighting
--folders
local wps = main:WaitForChild("Weapons")
local arm = main:WaitForChild("Armor")
local sls = main:WaitForChild("SOULs")
--events
local Buy = game.Lighting:WaitForChild("Buy")

local function Check()
  if Buy == nil or wps == nil then
    print("Buy event not found")
  else
    return true
  end
end

function GetWeapons()
    for i,v in pairs(wps:GetChildren()) do
        Buy:FireServer(v, "Weapon")
    end
end

function GetArmor()
    for i,v in pairs(arm:GetChildren()) do
        Buy:FireServer(v, "Armor")
    end
end

function GetSouls()
    for i,v in pairs(sls:GetChildren()) do
        Buy:FireServer(v, "Soul")
    end
end

if Check() == true then
    print("all is ok, working.")

    GetWeapons()
    GetArmor()
    GetSouls()
end
