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
Day:SetName("Siege");
Day:SetDescription("All prisoners get guns and attack guards. Guards camp in room designated by warden. Guards that leave the room are slayable. No LR is given this day.");
Day:SetStartCallback(function()
	JB:BroadcastNotification("Today is a Siege Day!");
	JB:BroadcastNotification("The warden must place a waypoint to designate the siege room");
	JB:BroadcastNotification("All guards must stay in the room that the warden has desiganted");
	JB:BroadcastNotification("All prisoners must attack the siege room");
	JB:BroadcastNotification("Warden must open cell doors by 9:00.");
	JB:BroadcastNotification("All prisoners are KOS as soon as the cell doors open.");
end)
Day:SetIcon(Material("icon16/flag_green.png"))
Day();
