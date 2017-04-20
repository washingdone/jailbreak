local Day = JB.CLASS_Day();
Day:SetName("Siege");
Day:SetDescription("All prisoners get guns and attack guards. Guards camp in room designated by warden. Guards that leave the room are slayable. No LR is given this day.");
Day:SetStartCallback(function()
	JB:BroadcastNotification("Today is a Siege Day!");
	JB:BroadcastNotification("The warden must place a waypoint to designate the siege room.");
	JB:BroadcastNotification("All guards must stay in the room that the warden has desiganted.");
	JB:BroadcastNotification("All prisoners must attack the siege room.");
	JB:BroadcastNotification("Cell doors will open automatically at 9:15.");
	JB:BroadcastNotification("All prisoners are KOS as soon as the cell doors open.");
	timer.Simple(45,function()
		for k,v in ipairs(ents.FindByName("cells"))do
				v:Fire("Open",1)
		end
	end)
end)
Day:SetIcon(Material("jailbreak_washingdone/days/siege.png"))
Day();
