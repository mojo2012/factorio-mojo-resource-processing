-- reset original tin plate recipe
data.raw["recipe"]["tin-plate"] = nil


data:extend({
    { -- ore materials
      type = "recipe",
      name = "ore-tin-crushed",
      category = "ore-crusher",
      subgroup = "tin",
      energy_required = 3,
      icon = "__mojo-resource-processing__/graphics/icons/ore-tin/crushed-ore-tin.png",
      ingredients = {
        {"tin-ore", 10}
      },
      enabled = false,
      results = {
      	{"ore-tin-crushed", 7},
      	{"stone", 3}
      }
    },
    {
      type = "recipe",
      name = "ore-tin-pulverized",
      category = "ore-pulverizer",
      subgroup = "tin",
      energy_required = 3,
      icon = "__mojo-resource-processing__/graphics/icons/ore-tin/pulverized-ore-tin.png",
      ingredients = {
        {"ore-tin-crushed", 10}
      },
      enabled = false,
      results = {
      	{"ore-tin-pulverized", 8},
      	{"gravel", 2}
      }
    },
    
    { -- tin plates
      type = "recipe",
      name = "tin-plate",
      category = "smelting",
      subgroup = "tin",
      energy_required = 10,
      icon = "__mojo-resource-processing__/graphics/icons/ore-tin/tin-plate.png",
      ingredients = {
        {"tin-ore", 10}
      },
      enabled = true,
      results = {
      	{"tin-plate", 3},
        {"slag", 4},
      }
    },
    {
      type = "recipe",
      name = "tin-plate-crushed-ore",
      category = "smelting",
      subgroup = "tin",
      energy_required = 8,
      icon = "__mojo-resource-processing__/graphics/icons/ore-tin/tin-plate.png",
      ingredients = {
        {"ore-tin-crushed", 10}
      },
      enabled = false,
      results = {
      	{"tin-plate", 6},
      	{"slag", 2}
      }
    },
    {
      type = "recipe",
      name = "tin-plate-pulverized-ore",
      category = "smelting",
      subgroup = "tin",
      energy_required = 8,
      icon = "__mojo-resource-processing__/graphics/icons/ore-tin/tin-plate.png",
      ingredients = {
        {"ore-tin-pulverized", 10}
      },
      enabled = false,
      results = {
      	{"tin-plate", 8}
      }
    },
  })