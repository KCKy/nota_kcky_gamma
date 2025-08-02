function getInfo()
    return
    {
        onNoUnits = SUCCESS,
        tooltip = "Order units to not wander, nor attack, nor repeat queued actions",
		parameterDefs = { }
    }
end

local commandName = "keepCalm"

function Run(self, units)
    for _, unit in ipairs(units) do
        Spring.GiveOrderToUnit(unit, CMD.FIRE_STATE, {0}, {"shift"})
        Spring.GiveOrderToUnit(unit, CMD.MOVE_STATE, {0}, {"shift"})
        Spring.GiveOrderToUnit(unit, CMD.REPEAT, {0}, {"shift"})
    end
    return SUCCESS
end

function Reset() end
