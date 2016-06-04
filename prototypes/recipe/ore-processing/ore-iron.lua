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
        {"iron-ore", 3}
      },
      enabled = false,
      results = {
      	{"ore-iron-crushed", 3},
      	{"stone", 1}
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
        {"ore-iron-crushed", 3}
      },
      enabled = false,
      results = {
      	{"ore-iron-pulverized", 6},
      	{"gravel", 1}
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
        {"iron-ore", 2}
      },
      enabled = true,
      results = {
      	{"iron-plate", 2},
        {"slag", 1},
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
        {"ore-iron-nugget", 1}
      },
      enabled = true,
      results = {
        {"iron-plate", 1},
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
        {"ore-iron-crushed", 2}
      },
      enabled = false,
      results = {
      	{"iron-plate", 3},
      	{"slag", 1}
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
        {"ore-iron-pulverized", 1}
      },
      enabled = false,
      results = {
      	{"iron-plate", 1}
      }
    },
  })