// Weapon types, used to determine range.
WEAPON_NONE=0;
WEAPON_SMG=1;
WEAPON_RIFLE = 2;
WEAPON_SNIPER=3;
WEAPON_PISTOL=4;

// Quick hack to fix pickup bug.
local oldRegister = weapons.Register;
function weapons.Register(tab,class)
	if tab and tab.Primary and tab.Base and tab.Base == "weapon_jb_base" then
		tab.Primary.DefaultClip	= tab.Primary.ClipSize or 0;
		JB:DebugPrint("Registered JailBreak weapon: "..class);
	end
	return oldRegister(tab,class);
end