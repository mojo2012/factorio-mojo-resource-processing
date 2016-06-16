data:extend({
	{
		type = "decorative",
		name = "shovel",
		icon = "__mojo-resource-processing__/graphics/icons/terraform/shovel.png",
		flags = {"placeable-neutral", "not-on-map"},
		subgroup="remnants",
		order="d[remnants]-c[wall]",
		selection_box = {{-1, -1}, {1, 1}},
		collision_box = {{-0.99, -0.99}, {0.99, 0.99}},
		collision_mask = {"object-layer"},
		selectable_in_game = false,
		pictures = {
			filename = "__mojo-resource-processing__/graphics/entity/selectionbox_small.png",
			width = 120,
			height = 120
		},
	},

	{
		type = "corpse",
		name = "shovel-placeholder-water",
		icon = "__mojo-resource-processing__/graphics/icons/terraform/shovel.png",
		flags = {"placeable-neutral", "not-on-map"},
		subgroup="remnants",
		order="d[remnants]-c[wall]",
		selection_box = {{-1.5, -1.5}, {1.5, 1.5}},
		collision_box = {{-0.99, -0.99}, {0.99, 0.99}},
		collision_mask = {"object-layer"},
		selectable_in_game = false,
		time_before_removed = 15, -- disappear after 0.75 seconds
		final_render_layer = "remnants",
		animation = {
			{
				filename = "__mojo-resource-processing__/graphics/entity/selectionbox_small.png",
				width = 120,
				height = 120,
				frame_count = 1,
				direction_count = 1,
			}
		},
	},

	{
		type = "corpse",
		name = "shovel-placeholder-land",
		icon = "__mojo-resource-processing__/graphics/icons/terraform/shovel.png",
		flags = {"placeable-neutral", "not-on-map"},
		subgroup="remnants",
		order="d[remnants]-c[wall]",
		selection_box = {{-2.6, -2.6}, {1.7, 1.7}},
		collision_box = {{-2.2, -2.2}, {2.2, 2.2}},
		collision_mask = {"object-layer"},
		selectable_in_game = false,
		time_before_removed = 15, -- disappear after 0.75 seconds
		final_render_layer = "remnants",
		animation = {
			{
				filename = "__mojo-resource-processing__/graphics/entity/selectionbox_small.png",
				width = 120,
				height = 120,
				frame_count = 1,
				direction_count = 1,
			}
		},
	},
})