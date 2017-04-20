local pmeta = FindMetaTable("Player");

local uniqueid;
local getname = pmeta.Nick;
function pmeta:Nick()
	if tobool(JB.Config.prisonerNameChange) and LocalPlayer():Alive() and self:Alive() and self:Team() == TEAM_PRISONER then
		uniqueid = self:UniqueID();
		return (LocalPlayer():IsAdmin() and "["..getname(self).."] " or "Prisoner ")..(string.Right(uniqueid,string.len(uniqueid)/2));
	end
	
	return getname(self);
end