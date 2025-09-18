local TweenService = game:GetService("TweenService")
local Player = game.Players.LocalPlayer
local Character = Player.Character or Player.CharacterAdded:Wait()
local HRP = Character:WaitForChild("HumanoidRootPart")
local Humanoid = Character:WaitForChild("Humanoid")

--location
local VOLCANO = CFrame.new(-585.8717651367188, 59.000057220458984, 104.78071594238281) --หันหน้าไป -603.309326171875, 59.000057220458984, 110.06294250488281
--Vector3
local VOLCANO_VEC3 = Vector3.new(-602.9340209960938, 59.000057220458984, 108.59332275390625) --หันหน้าไป -603.309326171875, 59.000057220458984, 110.06294250488281

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

function VolcanoFarm()
    wait(3)
    TP(VOLCANO)
    wait(2)
    --stop auto fish
    autofish(false)
    wait(1)
    -- pick up rod
    unpickuprod()
    wait(1)

    local targetPos = VOLCANO_VEC3  -- จุดที่ไป
    local lookAtPos = Vector3.new(-603.309326171875, 59.000057220458984, 110.06294250488281) -- จุดที่หันหน้า
    local tweenInfo = TweenInfo.new(3, Enum.EasingStyle.Linear, Enum.EasingDirection.Out)
    local goal = {CFrame = CFrame.new(targetPos, lookAtPos)}
    local tween = TweenService:Create(HRP, tweenInfo, goal)
    tween:Play()

    wait(3)
    -- pick up rod
    pickitem(1)
    wait(1)
    --start autofish
    autofish(true)

end

VolcanoFarm()