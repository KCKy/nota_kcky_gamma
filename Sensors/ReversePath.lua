local sensorInfo = {
	name = "ReversePath",
	desc = "Reverse given path",
	author = "KCKy",
	date = "2025-08-01",
	license = "MIT",
}

function getInfo() return { period = -1 } end

return function (path)
	reverse = {}
	for _, x in ipairs(path) do
		table.insert(reverse, 1, x)
	end
	return reverse
end
