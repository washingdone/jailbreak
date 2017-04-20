AddCSLuaFile()

SWEP.PrintName			= "M4A1"

SWEP.Slot				= 1
SWEP.SlotPos			= 1

SWEP.HoldType			= "ar2"
SWEP.Base				= "weapon_jb_base"
SWEP.Category			= "Jailbreak Weapons"

SWEP.Spawnable			= true
SWEP.AdminSpawnable		= true

SWEP.ViewModel			= "models/weapons/cstrike/c_rif_m4a1.mdl"
SWEP.WorldModel			= "models/weapons/w_rif_m4a1.mdl"

SWEP.Weight				= 3
SWEP.AutoSwitchTo		= true
SWEP.AutoSwitchFrom		= false

SWEP.Primary.Sound			= Sound("Weapon_M4A1.Single")
SWEP.Primary.Recoil			= 1
SWEP.Primary.Damage			= 30
SWEP.Primary.NumShots		= 1
SWEP.Primary.Cone			= 0.02
SWEP.Primary.ClipSize		= 30
SWEP.Primary.Delay			= 0.15
SWEP.Primary.DefaultClip	= 60
SWEP.Primary.Automatic		= true
SWEP.Primary.ShootConeAdd	= 0.0065;
SWEP.Primary.Ammo			= "smg1"

SWEP.FakeIronSights = true;

SWEP.Positions = {};
SWEP.Positions[1] = {pos = Vector(0,0,0), ang = Vector(0,0,0)};
SWEP.Positions[2] = {pos = Vector(-7.881, -1.181, 0.239), ang = Vector(2.799, -1.4, -4.6)};
SWEP.Positions[3] = {pos = Vector(6.534, -9, 0.708), ang = Vector(0,70,0)};
