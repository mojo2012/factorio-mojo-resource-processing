-- reset original lead plate recipe
data.raw["recipe"]["lead-plate"] = nil


data:extend({
    { -- ore materials
      type = "recipe",
      name = "ore-lead-crushed",
      category = "ore-crusher",
      subgroup = "lead",
      energy_required = 3,
      icon = "__mojo-resource-processing__/graphics/icons/ore-lead/crushed-ore-lead.png",
      ingredients = {
        {"lead-ore", 10}
      },
      enabled = false,
      results = {
      	{"ore-lead-crushed", 7},
      	{"stone", 3}
      }
    },
    {
      type = "recipe",
      name = "ore-lead-pulverized",
      category = "ore-pulverizer",
      subgroup = "lead",
      energy_required = 3,
      icon = "__mojo-resource-processing__/graphics/icons/ore-lead/pulverized-ore-lead.png",
      ingredients = {
        {"ore-lead-crushed", 10}
      },
      enabled = false,
      results = {
      	{"ore-lead-pulverized", 8},
      	{"gravel", 2}
      }
    },
    
    { -- lead plates
      type = "recipe",
      name = "lead-plate",
      category = "smelting",
      subgroup = "lead",
      energy_required = 10,
      icon = "__mojo-resource-processing__/graphics/icons/ore-lead/lead-plate.png",
      ingredients = {
        {"lead-ore", 10}
      },
      enabled = true,
      results = {
      	{"lead-plate", 3},
        {"slag", 4},
      }
    },
    {
      type = "recipe",
      name = "lead-plate-crushed-ore",
      category = "smelting",
      subgroup = "lead",
      energy_required = 8,
      icon = "__mojo-resource-processing__/graphics/icons/ore-lead/lead-plate.png",
      ingredients = {
        {"ore-lead-crushed", 10}
      },
      enabled = false,
      results = {
      	{"lead-plate", 6},
      	{"slag", 2}
      }
    },
    {
      type = "recipe",
      name = "lead-plate-pulverized-ore",
      category = "smelting",
      subgroup = "lead",
      energy_required = 8,
      icon = "__mojo-resource-processing__/graphics/icons/ore-lead/lead-plate.png",
      ingredients = {
        {"ore-lead-pulverized", 10}
      },
      enabled = false,
      results = {
      	{"lead-plate", 8}
      }
    },
  })