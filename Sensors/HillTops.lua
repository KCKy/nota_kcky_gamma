local sensorInfo = {
	name = "HillTops",
	desc = "Aproximate hill tops position on the map",
	author = "KCKy",
	date = "2025-04-22",
	license = "MIT",
}

function getInfo() return { period = -1 } end

return function(step)
	local width = Game.mapSizeX / Game.squareSize
	local height = Game.mapSizeZ / Game.squareSize

	local collectedPoints = {}

	for x = 0, width, step do
		for y = 0, height, step do
			table.insert(collectedPoints, {x=x, y=y})
		end
	end

	return collectedPoints
end
