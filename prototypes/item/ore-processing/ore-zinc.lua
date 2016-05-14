require("ore-general")

-- item definitions
data:extend({
  {
    type= "item",
    name= "ore-zinc-crushed",
    icon = "__mojo-resource-processing__/graphics/icons/ore-zinc/crushed-ore-zinc.png",
    flags= { "goes-to-main-inventory" },
    subgroup = "zinc",
    order = "f[ore-zinc-crushed]",
    stack_size= 50,
  },
  {
    type= "item",
    name= "ore-zinc-pulverized",
    icon = "__mojo-resource-processing__/graphics/icons/ore-zinc/pulverized-ore-zinc.png",
    flags= { "goes-to-main-inventory" },
    subgroup = "zinc",
    order = "f[ore-zinc-pulverized]",
    stack_size= 50,
  }
})

-- item subgroup definition
data:extend({
    {
      type = "item-subgroup",
      name = "zinc",
      group = "intermediate-products",
      order = "b2"
    }
  })

data.raw.item["zinc-ore"].subgroup = "zinc"

-- Minable ressources
data.raw["resource"]["zinc-ore"].minable.result = nil
data.raw["resource"]["zinc-ore"].minable.results = {
  ressourceItemMinMaxProb("zinc-ore",   1, 1, 0.9), -- 1 item at percentage 0.9 --
  ressourceItemMinMaxProb("gravel",     1, 1, 0.45),
  ressourceItemMinMaxProb("dirt",       1, 1, 0.4)
}
