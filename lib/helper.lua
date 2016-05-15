require("lib.basic_extensions")

-- Used to change minable results from ore fields
function ressourceItemMinMaxProb(itemName, amountMin, amountMax, probability)
  return {
    type = "item",
    name = itemName,
    amount_min = amountMin,
    amount_max = amountMax,
    probability = probability
  }
end

function addItem(itemName, subgroup, order, stackSize)
	data:extend({
		{
			type = "item",
			name = itemName,
			icon = "__hardCrafting__/graphics/icons/"..itemName..".png",
			flags = {"goes-to-main-inventory"},
			subgroup = subgroup,
			order = order,
			stack_size = stackSize
		}
	})
end


function addRecipe(name,category,subgroup,timeRequired,ingredients,results,order)
	local resultsDetailled = {}
	if not results then
		print("No results found for recipe with name: "..name)
	end
	for _,s in pairs(results) do
		local typ = "item"
		if s[1] == "sulfuric-acid" or s[1] == "water" then
			typ = "fluid"
		end
		table.insert(resultsDetailled, {type=typ, name=s[1], amount=s[2]})
	end
	imageName = removeAfterSign(name,"|")
	data:extend({
	{
		type = "recipe",
    name = name,
    category = category,
		subgroup = subgroup,
    energy_required = timeRequired,
    ingredients = ingredients,
		icon = "__hardCrafting__/graphics/icons/"..imageName..".png",
    results = resultsDetailled,
		order = order
	}
	})
end


-- adds a recipe which is unlocked when the given technology is researched
function addTechnologyUnlocksRecipe(technologyName, recipeName)
	data.raw["recipe"][recipeName].enabled = false
	if data.raw["technology"][technologyName].effects == nil then
		data.raw["technology"][technologyName].effects = {}
	end
	table.insert(data.raw["technology"][technologyName].effects,
		{ type = "unlock-recipe", recipe = recipeName })
end