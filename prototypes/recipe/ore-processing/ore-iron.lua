-- reset original iron plate recipe
data.raw["recipe"]["iron-plate"] = nil


data:extend({
    { -- ore materials
      type = "recipe",
      name = "ore-iron-crushed",
      category = "ore-crusher",
      subgroup = "iron",
      energy_required = 3,
      icon = "__mojo-resource-processing__/graphics/icons/ore-iron/crushed-ore-iron.png",
      ingredients = {
        {"iron-ore", 10}
      },
      enabled = false,
      results = {
      	{"ore-iron-crushed", 7},
      	{"ore-iron-nugget", 1},
      	{"stone", 3}
      }
    },
    {
      type = "recipe",
      name = "ore-iron-pulverized",
      category = "ore-pulverizer",
      subgroup = "iron",
      energy_required = 3,
      icon = "__mojo-resource-processing__/graphics/icons/ore-iron/pulverized-ore-iron.png",
      ingredients = {
        {"ore-iron-crushed", 10}
      },
      enabled = false,
      results = {
      	{"ore-iron-pulverized", 8},
      	{"gravel", 2}
      }
    },
    
    { -- iron plates
      type = "recipe",
      name = "iron-plate",
      category = "smelting",
      subgroup = "iron",
      energy_required = 10,
      icon = "__base__/graphics/icons/iron-plate.png",
      ingredients = {
        {"iron-ore", 10}
      },
      enabled = true,
      results = {
      	{"iron-plate", 3},
        {"slag", 4},
      }
    },
    {
      type = "recipe",
      name = "iron-plate-nugget",
      category = "smelting",
      subgroup = "iron",
      energy_required = 8,
      icon = "__base__/graphics/icons/iron-plate.png",
      ingredients = {
        {"ore-iron-nugget", 10}
      },
      enabled = true,
      results = {
        {"iron-plate", 8},
      }
    },
    {
      type = "recipe",
      name = "iron-plate-crushed-ore",
      category = "smelting",
      subgroup = "iron",
      energy_required = 8,
      icon = "__base__/graphics/icons/iron-plate.png",
      ingredients = {
        {"ore-iron-crushed", 10}
      },
      enabled = false,
      results = {
      	{"iron-plate", 6},
      	{"slag", 2}
      }
    },
    {
      type = "recipe",
      name = "iron-plate-pulverized-ore",
      category = "smelting",
      subgroup = "iron",
      energy_required = 8,
      icon = "__base__/graphics/icons/iron-plate.png",
      ingredients = {
        {"ore-iron-pulverized", 10}
      },
      enabled = false,
      results = {
      	{"iron-plate", 8}
      }
    },
  })