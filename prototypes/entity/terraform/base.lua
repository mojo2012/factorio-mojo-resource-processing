data:extend({
	{
		type = "decorative",
		name = "landfill2by2",
		icon = "__mojo-resource-processing__/graphics/icons/terraform/landfill_small.png",
		flags = {"placeable-neutral", "player-creation"},
		collision_box = {{-0.99, -0.99}, {0.99, 0.99}},
		collision_mask = {"object-layer"},
		selection_box = {{-1, -1}, {1, 1}},
		minable = {mining_time = 1, result = "landfill2by2", count = 0},
		max_health = 1000,
		corpse = "big-remnants",
		repair_sound = { filename = "__base__/sound/manual-repair-simple.ogg" },
		mined_sound = { filename = "__base__/sound/deconstruct-bricks.ogg" },
		render_layer = "tile",
		pictures = {
			{
				filename = "__mojo-resource-processing__/graphics/entity/terraform/landfill_small.png",
				width = 120,
				height = 120
			}
		}
	},
	{
		type = "decorative",
		name = "landfill4by4",
		icon = "__mojo-resource-processing__/graphics/icons/terraform/landfill_big.png",
		flags = {"placeable-neutral", "player-creation"},
		collision_box = {{-1.99, -1.99}, {1.99, 1.99}},
		collision_mask = {"object-layer"},
		selection_box = {{-2, -2}, {2, 2}},
		minable = {mining_time = 1, result = "landfill4by4", count = 0},
		max_health = 1000,
		corpse = "big-remnants",
		repair_sound = { filename = "__base__/sound/manual-repair-simple.ogg" },
		mined_sound = { filename = "__base__/sound/deconstruct-bricks.ogg" },
		render_layer = "tile",
		pictures = {
			{
				filename = "__mojo-resource-processing__/graphics/entity/terraform/landfill_big.png",
				width = 240,
				height = 240
			}
		}
	},
	
	-- ********************************
	-- Landfill Fade
	-- Placeholder after landfill use to prevent accidental spam
	-- ********************************
	{
		type = "corpse",
		name = "landfill-fade",
		icon = "__mojo-resource-processing__/graphics/icons/terraform/landfill_small.png",
		flags = {"placeable-neutral", "not-on-map"},
		subgroup="remnants",
		order="d[remnants]-c[wall]",
		selection_box = {{-1, -1}, {1, 1}},
		collision_box = {{-0.99, -0.99}, {0.99, 0.99}},
		collision_mask = {"object-layer"},
		selectable_in_game = false,
		time_before_removed = 10, -- disappear after 0.75 seconds
		final_render_layer = "remnants",
		animation = {
			{
				filename = "__mojo-resource-processing__/graphics/entity/terraform/null.png",
				width = 1,
				height = 1,
				frame_count = 1,
				direction_count = 1,
			}
		}
	},
	{
		type = "corpse",
		name = "landfill-fade-2",
		icon = "__mojo-resource-processing__/graphics/icons/terraform/landfill_big.png",
		flags = {"placeable-neutral", "not-on-map"},
		subgroup="remnants",
		order="d[remnants]-c[wall]",
		selection_box = {{-2, -2}, {2, 2}},
		collision_box = {{-1.99, -1.99}, {1.99, 1.99}},
		collision_mask = {"object-layer"},
		selectable_in_game = false,
		time_before_removed = 10, -- disappear after 1 seconds
		final_render_layer = "remnants",
		animation = {
			{
				filename = "__mojo-resource-processing__/graphics/entity/terraform/null.png",
				width = 1,
				height = 1,
				frame_count = 1,
				direction_count = 1,
			}
		}
	},

	-- placeholder shovel entity
	{
		type = "decorative",
		name = "shovel",
		icon = "__mojo-resource-processing__/graphics/icons/terraform/shovel.png",
		flags = {"placeable-neutral", "player-creation"},
		collision_box = {{-0.99, -0.99}, {0.99, 0.99}},
		collision_mask = {"object-layer"},
		selection_box = {{-1, -1}, {1, 1}},
		minable = {mining_time = 1, result = "landfill2by2", count = 0},
		max_health = 1000,
		corpse = "big-remnants",
		repair_sound = { filename = "__base__/sound/manual-repair-simple.ogg" },
		mined_sound = { filename = "__base__/sound/deconstruct-bricks.ogg" },
		render_layer = "tile",
		pictures = {
			{
				filename = "__mojo-resource-processing__/graphics/entity/terraform/landfill_small.png",
				width = 120,
				height = 120
			}
		}
	},
})