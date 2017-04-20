TEAM_GUARD 		= 2;
TEAM_PRISONER 	= 1;
JB.Gamemode.CreateTeams = function()
	team.SetUp( TEAM_GUARD, "Guards", JB.Color["#0066FF"]	)
	team.SetUp( TEAM_PRISONER, "Prisoners", JB.Color["#E31100"] )

	team.SetSpawnPoint( TEAM_GUARD,"info_player_counterterrorist" );
	team.SetSpawnPoint( TEAM_PRISONER,"info_player_terrorist" );
	team.SetSpawnPoint( TEAM_SPECTATOR, "worldspawn" ) 
end

-- Utility functions
function JB:GetGuardsAllowed()
    if #team.GetPlayers(TEAM_GUARD) <= 0 then
        return 1;
    end
    return math.ceil((#team.GetPlayers(TEAM_GUARD) + #team.GetPlayers(TEAM_PRISONER)) * (tonumber(JB.Config.guardsAllowed)/100));
end

function JB:BalanceTeams()
	if ( #team.GetPlayers(TEAM_GUARD) + #team.GetPlayers(TEAM_PRISONER) ) <= 1 then return end

	local balls = {};
	
	if #team.GetPlayers(TEAM_GUARD) > JB:GetGuardsAllowed() then
		for i=1, (#team.GetPlayers(TEAM_GUARD) - JB:GetGuardsAllowed()) do
			local ply = table.Random(team.GetPlayers(TEAM_GUARD));
			if IsValid(ply) then
				ply:SetTeam(TEAM_PRISONER);
				ply:ChatPrint("You were moved to Prisoners to make the game more fair.");
				balls[#balls+1] = ply;
			end
		end
	end
	
	return balls;
end

local count;
function JB:AliveGuards()
	count=0;
	for _,v in pairs(team.GetPlayers(TEAM_GUARD))do
		if v:Alive() then
			count = count+1;
		end
	end
	return count;
end

function JB:AlivePrisoners()
	count=0;
	for _,v in pairs(team.GetPlayers(TEAM_PRISONER))do
		if v:Alive() then
			count = count+1;
		end
	end
	return count;
end

--Useless gooks
function GM:PlayerJoinTeam() return false end
function GM:PlayerRequestTeam() return false end