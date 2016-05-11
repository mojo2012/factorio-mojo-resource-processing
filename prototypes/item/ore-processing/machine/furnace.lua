-- this changes the invetory result size so that we can output 2 results
-- its kind of a hack ;-)


-- exclude some other furnace based machines
local furnacesExclude = table.set{"incinerator","electric-incinerator"}

for name,furnace in pairs(data.raw["furnace"]) do
	if not furnacesExclude[name] then
		furnace.result_inventory_size = math.max(furnace.result_inventory_size, 2)
	end
end
