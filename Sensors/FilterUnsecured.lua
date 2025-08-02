local sensorInfo = {
	name = "FilterUnsecured",
	desc = "",
	author = "KCKy",
	date = "2025-08-01",
	license = "MIT",
}

function getInfo() return { period = -1 } end

local function Filter(table, predicate)
  local result = { }
  for _, x in pairs(table) do
      if predicate(x) then
          result[#result+1] = x
      end
  end
  return result
end

return function (units)
    global.reserved = global.reserved or { }
    return Filter(units, function(x) return not Sensors.nota_kcky_gamma.UnitSecured(x) and Spring.GetUnitIsDead(x) == false and not global.reserved[x] end )
end
