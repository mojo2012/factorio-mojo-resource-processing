require("ore-general")

-- item definitions
data:extend({
  {
    type= "item",
    name= "ore-tin-crushed",
    icon = "__mojo-resource-processing__/graphics/icons/ore-tin/crushed-ore-tin.png",
    flags= { "goes-to-main-inventory" },
    subgroup = "tin",
    order = "f[ore-tin-crushed]",
    stack_size= 50,
  },
  {
    type= "item",
    name= "ore-tin-pulverized",
    icon = "__mojo-resource-processing__/graphics/icons/ore-tin/pulverized-ore-tin.png",
    flags= { "goes-to-main-inventory" },
    subgroup = "tin",
    order = "f[ore-tin-pulverized]",
    stack_size= 50,
  }
})

-- item subgroup definition
data:extend({
    {
      type = "item-subgroup",
      name = "tin",
      group = "intermediate-products",
      order = "b2"
    }
  })

data.raw.item["tin-ore"].subgroup = "tin"

-- Minable ressources
data.raw["resource"]["tin-ore"].minable.result = nil
data.raw["resource"]["tin-ore"].minable.results = {
  ressourceItemMinMaxProb("tin-ore",   1, 1, 0.9), -- 1 item at percentage 0.9 --
  ressourceItemMinMaxProb("gravel",     1, 1, 0.45),
  ressourceItemMinMaxProb("dirt",       1, 1, 0.4)
}
