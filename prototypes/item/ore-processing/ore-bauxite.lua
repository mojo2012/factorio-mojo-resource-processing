require("ore-general")

-- item definitions
data:extend({
  {
    type= "item",
    name= "ore-bauxite-crushed",
    icon = "__mojo-resource-processing__/graphics/icons/ore-bauxite/crushed-ore-bauxite.png",
    flags= { "goes-to-main-inventory" },
    subgroup = "bauxite",
    order = "f[ore-bauxite-crushed]",
    stack_size= 50,
  },
  {
    type= "item",
    name= "ore-bauxite-pulverized",
    icon = "__mojo-resource-processing__/graphics/icons/ore-bauxite/pulverized-ore-bauxite.png",
    flags= { "goes-to-main-inventory" },
    subgroup = "bauxite",
    order = "f[ore-bauxite-pulverized]",
    stack_size= 50,
  }
})


-- item subgroup definition
data:extend({
  {
    type = "item-subgroup",
    name = "bauxite",
    group = "intermediate-products",
    order = "b2"
  }
})

data.raw.item["bauxite-ore"].subgroup = "bauxite"

-- Minable ressources
data.raw["resource"]["bauxite-ore"].minable.result = nil
data.raw["resource"]["bauxite-ore"].minable.results = {
  ressourceItemMinMaxProb("bauxite-ore",   1, 1, 0.8), -- 1 item at percentage 0.9 --
  ressourceItemMinMaxProb("gravel",     1, 1, 0.35),
  ressourceItemMinMaxProb("dirt",       1, 1, 0.2)
}
