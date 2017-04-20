AddCSLuaFile()

	SWEP.PrintName			= "Galil"

SWEP.Slot				= 1
SWEP.SlotPos			= 1

SWEP.HoldType			= "ar2"
SWEP.Base				= "weapon_jb_base"
SWEP.Category			= "Jailbreak Weapons"

SWEP.Spawnable			= true
SWEP.AdminSpawnable		= true

SWEP.ViewModel				= "models/weapons/cstrike/c_rif_galil.mdl"
SWEP.WorldModel				= "models/weapons/w_rif_galil.mdl"

SWEP.Weight				= 5
SWEP.AutoSwitchTo		= true
SWEP.AutoSwitchFrom		= false

SWEP.Primary.Sound			= Sound( "Weapon_Galil.Single" )
SWEP.Primary.Recoil			= 0.5
SWEP.Primary.Damage			= 25
SWEP.Primary.NumShots		= 1
SWEP.Primary.Cone			= 0.03
SWEP.Primary.ClipSize		= 35
SWEP.Primary.Delay			= 0.1
SWEP.Primary.DefaultClip	= 90
SWEP.Primary.Automatic		= true
SWEP.Primary.Ammo			= "smg1"

SWEP.Positions = {};
SWEP.Positions[1] = {pos = Vector(0,0,0), ang = Vector(0,0,0)};
SWEP.Positions[2] = {pos = Vector(-6.361, -12.801, 2.519), ang = Vector(0,0,0)};
SWEP.Positions[3] = {pos = Vector(6.534, -6, 0.708), ang = Vector(0,70,0)};
