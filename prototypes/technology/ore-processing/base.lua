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
        --iron
        {
          type = "unlock-recipe",
          recipe = "ore-iron-crushed"
        },
        {
          type = "unlock-recipe",
          recipe = "iron-plate-crushed-ore"
        },
        --copper
        {
          type = "unlock-recipe",
          recipe = "ore-copper-crushed"
        },
        {
          type = "unlock-recipe",
          recipe = "copper-plate-crushed-ore"
        },
        --bauxite
        {
          type = "unlock-recipe",
          recipe = "ore-bauxite-crushed"
        },
        {
          type = "unlock-recipe",
          recipe = "aluminium-plate-crushed-ore"
        },
        --gold
        {
          type = "unlock-recipe",
          recipe = "ore-gold-crushed"
        },
        {
          type = "unlock-recipe",
          recipe = "gold-plate-crushed-ore"
        },
        --lead
        {
          type = "unlock-recipe",
          recipe = "ore-lead-crushed"
        },
        {
          type = "unlock-recipe",
          recipe = "lead-plate-crushed-ore"
        },
        --nickel
        {
          type = "unlock-recipe",
          recipe = "ore-nickel-crushed"
        },
        {
          type = "unlock-recipe",
          recipe = "nickel-plate-crushed-ore"
        },
        --tin
        {
          type = "unlock-recipe",
          recipe = "ore-tin-crushed"
        },
        {
          type = "unlock-recipe",
          recipe = "tin-plate-crushed-ore"
        },
        --tungsten
        {
          type = "unlock-recipe",
          recipe = "ore-tungsten-crushed"
        },
        {
          type = "unlock-recipe",
          recipe = "tungsten-plate-crushed-ore"
        },
        --zinc
        {
          type = "unlock-recipe",
          recipe = "ore-zinc-crushed"
        },
        {
          type = "unlock-recipe",
          recipe = "zinc-plate-crushed-ore"
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
        --iron
        {
          type = "unlock-recipe",
          recipe = "ore-iron-pulverized"
        },
        {
          type = "unlock-recipe",
          recipe = "iron-plate-pulverized-ore"
        },
        --copper
        {
          type = "unlock-recipe",
          recipe = "ore-copper-pulverized"
        },
        {
          type = "unlock-recipe",
          recipe = "copper-plate-pulverized-ore"
        },
        --bauxite
        {
          type = "unlock-recipe",
          recipe = "ore-bauxite-pulverized"
        },
        {
          type = "unlock-recipe",
          recipe = "aluminium-plate-pulverized-ore"
        },
        --gold
        {
          type = "unlock-recipe",
          recipe = "ore-gold-pulverized"
        },
        {
          type = "unlock-recipe",
          recipe = "gold-plate-pulverized-ore"
        },
        --lead
        {
          type = "unlock-recipe",
          recipe = "ore-lead-pulverized"
        },
        {
          type = "unlock-recipe",
          recipe = "lead-plate-pulverized-ore"
        },
        --nickel
        {
          type = "unlock-recipe",
          recipe = "ore-nickel-pulverized"
        },
        {
          type = "unlock-recipe",
          recipe = "nickel-plate-pulverized-ore"
        },
        --tin
        {
          type = "unlock-recipe",
          recipe = "ore-tin-pulverized"
        },
        {
          type = "unlock-recipe",
          recipe = "tin-plate-pulverized-ore"
        },
        --tungsten
        {
          type = "unlock-recipe",
          recipe = "ore-tungsten-pulverized"
        },
        {
          type = "unlock-recipe",
          recipe = "tungsten-plate-pulverized-ore"
        },
        --zinc
        {
          type = "unlock-recipe",
          recipe = "ore-zinc-pulverized"
        },
        {
          type = "unlock-recipe",
          recipe = "zinc-plate-pulverized-ore"
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


-- insert concrete-slag recipe into advanced-material-processing-2 technology
addTechnologyUnlocksRecipe("advanced-material-processing-2", "concrete-slag")