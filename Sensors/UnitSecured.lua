local sensorInfo = {
	name = "UnitSecured",
	desc = "Check whether given unit is the safe area",
	author = "KCKy",
	date = "2025-08-01",
	license = "MIT",
}

function getInfo() return { period = -1 } end

return function (unit)
    local position = Vec3(Spring.GetUnitPosition(unit))
    local safe = Sensors.core.MissionInfo().safeArea.center
    return (position - safe):Length() <= Sensors.core.MissionInfo().safeArea.radius
end
