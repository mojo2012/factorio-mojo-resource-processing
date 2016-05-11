data:extend({
    {
      type = "technology",
      name = "ore-crusher",
      icon = "__mojo-resource-processing__/graphics/icons/ore-processing/crusher.png",
      prerequisites = {},
      effects = {
        {
          type = "unlock-recipe",
          recipe = "ore-crusher"
        },
        {
          type = "unlock-recipe",
          recipe = "ore-crusher"
        }
      },
      unit = {
        count = 42,
        ingredients = {
          {"science-pack-1", 1}
        },
        time = 20
      },
      order = "_crusher"
    }
  })

data:extend({
    {
      type = "technology",
      name = "ore-pulverizer",
      icon = "__mojo-resource-processing__/graphics/icons/ore-processing/pulverizer.png",
      prerequisites = {"ore-crusher", "steel-processing", "advanced-material-processing", },
      effects = {
        {
          type = "unlock-recipe",
          recipe = "ore-pulverizer"
        },
        {
          type = "unlock-recipe",
          recipe = "ore-copper-pulverized"
        }
      },
      unit = {
        count = 50,
        ingredients = {
          {"science-pack-1", 2},
          {"science-pack-2", 1}
        },
        time = 30
      },
      order = "_crusher-2"
    }
  })