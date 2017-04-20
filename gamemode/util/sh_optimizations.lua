function JB.Util.memoize(f)
	local mem = {} 
	setmetatable(mem, {__mode = "kv"})
	return (function (x)
		local r = mem[x]
		if r == nil then
			r = f(x)
			mem[x] = r
		end
		return r
	end)
end
