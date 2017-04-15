-- ####################################################################################
-- ##                                                                                ##
-- ##                                                                                ##
-- ##     CASUAL BANANAS CONFIDENTIAL                                                ##
-- ##                                                                                ##
-- ##     __________________________                                                 ##
-- ##                                                                                ##
-- ##                                                                                ##
-- ##     Copyright 2014 (c) Casual Bananas                                          ##
-- ##     All Rights Reserved.                                                       ##
-- ##                                                                                ##
-- ##     NOTICE:  All information contained herein is, and remains                  ##
-- ##     the property of Casual Bananas. The intellectual and technical             ##
-- ##     concepts contained herein are proprietary to Casual Bananas and may be     ##
-- ##     covered by U.S. and Foreign Patents, patents in process, and are           ##
-- ##     protected by trade secret or copyright law.                                ##
-- ##     Dissemination of this information or reproduction of this material         ##
-- ##     is strictly forbidden unless prior written permission is obtained          ##
-- ##     from Casual Bananas                                                        ##
-- ##                                                                                ##
-- ##     _________________________                                                  ##
-- ##                                                                                ##
-- ##                                                                                ##
-- ##     Casual Bananas is registered with the "Kamer van Koophandel" (Dutch        ##
-- ##     chamber of commerce) in The Netherlands.                                   ##
-- ##                                                                                ##
-- ##     Company (KVK) number     : 59449837                                        ##
-- ##     Email                    : info@casualbananas.com                          ##
-- ##                                                                                ##
-- ##                                                                                ##
-- ####################################################################################


local Day = JB.CLASS_Day();
Day:SetName("Hunger Games");
Day:SetDescription("All prisoners get guns and attack each other. Guards may only attack a rebelling prisoner. Last survivor gets LR.");
Day:SetStartCallback(function()
	JB:BroadcastNotification("Today is a Hunger Games Day!");
	JB:BroadcastNotification("All prisoners are allowed to have weapons.");
	JB:BroadcastNotification("Prisoners must attack each other when friendly fire is turned on.");
	JB:BroadcastNotification("Cell doors will open automatically at 9:30.");
	JB:BroadcastNotification("Friendly fire will turn on at 9:00.");
	JB:BroadcastNotification("The last remaining prisoner gets LR!");
	timer.Simple(30,function()
		for k,v in ipairs(ents.FindByName("cells"))do
				v:Fire("Open",1)
		end
		timer.Simple(30,function()
			RunConsoleCommand("jb_warden_changecontrol","PVP",tostring(not (IsValid(JB.TRANSMITTER) and JB.TRANSMITTER:GetJBWarden_PVPDamage())))
		end)
	end)
end)
Day:SetIcon(Material("jailbreak_washingdone/days/hunger.png"))
Day();
