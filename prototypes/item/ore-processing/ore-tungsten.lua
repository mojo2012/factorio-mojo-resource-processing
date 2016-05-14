require("ore-general")

-- item definitions
data:extend({
  {
    type= "item",
    name= "ore-tungsten-crushed",
    icon = "__mojo-resource-processing__/graphics/icons/ore-tungsten/crushed-ore-tungsten.png",
    flags= { "goes-to-main-inventory" },
    subgroup = "tungsten",
    order = "f[ore-tungsten-crushed]",
    stack_size= 50,
  },
  {
    type= "item",
    name= "ore-tungsten-pulverized",
    icon = "__mojo-resource-processing__/graphics/icons/ore-tungsten/pulverized-ore-tungsten.png",
    flags= { "goes-to-main-inventory" },
    subgroup = "tungsten",
    order = "f[ore-tungsten-pulverized]",
    stack_size= 50,
  }
})

-- item subgroup definition
data:extend({
    {
      type = "item-subgroup",
      name = "tungsten",
      group = "intermediate-products",
      order = "b2"
    }
  })

data.raw.item["tungsten-ore"].subgroup = "tungsten"

-- Minable ressources
data.raw["resource"]["tungsten-ore"].minable.result = nil
data.raw["resource"]["tungsten-ore"].minable.results = {
  ressourceItemMinMaxProb("tungsten-ore",   1, 1, 0.9), -- 1 item at percentage 0.9 --
  ressourceItemMinMaxProb("gravel",     1, 1, 0.45),
  ressourceItemMinMaxProb("dirt",       1, 1, 0.4)
}
