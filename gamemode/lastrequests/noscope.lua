local LR = JB.CLASS_LR();
LR:SetName("No-Scope Battle");
LR:SetDescription("The guard and the prisoner both get a sniper rifle, which they may use to kill each other. The catch: no aiming through the scope allowed.");
LR:SetStartCallback(function(prisoner,guard)
	for _,ply in ipairs{prisoner,guard} do
		ply:StripWeapons();
		ply:Give("weapon_jb_scout");
		ply:GiveAmmo(899,"SMG1");
		ply:SetHealth(100);
		ply:SetArmor(0);
	end
end)
LR:SetIcon(Material("icon16/flag_red.png"))
local this = LR();

hook.Add("PlayerBindPress", "JB.PlayerBindPress.LR.NoScopeBattle", function(pl, bind, pressed) // Not the safest way, but it requires the least amount of touching code outside of this file (without using nasty hacky methods)
	if JB.LastRequest == this and table.HasValue(JB.LastRequestPlayers,pl) and string.find( bind,"+attack2" ) then
		return true;
	end
end)