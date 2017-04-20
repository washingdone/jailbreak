local LR = JB.CLASS_LR();
LR:SetName("Knife Battle");
LR:SetDescription("The guard and the prisoner both get a knife, all other weapons are stripped, and they must fight eachother until one of the two dies");
LR:SetStartCallback(function(prisoner,guard)
	for _,ply in ipairs{prisoner,guard} do
		ply:StripWeapons();
		ply:Give("weapon_jb_knife");
		ply:Give("weapon_jb_fists");
		
		ply:SetHealth(100);
		ply:SetArmor(0);
	end
end)
LR:SetIcon(Material("icon16/flag_blue.png"))
LR();