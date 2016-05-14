-- reset original zinc plate recipe
data.raw["recipe"]["zinc-plate"] = nil


data:extend({
    { -- ore materials
      type = "recipe",
      name = "ore-zinc-crushed",
      category = "ore-crusher",
      subgroup = "zinc",
      energy_required = 3,
      icon = "__mojo-resource-processing__/graphics/icons/ore-zinc/crushed-ore-zinc.png",
      ingredients = {
        {"zinc-ore", 10}
      },
      enabled = false,
      results = {
      	{"ore-zinc-crushed", 7},
      	{"stone", 3}
      }
    },
    {
      type = "recipe",
      name = "ore-zinc-pulverized",
      category = "ore-pulverizer",
      subgroup = "zinc",
      energy_required = 3,
      icon = "__mojo-resource-processing__/graphics/icons/ore-zinc/pulverized-ore-zinc.png",
      ingredients = {
        {"ore-zinc-crushed", 10}
      },
      enabled = false,
      results = {
      	{"ore-zinc-pulverized", 8},
      	{"gravel", 2}
      }
    },
    
    { -- zinc plates
      type = "recipe",
      name = "zinc-plate",
      category = "smelting",
      subgroup = "zinc",
      energy_required = 10,
      icon = "__mojo-resource-processing__/graphics/icons/ore-zinc/zinc-plate.png",
      ingredients = {
        {"zinc-ore", 10}
      },
      enabled = true,
      results = {
      	{"zinc-plate", 3},
        {"slag", 4},
      }
    },
    {
      type = "recipe",
      name = "zinc-plate-crushed-ore",
      category = "smelting",
      subgroup = "zinc",
      energy_required = 8,
      icon = "__mojo-resource-processing__/graphics/icons/ore-zinc/zinc-plate.png",
      ingredients = {
        {"ore-zinc-crushed", 10}
      },
      enabled = false,
      results = {
      	{"zinc-plate", 6},
      	{"slag", 2}
      }
    },
    {
      type = "recipe",
      name = "zinc-plate-pulverized-ore",
      category = "smelting",
      subgroup = "zinc",
      energy_required = 8,
      icon = "__mojo-resource-processing__/graphics/icons/ore-zinc/zinc-plate.png",
      ingredients = {
        {"ore-zinc-pulverized", 10}
      },
      enabled = false,
      results = {
      	{"zinc-plate", 8}
      }
    },
  })