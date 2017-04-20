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
