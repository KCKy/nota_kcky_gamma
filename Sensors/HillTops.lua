local sensorInfo = {
	name = "HillTops",
	desc = "Aproximate hill tops position on the map",
	author = "KCKy",
	date = "2025-04-22",
	license = "MIT",
}

function getInfo() return { period = -1 } end

return function(step, threshold, peak_error)
	local width = Game.mapSizeX
	local height = Game.mapSizeZ

	local collectedPoints = {}

	for x = 0, width, step do
		for z = 0, height, step do
			local point = Vec3(x, Spring.GetGroundHeight(x, z), z)
			if point.y >= threshold then
				table.insert(collectedPoints, point)
			end
		end
	end

	local clusters = { }
	local weights = { }

	for _, pos in ipairs(collectedPoints) do
		local success = true
		for i, hilltop in ipairs(clusters) do
			local middle = (pos + hilltop) / 2
			if Spring.GetGroundHeight(middle.x, middle.z) >= threshold - peak_error then
				clusters[i] = (hilltop * weights[i] + pos) / (weights[i] + 1)
				weights[i] = weights[i] + 1
				success = false
				break
			end
		end
		if success then
			table.insert(clusters, pos)
			table.insert(weights, 1)
		end
	end

	return clusters
end
