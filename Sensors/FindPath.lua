local sensorInfo = {
	name = "FindPath",
	desc = "Find path on grid with given cost function",
	author = "KCKy",
	date = "2025-08-01",
	license = "MIT",
}

function getInfo() return { period = -1 } end

local function getPos(position)
	return Vec3(position.x, Spring.GetGroundHeight(position.x, position.z), position.z)
end

local function defaultCostFunction(from, to)
	from = getPos(from)
	to = getPos(to)
	local diff = to - from

	-- We percieve the terrain as extremely tall when going up to disincentivize climbing
	if diff.y > 0 then
		diff.y = diff.y * 1000000
	end

	return diff:Length()
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
	return pos.x .. "," .. pos.z
end

local function enqueue(queue, pos, cost)
	queue[#queue+1] = { pos = pos, cost = cost }
	filter(queue, function(a) return a.pos.x ~= pos.x or a.pos.z ~= pos.z end)
end

local function dequeue(queue)
	table.sort(queue, function(a, b) return a.cost > b.cost end)
	local value = queue[#queue]
	queue[#queue] = nil
	return value.pos
end

local function floorv(v)
	return Vec3(math.floor(v.x), math.floor(v.y), math.floor(v.z))
end

local function inBounds(pos)
	return pos.x >= 0 and pos.z >= 0 and pos.x <= Game.mapSizeX and pos.z <= Game.mapSizeZ
end

return function (src, trgt, costFunction, grid)
	src = floorv(src)
	trgt = floorv(trgt)
	costFunction = costFunction or defaultCostFunction
	grid = grid or 1

	local function is_close(a, b)
		return math.abs(a.x - b.x) < grid and math.abs(a.z - b.z) < grid
	end

	local function neighbors(pos)
		local x, z = pos.x, pos.z
		local options =
		{
			{x = x + grid, z = z},
			{x = x - grid, z = z},
			{x = x, z = z + grid},
			{x = x, z = z - grid},
			{x = x + grid, z = z + grid},
			{x = x + grid, z = z - grid},
			{x = x - grid, z = z + grid},
			{x = x - grid, z = z - grid}
		}
		return filter(options, inBounds)
	end

	local visited = { }
	local cameFrom = { }
	local cost = { }
	local queue = { }

	cost[key(src)] = 0
	enqueue(queue, src, 0)

	while #queue > 0 do
		local current = dequeue(queue)
		if is_close(current, trgt)
		then
			if key(current) ~= key(trgt) then
					cameFrom[key(trgt)] = current
			end
			break
		end
		for _, next in ipairs(neighbors(current)) do
			local nextKey = key(next)
			local newCost = cost[key(current)] + costFunction(current, next)
			if (not visited[nextKey]) and (cost[nextKey] == nil or newCost < cost[nextKey]) then
				cost[nextKey] = newCost
				enqueue(queue, next, newCost)
				cameFrom[nextKey] = current
			end
		end

		visited[current] = true
	end

	local path = { }
	local current = trgt
	while current do
		table.insert(path, 1, Vec3(current.x, 0, current.z))
		current = cameFrom[key(current)]
	end
	if key(path[1]) ~= key(src) then
		table.insert(path, 1, src)
	end
	return path
end
