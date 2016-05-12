local seedscale = 0.1
local smallscale = 0.25
local mediumscale = 0.5
local bigscale = 0.8

tree_02_tint = {r=0.77, g=0.28, b=0.28, a=0.85}
tree_09_tint = {r=0.81, g=0.37, b=0.37, a=0.85}

local tree_types =
{
  { -- tree-09
    { -- a
      trunk = { width = 244, height = 170, shift = {2.07813, -1.14063}},
      leaves = { width = 123, height = 103, shift = {0.15625, -2.28125}}
    },
    { -- b
      trunk = { width = 208, height = 150, shift = {1.67188, -1.10938}},
      leaves = { width = 99, height = 86, shift = {-0.0625, -2.14063}}
    },
    { -- c
      trunk = { width = 238, height = 167, shift = {1.76563, -1.15625}},
      leaves = { width = 113, height = 96, shift = {-0.25, -2.29688}}
    },
    { -- d
      trunk = { width = 170, height = 116, shift = {1.45313, -0.984375}},
      leaves = { width = 90, height = 64, shift = {0.140625, -1.85938}}
    },
    { -- e
      trunk = { width = 202, height = 158, shift = {1.98438, -1.20313}},
      leaves = { width = 103, height = 104, shift = {0.375, -2.07813}}
    }
  },
  { -- tree-02
    { -- a
      trunk = { width = 227, height = 171, shift = {1.95313, -1.34063}},
      leaves = { width = 95, height = 130, shift = {-0.109375, -2.04375}}
    },
    { -- b
      trunk = { width = 227, height = 193, shift = {1.665625, -1.37187}},
      leaves = { width = 97, height = 143, shift = {-0.36563, -2.215625}}
    },
    { -- c
      trunk = { width = 251, height = 202, shift = {2.309375, -1.7125}},
      leaves = { width = 106, height = 154, shift = {0.04375, -2.525}}
    },
    { -- d
      trunk = { width = 271, height = 187, shift = {2.83438, -1.471875}},
      leaves = { width = 119, height = 154, shift = {0.49062, -2.01875}}
    },
    { -- e
      trunk = { width = 258, height = 192, shift = {2.25, -1.3}},
      leaves = { width = 104, height = 144, shift = {-0.125, -2.1125}}
    }
  },
}

