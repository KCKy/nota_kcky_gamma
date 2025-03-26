local elements = {
  [8695] = {
    air = false,
    ammo = {
      [1] = {
        count = 45,
        defName = "rifle",
      },
      [2] = {
        count = 1,
        defName = "grenade",
      },
    },
    defName = "soldier",
    distance = 5984,
    teamID = 3,
  },
  [23] = {
    air = false,
    ammo = {
      [1] = {
        count = 25,
        defName = "mg",
      }
    },
    defName = "machinegunner",
    distance = 350,
    teamID = 1,
  },
  [2454] = {
    air = true,
    ammo = {
      [1] = {
        count = 1140,
        defName = "aircannon",
      }
    },
    defName = "fighter",
    distance = 1840,
    teamID = 2,
  },
  [13541] = {
    air = false,
    ammo = {
      [1] = {
        count = 15,
        defName = "rifle",
      },
      [2] = {
        count = 3,
        defName = "grenade",
      },
    },
    defName = "soldier",
    distance = 5321,
    teamID = 3,
  },
  [13544] = {
    air = false,
    ammo = {
      [1] = {
        count = 25,
        defName = "rifle",
      },
      [2] = {
        count = 2,
        defName = "grenade",
      },
    },
    defName = "soldier",
    distance = 5328,
    teamID = 3,
  },
  [14584] = {
    air = false,
    ammo = {
      [1] = {
        count = 45,
        defName = "rifle",
      },
      [2] = {
        count = 1,
        defName = "grenade",
      },
    },
    defName = "soldier",
    distance = 5228,
    teamID = 3,
  },
  [19854] = {
    air = false,
    ammo = {
      [1] = {
        count = 70,
        defName = "rifle",
      },
      [2] = {
        count = 6,
        defName = "grenade",
      },
    },
    defName = "soldier",
    distance = 5541,
    teamID = 3,
  },
  [52411] = {
    air = false,
    ammo = {
      [1] = {
        count = 7,
        defName = "HE",
      },
      [2] = {
        count = 15,
        defName = "sabot",
      },
    },
    defName = "tank",
    distance = 684,
    teamID = 1,
  },
  [58411] = {
    air = false,
    ammo = {
      [1] = {
        count = 5,
        defName = "HE",
      },
      [2] = {
        count = 8,
        defName = "sabot",
      },
    },
    defName = "tank",
    distance = 1001,
    teamID = 1,
  },
  [22248] = {
    air = false,
    ammo = {
      [1] = {
        count = 18,
        defName = "rifle",
      },
      [2] = {
        count = 4,
        defName = "grenade",
      },
    },
    defName = "soldier",
    distance = 284,
    teamID = 1,
  },
  [85471] = {
    air = false,
    ammo = {
      [1] = {
        count = 0,
        defName = "rifle",
      },
      [2] = {
        count = 2,
        defName = "grenade",
      },
    },
    defName = "soldier",
    distance = 284,
    teamID = 1,
  },
  [95450] = {
    air = false,
    ammo = {
      [1] = {
        count = 0,
        defName = "rifle",
      },
      [2] = {
        count = 0,
        defName = "grenade",
      },
    },
    defName = "soldier",
    distance = 400,
    teamID = 1,
  },
  [95520] = {
    air = false,
    ammo = {
      [1] = {
        count = 0,
        defName = "rifle",
      },
      [2] = {
        count = 5,
        defName = "grenade",
      },
    },
    defName = "soldier",
    distance = 421,
    teamID = 1,
  },
  [89562] = {
    air = false,
    ammo = {
      [1] = {
        count = 0,
        defName = "rifle",
      },
      [2] = {
        count = 5,
        defName = "grenade",
      },
    },
    defName = "soldier",
    distance = 500,
    teamID = 1,
  },
  [84515] = {
    air = false,
    ammo = {},
    defName = "bugBuilder",
    distance = 1080,
    teamID = 4,
  },
  [98741] = {
    air = false,
    ammo = {
      [1] = {
        count = math.huge,
        defName = "acid",
      }
    },
    defName = "bugSpitter",
    distance = 1080,
    teamID = 4,
  },
}

