require("ore-general")

-- item definitions
data:extend({
  {
    type= "item",
    name= "ore-lead-crushed",
    icon = "__mojo-resource-processing__/graphics/icons/ore-lead/crushed-ore-lead.png",
    flags= { "goes-to-main-inventory" },
    subgroup = "lead",
    order = "f[ore-lead-crushed]",
    stack_size= 50,
  },
  {
    type= "item",
    name= "ore-lead-pulverized",
    icon = "__mojo-resource-processing__/graphics/icons/ore-lead/pulverized-ore-lead.png",
    flags= { "goes-to-main-inventory" },
    subgroup = "lead",
    order = "f[ore-lead-pulverized]",
    stack_size= 50,
  }
})

-- item subgroup definition
data:extend({
    {
      type = "item-subgroup",
      name = "lead",
      group = "intermediate-products",
      order = "b2"
    }
  })

data.raw.item["lead-ore"].subgroup = "lead"

-- Minable ressources
data.raw["resource"]["lead-ore"].minable.result = nil
data.raw["resource"]["lead-ore"].minable.results = {
  ressourceItemMinMaxProb("lead-ore",   1, 1, 0.9), -- 1 item at percentage 0.9 --
  ressourceItemMinMaxProb("gravel",     1, 1, 0.45),
  ressourceItemMinMaxProb("dirt",       1, 1, 0.4)
}