local tree_datas =
{
  {
    type = 1,
    miningcount = 1,
    identifier = "red",
    scale = seedscale,
    drawing_box = {{-0.9 * seedscale, -3.5 * seedscale}, {0.9 * seedscale, 0.6 * seedscale}},
    colors =
    {
      --red - for green-grass
      {r = 196, g = 91, b = 91},
      {r = 207, g = 95, b = 95},
      {r = 250, g = 108, b = 108},
      {r = 222, g = 100, b = 100},
      {r = 223, g = 110, b = 84},
      {r = 234, g = 107, b = 78},
      {r = 217, g = 131, b = 111},
    }
  },
  {
    type = 1,
    miningcount = 1,
    identifier = "red",
    scale = smallscale,
    drawing_box = {{-0.9 * smallscale, -3.5 * smallscale}, {0.9 * smallscale, 0.6 * smallscale}},
    colors =
    {
      --red - for green-grass
      {r = 196, g = 91, b = 91},
      {r = 207, g = 95, b = 95},
      {r = 250, g = 108, b = 108},
      {r = 222, g = 100, b = 100},
      {r = 223, g = 110, b = 84},
      {r = 234, g = 107, b = 78},
      {r = 217, g = 131, b = 111},
    }
  },
  {
    type = 1,
    miningcount = 2,
    identifier = "red",
    scale = mediumscale,
    drawing_box = {{-0.9 * mediumscale, -3.5 * mediumscale}, {0.9 * mediumscale, 0.6 * mediumscale}},
    colors =
    {
      --red - for green-grass
      {r = 196, g = 91, b = 91},
      {r = 207, g = 95, b = 95},
      {r = 250, g = 108, b = 108},
      {r = 222, g = 100, b = 100},
      {r = 223, g = 110, b = 84},
      {r = 234, g = 107, b = 78},
      {r = 217, g = 131, b = 111},
    },
  },
  {
    type = 1,
    miningcount = 3,
    identifier = "red",
    scale = bigscale,
    drawing_box = {{-0.9 * bigscale, -3.5 * bigscale}, {0.9 * bigscale, 0.6 * bigscale}},
    colors =
    {
      --red - for green-grass
      {r = 196, g = 91, b = 91},
      {r = 207, g = 95, b = 95},
      {r = 250, g = 108, b = 108},
      {r = 222, g = 100, b = 100},
      {r = 223, g = 110, b = 84},
      {r = 234, g = 107, b = 78},
      {r = 217, g = 131, b = 111},
    },
  },


  {
    type = 2,
    miningcount = 1,
    identifier = "red",
    scale = seedscale,
    drawing_box = {{-0.9 * seedscale, -3.9 * seedscale}, {0.9 * seedscale, 0.6 * seedscale}},
    colors =
    {
      --tutti-colori
      --yels      
      {r = 239, g = 218, b = 43},
      {r = 232, g = 216, b = 85},
      {r = 242, g = 224, b = 28},
      {r = 217, g = 210, b = 29},
      {r = 252, g = 182, b = 72},
      {r = 196, g = 113, b = 76},
      {r = 213, g = 111, b = 66},
      --reds
      {r = 197, g = 73, b = 73},
      {r = 229, g = 92, b = 78},
      {r = 204, g = 86, b = 83},
      {r = 224, g = 82, b = 63},
      {r = 231, g = 94, b = 75},
      --grins
      {r = 175, g = 227, b = 85},
      {r = 182, g = 219, b = 119},
      {r = 152, g = 192, b = 81},
      {r = 173, g = 211, b = 113}
    }
  },
  {
    type = 2,
    miningcount = 1,
    identifier = "red",
    scale = smallscale,
    drawing_box = {{-0.9 * smallscale, -3.9 * smallscale}, {0.9 * smallscale, 0.6 * smallscale}},
    colors =
    {
      --tutti-colori
      --yels      
      {r = 239, g = 218, b = 43},
      {r = 232, g = 216, b = 85},
      {r = 242, g = 224, b = 28},
      {r = 217, g = 210, b = 29},
      {r = 252, g = 182, b = 72},
      {r = 196, g = 113, b = 76},
      {r = 213, g = 111, b = 66},
      --reds
      {r = 197, g = 73, b = 73},
      {r = 229, g = 92, b = 78},
      {r = 204, g = 86, b = 83},
      {r = 224, g = 82, b = 63},
      {r = 231, g = 94, b = 75},
      --grins
      {r = 175, g = 227, b = 85},
      {r = 182, g = 219, b = 119},
      {r = 152, g = 192, b = 81},
      {r = 173, g = 211, b = 113}
    }
  },
  {
    type = 2,
    miningcount = 2,
    identifier = "red",
    scale = mediumscale,
    drawing_box = {{-0.9 * mediumscale, -3.9 * mediumscale}, {0.9 * mediumscale, 0.6 * mediumscale}},
    colors =
    {
      --tutti-colori
      --yels      
      {r = 239, g = 218, b = 43},
      {r = 232, g = 216, b = 85},
      {r = 242, g = 224, b = 28},
      {r = 217, g = 210, b = 29},
      {r = 252, g = 182, b = 72},
      {r = 196, g = 113, b = 76},
      {r = 213, g = 111, b = 66},
      --reds
      {r = 197, g = 73, b = 73},
      {r = 229, g = 92, b = 78},
      {r = 204, g = 86, b = 83},
      {r = 224, g = 82, b = 63},
      {r = 231, g = 94, b = 75},
      --grins
      {r = 175, g = 227, b = 85},
      {r = 182, g = 219, b = 119},
      {r = 152, g = 192, b = 81},
      {r = 173, g = 211, b = 113}
    }
  },
  {
    type = 2,
    miningcount = 3,
    identifier = "red",
    scale = bigscale,
    drawing_box = {{-0.9 * bigscale, -3.9 * bigscale}, {0.9 * bigscale, 0.6 * bigscale}},
    colors =
    {
      --tutti-colori
      --yels      
      {r = 239, g = 218, b = 43},
      {r = 232, g = 216, b = 85},
      {r = 242, g = 224, b = 28},
      {r = 217, g = 210, b = 29},
      {r = 252, g = 182, b = 72},
      {r = 196, g = 113, b = 76},
      {r = 213, g = 111, b = 66},
      --reds
      {r = 197, g = 73, b = 73},
      {r = 229, g = 92, b = 78},
      {r = 204, g = 86, b = 83},
      {r = 224, g = 82, b = 63},
      {r = 231, g = 94, b = 75},
      --grins
      {r = 175, g = 227, b = 85},
      {r = 182, g = 219, b = 119},
      {r = 152, g = 192, b = 81},
      {r = 173, g = 211, b = 113}
    }
  },
}

