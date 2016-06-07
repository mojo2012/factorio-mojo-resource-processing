require("ore-general")

--[[
-- item definitions
data:extend({
  {
    type= "item",
    name= "ore-rutile-crushed",
    icon = "__mojo-resource-processing__/graphics/icons/ore-rutile/crushed-ore-rutile.png",
    flags= { "goes-to-main-inventory" },
    subgroup = "rutile",
    order = "f[ore-rutile-crushed]",
    stack_size= 50,
  },
  {
    type= "item",
    name= "ore-rutile-pulverized",
    icon = "__mojo-resource-processing__/graphics/icons/ore-rutile/pulverized-ore-rutile.png",
    flags= { "goes-to-main-inventory" },
    subgroup = "rutile",
    order = "f[ore-rutile-pulverized]",
    stack_size= 50,
  }
})
]]--

-- item subgroup definition
data:extend({
    {
      type = "item-subgroup",
      name = "rutile",
      group = "intermediate-products",
      order = "b2"
    }
  })



data.raw.item["rutile-ore"].subgroup = "rutile"
-- Minable ressources
data.raw["resource"]["rutile-ore"].minable.result = nil
data.raw["resource"]["rutile-ore"].minable.results = {
  ressourceItemMinMaxProb("rutile-ore",   1, 1, 0.3), -- 1 item at percentage 0.9 --
  ressourceItemMinMaxProb("gravel",     1, 1, 0.5),
  ressourceItemMinMaxProb("stone",     1, 1, 0.4),
  ressourceItemMinMaxProb("dirt",       1, 1, 0.7)
}
