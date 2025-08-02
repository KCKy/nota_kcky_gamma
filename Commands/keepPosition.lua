function getInfo()
    return
    {
        onNoUnits = SUCCESS,
        tooltip = "Order units to stay at their position if within the safe area, which is needed to remedy the sliding bug",
		parameterDefs = { }
    }
end

local commandName = "keepPosition"

function Run(self, units)
    for _, unit in ipairs(units) do
        local currentPosition = Vec3(Spring.GetUnitPosition(unit))
        Spring.GiveOrderToUnit(unit, CMD.MOVE, currentPosition:AsSpringVector(), {})
    end
    return RUNNING
end

function Reset() end
