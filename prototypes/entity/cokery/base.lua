data:extend({
  {
    type = "assembling-machine",
    name = "cokery",
    icon = "__mojo-resource-processing__/graphics/icons/cokery/cokery.png",
    flags = {"placeable-neutral","placeable-player", "player-creation"},
    order = "a[cokery]",
    minable = {hardness = 0.2, mining_time = 0.5, result = "cokery"},
    max_health = 200,
    corpse = "big-remnants",
    resistances = {{type = "fire", percent = 70}},
    collision_box = {{-1.4, -2.0}, {1.4, 2.4}},
    selection_box = {{-1.5, -2.5}, {1.5, 2.5}},
    module_slots = 2,
    allowed_effects = {"consumption", "speed"},

    animation =
    {
      north =
      {
        filename = "__mojo-resource-processing__/graphics/entity/cokery/cokery-idle.png",
        width = 100,
        height = 160,
        frame_count = 1,
        line_length = 1,
        shift = {0, 0}
      },
      south =
      {
        filename = "__mojo-resource-processing__/graphics/entity/cokery/cokery-idle.png",
        width = 100,
        height = 160,
        frame_count = 1,
        line_length = 1,
        shift = {0, 0}
      },
      west =
      {
        filename = "__mojo-resource-processing__/graphics/entity/cokery/cokery-idle.png",
        width = 100,
        height = 160,
        frame_count = 1,
        line_length = 1,
        shift = {0, 0}
      },
      east =
      {
        filename = "__mojo-resource-processing__/graphics/entity/cokery/cokery-idle.png",
        width = 100,
        height = 160,
        frame_count = 1,
        line_length = 1,
        shift = {0, 0}
      }
    },
    working_visualisations =
    {

      {
        north_position = { 0.0,  0.0},
        south_position = { 0.0,  0.0},
        west_position  = { 0.0,  0.0},  --{ 1.3, -2.0},
        east_position  = { 0.0,  0.0},  --{ 1.3, -2.0},
      
        animation =
        {
          filename = "__mojo-resource-processing__/graphics/entity/cokery/cokery-anim.png",
          frame_count = 28,
          line_length = 14,
          width = 100,
          height = 160,
          scale = 1.0,
          shift = {0, 0},
          animation_speed = 0.1
        }
      }
    },
    crafting_categories = {"cokery"},
    energy_source =
    {
      type = "burner",
      effectivity = 1,
      fuel_inventory_size = 1,
      emissions = 0.01,
      smoke =
      {
        {
          name = "smoke",
          deviation = {0.1, 0.1},
          frequency = 0.5,
          position = {0, 0},
          starting_vertical_speed = 0.05
        }
      }
    },
    energy_usage = "4W",
    crafting_speed = 2,
    ingredient_count = 1
  },
  {
    type = "assembling-machine",
    name = "cokery-electric",
    icon = "__mojo-resource-processing__/graphics/icons/cokery/cokery.png",
    flags = {"placeable-neutral","placeable-player", "player-creation"},
    order = "a[cokery-electric]",
    minable = {hardness = 0.2, mining_time = 0.5, result = "cokery-electric"},
    max_health = 200,
    corpse = "big-remnants",
    resistances = {{type = "fire", percent = 70}},
    collision_box = {{-1.4, -2.0}, {1.4, 2.4}},
    selection_box = {{-1.5, -2.5}, {1.5, 2.5}},
    module_slots = 2,
    allowed_effects = {"consumption", "speed"},

    animation =
    {
      north =
      {
        filename = "__mojo-resource-processing__/graphics/entity/cokery/cokery-idle.png",
        width = 100,
        height = 160,
        frame_count = 1,
        line_length = 1,
        shift = {0, 0}
      },
      south =
      {
        filename = "__mojo-resource-processing__/graphics/entity/cokery/cokery-idle.png",
        width = 100,
        height = 160,
        frame_count = 1,
        line_length = 1,
        shift = {0, 0}
      },
      west =
      {
        filename = "__mojo-resource-processing__/graphics/entity/cokery/cokery-idle.png",
        width = 100,
        height = 160,
        frame_count = 1,
        line_length = 1,
        shift = {0, 0}
      },
      east =
      {
        filename = "__mojo-resource-processing__/graphics/entity/cokery/cokery-idle.png",
        width = 100,
        height = 160,
        frame_count = 1,
        line_length = 1,
        shift = {0, 0}
      }
    },
    working_visualisations =
    {

      {
        north_position = { 0.0,  0.0},
        south_position = { 0.0,  0.0},
        west_position  = { 0.0,  0.0},  --{ 1.3, -2.0},
        east_position  = { 0.0,  0.0},  --{ 1.3, -2.0},
      
        animation =
        {
          filename = "__mojo-resource-processing__/graphics/entity/cokery/cokery-anim.png",
          frame_count = 28,
          line_length = 14,
          width = 100,
          height = 160,
          scale = 1.0,
          shift = {0, 0},
          animation_speed = 0.1
        }
      }
    },
    crafting_categories = {"cokery"},
    energy_source =
    {
      type = "electric",
      input_priority = "secondary",
      usage_priority = "secondary-input",
      emissions = 6 / 3
    },
    energy_usage = "6W",
    crafting_speed = 2,
    ingredient_count = 1
  },
})
