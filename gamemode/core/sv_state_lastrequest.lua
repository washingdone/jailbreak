function JB:CanLastRequest()
	return JB:AliveGuards() >= 1 and JB:AlivePrisoners() == 1 and (JB.State == STATE_PLAYING or JB.State == STATE_DAY or (JB.State == STATE_LASTREQUEST and not JB.ValidLR(JB.LastRequestTypes[JB.LastRequest])) or JB.State == STATE_SETUP);
end


concommand.Add("jb_lastrequest_start",function(p,c,a)
	if not JB:CanLastRequest() or not p:Team() == TEAM_PRISONER or not p:Alive() or not a or not a[1] or not a[2] then return end
	
	local lr = a[1];
	if not JB.ValidLR(JB.LastRequestTypes[lr]) then return end

	local guard = Entity(tonumber(a[2]));
	if not IsValid(guard) or not guard.IsPlayer or not guard:IsPlayer() or not guard:Team() == TEAM_GUARD or not guard:Alive() then return end
	
	JB:DebugPrint("Setting up LR for ",p:Nick())
	JB.LastRequest = {type=lr,guard=guard,prisoner=p};
end);