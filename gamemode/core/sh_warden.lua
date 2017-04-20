function JB:GetWarden()
	if not IsValid(JB.TRANSMITTER) then return NULL; end

	local warden=JB.TRANSMITTER:GetJBWarden()
	if IsValid(warden)
	and warden:Team() == TEAM_GUARD
	and warden:Alive() then
		return warden;
	end

	return NULL;
end
