data:extend({

  -- machines
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

  -- resources
  {
    type = "recipe",
    name = "charcoal",
    icon = "__mojo-resource-processing__/graphics/icons/cokery/charcoal.png",
    enabled = "false",
    energy_required = 2,
    category = "cokery",
    subgroup = "raw-material",
    ingredients = {
      {"raw-wood", 3}
    },
    results = {
      {"charcoal", 3},
      {"charcoal-dust", 1},
    },
  },
  --[[{
    type = "recipe",
    name = "charcoal-dust",
    icon = "__mojo-resource-processing__/graphics/icons/cokery/charcoal-dust.png",
    enabled = "false",
    energy_required = 2,
    subgroup = "raw-material",
    ingredients = {
      {"charcoal", 1}
    },
    results = {
      {"charcoal-dust", 1}
    },
  },
  ]]--
})
