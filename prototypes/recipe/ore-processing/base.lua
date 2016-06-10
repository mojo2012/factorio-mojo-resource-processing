require("prototypes.recipe.ore-processing.machine.crusher")
require("prototypes.recipe.ore-processing.machine.pulverizer")

-- original ores
require("prototypes.recipe.ore-processing.ore-iron")
require("prototypes.recipe.ore-processing.ore-copper")

-- bobores - extended
require("prototypes.recipe.ore-processing.ore-bauxite")
require("prototypes.recipe.ore-processing.ore-gold")
require("prototypes.recipe.ore-processing.ore-lead")
require("prototypes.recipe.ore-processing.ore-nickel")
require("prototypes.recipe.ore-processing.ore-quartz")
require("prototypes.recipe.ore-processing.ore-silver")
require("prototypes.recipe.ore-processing.ore-tin")
require("prototypes.recipe.ore-processing.ore-tungsten")
require("prototypes.recipe.ore-processing.ore-zinc")

require("prototypes.recipe.ore-processing.metal-products")


-- gems
require("prototypes.recipe.ore-processing.ore-rutile")
require("prototypes.recipe.ore-processing.ore-quartz")
--require("prototypes.recipe.ore-processing.ore-gemstone")

data:extend({
    { -- concrete
      type = "recipe",
      name = "concrete-slag",
	  energy_required = 10,
	  enabled = false,
	  category = "crafting-with-fluid",
	  ingredients = {
		  {"slag", 5},
		  {type="fluid", name="water", amount=10}
		},
	  results = {
	  	{"concrete", 1},
	  }
    },

    { -- stone bricks
      type = "recipe",
      name = "stone-brick-gravel",
	  energy_required = 3.5,
	  enabled = true,
	  category = "smelting",
	  ingredients = {
		  {"gravel", 4}
		},
	  results = { 
	  	{"stone-brick", 1},
	  }
    },

    { -- crushed stone 
      type = "recipe",
      name = "stone-crushed",
      category = "ore-crusher",
      subgroup = "raw-resource",
      energy_required = 2,
      icon = "__mojo-resource-processing__/graphics/icons/ore-general/crushed-stone.png",
      ingredients = {
        {"stone", 2}
      },
      enabled = false,
      results = {
      	{"stone-crushed", 2}
      }
    },
})
