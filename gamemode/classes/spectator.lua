DEFINE_BASECLASS( "player_default" )

local PLAYER = {} 
PLAYER.DisplayName			= "Spectator"
PLAYER.WalkSpeed 			= 260
PLAYER.RunSpeed				= 260
PLAYER.DuckSpeed			= 1

player_manager.RegisterClass( "player_spectator", PLAYER, "player_default" )
