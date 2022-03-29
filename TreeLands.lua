local library = loadstring(game:HttpGet("https://raw.githubusercontent.com/preztel/AzureLibrary/master/uilib.lua", true))()

local fruitslist = {
    "Apple",
    "Banana",
    "Durian",
    "Green Apple",
    "Candy Cane",
    "Large Banana",
    "Horned Melon",
    "Kumquat",
    "Lemon",
    "Mango",
    "Orange",
    "Papaya",
    "Dragonfruit",
    "Pear",
    "Pineapple", -- richhhh
    "Plum",
    "Pomelo",
    "Potato",
    "Watermelon",
    "Purple Crystal"
}

----------------

local changeAllTab = library:CreateTab("Change all")
changeAllTab:CreateDropDown("Fruit you want", fruitslist, function(fruit)
    _G.changeAllSelectedFruit = fruit
end)
changeAllTab:CreateToggle("Change fruits", function(bool)
    _G.changeAllBool = bool
end)
workspace.Fruits.ChildAdded:connect(function(newfruit)
    local fruitTo = _G.changeAllSelectedFruit
    local on = _G.changeAllBool
    
    if on then
        newfruit.Name = fruitTo
        newfruit.Tooltip.Value = fruitTo
    end
end)

----------------

local duplicateSpecificTab = library:CreateTab("Duplicate specific")
duplicateSpecificTab:CreateDropDown("Fruit to duplicate", fruitslist, function(fruit)
    _G.duplicateSpecificSelectedFruit = fruit
end)
duplicateSpecificTab:CreateButton("Duplicate selected", function()
    local fruits = workspace.Fruits:Clone():getChildren()
    local fruit = _G.duplicateSpecificSelectedFruit

    for I,V in pairs(fruits) do
        if V.Name == fruit then
            fruits[I].Parent = workspace.Fruits
        end 
    end
end)

-------

local miscTab = library:CreateTab("Misc")
miscTab:CreateButton("Clear fruits", function() -- clears all dropped fruits
    local fruits = workspace.Fruits:getChildren()
    for I,V in pairs(fruits) do
        V:Destroy()
    end
end)
miscTab:CreateButton("inf pineapple", function() -- clears all dropped fruits
    local fruits = workspace.Fruits.Pineapple
    
    fruits.Pineapple.CombinedValue.Value = 9999999999
end)
miscTab:CreateButton("Get ALL (experimental)", function() -- clears all dropped fruits
    local fruits = workspace.Fruits.Pineapple
    
    local bv = game:GetService("ReplicatedStorage").Events.Server.BuyVehicle

    bv:InvokeServer(1,1)
    bv:InvokeServer(2,1)
    bv:InvokeServer(3,1)
    bv:InvokeServer(4,1)
    bv:InvokeServer(5,1)
    bv:InvokeServer(6,1)
    bv:InvokeServer(7,1)
    bv:InvokeServer(8,1)
    bv:InvokeServer(9,1)
    bv:InvokeServer(10,1)
    bv:InvokeServer(11,1)
    bv:InvokeServer(12,1)
    bv:InvokeServer(13,1)
    bv:InvokeServer(14,1)
end)
miscTab:CreateButton("Collect gold", function()
    game.ReplicatedStorage.Events.Server.Collect:FireServer()
end)
