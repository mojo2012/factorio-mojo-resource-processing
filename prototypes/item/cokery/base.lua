data:extend({
  {
    type = "item",
    name = "cokery",
    icon = "__mojo-resource-processing__/graphics/icons/cokery/cokery.png",
    flags = {"goes-to-quickbar"},
    subgroup = "production-machine",
    order = "a-a-a",
    place_result = "cokery",
    stack_size = 50
  },
  {
    type = "item",
    name = "cokery-electric",
    icon = "__mojo-resource-processing__/graphics/icons/cokery/cokery.png",
    flags = {"goes-to-quickbar"},
    subgroup = "production-machine",
    order = "a-a-a",
    place_result = "cokery-electric",
    stack_size = 50
  },
  { -- charcoal
    type = "item",
    name = "charcoal",
    icon = "__mojo-resource-processing__/graphics/icons/cokery/charcoal.png",
    flags = {"goes-to-main-inventory"},
    fuel_value = "6MJ",
    subgroup = "raw-material",
    order = "b[coal]-a[th-1]",
    stack_size = 50
  },
  { -- charcoal dust
    type = "item",
    name = "charcoal-dust",
    icon = "__mojo-resource-processing__/graphics/icons/cokery/charcoal-dust.png",
    flags = {"goes-to-main-inventory"},
    fuel_value = "1MJ",
    subgroup = "raw-material",
    order = "b[coal]-a[th-2]",
    stack_size = 50
  },
})
