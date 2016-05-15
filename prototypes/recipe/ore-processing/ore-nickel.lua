-- reset original nickel plate recipe
data.raw["recipe"]["nickel-plate"] = nil


data:extend({
    { -- ore materials
      type = "recipe",
      name = "ore-nickel-crushed",
      category = "ore-crusher",
      subgroup = "nickel",
      energy_required = 3,
      icon = "__mojo-resource-processing__/graphics/icons/ore-nickel/crushed-ore-nickel.png",
      ingredients = {
        {"nickel-ore", 10}
      },
      enabled = false,
      results = {
      	{"ore-nickel-crushed", 7},
      	{"stone", 3}
      }
    },
    {
      type = "recipe",
      name = "ore-nickel-pulverized",
      category = "ore-pulverizer",
      subgroup = "nickel",
      energy_required = 3,
      icon = "__mojo-resource-processing__/graphics/icons/ore-nickel/pulverized-ore-nickel.png",
      ingredients = {
        {"ore-nickel-crushed", 10}
      },
      enabled = false,
      results = {
      	{"ore-nickel-pulverized", 8},
      	{"gravel", 2}
      }
    },
    
    { -- nickel plates
      type = "recipe",
      name = "nickel-plate",
      category = "smelting",
      subgroup = "nickel",
      energy_required = 10,
      icon = "__mojo-resource-processing__/graphics/icons/ore-nickel/nickel-plate.png",
      ingredients = {
        {"nickel-ore", 10}
      },
      enabled = true,
      results = {
      	{"nickel-plate", 3},
        {"slag", 4},
      }
    },
    {
      type = "recipe",
      name = "nickel-plate-crushed-ore",
      category = "smelting",
      subgroup = "nickel",
      energy_required = 8,
      icon = "__mojo-resource-processing__/graphics/icons/ore-nickel/nickel-plate.png",
      ingredients = {
        {"ore-nickel-crushed", 10}
      },
      enabled = false,
      results = {
      	{"nickel-plate", 6},
      	{"slag", 2}
      }
    },
    {
      type = "recipe",
      name = "nickel-plate-pulverized-ore",
      category = "smelting",
      subgroup = "nickel",
      energy_required = 8,
      icon = "__mojo-resource-processing__/graphics/icons/ore-nickel/nickel-plate.png",
      ingredients = {
        {"ore-nickel-pulverized", 10}
      },
      enabled = false,
      results = {
      	{"nickel-plate", 8}
      }
    },
  })