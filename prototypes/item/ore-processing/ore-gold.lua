require("ore-general")

-- item definitions
data:extend({
    {
      type= "item",
      name= "ore-gold-crushed",
      icon = "__mojo-resource-processing__/graphics/icons/ore-gold/crushed-ore-gold.png",
      flags= { "goes-to-main-inventory" },
      subgroup = "gold",
      order = "f[ore-gold-crushed]",
      stack_size= 50,
    },
    {
      type= "item",
      name= "ore-gold-pulverized",
      icon = "__mojo-resource-processing__/graphics/icons/ore-gold/pulverized-ore-gold.png",
      flags= { "goes-to-main-inventory" },
      subgroup = "gold",
      order = "f[ore-gold-pulverized]",
      stack_size= 50,
    },
    {
      type= "item",
      name= "ore-gold-nugget",
      icon = "__mojo-resource-processing__/graphics/icons/ore-gold/nugget-gold.png",
      flags= { "goes-to-main-inventory" },
      subgroup = "gold",
      order = "f[nugget-gold]",
      stack_size= 50,
    }
  })

-- item subgroup definition
data:extend({
    {
      type = "item-subgroup",
      name = "gold",
      group = "intermediate-products",
      order = "b2"
    }
  })

data.raw.item["gold-ore"].subgroup = "gold"

-- Minable ressources
data.raw["resource"]["gold-ore"].minable.result = nil
data.raw["resource"]["gold-ore"].minable.results = {
  ressourceItemMinMaxProb("gold-ore",   1, 1, 0.9), -- 1 item at percentage 0.9 --
  ressourceItemMinMaxProb("ore-gold-nugget",1, 1, 0.1),
  ressourceItemMinMaxProb("gravel",     1, 1, 0.45),
  ressourceItemMinMaxProb("dirt",       1, 1, 0.4)
}

