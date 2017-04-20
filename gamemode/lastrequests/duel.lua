local RandomLoadouts = {};
RandomLoadouts[1] = {
	primary="weapon_jb_ak47",
	secondary="weapon_jb_glock"
};
RandomLoadouts[2] = {
	primary="weapon_jb_scout",
	secondary="weapon_jb_deagle"
};


local LR = JB.CLASS_LR();
LR:SetName("Duel");
LR:SetDescription("Both the prisoner and guard are given the same random loadout and full ammo. They may fight without interruption of other guards.");
LR:SetStartCallback(function(prisoner,guard)

	local randomSelect = RandomLoadouts[math.random(1,#RandomLoadouts)];
	
	JB.Util.iterate{prisoner,guard}:GiveAmmo(1000,"SMG1"):GiveAmmo(1000,"pistol"):Give(randomSelect.primary):Give(randomSelect.secondary):Give("weapon_jb_fists");

end)
LR:SetIcon(Material("icon16/bomb.png"))
LR();