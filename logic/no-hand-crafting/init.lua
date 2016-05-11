-- iterates over all recipes and sets the max ingredient count of the burner assembling machine to the max amount of ingredients of all recipes.


function Set (list)
  local set = {}
  for _, l in ipairs(list) do set[l] = true end
  return set
end

local crafting_categories = Set(data.raw.player.player.crafting_categories)
local crafting_cap = 0

for i, obj in pairs(data.raw["recipe"]) do
  if (crafting_categories[obj.category] or obj.category == "" or obj.category == nil) then
    if #obj.ingredients > crafting_cap then
      crafting_cap = #obj.ingredients
    end
  end
end

data.raw["assembling-machine"]["burner-assembling-machine"].ingredient_count = crafting_cap

-- removes all crafting categores from player
data.raw.player.player.crafting_categories = {}
