AddCSLuaFile()


	SWEP.PrintName			= "Mac 10"


SWEP.Slot				= 1
SWEP.SlotPos			= 1

SWEP.HoldType			= "pistol"
SWEP.Base				= "weapon_jb_base"
SWEP.Category			= "Jailbreak Weapons"

SWEP.Spawnable			= true
SWEP.AdminSpawnable		= true

SWEP.ViewModel				= "models/weapons/cstrike/c_smg_mac10.mdl"
SWEP.WorldModel				= "models/weapons/w_smg_mac10.mdl"

SWEP.Weight				= 5
SWEP.AutoSwitchTo		= true
SWEP.AutoSwitchFrom		= false

SWEP.Primary.Sound			= Sound( "Weapon_Mac10.Single" )
SWEP.Primary.Recoil			= 0.5
SWEP.Primary.Damage			= 19
SWEP.Primary.NumShots		= 1
SWEP.Primary.Cone			= 0.04
SWEP.Primary.ClipSize		= 30
SWEP.Primary.Delay			= 0.07
SWEP.Primary.DefaultClip	= 100
SWEP.Primary.Automatic		= true
SWEP.Primary.Ammo			= "smg1"
SWEP.FakeIronSights 		= true;

SWEP.Positions = {};
SWEP.Positions[1] = {pos = Vector(0,0,0), ang = Vector(0,0,0)};
SWEP.Positions[2] = {pos = Vector(-9.32, -5.749, 2.759 ), ang = Vector(1.2, -5.401, -8.601)};
SWEP.Positions[3] = {pos = Vector(-5.119, -14.724, -13.938), ang = Vector(70, -1.93, -8.544)};
