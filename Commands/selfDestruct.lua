function getInfo()
    return
    {
        onNoUnits = SUCCESS,
        tooltip = "Order and wait for self destruct",
		parameterDefs = { }
    }
end

local commandName = "selfDestruct"

function Run(self, units)

    if self.issued then
        for _, unit in ipairs(units) do
            if Spring.GetUnitIsDead(unit) == false then
                return RUNNING
            end
        end
        return SUCCESS
    end

    self.issued = true
    for _, unit in ipairs(units) do
        Spring.GiveOrderToUnit(unit, CMD.SELFD, {}, {})
    end

    return RUNNING
end


function Reset(self)
    self.issued = nil
end