local function index_to_letter(index, starting_at)
  return string.char(string.byte(starting_at or "a", 1) - 1 + index)
end

for i, tree_data in ipairs(tree_datas) do
  local type_name = ""
  local name = "treehouse-" .. i
  
  if i < 5 then
    type_name = "tree-09"
  else
    type_name = "tree-02"
  end

  local tree_variations = {}
  local tree_type = tree_data.type
  for variation_index, variation in ipairs(tree_types[tree_type]) do
    local variation_path = ""
    local variation_letter = index_to_letter(variation_index)
    if i < 5 then
      variation_path = "09/" .. type_name .. "-" .. variation_letter
    else
      variation_path = "02/" .. type_name .. "-" .. variation_letter
    end

    tree_variations[#tree_variations + 1] =
    {
      trunk =
      {
        filename = "__base__/graphics/entity/tree/" .. variation_path .. "-trunk.png",
        width = variation.trunk.width,
        height =  variation.trunk.height,
        scale = tree_data.scale,
        frame_count = 4,
        shift = {variation.trunk.shift[1] * tree_data.scale, variation.trunk.shift[2] * tree_data.scale}
      },
      leaves =
      {
        filename = "__base__/graphics/entity/tree/" .. variation_path .. "-leaves.png",
        width = variation.leaves.width,
        height = variation.leaves.height,
        scale = tree_data.scale,
        frame_count = 3,
        shift = {variation.leaves.shift[1] * tree_data.scale, variation.leaves.shift[2] * tree_data.scale}
      },
      leaf_generation =
      {
        type = "create-particle",
        entity_name = "leaf-particle",
        offset_deviation = {{-0.5 * tree_data.scale, -0.5 * tree_data.scale}, {0.5 * tree_data.scale, 0.5 * tree_data.scale}},
        initial_height = 2,
        initial_height_deviation = 1,
        speed_from_center = 0.01
      },
      branch_generation =
      {
        type = "create-particle",
        entity_name = "branch-particle",
        offset_deviation = {{-0.5 * tree_data.scale, -0.5 * tree_data.scale}, {0.5 * tree_data.scale, 0.5 * tree_data.scale}},
        initial_height = 2,
        initial_height_deviation = 2,
        speed_from_center = 0.01,
        frame_speed = 0.1,
        repeat_count = 15
      }
    }
  end
  
  data:extend(
  {
    {
      type = "tree",
      name = name,
      icon = "__base__/graphics/icons/" .. type_name .. ".png",
      flags = {"placeable-neutral", "placeable-off-grid", "breaths-air"},
      minable =
      {
        mining_particle = "wooden-particle",
        mining_time = i * 0.25,
        result = "raw-wood",
        count = tree_data.miningcount
      },
      corpse = name .. "-stump",
      remains_when_mined = name .. "-stump",
      emissions_per_tick = i * -0.0001,
      max_health = i * 10,
      collision_box = {{-0.4 * tree_data.scale, -0.4 * tree_data.scale}, {0.4 * tree_data.scale, 0.4 * tree_data.scale}},
      selection_box = {{-0.9 * tree_data.scale, -2.2 * tree_data.scale}, {0.9 * tree_data.scale, 0.6 * tree_data.scale}},
      drawing_box = tree_data.drawing_box,
      subgroup = "trees",
      order = "a[tree]-a[regular]",
      vehicle_impact_sound =  { filename = "__base__/sound/car-wood-impact.ogg", volume = 1.0 },
      variations = tree_variations,
      colors = tree_data.colors
    }
  })
end

for i, tree_data in ipairs(tree_datas) do
  local type_name = ""
  local name = "treehouse-" .. i
  if i < 5 then
    type_name = "tree-09"
  else
    type_name = "tree-02"
  end
  
  local stump_variations = {}
  local tree_type = tree_data.type
  for variation_index, variation in ipairs(tree_types[tree_type]) do
    local variation_path = ""
    local variation_letter = index_to_letter(variation_index)
      
    if i < 5 then
      variation_path = "09/" .. type_name .. "-" .. variation_letter
    else
      variation_path = "02/" .. type_name .. "-" .. variation_letter
    end

    stump_variations[#stump_variations + 1] =
    {
      filename = "__base__/graphics/entity/tree/" .. variation_path .. "-trunk.png",
      width = variation.trunk.width,
      height = variation.trunk.height,
      x = variation.trunk.width * 4,
      scale = tree_data.scale,
      frame_count = 1,
      direction_count = 1,
      shift = {variation.trunk.shift[1] * tree_data.scale, variation.trunk.shift[2] * tree_data.scale}
    }
  end

  data:extend(
  {
    {
      type = "corpse",
      name = name .. "-stump",
      icon = "__base__/graphics/icons/" .. type_name .. "-stump.png",
      flags = {"placeable-neutral", "not-on-map"},
      collision_box = {{-0.4 * tree_data.scale, -0.4 * tree_data.scale}, {0.4 * tree_data.scale, 0.4 * tree_data.scale}},
      selection_box = {{-0.5 * tree_data.scale, -0.5 * tree_data.scale}, {0.5 * tree_data.scale, 0.5 * tree_data.scale}},
      tile_width = 1,
      tile_height = 1,
      selectable_in_game = false,
      time_before_removed = i * 10 * 60,
      final_render_layer = "remnants",
      subgroup = "remnants",
      order="d[remnants]-b[tree]",
      animation = stump_variations
    }
  })
end



data:extend(
{
  {
    type = "logistic-container",
    name = "treehouse",
    icon = "__mojo-resource-processing__/graphics/icons/tree-farm/tree-farm.png",
    flags = {"placeable-neutral", "placeable-player", "player-creation"},
    minable = {mining_time = 2, result = "treehouse"},
    order = "h[th-3]",
    max_health = 150,
    corpse = "big-remnants",
    dying_explosion = "medium-explosion",
    resistances =
    {
      {
        type = "fire",
        percent = 70
      }
    },
    collision_box = {{-1.2, -1.2}, {1.2, 1.2}},
    selection_box = {{-1.5, -1.5}, {1.5, 1.5}},
    light = {intensity = 0.4, size = 5},
    inventory_size = 48,
    logistic_mode = "passive-provider",
    open_sound = { filename = "__base__/sound/machine-open.ogg", volume = 0.85 },
    close_sound = { filename = "__base__/sound/machine-close.ogg", volume = 0.75 },
    vehicle_impact_sound =  { filename = "__base__/sound/car-metal-impact.ogg", volume = 0.65 },
    working_sound =
    {
      sound = {
        {
          filename = "__base__/sound/assembling-machine-t1-1.ogg",
          volume = 0.8
        },
        {
          filename = "__base__/sound/assembling-machine-t1-2.ogg",
          volume = 0.8
        },
      },
      idle_sound = { filename = "__base__/sound/idle1.ogg", volume = 0.6 },
      apparent_volume = 1.5,
    },
    picture =
    {
      layers = 
      {
        {
          filename = "__mojo-resource-processing__/graphics/entity/tree-farm/tree-farm.png",
          width = 70,
          height = 170,
          frame_count = 1,
          shift = {0, -2},
        }
      }
    },
    circuit_wire_max_distance = 7.5
  },
  {
    type = "container",
    name = "treehouseOverlay",
    icon = "__mojo-resource-processing__/graphics/icons/tree-farm/tree-farm.png",
    flags = {"placeable-neutral", "placeable-player", "player-creation"},
    order = "h[th-3]",
    minable = {mining_time = 2, result = "treehouse"},
    max_health = 150,
    collision_box = {{-1.2, -1.2}, {1.2, 1.2}},
    selection_box = {{-1.5, -1.5}, {1.5, 1.5}},
    light = {intensity = 0.4, size = 5},
    inventory_size = 48,
    picture =
    {
      layers =
      {
        {
          filename = "__mojo-resource-processing__/graphics/entity/tree-farm/tree-farm-base.png",
          width = 608,
          height = 608,
          frame_count = 1,
          shift = {0, 0},
        },
        {
          filename = "__mojo-resource-processing__/graphics/entity/tree-farm/tree-farm.png",
          width = 70,
          height = 170,
          frame_count = 1,
          shift = {0, -2},
        }
      }
    },
  },
  
  {
    type = "decorative",
    name = "treehand",
    icon = "__base__/graphics/icons/tree-02.png",
    flags = {"placeable-neutral", "placeable-player", "player-creation"},
    collision_box = {{-0.5, -0.5}, {0.5, 0.5}},
    selection_box = {{-0.5, -0.5}, {0.5, 0.5}},
    minable = {mining_time = 0.5, result = "treehand"},
    pictures =
    {
      layers =
      {
        {
          filename = "__mojo-resource-processing__/graphics/entity/tree-farm/tree-farm-base.png",
          width = 160,
          height = 160,
          frame_count = 1,
          shift = {0, 0},
        },
        {
          filename = "__base__/graphics/entity/tree/02/tree-02-e-trunk.png",
          width = tree_types[2][5].trunk.width,
          height =  tree_types[2][5].trunk.height,
          frame_count = 3,
          shift = {tree_types[2][5].trunk.shift[1], tree_types[2][5].trunk.shift[2]}
        },
        {
          filename = "__base__/graphics/entity/tree/02/tree-02-e-leaves.png",
          width = tree_types[2][5].leaves.width,
          height = tree_types[2][5].leaves.height,
          frame_count = 3,
          shift = {tree_types[2][5].leaves.shift[1], tree_types[2][5].leaves.shift[2]},
          tint = tree_02_tint
        },
      }
    },
  },
  {
    type = "decorative",
    name = "treehand-red",
    icon = "__base__/graphics/icons/tree-09.png",
    flags = {"placeable-neutral", "placeable-player", "player-creation"},
    collision_box = {{-0.5, -0.5}, {0.5, 0.5}},
    selection_box = {{-0.5, -0.5}, {0.5, 0.5}},
    minable = {mining_time = 0.5, result = "treehand-red"},
    pictures =
    {
      layers =
      {
        {
          filename = "__mojo-resource-processing__/graphics/entity/tree-farm/tree-farm-base.png",
          width = 160,
          height = 160,
          frame_count = 1,
          shift = {0, 0},
        },
        {
          filename = "__base__/graphics/entity/tree/09/tree-09-b-trunk.png",
          width = tree_types[1][2].trunk.width,
          height =  tree_types[1][2].trunk.height,
          frame_count = 3,
          shift = {tree_types[1][2].trunk.shift[1], tree_types[1][2].trunk.shift[2]}
        },
        {
          filename = "__base__/graphics/entity/tree/09/tree-09-b-leaves.png",
          width = tree_types[1][2].leaves.width,
          height = tree_types[1][2].leaves.height,
          frame_count = 3,
          shift = {tree_types[1][2].leaves.shift[1], tree_types[1][2].leaves.shift[2]},
          tint = tree_09_tint
        },
      }
    },
  },
})