require("ore-general")

-- item definitions
data:extend({
  {
    type= "item",
    name= "ore-copper-crushed",
    icon = "__mojo-resource-processing__/graphics/icons/ore-copper/crushed-ore-copper.png",
    flags= { "goes-to-main-inventory" },
    subgroup = "copper",
    order = "f[ore-copper-crushed]",
    stack_size= 50,
  },
  {
    type= "item",
    name= "ore-copper-pulverized",
    icon = "__mojo-resource-processing__/graphics/icons/ore-copper/pulverized-ore-copper.png",
    flags= { "goes-to-main-inventory" },
    subgroup = "copper",
    order = "f[ore-copper-pulverized]",
    stack_size= 50,
  }
})

-- item subgroup definition
data:extend({
    {
      type = "item-subgroup",
      name = "copper",
      group = "intermediate-products",
      order = "b2"
    }
  })

data.raw.item["copper-ore"].subgroup = "copper"

-- Minable ressources
data.raw["resource"]["copper-ore"].minable.result = nil
data.raw["resource"]["copper-ore"].minable.results = {
  ressourceItemMinMaxProb("copper-ore",   1, 1, 0.9), -- 1 item at percentage 0.9 --
  ressourceItemMinMaxProb("gravel",     1, 1, 0.35),
  ressourceItemMinMaxProb("dirt",       1, 1, 0.2)
}
