-- reset original rutile plate recipe
data.raw["recipe"]["rutile-plate"] = nil


data:extend({
  --[[
    { -- ore materials
      type = "recipe",
      name = "ore-rutile-crushed",
      category = "ore-crusher",
      subgroup = "rutile",
      energy_required = 3,
      icon = "__mojo-resource-processing__/graphics/icons/ore-rutile/crushed-ore-rutile.png",
      ingredients = {
        {"rutile-ore", 5}
      },
      enabled = false,
      results = {
      	{"ore-rutile-crushed", 5},
      	{"stone", 1}
      }
    },
    {
      type = "recipe",
      name = "ore-rutile-pulverized",
      category = "ore-pulverizer",
      subgroup = "rutile",
      energy_required = 3,
      icon = "__mojo-resource-processing__/graphics/icons/ore-rutile/pulverized-ore-rutile.png",
      ingredients = {
        {"ore-rutile-crushed", 5}
      },
      enabled = false,
      results = {
      	{"ore-rutile-pulverized", 5},
      	{"gravel", 1}
      }
    },
    ]]--

    { -- rutile plates (=titanium)
      type = "recipe",
      name = "titanium-plate",
      category = "smelting",
      subgroup = "rutile",
      energy_required = 10,
      icon = "__mojo-resource-processing__/graphics/icons/ore-rutile/titanium-plate.png",
      ingredients = {
        {"rutile-ore", 5}
      },
      enabled = true,
      results = {
      	{"titanium-plate", 3},
        {"slag", 1},
      }
    },
    --[[
    {
      type = "recipe",
      name = "titanium-plate-crushed-ore",
      category = "smelting",
      subgroup = "rutile",
      energy_required = 8,
      icon = "__mojo-resource-processing__/graphics/icons/ore-rutile/titanium-plate.png",
      ingredients = {
        {"ore-rutile-crushed", 5}
      },
      enabled = false,
      results = {
      	{"titanium-plate", 5},
      	{"slag", 1}
      }
    },
    {
      type = "recipe",
      name = "titanium-plate-pulverized-ore",
      category = "smelting",
      subgroup = "rutile",
      energy_required = 8,
      icon = "__mojo-resource-processing__/graphics/icons/ore-rutile/titanium-plate.png",
      ingredients = {
        {"ore-rutile-pulverized", 3}
      },
      enabled = false,
      results = {
      	{"titanium-plate", 2}
      }
    },
    ]]--
  })