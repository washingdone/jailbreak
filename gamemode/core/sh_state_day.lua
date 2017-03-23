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



JB.DayTypes = {};

local nothing=function() end;

local Day = {};
AccessorFunc(Day,"name","Name",FORCE_STRING);
AccessorFunc(Day,"description","Description",FORCE_STRING);
AccessorFunc(Day,"icon","Icon");
AccessorFunc(Day,"id","ID",FORCE_STRING);

function JB.CLASS_Day()
	local tab = {};
	setmetatable(tab,Day);
	Day.__index = Day;
	
	tab.startCallback = nothing;
	tab.setupCallback = nothing;

	tab:SetName("UNDEFINED");
	tab:SetDescription("UNDEFINED");
	tab:SetIcon(Material("icon16/bug.png"))

	return tab;
end
function Day:SetStartCallback(fc)
	self.startCallback = fc;
end
function Day:SetSetupCallback(fc)
	self.setupCallback = fc;
end
function Day:__call()
	self:SetID( tostring( util.CRC(self:GetName()) ) );
	JB.DayTypes[self:GetID()] = self;
	return self:GetID()
end

function JB.ValidDay(day)
	if not day or not day.id then 
		return false;
	end
	return true;
end
