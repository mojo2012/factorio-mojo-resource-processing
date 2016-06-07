data:extend({
  {
    type = "unit",
    name = "tree-robot",
    icon = "__base__/graphics/icons/construction-robot.png",
    flags = {"pushable", "placeable-player", "player-creation", "placeable-off-grid"},
    minable = {hardness = 0.1, mining_time = 0.1, result = "tree-robot"},
    max_health = 100,
    collision_box = {{-0.1, -0.1}, {0.1, 0.1}},
    selection_box = {{-0.5, -0.5}, {0.5, 0.5}},
    light = {intensity = 0.4, size = 2},
    attack_parameters =
    {
      type = "projectile",
      range = 0.01,
      cooldown = 300,
      ammo_category = "melee",
      ammo_type = make_unit_melee_ammo_type(0.01),
      animation = 
      {
        layers=
        {
          {
            filename = "__base__/graphics/entity/construction-robot/construction-robot-working.png",
            priority = "high",
            line_length = 2,
            width = 28,
            height = 36,
            frame_count = 2,
            shift = {0, -0.15625},
            direction_count = 16,
            animation_speed = 0.3,
          },

          {
            stripes = util.multiplystripes(2,
            {
              {
                filename = "__base__/graphics/entity/construction-robot/construction-robot-shadow.png",
                width_in_frames = 16,
                height_in_frames = 1,
              }
            }),
            priority = "high",
            width = 50,
            height = 24,
            frame_count = 2,
            shift = {1.09375, 0.59375},
            direction_count = 16
          },
        }
      }
    },
    vision_distance = 15,
    movement_speed = 0.06,
    distance_per_frame = 0.13,
    pollution_to_join_attack = 1000000,
    distraction_cooldown = 600,
    working_sound = flying_robot_sounds(),
    run_animation = 
    {
      layers=
      {
        {
          filename = "__base__/graphics/entity/construction-robot/construction-robot.png",
          priority = "high",
          line_length = 16,
          width = 32,
          height = 36,
          frame_count = 1,
          shift = {0, -0.15625},
          direction_count = 16,
          y = 36
        },

        {
          filename = "__base__/graphics/entity/construction-robot/construction-robot-shadow.png",
          priority = "high",
          line_length = 16,
          width = 50,
          height = 24,
          frame_count = 1,
          shift = {1.09375, 0.59375},
          direction_count = 16
        },
      }
    },
    smoke =
    {
      filename = "__base__/graphics/entity/smoke-construction/smoke-01.png",
      width = 39,
      height = 32,
      frame_count = 19,
      line_length = 19,
      shift = {0.078125, -0.15625},
      animation_speed = 0.3,
    },
  },
  {
    type = "container",
    name = "treehouse-chest",
    icon = "__base__/graphics/icons/iron-chest.png",
    flags = {"placeable-neutral", "player-creation"},
    minable = {mining_time = 0.5, result = "treehouse-chest"},
    max_health = 50,
    corpse = "small-remnants",
    collision_box = {{-0.35, -0.35}, {0.35, 0.35}},
    fast_replaceable_group = "container",
    selection_box = {{-0.5, -0.5}, {0.5, 0.5}},
    inventory_size = 2,
    open_sound = { filename = "__base__/sound/metallic-chest-open.ogg" },
    close_sound = { filename = "__base__/sound/metallic-chest-close.ogg" },
    vehicle_impact_sound =  { filename = "__base__/sound/car-metal-impact.ogg", volume = 1.0 },
    picture =
    {
      filename = "__base__/graphics/entity/iron-chest/iron-chest.png",
      priority = "extra-high",
      width = 46,
      height = 33,
      shift = {0.3, 0}
    }
  },
})