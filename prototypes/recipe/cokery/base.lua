data:extend({
  {
    type = "recipe-category",
    name = "cokery"
  },
  {
    type = "recipe",
    name = "cokery",
    enabled = "false",
    ingredients = {
      {"stone-furnace",1},
      {"iron-gear-wheel", 6},
      {"iron-plate", 4}
    },
    result = "cokery"
  },
  {
    type = "recipe",
    name = "cokery-electric",
    enabled = "false",
    ingredients = {
      {"stone", 20},
      {"iron-gear-wheel", 6},
      {"iron-plate", 4},
      {"copper-cable", 10}
    },
    result = "cokery-electric"
  },
  {
    type = "recipe",
    name = "coal",
    enabled = "false",
    energy_required = 2,
    category = "cokery",
    ingredients = {{"raw-wood", 2.0}},
    result = "coal"
  },
})
