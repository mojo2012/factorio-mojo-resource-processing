-- reset original tungsten plate recipe
data.raw["recipe"]["tungsten-plate"] = nil


data:extend({
    { -- ore materials
      type = "recipe",
      name = "ore-tungsten-crushed",
      category = "ore-crusher",
      subgroup = "tungsten",
      energy_required = 3,
      icon = "__mojo-resource-processing__/graphics/icons/ore-tungsten/crushed-ore-tungsten.png",
      ingredients = {
        {"tungsten-ore", 10}
      },
      enabled = false,
      results = {
      	{"ore-tungsten-crushed", 7},
      	{"stone", 3}
      }
    },
    {
      type = "recipe",
      name = "ore-tungsten-pulverized",
      category = "ore-pulverizer",
      subgroup = "tungsten",
      energy_required = 3,
      icon = "__mojo-resource-processing__/graphics/icons/ore-tungsten/pulverized-ore-tungsten.png",
      ingredients = {
        {"ore-tungsten-crushed", 10}
      },
      enabled = false,
      results = {
      	{"ore-tungsten-pulverized", 8},
      	{"gravel", 2}
      }
    },
    
    { -- tungsten plates
      type = "recipe",
      name = "tungsten-plate",
      category = "smelting",
      subgroup = "tungsten",
      energy_required = 10,
      icon = "__mojo-resource-processing__/graphics/icons/ore-tungsten/tungsten-plate.png",
      ingredients = {
        {"tungsten-ore", 5}
      },
      enabled = true,
      results = {
      	{"tungsten-plate", 3},
        {"slag", 2},
      }
    },
    {
      type = "recipe",
      name = "tungsten-plate-crushed-ore",
      category = "smelting",
      subgroup = "tungsten",
      energy_required = 8,
      icon = "__mojo-resource-processing__/graphics/icons/ore-tungsten/tungsten-plate.png",
      ingredients = {
        {"ore-tungsten-crushed", 5}
      },
      enabled = false,
      results = {
      	{"tungsten-plate", 4},
      	{"slag", 1}
      }
    },
    {
      type = "recipe",
      name = "tungsten-plate-pulverized-ore",
      category = "smelting",
      subgroup = "tungsten",
      energy_required = 8,
      icon = "__mojo-resource-processing__/graphics/icons/ore-tungsten/tungsten-plate.png",
      ingredients = {
        {"ore-tungsten-pulverized", 5}
      },
      enabled = false,
      results = {
      	{"tungsten-plate", 4}
      }
    },
  })