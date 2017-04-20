local Day = JB.CLASS_Day();
Day:SetName("Hide And Seek");
Day:SetDescription("All prisoners hide from the guards. Guards wait in armory for prisoners to hide. After 30 seconds guards seek the prisoners. Last survivor gets LR.");
Day:SetStartCallback(function()
	JB:BroadcastNotification("Today is a Hide and Seek Day!");
	JB:BroadcastNotification("All must hide from the guards.");
	JB:BroadcastNotification("All guards must wait in the armory until 9:00.");
	JB:BroadcastNotification("Cell doors will open automatically at 9:30.");
	JB:BroadcastNotification("The last remaining prisoner gets LR!");
	timer.Simple(30,function()
		for k,v in ipairs(ents.FindByName("cells"))do
				v:Fire("Open",1)
		end
		timer.Simple(30,function()
			JB:BroadcastNotification("All guards may now hunt for the prisoners!");
		end)
	end)
end)
Day:SetIcon(Material("jailbreak_washingdone/days/hide.png"))
Day();
