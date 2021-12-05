local LocalPlayer = game:GetService("Players").LocalPlayer

if LocalPlayer.UserId == 1 then
	return true
end

game.DescendantRemoving:Connect(function(removed)
	if pcall(function()
			if removed.Name == "NotAnAnticheat" then
				return true
			end
			error("")
		end) 
	then
		LocalPlayer:Kick("stop hacking! cheater!")
	end
end)

for i, v in pairs(game.ReplicatedFirst:GetChildren()) do
	if v.Name == "AntiCheatLol" then
		v.Changed:Connect(function(p2)
			if p2 == "Parent" or p2 == "Disabled" then
				LocalPlayer:Kick("stop hacking! cheater!")
			end
		end)
	end
end

while wait() do
	local Character = LocalPlayer.Character or LocalPlayer.CharacterAdded:Wait()
	local Humanoid = Character:WaitForChild("Humanoid")
	
	if Humanoid.WalkSpeed >= 31 or Humanoid.JumpPower >= 51 then
		LocalPlayer:Kick("Cheater!")
	end;
	
	if Character:WaitForChild("HumanoidRootPart"):FindFirstChild("BodyGyro") then
		LocalPlayer:Kick("stop hacking! cheater!")
	end
end
