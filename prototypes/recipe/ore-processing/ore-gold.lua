-- reset original gold plate recipe
data.raw["recipe"]["gold-plate"] = nil


data:extend({
    { -- ore materials
      type = "recipe",
      name = "ore-gold-crushed",
      category = "ore-crusher",
      subgroup = "gold",
      energy_required = 3,
      icon = "__mojo-resource-processing__/graphics/icons/ore-gold/crushed-ore-gold.png",
      ingredients = {
        {"gold-ore", 10}
      },
      enabled = false,
      results = {
      	{"ore-gold-crushed", 7},
      	{"ore-gold-nugget", 1},
      	{"stone", 3}
      }
    },
    {
      type = "recipe",
      name = "ore-gold-pulverized",
      category = "ore-pulverizer",
      subgroup = "gold",
      energy_required = 3,
      icon = "__mojo-resource-processing__/graphics/icons/ore-gold/pulverized-ore-gold.png",
      ingredients = {
        {"ore-gold-crushed", 10}
      },
      enabled = false,
      results = {
      	{"ore-gold-pulverized", 8},
      	{"gravel", 2}
      }
    },
    
    { -- gold plates
      type = "recipe",
      name = "gold-plate",
      category = "smelting",
      subgroup = "gold",
      energy_required = 10,
      icon = "__mojo-resource-processing__/graphics/icons/ore-gold/gold-plate.png",
      ingredients = {
        {"gold-ore", 10}
      },
      enabled = true,
      results = {
      	{"gold-plate", 3},
        {"slag", 4},
      }
    },
    {
      type = "recipe",
      name = "gold-plate-nugget",
      category = "smelting",
      subgroup = "gold",
      energy_required = 8,
      icon = "__mojo-resource-processing__/graphics/icons/ore-gold/gold-plate.png",
      ingredients = {
        {"ore-gold-nugget", 10}
      },
      enabled = true,
      results = {
        {"gold-plate", 8},
      }
    },
    {
      type = "recipe",
      name = "gold-plate-crushed-ore",
      category = "smelting",
      subgroup = "gold",
      energy_required = 8,
      icon = "__mojo-resource-processing__/graphics/icons/ore-gold/gold-plate.png",
      ingredients = {
        {"ore-gold-crushed", 10}
      },
      enabled = false,
      results = {
      	{"gold-plate", 6},
      	{"slag", 2}
      }
    },
    {
      type = "recipe",
      name = "gold-plate-pulverized-ore",
      category = "smelting",
      subgroup = "gold",
      energy_required = 8,
      icon = "__mojo-resource-processing__/graphics/icons/ore-gold/gold-plate.png",
      ingredients = {
        {"ore-gold-pulverized", 10}
      },
      enabled = false,
      results = {
      	{"gold-plate", 8}
      }
    },
  })