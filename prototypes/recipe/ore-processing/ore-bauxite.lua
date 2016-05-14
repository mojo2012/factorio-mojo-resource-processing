-- reset original bauxite plate recipe
data.raw["recipe"]["aluminium-plate"] = nil


data:extend({
    { -- ore materials
      type = "recipe",
      name = "ore-bauxite-crushed",
      category = "ore-crusher",
      subgroup = "bauxite",
      energy_required = 3,
      icon = "__mojo-resource-processing__/graphics/icons/ore-bauxite/crushed-ore-bauxite.png",
      ingredients = {
        {"bauxite-ore", 10}
      },
      enabled = false,
      results = {
      	{"ore-bauxite-crushed", 7},
      	{"stone", 3}
      }
    },
    {
      type = "recipe",
      name = "ore-bauxite-pulverized",
      category = "ore-pulverizer",
      subgroup = "bauxite",
      energy_required = 3,
      icon = "__mojo-resource-processing__/graphics/icons/ore-bauxite/pulverized-ore-bauxite.png",
      ingredients = {
        {"ore-bauxite-crushed", 10}
      },
      enabled = false,
      results = {
      	{"ore-bauxite-pulverized", 8},
      	{"gravel", 2}
      }
    },
    
    { -- aluminium plates
      type = "recipe",
      name = "aluminium-plate",
      category = "smelting",
      subgroup = "bauxite",
      energy_required = 10,
      icon = "__mojo-resource-processing__/graphics/icons/ore-bauxite/aluminium-plate.png",
      ingredients = {
        {"bauxite-ore", 10}
      },
      enabled = true,
      results = {
      	{"aluminium-plate", 3},
        {"slag", 4},
      }
    },
    {
      type = "recipe",
      name = "aluminium-plate-crushed-ore",
      category = "smelting",
      subgroup = "bauxite",
      energy_required = 8,
      icon = "__mojo-resource-processing__/graphics/icons/ore-bauxite/aluminium-plate.png",
      ingredients = {
        {"ore-bauxite-crushed", 10}
      },
      enabled = false,
      results = {
      	{"aluminium-plate", 6},
      	{"slag", 2}
      }
    },
    {
      type = "recipe",
      name = "bauxite-plate-pulverized-ore",
      category = "smelting",
      subgroup = "bauxite",
      energy_required = 8,
      icon = "__mojo-resource-processing__/graphics/icons/ore-bauxite/aluminium-plate.png",
      ingredients = {
        {"ore-bauxite-pulverized", 10}
      },
      enabled = false,
      results = {
      	{"aluminium-plate", 8}
      }
    },
  })