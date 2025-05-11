local sensorInfo = {
	name = "Wind",
	desc = "",
	author = "KCKy",
	date = "2025-04-22",
	license = "MIT",
}

function getInfo() return { period = -1 } end

return function()
	local x, _, z = Spring.GetWind()
	return Vec3(x, 0, z)
end
