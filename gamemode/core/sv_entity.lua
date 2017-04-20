hook.Add("OnEntityCreated","JB.OnEntityCreated.InvalidateDefaultWeapons",function(e)
	if string.lower(string.Left(e:GetClass(),6)) == "weapon" or e:IsWeapon() then
		e.IsDropped = true;
		e.BeingPickedUp = false;
		timer.Simple(0,function()
			if not IsValid(e) then return end
			e.IsDropped = true;
			e.BeingPickedUp = false;

			local phys = e:GetPhysicsObject();
			if phys and IsValid(phys) then
				phys:EnableGravity(true);
				phys:EnableMotion(true);
				phys:Wake();
			end
		end)
	end
end)