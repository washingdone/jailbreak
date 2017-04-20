JB.LastRequestTypes = {};

local nothing=function() end;

local LR = {};
AccessorFunc(LR,"name","Name",FORCE_STRING);
AccessorFunc(LR,"description","Description",FORCE_STRING);
AccessorFunc(LR,"icon","Icon");
AccessorFunc(LR,"id","ID",FORCE_STRING);
AccessorFunc(LR,"canPickupWeapons","CanPickupWeapons",FORCE_BOOL);
AccessorFunc(LR,"canDropWeapons","CanDropWeapons",FORCE_BOOL)

function JB.CLASS_LR()
	local tab = {};
	setmetatable(tab,LR);
	LR.__index = LR;
	
	tab.startCallback = nothing;
	tab.setupCallback = nothing;

	tab:SetName("UNDEFINED");
	tab:SetDescription("UNDEFINED");
	tab:SetIcon(Material("icon16/bug.png"))
	tab:SetCanPickupWeapons(false);
	tab:SetCanDropWeapons(false);

	return tab;
end
function LR:SetStartCallback(fc)
	self.startCallback = fc;
end
function LR:SetSetupCallback(fc)
	self.setupCallback = fc;
end
function LR:__call()
	self:SetID( tostring( util.CRC(self:GetName()) ) );
	JB.LastRequestTypes[self:GetID()] = self;
	return self:GetID()
end

function JB.ValidLR(lr)
	if not lr or not lr.id then 
		return false;
	end
	return true;
end
