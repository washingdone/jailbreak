function JB:CanDay()
	return IsValid(JB:GetWarden()) and JB.State == STATE_SETUP and not JB.ValidDay(JB.DayTypes[day]);
end


concommand.Add("jb_day_start",function(p,c,a)
	if not JB:CanDay() or not p:Team() == TEAM_GUARD or not p:Alive() or not a or not a[1] then return end
	
	local day = a[1];
	if not JB.ValidDay(JB.DayTypes[day]) then return end

	
	JB:DebugPrint("Setting up day ")
	JB.Day = {type=day};
end);