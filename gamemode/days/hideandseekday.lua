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
Day:SetName("Hide And Seek");
Day:SetDescription("All prisoners hide from the guards. Guards wait in armory for prisoners to hide. After 30 seconds guards seek the prisoners. Last survivor gets LR.");
Day:SetStartCallback(function()
	JB:BroadcastNotification("Today is a Hide and Seek Day!");
	JB:BroadcastNotification("All must hide from the guards.");
	JB:BroadcastNotification("Warden must open cell doors by 9:00.");
	JB:BroadcastNotification("All prisoners are KOS 30 seconds after the cell doors open.");
	JB:BroadcastNotification("The last remaining prisoner gets LR!");
end)
Day:SetIcon(Material("icon16/flag_green.png"))
Day();
