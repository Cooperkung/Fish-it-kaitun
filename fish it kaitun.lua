local TweenService = game:GetService("TweenService")
local Player = game.Players.LocalPlayer
local Character = Player.Character or Player.CharacterAdded:Wait()
local HRP = Character:WaitForChild("HumanoidRootPart")
local Humanoid = Character:WaitForChild("Humanoid")

--location
local BAY = CFrame.new(94.43900299072266, 17.03352165222168, 2833.9794921875)
local ENCHANT = CFrame.new(3239.666015625, -1301.03564453125, 1397.5712890625)
local TREASUREROOM = CFrame.new(-3539.29931640625, -266.3741455078125, -1635.249755859375)
local SISYPHUS = CFrame.new(-3674.867431640625, -135.0744171142578, -996.6951293945312) --หันหน้าไป -3676.949951171875, -135.0744171142578, -994.6493530273438
local VOLCANO = CFrame.new(-602.9340209960938, 59.000057220458984, 108.59332275390625) --หันหน้าไป -603.309326171875, 59.000057220458984, 110.06294250488281
--Vector3
local BAY_VEC3 = CFrame.new(94.43900299072266, 17.03352165222168, 2833.9794921875)
local ENCHANT_VEC3 = Vector3.new(3239.666015625, -1301.03564453125, 1397.5712890625)
local TREASUREROOM_VEC3 = Vector3.new(-3539.29931640625, -266.3741455078125, -1635.249755859375)
local SISYPHUS_VEC3 = Vector3.new(-3674.867431640625, -135.0744171142578, -996.6951293945312) --หันหน้าไป -3676.949951171875, -135.0744171142578, -994.6493530273438
local VOLCANO_VEC3 = Vector3.new(-602.9340209960938, 59.000057220458984, 108.59332275390625) --หันหน้าไป -603.309326171875, 59.000057220458984, 110.06294250488281

wait(5)

function TP(pos)
    HRP.CFrame = pos
end

function unpickuprod()
    game:GetService("ReplicatedStorage"):WaitForChild("Packages"):WaitForChild("_Index"):WaitForChild("sleitnick_net@0.2.0"):WaitForChild("net"):WaitForChild("RE/EquipToolFromHotbar"):FireServer()
end

function pickitem(v)
    game:GetService("ReplicatedStorage"):WaitForChild("Packages"):WaitForChild("_Index"):WaitForChild("sleitnick_net@0.2.0"):WaitForChild("net"):WaitForChild("RE/EquipToolFromHotbar"):FireServer(v)
end

function autofish(v)
    game:GetService("ReplicatedStorage"):WaitForChild("Packages"):WaitForChild("_Index"):WaitForChild("sleitnick_net@0.2.0"):WaitForChild("net"):WaitForChild("RF/UpdateAutoFishingState"):InvokeServer(v)
end

function IsleFarm()
    --stop auto fish
    autofish(false)
    wait(1)
    -- cancel pick up rod
    unpickuprod()
    wait(1)

    local targetPos = SISYPHUS_VEC3  -- จุดที่ไป
    local lookAtPos = Vector3.new(-3676.949951171875, -135.0744171142578, -994.6493530273438) -- จุดที่หันหน้า
    local tweenInfo = TweenInfo.new(5, Enum.EasingStyle.Linear, Enum.EasingDirection.Out)
    local goal = {CFrame = CFrame.new(targetPos, lookAtPos)}
    local tween = TweenService:Create(HRP, tweenInfo, goal)
    tween:Play()

    wait(10)
    -- pick up rod
    pickitem(1)
    wait(1)
    --start autofish
    autofish(true)

end

IsleFarm()
