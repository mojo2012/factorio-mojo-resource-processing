data:extend({
    {
      type = "assembling-machine",
      name = "ore-crusher",
      icon = "__mojo-resource-processing__/graphics/icons/ore-processing/crusher.png",
      flags = {"placeable-neutral", "placeable-player", "player-creation"},
      minable = {hardness = 0.2, mining_time = 0.5, result = "ore-crusher"},
      max_health = 250,
      corpse = "big-remnants",
      dying_explosion = "medium-explosion",
      resistances =
      {
        {
          type = "fire",
          percent = 70
        }
      },
      fluid_boxes =
      {
        {
          production_type = "input",
          pipe_picture = assembler2pipepictures(),
          pipe_covers = pipecoverspictures(),
          base_area = 10,
          base_level = -1,
          pipe_connections = {{ type="input", position = {0, -2} }}
        },
        {
          production_type = "output",
          pipe_picture = assembler2pipepictures(),
          pipe_covers = pipecoverspictures(),
          base_area = 10,
          base_level = 1,
          pipe_connections = {{ type="output", position = {0, 2} }}
        },
        off_when_no_fluid_recipe = true
      },
      collision_box = {{-1.2, -1.2}, {1.2, 1.2}},
      selection_box = {{-1.5, -1.5}, {1.5, 1.5}},
      fast_replaceable_group = "assembling-machine",
      animation =
      {
        filename = "__mojo-resource-processing__/graphics/entity/crusher/crusher-base.png",
        priority = "high",
        width = 129,
        height = 100,
        frame_count = 1,
        shift = {0.421875, 0}
      },
      working_sound =
      {
        sound =
        {
          filename = "__base__/sound/electric-furnace.ogg",
          volume = 0.7
        },
        apparent_volume = 1.5
      },
--      open_sound = { },
--      close_sound = { },
      vehicle_impact_sound =  { filename = "__base__/sound/car-metal-impact.ogg", volume = 0.65 },
      crafting_categories = {"ore-crusher"},
      crafting_speed = 1,
      energy_source =
      {
        type = "electric",
        usage_priority = "secondary-input",
        emissions = 0.04 / 2.5
      },
      energy_usage = "80kW",
      ingredient_count = 4,
      module_specification =
      {
        module_slots = 2
      },
      allowed_effects = {"consumption", "speed", "productivity", "pollution"},
      source_inventory_size = 1,
      result_inventory_size = 3, 
      working_visualisations = {
        {
          animation =
          {
            filename = "__mojo-resource-processing__/graphics/entity/crusher/crusher-gears.png",
            priority = "high",
            width = 25,
            height = 15,
            frame_count = 4,
            animation_speed = 0.2,
            shift = {0.015625, 0.890625}
          },
          light = {intensity = 0.4, size = 6, shift = {0.0, 1.0}}
        }
      }
    }
  })
