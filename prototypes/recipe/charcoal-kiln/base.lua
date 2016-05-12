data:extend({
  {
    type = "recipe-category",
    name = "charcoal-kiln"
  },
  {
    type = "recipe",
    name = "charcoal-kiln",
    enabled = "true",
    ingredients =
    {
      {"stone-brick", 5},
      {"iron-gear-wheel", 6},
      {"iron-plate", 4}
    },
    result = "charcoal-kiln"
  },
  {
	type = "recipe",
    name = "coal",
	energy_required = 2,
	category = "charcoal-kiln",
    ingredients = {{"raw-wood", 2.0}},
    result = "coal"
  }
  })
