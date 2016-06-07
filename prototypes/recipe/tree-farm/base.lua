data:extend({
  { -- robot
    type = "recipe",
    name = "tree-robot",
    ingredients = {
      {"iron-axe", 1},
      {"iron-plate", 10},
      {"electronic-circuit", 5},
    },
    result = "tree-robot"
  },
  { -- tree house
       type = "recipe",
       name = "treehouse",
       ingredients = {
          {"iron-plate", 40},
          {"steel-plate", 20},
          {"electronic-circuit", 20},
       },
       energy_required = 3,
       result = "treehouse"
  },
  { -- fertilizer chest
    type = "recipe",
    name = "treehouse-chest",
    ingredients = {{"iron-plate", 3}},
    result = "treehouse-chest"
  },


  { -- trees
       type = "recipe",
       name = "treehand-red",
       ingredients = {
          {"raw-wood", 1},
       },
       result = "treehand-red"
  },
  {
       type = "recipe",
       name = "treehand",
       ingredients = {
          {"raw-wood", 1},
       },
       result = "treehand"
  },
})