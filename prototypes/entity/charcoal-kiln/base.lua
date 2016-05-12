data:extend({
{
    type = "assembling-machine",
    name = "charcoal-kiln",
    icon = "__mojo-resource-processing__/graphics/icons/charcoal-kiln/charcoal-kiln.png",
    flags = {"placeable-neutral", "placeable-player", "player-creation"},
    minable = {hardness = 0.2, mining_time = 0.5, result = "charcoal-kiln"},
    max_health = 200,
    corpse = "big-remnants",
    dying_explosion = "medium-explosion",
    resistances =
    {
      {
        type = "fire",
        percent = 80
      },
      {
        type = "explosion",
        percent = 30
      }
    },
    collision_box = {{-0.7, -0.7}, {0.7, 0.7}},
    selection_box = {{-1, -1}, {1, 1}},
    fast_replaceable_group = "furnace",
    animation =
    {
      filename = "__mojo-resource-processing__/graphics/entity/charcoal-kiln/charcoal-kiln.png",
      priority="high",
      width = 66,
      height = 68,
      frame_count = 32,
      line_length = 8,
      shift = {0.25, -0.1}
    },
	working_visualisations =
    {
      {
        north_position = {0.0, 0.0},
        east_position = {0.0, 0.0},
        south_position = {0.0, 0.0},
        west_position = {0.0, 0.0},
        animation =
        {
          filename = "__mojo-resource-processing__/graphics/entity/charcoal-kiln/fire.png",
          priority = "extra-high",
          width = 23,
          height = 27,
          frame_count = 12,
          shift = { 0.32, 0.5}
        },
        light = {intensity = 0.8, size = 0.8}
      }
    },
	crafting_categories = {"charcoal-kiln"},
    crafting_speed = 0.75,
    energy_source =
    {
      type = "burner",
      effectivity = 0.8,
      fuel_inventory_size = 1,
      emissions = 0.04 / 4,
      smoke =
      {
        {
          name = "smoke",
          deviation = {0.1, 0.1},
		  position = {0.44, 0},
          frequency = 1
        }
      }
    },
    energy_usage = "250kW",
    ingredient_count = 1,
    open_sound = { filename = "__base__/sound/machine-open.ogg", volume = 0.85 },
    close_sound = { filename = "__base__/sound/machine-close.ogg", volume = 0.75 },
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
		{
		  filename = "__base__/sound/furnace.ogg",
		  volume = 0.4
		},
      },
      idle_sound = { filename = "__base__/sound/idle1.ogg", volume = 0.6 },
      apparent_volume = 1.5,
    }
  },
})
