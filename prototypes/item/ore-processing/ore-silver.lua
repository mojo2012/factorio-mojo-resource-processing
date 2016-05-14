require("ore-general")

-- item definitions
data:extend({
    {
      type= "item",
      name= "ore-silver-crushed",
      icon = "__mojo-resource-processing__/graphics/icons/ore-silver/crushed-ore-silver.png",
      flags= { "goes-to-main-inventory" },
      subgroup = "silver",
      order = "f[ore-silver-crushed]",
      stack_size= 50,
    },
    {
      type= "item",
      name= "ore-silver-pulverized",
      icon = "__mojo-resource-processing__/graphics/icons/ore-silver/pulverized-ore-silver.png",
      flags= { "goes-to-main-inventory" },
      subgroup = "silver",
      order = "f[ore-silver-pulverized]",
      stack_size= 50,
    },
    {
      type= "item",
      name= "ore-silver-nugget",
      icon = "__mojo-resource-processing__/graphics/icons/ore-silver/nugget-silver.png",
      flags= { "goes-to-main-inventory" },
      subgroup = "silver",
      order = "f[nugget-silver]",
      stack_size= 50,
    }
  })

-- item subgroup definition
data:extend({
    {
      type = "item-subgroup",
      name = "silver",
      group = "intermediate-products",
      order = "b2"
    }
  })

data.raw.item["silver-ore"].subgroup = "silver"


-- Minable ressources
data.raw["resource"]["silver-ore"].minable.result = nil
data.raw["resource"]["silver-ore"].minable.results = {
  ressourceItemMinMaxProb("silver-ore",   1, 1, 0.9), -- 1 item at percentage 0.9 --
  ressourceItemMinMaxProb("ore-silver-nugget",1, 1, 0.1),
  ressourceItemMinMaxProb("gravel",     1, 1, 0.45),
  ressourceItemMinMaxProb("dirt",       1, 1, 0.4)
}

