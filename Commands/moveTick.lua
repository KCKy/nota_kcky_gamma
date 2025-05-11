function getInfo()
    return
    {
        onNoUnits = SUCCESS,
        tooltip = "Move this tick by vector",
		parameterDefs =
        {
            {
                name = "vector",
                variableType = "expression",
                componentType = "editBox",
                defaultValue = ""
            }
        }
    }
end

local commandName = "moveTick"

function Run(self, units, parameter)
    local vector = parameter.vector

    for _, unit in ipairs(units) do
        local position = Vec3(Spring.GetUnitPosition(unit))
        local target = position + vector
        Spring.GiveOrderToUnit(unit, CMD.MOVE, target:AsSpringVector(), {})
    end

    return RUNNING
end

function Reset() end
