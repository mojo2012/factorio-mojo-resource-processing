require("ore-general")

-- item definitions
data:extend({
    {
      type= "item",
      name= "ore-iron-crushed",
      icon = "__mojo-resource-processing__/graphics/icons/ore-iron/crushed-ore-iron.png",
      flags= { "goes-to-main-inventory" },
      subgroup = "iron",
      order = "f[ore-iron-crushed]",
      stack_size= 50,
    },
    {
      type= "item",
      name= "ore-iron-pulverized",
      icon = "__mojo-resource-processing__/graphics/icons/ore-iron/pulverized-ore-iron.png",
      flags= { "goes-to-main-inventory" },
      subgroup = "iron",
      order = "f[ore-iron-pulverized]",
      stack_size= 50,
    },
    {
      type= "item",
      name= "ore-iron-nugget",
      icon = "__mojo-resource-processing__/graphics/icons/ore-iron/nugget-iron.png",
      flags= { "goes-to-main-inventory" },
      subgroup = "iron",
      order = "f[nugget-iron]",
      stack_size= 50,
    }
  })

-- item subgroup definition
data:extend({
    {
      type = "item-subgroup",
      name = "iron",
      group = "intermediate-products",
      order = "b2"
    }
  })

data.raw.item["iron-ore"].subgroup = "iron"

-- Minable ressources
data.raw["resource"]["iron-ore"].minable.result = nil
data.raw["resource"]["iron-ore"].minable.results = {
  ressourceItemMinMaxProb("iron-ore",   1, 1, 0.9), -- 1 item at percentage 0.9 --
  ressourceItemMinMaxProb("ore-iron-nugget",1, 1, 0.1),
  ressourceItemMinMaxProb("gravel",     1, 1, 0.45),
  ressourceItemMinMaxProb("dirt",       1, 1, 0.4)
}

