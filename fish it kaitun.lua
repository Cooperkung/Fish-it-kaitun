local TweenService = game:GetService("TweenService")
local Player = game.Players.LocalPlayer
local Character = Player.Character or Player.CharacterAdded:Wait()
local HRP = Character:WaitForChild("HumanoidRootPart")
local Humanoid = Character:WaitForChild("Humanoid")

function antiafk()
        --loop anti afk
    while true do
        wait(5) -- รอ 5 นาที (300 วินาที)
        
        -- กระโดด 1 ครั้ง
        if Humanoid then
            Humanoid.Jump = true
        end
    end
end


function instantfishing()
        --loop fish
    while true do
        game:GetService("ReplicatedStorage"):WaitForChild("Packages"):WaitForChild("_Index"):WaitForChild("sleitnick_net@0.2.0"):WaitForChild("net"):WaitForChild("RE/FishingCompleted"):FireServer()
        wait(0.1)
    end
end


function buyrod()
    while true do
        --Demascus Rod 3k coins
        local args = {
        77
        }
        game:GetService("ReplicatedStorage"):WaitForChild("Packages"):WaitForChild("_Index"):WaitForChild("sleitnick_net@0.2.0"):WaitForChild("net"):WaitForChild("RF/PurchaseFishingRod"):InvokeServer(unpack(args))
        wait(0.1)

        --lucky Rod
        local args = {
	    4
        }
        game:GetService("ReplicatedStorage"):WaitForChild("Packages"):WaitForChild("_Index"):WaitForChild("sleitnick_net@0.2.0"):WaitForChild("net"):WaitForChild("RF/PurchaseFishingRod"):InvokeServer(unpack(args))
        wait(0.1)
        --steampunk Rod 250k coins
        local args = {
        6
        }
        game:GetService("ReplicatedStorage"):WaitForChild("Packages"):WaitForChild("_Index"):WaitForChild("sleitnick_net@0.2.0"):WaitForChild("net"):WaitForChild("RF/PurchaseFishingRod"):InvokeServer(unpack(args))
        wait(0.1)

        --Astral Rod 1m coins

        wait(0.1)

        --Ares Rod 3m coins
        local args = {
        126
        }
        game:GetService("ReplicatedStorage"):WaitForChild("Packages"):WaitForChild("_Index"):WaitForChild("sleitnick_net@0.2.0"):WaitForChild("net"):WaitForChild("RF/PurchaseFishingRod"):InvokeServer(unpack(args))
        wait(1)
    end
end

function buybobber()
    while true do
        --nature bait 83.5k
        local args = {
	    17
        }
        game:GetService("ReplicatedStorage"):WaitForChild("Packages"):WaitForChild("_Index"):WaitForChild("sleitnick_net@0.2.0"):WaitForChild("net"):WaitForChild("RF/PurchaseBait"):InvokeServer(unpack(args))
        wait(0.1)
        --Chroma Bait 290k
        local args = {
	    6
        }
        game:GetService("ReplicatedStorage"):WaitForChild("Packages"):WaitForChild("_Index"):WaitForChild("sleitnick_net@0.2.0"):WaitForChild("net"):WaitForChild("RF/PurchaseBait"):InvokeServer(unpack(args))

        wait(1)
    end
end


function Starter()
        -- stop auto fish
    local args = {
        false
    }
    game:GetService("ReplicatedStorage"):WaitForChild("Packages"):WaitForChild("_Index"):WaitForChild("sleitnick_net@0.2.0"):WaitForChild("net"):WaitForChild("RF/UpdateAutoFishingState"):InvokeServer(unpack(args))

    wait(1)
    -- pick up rod
    local args = {
        1
    }
    game:GetService("ReplicatedStorage"):WaitForChild("Packages"):WaitForChild("_Index"):WaitForChild("sleitnick_net@0.2.0"):WaitForChild("net"):WaitForChild("RE/EquipToolFromHotbar"):FireServer(unpack(args))

    wait(1)
    -- teleport
    local sisyphus = CFrame.new(-3693.771728515625, -135.5744171142578, -1040.6446533203125)
    local treasure = CFrame.new(-3539.29931640625, -266.3741455078125, -1635.249755859375)

    function TP(Pos)
        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = Pos
    end

    TP(sisyphus)


    wait(5)
    -- tween and fish
    local targetPos = Vector3.new(-3674.867431640625, -135.0744171142578, -996.6951293945312)  -- จุดที่ไป
    local lookAtPos = Vector3.new(-3676.949951171875, -135.0744171142578, -994.6493530273438)      -- จุดที่หันหน้า
    local tweenInfo = TweenInfo.new(2, Enum.EasingStyle.Linear, Enum.EasingDirection.Out)

    -- ใช้ CFrame.new(pos, lookAt) ให้ไปและหันหน้า
    local goal = {CFrame = CFrame.new(targetPos, lookAtPos)}

    local tween = TweenService:Create(HRP, tweenInfo, goal)
    tween:Play()

    wait(4)

    local args = {
        true
    }
    game:GetService("ReplicatedStorage"):WaitForChild("Packages"):WaitForChild("_Index"):WaitForChild("sleitnick_net@0.2.0"):WaitForChild("net"):WaitForChild("RF/UpdateAutoFishingState"):InvokeServer(unpack(args))

end

antiafk()
instantfishing()
buyrod()
buybobber()
Starter()

