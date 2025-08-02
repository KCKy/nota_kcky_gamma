local sensorInfo = {
	name = "FindPaths",
	desc = "Find path on grid with given cost function",
	author = "KCKy",
	date = "2025-08-01",
	license = "MIT",
}

function getInfo() return { period = -1 } end


local function defaultCostFunction(from, to)
	local h = Spring.GetGroundHeight(to.x, to.z)
	local l = math.sqrt((from.x - to.x)^2 + (from.z - to.z)^2) / 50
	return l * (1 + math.max(0, h) / 50)
end

local function filter(table, predicate)
  local result = { }
  for _, x in pairs(table) do
      if predicate(x) then
          result[#result+1] = x
      end
  end
  return result
end

local function key(pos)
	return pos.x * 100000 + pos.z
end

local function inBounds(pos)
	return pos.x >= 0 and pos.z >= 0 and pos.x <= Game.mapSizeX and pos.z <= Game.mapSizeZ
end

return function (src, costFunction, grid)
	costFunction = costFunction or defaultCostFunction
	grid = grid or 1

	local function neighbors(pos)
		local x, z = pos.x, pos.z
		local options =
		{
			Vec3(x + grid, 0, z),
			Vec3(x - grid, 0, z),
			Vec3(x, 0, z + grid),
			Vec3(x, 0, z - grid),
			Vec3(x + grid, 0, z + grid),
			Vec3(x + grid, 0, z - grid),
			Vec3(x - grid, 0, z + grid),
			Vec3(x - grid, 0, z - grid),
		}
		return filter(options, inBounds)
	end

	local visited = { }
	local cameFrom = { }
	local cost = { }
	local queue = { }

	cost[key(src)] = 0
	queue[#queue+1] = src

	local v = 0

	while #queue > 0 do
		local current = table.remove(queue, 1)
		local currentKey = key(current)
		v = v + 1

		if not visited[currentKey] then
			for _, next in ipairs(neighbors(current)) do
				local nextKey = key(next)
				local newCost = cost[currentKey] + costFunction(current, next)
				if (cost[nextKey] == nil or newCost < cost[nextKey]) then
					visited[nextKey] = nil
					cost[nextKey] = newCost
					cameFrom[nextKey] = current
					queue[#queue+1] = next
				end
			end
			visited[currentKey] = true
		end
	end

	return cameFrom
end
