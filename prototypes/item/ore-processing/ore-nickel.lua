require("ore-general")

-- item definitions
data:extend({
  {
    type= "item",
    name= "ore-nickel-crushed",
    icon = "__mojo-resource-processing__/graphics/icons/ore-nickel/crushed-ore-nickel.png",
    flags= { "goes-to-main-inventory" },
    subgroup = "nickel",
    order = "f[ore-nickel-crushed]",
    stack_size= 50,
  },
  {
    type= "item",
    name= "ore-nickel-pulverized",
    icon = "__mojo-resource-processing__/graphics/icons/ore-nickel/pulverized-ore-nickel.png",
    flags= { "goes-to-main-inventory" },
    subgroup = "nickel",
    order = "f[ore-nickel-pulverized]",
    stack_size= 50,
  }
})

-- item subgroup definition
data:extend({
    {
      type = "item-subgroup",
      name = "nickel",
      group = "intermediate-products",
      order = "b2"
    }
  })

data.raw.item["nickel-ore"].subgroup = "nickel"

-- Minable ressources
data.raw["resource"]["nickel-ore"].minable.result = nil
data.raw["resource"]["nickel-ore"].minable.results = {
  ressourceItemMinMaxProb("nickel-ore",   1, 1, 0.9), -- 1 item at percentage 0.9 --
  ressourceItemMinMaxProb("gravel",     1, 1, 0.45),
  ressourceItemMinMaxProb("dirt",       1, 1, 0.4)
}
