data:extend({
 { --dirt, can be burnt or used used to make primitive roads
    type = "item",
    name = "dirt",
    icon = "__mojo-resource-processing__/graphics/icons/ore-general/dirt.png",
    flags = { "goes-to-quickbar" },
    subgroup = "raw-resource",
    order = "f[dirt]",
    stack_size= 100,
  },
  { -- rock dust, can be used to create stone bricks
    type= "item",
    name= "gravel",
    icon = "__mojo-resource-processing__/graphics/icons/ore-general/gravel.png",
    flags= { "goes-to-main-inventory" },
    subgroup = "raw-resource",
    order = "f[gravel]",
    stack_size= 50,
  },
  { -- rock dust, can be used to create stone bricks
    type= "item",
    name= "slag",
    icon = "__mojo-resource-processing__/graphics/icons/ore-general/slag.png",
    flags= { "goes-to-main-inventory" },
    subgroup = "raw-resource",
    order = "f[slag]",
    stack_size= 50,
  },
  { -- crushed stone
    type= "item",
    name= "stone-crushed",
    icon = "__mojo-resource-processing__/graphics/icons/ore-general/crushed-stone.png",
    flags= { "goes-to-main-inventory" },
    subgroup = "raw-resource",
    order = "f[stone-crushed]",
    stack_size= 50,
  },
})


-- Place as tile
data.raw["item"]["dirt"].place_as_tile = {
    result = "dirt-marker",
    condition_size = 3,
    condition = { "water-tile" }
}
