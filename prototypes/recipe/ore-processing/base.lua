require("prototypes.recipe.ore-processing.machine.crusher")
require("prototypes.recipe.ore-processing.machine.pulverizer")

require("prototypes.recipe.ore-processing.ore-iron")
require("prototypes.recipe.ore-processing.ore-copper")

data:extend({
    { -- concrete
      type = "recipe",
      name = "concrete-slag",
	  energy_required = 10,
	  enabled = false,
	  category = "crafting-with-fluid",
	  ingredients = {
		  {"slag", 8},
		  {type="fluid", name="water", amount=10}
		},
	  result= "concrete",
	  result_count = 10
    },

    { -- stone bricks
      type = "recipe",
      name = "stone-brick-gravel",
	  energy_required = 3.5,
	  enabled = false,
	  category = "smelting",
	  ingredients = {
		  {"gravel", 10},
		  {type="fluid", name="water", amount=2}
		},
	  result = "stone-brick",
	  result_count = 5
    },
  })
