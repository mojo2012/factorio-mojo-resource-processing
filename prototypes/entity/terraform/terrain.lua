data:extend({
	{
		type = "tile",
		name = "moat",
		collision_mask = {
			"water-tile",
			"item-layer",
			"resource-layer",
			"player-layer",
			"doodad-layer"
		},
		autoplace = water_autoplace_settings(0, {{{35, 1}, {15, 0.7}}}),
		layer = 40,
		variants = {
			main = {
				{
					picture = "__mojo-resource-processing__/graphics/terrain/moat/moat1.png",
					count = 8,
					size = 1
				},
				{
					picture = "__mojo-resource-processing__/graphics/terrain/moat/moat2.png",
					count = 8,
					size = 2
				},
				{
					picture = "__mojo-resource-processing__/graphics/terrain/moat/moat4.png",
					count = 6,
					size = 4
				}
			},
			inner_corner = {
				picture = "__mojo-resource-processing__/graphics/terrain/moat/moat-inner-corner.png",
				count = 6
			},
			outer_corner = {
				picture = "__mojo-resource-processing__/graphics/terrain/moat/moat-outer-corner.png",
				count = 6
			},
			side = {
				picture = "__mojo-resource-processing__/graphics/terrain/moat/moat-side.png",
				count = 8
			}
		},
		allowed_neighbors = { "grass", "grass-dry", "grass-medium", "dirt", "dirt-dark" },
		map_color={r=31, g=48, b=18},
		ageing=0.0005
	},
	})