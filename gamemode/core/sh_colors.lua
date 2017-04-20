JB.Color = {};

-- just a stupid conveinience function for adding new colors on the fly.
setmetatable(JB.Color,{
	__index = function(tbl,key)
		if type(key) == "string" and string.Left(key,1) == "#" and (string.len(key) == 4 or string.len(key) == 7) then
			local hex = key:gsub("#","");
			if string.len(hex) == 3 then
				local real = "";
				for i=1,3 do
					real=real..hex[i]..hex[i];
				end
				hex=real;
			end
			
			local rgb=Color(tonumber("0x"..hex:sub(1,2)), tonumber("0x"..hex:sub(3,4)), tonumber("0x"..hex:sub(5,6)));
			tbl[key] = rgb; -- cache result
			return rgb;
		end
		
		return Color(255,255,0,200);
	end
});

JB.Color.black = Color(0,0,0);
JB.Color.white = Color(255,255,255);