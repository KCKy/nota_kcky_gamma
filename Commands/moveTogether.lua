function getInfo()
    return
    {
        onNoUnits = SUCCESS,
        tooltip = "Move group as two wings of a leading unit.",
		parameterDefs =
        {
            {
                name = "amount",
                variableType = "expression",
                componentType = "editBox",
                defaultValue = ""
            },
            {
                name = "distanceScale",
                variableType = "expression",
                componentType = "editBox",
                defaultValue = ""
            },
            {
                name = "leader",
                variableType = "expression",
                componentType = "editBox",
                defaultValue = ""
            },
            {
                name = "gap",
                variableType = "expression",
                componentType = "editBox",
                defaultValue = ""
            }
        }
    }
end

local commandName = "moveTogether"

local function contains(array, y)
    for _, x in ipairs(array) do
        if y == x then
            return true
        end
    end
    return false
end

local function filter(array, predicate)
    local result = { }
    for _, x in ipairs(array) do
        if predicate(x) then
            result[#result+1] = x
        end
    end
    return result
  end

function Run(self, units, parameter)
    if self.gaveOrder then
        return SUCCESS
    end

    local distance = parameter.amount
    local leader = parameter.leader[1]
    local gap = parameter.gap

    if not Spring.ValidUnitID(leader) then
        Logger.warn(commandName, "Given leader id is not a valid unit ID: " .. leader)
        return FAILURE
    end

    local defID = Spring.GetUnitDefID(leader)
    if defID ~= UnitDefNames["armmav"].id then
        Logger.warn(commandName, "Given leader is not an armmav but a " .. UnitDefs[defID].name)
        return FAILURE
    end

    if not contains(units, leader) then
        Spring.Echo(dump(units))
        Logger.warn(commandName, "Given leader is not part of the selected units.")
        return FAILURE
    end

    local leaderPosition = Vec3(Spring.GetUnitPosition(leader))
    distance = Vec3(distance[1], 0, distance[2]) * parameter.distanceScale
    local leaderTarget = leaderPosition + distance
    local direction = distance:Normalize() * gap
    local leftWing = direction:Rotate2D(-90)
    local rightWing = -leftWing

    local followers = filter(units, function(x) return x ~= leader end)

    for i, follower in ipairs(followers) do
        i = i - 1
        local index = math.floor(i / 2) + 1
        local target
        if i % 2 == 0 then
            target = leaderTarget + leftWing * index
        else
            target = leaderTarget + rightWing * index
        end
        Spring.GiveOrderToUnit(follower, CMD.MOVE, target:AsSpringVector(), {})
    end

    Spring.GiveOrderToUnit(leader, CMD.MOVE, leaderTarget:AsSpringVector(), {})
    self.gaveOrder = true
    return RUNNING
end

function Reset(self)
    self.gaveOrder = nil
end
