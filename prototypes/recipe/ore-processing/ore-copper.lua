-- reset original iron plate recipe
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
        {"copper-ore", 10}
      },
      enabled = false,
      results = {
      	{"ore-copper-crushed", 7},
      	{"stone", 3}
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
        {"ore-copper-crushed", 10}
      },
      enabled = false,
      results = {
      	{"ore-copper-pulverized", 8},
      	{"gravel", 2}
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
        {"copper-ore", 10}
      },
      enabled = true,
      results = {
      	{"copper-plate", 3},
      	{"slag", 3}
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
        {"ore-copper-crushed", 10}
      },
      enabled = false,
      results = {
        {"copper-plate", 6},
        {"slag", 2},
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
        {"ore-copper-pulverized", 10}
      },
      enabled = false,
      results = {
      	{"copper-plate", 8}
      }
    },
  })