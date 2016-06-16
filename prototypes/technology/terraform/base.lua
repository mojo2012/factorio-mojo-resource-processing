data:extend({
	{
		type = "technology",
		name = "terraform",
		icon_size = 128,
		icon = "__mojo-resource-processing__/graphics/icons/terraform/shovel.png",
		effects = {
			{
				type = "unlock-recipe",
				recipe = "shovel"
			},
			{
				type = "unlock-recipe",
				recipe = "landfill-stone"
			},
			{
				type = "unlock-recipe",
				recipe = "landfill-gravel"
			},
			{
				type = "unlock-recipe",
				recipe = "landfill-dirt"
			},
		},
		unit = {
			count = 3,
			ingredients = {
				{"science-pack-1", 5}
			},
			time = 20
		}
	},
})

