require("ore-general")

-- item definitions
data:extend({
  {
    type= "item",
    name= "quarz",
    icon = "__mojo-resource-processing__/graphics/icons/ore-quartz/ore-quartz.png",
    flags= { "goes-to-main-inventory" },
    subgroup = "quartz",
    order = "f[ore-sand]",
    stack_size= 50,
  },
  {
    type= "item",
    name= "quartz-sand",
    icon = "__mojo-resource-processing__/graphics/icons/ore-quartz/quartz-sand.png",
    flags= { "goes-to-main-inventory" },
    subgroup = "quartz",
    order = "f[glass-plate]",
    stack_size= 50,
  },

  -- glass production
  {
    type= "item",
    name= "glass-plate",
    icon = "__mojo-resource-processing__/graphics/icons/ore-quartz/glass-plate.png",
    flags= { "goes-to-main-inventory" },
    subgroup = "quartz",
    order = "f[cut-glass]",
    stack_size= 50,
  },
  {
    type= "item",
    name= "cut-glass",
    icon = "__mojo-resource-processing__/graphics/icons/ore-quartz/cut-glass.png",
    flags= { "goes-to-main-inventory" },
    subgroup = "quartz",
    --order = "f[]",
    stack_size= 50,
  }
})

-- item subgroup definition
data:extend({
    {
      type = "item-subgroup",
      name = "quartz",
      group = "intermediate-products",
      order = "b2"
    }
  })

data.raw.item["quartz"].subgroup = "quartz"

-- Minable ressources
data.raw["resource"]["quartz"].minable.result = nil
data.raw["resource"]["quartz"].minable.results = {
  ressourceItemMinMaxProb("quartz",   1, 1, 0.3), -- 1 item at percentage 0.9 --
  ressourceItemMinMaxProb("gravel",     1, 1, 0.5),
  ressourceItemMinMaxProb("stone",     1, 1, 0.4),
  ressourceItemMinMaxProb("dirt",       1, 1, 0.7)
}
