function Loop1()
    print("Enter N:")
    local n = io.read("*n")
    for i = 1, n do
        print(i)
    end
end

function Loop2()
    print("Enter N:")
    local n = io.read("*n")
    for i = 1, n, 2 do
        print(i)
    end
end

function Loop3()
    print("Enter N:")
    local n = io.read("*n")
    for i = n, 1, -1 do
        print(i)
    end
end

function Array1()
    local arr = {10, 0, 0, 0, 0, 0, 10}
    local sum = 0
    for _, x in ipairs(arr) do
        sum = sum + x
    end
    print(sum)
end

function Array2()
    local arr = {10, 0, 0, 25, 0, 0, 10}
    local max, index = math.mininteger, nil
    for i, x in ipairs(arr) do
        if x > max then
            max = x
            index = i
        end
    end
    print(index)
end

function Array3()
    print("Enter N:")
    local n = io.read("*n")
    local arr = {}
    for i = 1, n do
        arr[i] = i * i
    end
    
    for i, x in pairs(arr) do
        print(i, x)
    end
end

function Array4()
    print("Enter N:")
    local n = io.read("*n")
    local arr = {0, 1, 3, 0, 5, 1}
    for _, x in ipairs(arr) do
        if x % 2 ~= 0 then
            n = n - 1
            if n == 0 then
                print(x)
            end
        end
    end
end

function Vs1()
    local arr = {0, 1, 3, 0, 5, 1}
    for i, x in ipairs(arr) do
        print(i, x)
    end
    local table = { x = 0, y = 1 }
    for i, x in pairs(table) do
        print(i, x)
    end
end

function TableSize(table)
    local size = 0
    for _, _ in pairs(table) do
        size = size + 1
    end
    return size
end

function Vs2()
    local arr = {0, 1, 3, 0, 5, 1}
    print(#arr)
    local table = { x = 0, y = 1 }
    print(TableSize(table))
end

function Vs3()
    local arr = {0, 1, 3, 0, 5, 1}
    print(#arr == 0 and "empty" or "non-empty")
    local table = { x = 0, y = 1 }
    print(TableSize(table) == 0 and "empty" or "non-empty")
end

function Format(obj)
    local type = type(obj)
    if type == "nil" then
        return "nil"
    elseif type == "table" then
        -- Sorry I made this so ugly, could make it a lot cleaner but that's not the point of the task.
        if TableSize(obj) == #obj then
            local text = "{"
            for _, x in pairs(obj) do
                text = text .. ("\n" ..  Format(x))
            end
            text = text .. "}"
            return text
        else
            local text = "{"
            for i, x in pairs(obj) do
                text = text .. ("\n(" .. Format(i) .. " = " .. Format(x) .. ")")
            end
            text = text .. "}"
            return text
        end
    else
        return tostring(obj) .. " : " .. tostring(type)
    end
end

function Basic1()
    local arr = {0, 1, 3, 0, 5, 1, "shrek"}
    local table = { x = 0, y = 1, arr = arr }
    print(Format(table))
end

function Filter(arr, predicate)
    local result = { }
    for _, x in ipairs(arr) do
        if predicate(x) then
            result[#result + 1] = x
        end
    end
    return result
end

function Basic2()
    local function predicate(value)
        return type(value) == "number" and value % 2 == 1
    end

    local arr = {0, 1, 3, 0, 5, 1, "shrek"}
    print(Format(Filter(arr, predicate)))
end

Loop1()
Loop2()
Loop3()
Array1()
Array2()
Array3()
Array4()
Vs1()
Vs2()
Vs3()
Basic1()
Basic2()
