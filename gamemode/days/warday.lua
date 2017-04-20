local Day = JB.CLASS_Day();
Day:SetName("War");
Day:SetDescription("All prisoners get guns and attack guards. Guards are allowed to fight back. No LR is given this day.");
Day:SetStartCallback(function()
	JB:BroadcastNotification("Today is a War Day!");
	JB:BroadcastNotification("All prisoners are allowed to have weapons.");
	JB:BroadcastNotification("Cell doors will open automatically at 9:30.");
	JB:BroadcastNotification("All prisoners are KOS at 9:00.");
	timer.Simple(30,function()
		for k,v in ipairs(ents.FindByName("cells"))do
				v:Fire("Open",1)
		end
		timer.Simple(30,function()
			JB:BroadcastNotification("All prisoners are now KOS!");
		end)
	end)
end)
Day:SetIcon(Material("jailbreak_washingdone/days/war.png"))
Day();
