-- reset original silver plate recipe
data.raw["recipe"]["silver-plate"] = nil


data:extend({
    { -- ore materials
      type = "recipe",
      name = "ore-silver-crushed",
      category = "ore-crusher",
      subgroup = "silver",
      energy_required = 3,
      icon = "__mojo-resource-processing__/graphics/icons/ore-silver/crushed-ore-silver.png",
      ingredients = {
        {"silver-ore", 10}
      },
      enabled = false,
      results = {
      	{"ore-silver-crushed", 7},
      	{"ore-silver-nugget", 1},
      	{"stone", 3}
      }
    },
    {
      type = "recipe",
      name = "ore-silver-pulverized",
      category = "ore-pulverizer",
      subgroup = "silver",
      energy_required = 3,
      icon = "__mojo-resource-processing__/graphics/icons/ore-silver/pulverized-ore-silver.png",
      ingredients = {
        {"ore-silver-crushed", 10}
      },
      enabled = false,
      results = {
      	{"ore-silver-pulverized", 8},
      	{"gravel", 2}
      }
    },
    
    { -- silver plates
      type = "recipe",
      name = "silver-plate",
      category = "smelting",
      subgroup = "silver",
      energy_required = 10,
      icon = "__mojo-resource-processing__/graphics/icons/ore-silver/silver-plate.png",
      ingredients = {
        {"silver-ore", 10}
      },
      enabled = true,
      results = {
      	{"silver-plate", 3},
        {"slag", 4},
      }
    },
    {
      type = "recipe",
      name = "silver-plate-nugget",
      category = "smelting",
      subgroup = "silver",
      energy_required = 8,
      icon = "__mojo-resource-processing__/graphics/icons/ore-silver/silver-plate.png",
      ingredients = {
        {"ore-silver-nugget", 10}
      },
      enabled = true,
      results = {
        {"silver-plate", 8},
      }
    },
    {
      type = "recipe",
      name = "silver-plate-crushed-ore",
      category = "smelting",
      subgroup = "silver",
      energy_required = 8,
      icon = "__mojo-resource-processing__/graphics/icons/ore-silver/silver-plate.png",
      ingredients = {
        {"ore-silver-crushed", 10}
      },
      enabled = false,
      results = {
      	{"silver-plate", 6},
      	{"slag", 2}
      }
    },
    {
      type = "recipe",
      name = "silver-plate-pulverized-ore",
      category = "smelting",
      subgroup = "silver",
      energy_required = 8,
      icon = "__mojo-resource-processing__/graphics/icons/ore-silver/silver-plate.png",
      ingredients = {
        {"ore-silver-pulverized", 10}
      },
      enabled = false,
      results = {
      	{"silver-plate", 8}
      }
    },
  })