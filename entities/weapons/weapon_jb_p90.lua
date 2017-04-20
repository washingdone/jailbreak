AddCSLuaFile()


	SWEP.PrintName			= "P90"


SWEP.Slot				= 1
SWEP.SlotPos			= 1

SWEP.HoldType			= "ar2"
SWEP.Base				= "weapon_jb_base"
SWEP.Category			= "Jailbreak Weapons"

SWEP.Spawnable			= true
SWEP.AdminSpawnable		= true

SWEP.ViewModel				= "models/weapons/cstrike/c_smg_p90.mdl"
SWEP.WorldModel				= "models/weapons/w_smg_p90.mdl"

SWEP.Weight				= 5
SWEP.AutoSwitchTo		= true
SWEP.AutoSwitchFrom		= false

SWEP.Primary.Sound			= Sound( "Weapon_p90.Single" )
SWEP.Primary.Recoil			= 0.6
SWEP.Primary.Damage			= 15
SWEP.Primary.NumShots		= 1
SWEP.Primary.Cone			= 0.018
SWEP.Primary.ClipSize		= 50
SWEP.Primary.Delay			= 0.07
SWEP.Primary.DefaultClip	= 100
SWEP.Primary.Automatic		= true
SWEP.Primary.Ammo			= "smg1"

SWEP.FakeIronSights			= true;

SWEP.Positions = {};
SWEP.Positions[1] = {pos = Vector(0,0,0), ang = Vector(0,0,0)};
SWEP.Positions[2] = {pos = Vector(-5.72, -5.434, 1.84), ang = Vector(0,0,0)};
SWEP.Positions[3] = {pos = Vector(7.953, -12.992, -0.394), ang = Vector(0,70,0)};
