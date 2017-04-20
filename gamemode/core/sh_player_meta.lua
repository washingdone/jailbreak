local pmeta = FindMetaTable("Player");
function pmeta:CanPickupWeapon(entity)
	if #self:GetWeapons() > 0 then
		for k,v in pairs(self:GetWeapons()) do
			if v.Slot == entity.Slot or v:GetClass() == entity:GetClass() then
				return false
			end
		end
	end

	return true; 
end
function pmeta:GetWarden()
	return (JB:GetWarden() == self);
end
