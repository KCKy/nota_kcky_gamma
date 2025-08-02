local sensorInfo = {
	name = "GetPath",
	desc = "Get path from the precomputed grid",
	author = "KCKy",
	date = "2025-08-01",
	license = "MIT",
}

function getInfo() return { period = -1 } end

local function key(pos)
	return pos.x * 100000 + pos.z
end

local function floorv(v)
	return Vec3(math.floor(v.x), math.floor(v.y), math.floor(v.z))
end

return function (paths, src, trgt, grid)
	local path = { }
	local current = src + floorv((trgt - src) / grid) * grid
	current.y = 0
	while current do
		table.insert(path, 1, current)
		current = paths[key(current)]
	end
	path[#path+1] = trgt
	return path
end