local inserts = {
  [14751] = {
    air = false,
    ammo = {
      [1] = {
        count = 15,
        defName = "HE",
      },
      [2] = {
        count = 14,
        defName = "sabot",
      },
    },
    defName = "tank",
    distance = 2685,
    teamID = 1,
  },
  [95520] = {
    air = false,
    ammo = {
      [1] = {
        count = 14,
        defName = "HE",
      },
      [2] = {
        count = 14,
        defName = "sabot",
      },
    },
    defName = "tank",
    distance = 552,
    teamID = 1,
  },
  [84564] = {
    air = false,
    ammo = {},
    defName = "bugBuilder",
    distance = 1154,
    teamID = 4,
  },
  [84585] = {
    air = false,
    ammo = {},
    defName = "bugBuilder",
    distance = 1150,
    teamID = 4,
  },
  [55854] = {
    air = false,
    ammo = {
      [1] = {
        count = 58,
        defName = "rifle",
      },
      [2] = {
        count = 3,
        defName = "grenade",
      },
    },
    defName = "soldier",
    distance = 400,
    teamID = 2,
  },
  [11474] = {
    air = true,
    ammo = {
      [1] = {
        count = 1300,
        defName = "aircannon",
      }
    },
    defName = "fighter",
    distance = 10585,
    teamID = 2,
  },
}

local deletionsByID = {8695, 84585, 84515}

function Filter(table, predicate)
  local result = { }
  for i, x in pairs(table) do
      if predicate(x) then
          result[i] = x
      end
  end
  return result
end

function Map(table, map)
  local result = {}
  for i, x in pairs(table) do
    result[i] = map(x)
  end
  return result
end

function TableSize(table)
  local size = 0
  for _, _ in pairs(table) do
      size = size + 1
  end
  return size
end

function Flatten(table)
  local result = { }
  for _, x in pairs(table) do
    if type(x) == "table" then
      for _, y in pairs(x) do
        result[#result+1] = y
      end
    else
      result[#result+1] = x
    end
  end
  return result
end

function First(table)
  for _, x in pairs(table) do
    return x
  end
  return nil
end

function Format(obj, indent)
  indent = indent or 0
  local spacing = string.rep(" ", indent)
  local obj_type = type(obj)
  if obj_type == "nil" then
      return "nil"
  elseif obj_type == "boolean" then
      return obj and "true" or "false"
  elseif obj_type == "number" then
      return tostring(obj)
  elseif obj_type == "string" then
      return string.format("%q", obj)
  elseif obj_type == "table" then
      if TableSize(obj) == 0 then
        return "{ }"
      end
      local result = "\n" .. spacing .. "{\n"
      if #obj == TableSize(obj) then
          for _, v in ipairs(obj) do
              result = result .. spacing .. "  " .. Format(v, indent + 2) .. "\n"
          end
      else
          for k, v in pairs(obj) do
              local key_repr = type(k) == "string" and string.format("%q", k) or "" .. Format(k)
              result = result .. spacing .. "  " .. key_repr .. " = " .. Format(v, indent + 2) .. "\n"
          end
      end
      result = result .. spacing .. "}"
      return result
  else
      return tostring(obj)
  end
end

function PrintFormat(obj)
  print(Format(obj))
end

function Reduce(obj, initial, func)
  local aggregate = initial
  for _, x in pairs(obj) do
    aggregate = func(aggregate, x)
  end
  return aggregate
end

function Sum(obj)
  return Reduce(obj, 0, function (x, y) return x + y end)
end

for i, x in pairs(inserts) do
  elements[i] = x
end

for _, x in ipairs(deletionsByID) do
  elements[x] = nil
end

PrintFormat(Filter(elements, function(x) return x.air end))
print()

PrintFormat(Filter(elements, function(x) return x.defName == "tank" end))
print()

team1_tanks = Filter(elements, function(x) return x.defName == "tank" and x.teamID == 1 end)
PrintFormat(Map(team1_tanks, function(x) return x.ammo end))
print()

PrintFormat(Filter(elements, function(x) return x.teamID == 4 and #x.ammo > 0 end))
print()

PrintFormat(Filter(elements, function(x) return x.teamID ~= 1 and x.distance <= 1500 end))
print()

for i=1,4 do
  local units = Filter(elements, function(x) return x.teamID == i end)
  local grenades = Map(units, function(x) return First(Filter(x.ammo, function(y) return y.defName == "grenade" end)) end)
  PrintFormat(grenades)
end
print()

for i=1,4 do
  local units = Filter(elements, function(x) return x.teamID == i and x.defName == "soldier" end)
  local grenades = Map(units, function(x) return First(Filter(x.ammo, function(y) return y.defName == "grenade" end)) end)
  PrintFormat(grenades)
end
print()

Evals =
{
  HE = 10
}

function AmmoValue(x)
  local value = Evals[x.defName] or 1
  return x.count * value
end

for i=1,4 do
  local units = Filter(elements, function(x) return x.teamID == i end)
  PrintFormat(Sum(Map(units, function(x) return Sum(Map(x.ammo, AmmoValue)) end)))
end
print()
