data:extend({
    {
      type = "furnace",
      name = "ore-crusher",
      icon = "__mojo-resource-processing__/graphics/icons/ore-processing/crusher.png",
      flags = {"placeable-neutral","player-creation"},
      minable = {hardness = 0.2,mining_time = 0.5,result = "ore-crusher"},
      max_health = 100,
      corpse = "big-remnants",
      dying_explosion = "medium-explosion",
      module_slots = 1,
      resistances = {{type = "fire",percent = 70}},
      working_sound = {
                sound = {
                      filename = "__base__/sound/assembling-machine-t1-1.ogg",
                      volume = 0.7
                    },
                apparent_volume = 1.5
              },
      collision_box = {{-0.8,-0.8},{0.8,0.8}},
      selection_box = {{-1.0,-1.0},{1.0,1.0}},
      animation = {
                filename = "__mojo-resource-processing__/graphics/entity/ore-processing/crusher_anim.png",
                priority = "high",
                width = 65,
                height = 78,
                frame_count = 11,
                animation_speed = 0.5,
                shift = {0.0, -0.1}
              },
      working_visualisations = {
                filename = "__mojo-resource-processing__/graphics/entity/ore-processing/crusher_anim.png",
                priority = "high",
                width = 65,
                height = 78,
                frame_count = 11,
                animation_speed = 0.18 / 2.5,
                shift = {0.0, -0.1}
              },
      crafting_categories = {"ore-crusher"},
      source_inventory_size = 1,
      result_inventory_size = 3,
      crafting_speed = 1,
      energy_source = {
                type = "electric",
                usage_priority = "secondary-input",
                emissions = 0.05 / 1.5
              },
      energy_usage = "80kW"
    },
  })
