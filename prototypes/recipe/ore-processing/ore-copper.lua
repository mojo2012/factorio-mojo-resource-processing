dw-- reset original iron plate recipe
data.raw["recipe"]["copper-plate"] = nil

data:extend({
    { -- ore materials
      type = "recipe",
      name = "ore-copper-crushed",
      category = "ore-crusher",
      subgroup = "copper",
      energy_required = 3,
      icon = "__mojo-resource-processing__/graphics/icons/ore-copper/crushed-ore-copper.png",
      ingredients = {
        {"copper-ore", 3}
      },
      enabled = false,
      results = {
      	{"ore-copper-crushed", 2},
      	{"stone", 2}
      }
    },
    {
      type = "recipe",
      name = "ore-copper-pulverized",
      category = "ore-pulverizer",
      subgroup = "copper",
      energy_required = 3,
      icon = "__mojo-resource-processing__/graphics/icons/ore-copper/pulverized-ore-copper.png",
      ingredients = {
        {"ore-copper-crushed", 3}
      },
      enabled = false,
      results = {
      	{"ore-copper-pulverized", 5},
      	{"gravel", 1}
      }
    },
    { -- copper plates
      type = "recipe",
      name = "copper-plate",
      category = "smelting",
      subgroup = "copper",
      energy_required = 10,
      icon = "__base__/graphics/icons/copper-plate.png",
      ingredients = {
        {"copper-ore", 3}
      },
      enabled = true,
      results = {
      	{"copper-plate", 1},
      	{"slag", 1}
      }
    },
    {
      type = "recipe",
      name = "copper-plate-crushed-ore",
      category = "smelting",
      subgroup = "copper",
      energy_required = 8,
      icon = "__base__/graphics/icons/copper-plate.png",
      ingredients = {
        {"ore-copper-crushed", 3}
      },
      enabled = false,
      results = {
        {"copper-plate", 3},
        {"slag", 1},
      }
    },
    {
      type = "recipe",
      name = "copper-plate-pulverized-ore",
      category = "smelting",
      subgroup = "copper",
      energy_required = 8,
      icon = "__base__/graphics/icons/copper-plate.png",
      ingredients = {
        {"ore-copper-pulverized", 1}
      },
      enabled = false,
      results = {
      	{"copper-plate", 1}
      }
    },
  })