-- reset original quartz plate recipe
data.raw["recipe"]["quartz-plate"] = nil


data:extend({
    {
      type = "recipe",
      name = "quartz-sand",
      category = "ore-pulverizer",
      subgroup = "quartz",
      energy_required = 3,
      icon = "__mojo-resource-processing__/graphics/icons/ore-quartz/quartz-sand.png",
      ingredients = {
        {"quartz", 3}
      },
      enabled = false,
      results = {
      	{"quartz-sand", 5},
      	{"dirt", 1}
      }
    },
    
    { -- glass
      type = "recipe",
      name = "glass-plate",
      category = "smelting",
      subgroup = "quartz",
      energy_required = 10,
      icon = "__mojo-resource-processing__/graphics/icons/ore-quartz/glass-plate.png",
      ingredients = {
        {"quartz-sand", 2}
      },
      enabled = false,
      results = {
      	{"glass-plate", 1}
      }
    },
    {
      type = "recipe",
      name = "cut-glass",
      category = "advanced-crafting",
      subgroup = "quartz",
      energy_required = 3,
      icon = "__mojo-resource-processing__/graphics/icons/ore-quartz/cut-glass.png",
      ingredients = {
        {"glass-plate", 1}
      },
      enabled = false,
      results = {
      	{"cut-glass", 1}
      }
    },
  })