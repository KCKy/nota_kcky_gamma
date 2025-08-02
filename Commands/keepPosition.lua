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
    self.keptPositions = self.keptPositions or { }
    for _, unit in ipairs(units) do
        if (Sensors.nota_kcky_gamma.UnitSecured(unit)) then
            self.keptPositions[unit] = self.keptPositions[unit] or Vec3(Spring.GetUnitPosition(unit))
            local position = self.keptPositions[unit]
            Spring.GiveOrderToUnit(unit, CMD.MOVE, position:AsSpringVector(), {})
        end
    end
    return RUNNING
end

function Reset(self)
    self.initialized = false
end
