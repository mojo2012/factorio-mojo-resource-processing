data:extend({
	{
		type = "technology",
		name = "bio-farming",
		icon_size = 128,
		icon = "__mojo-resource-processing__/graphics/technology/biofarm/bio-farming.png",
		effects = {
			{
				type = "unlock-recipe",
				recipe = "seedling"
			},
			{
				type = "unlock-recipe",
				recipe = "bioreactor"
			},
			{
				type = "unlock-recipe",
				recipe = "biofarm"
			},

			-- wood recipes
			{
				type = "unlock-recipe",
				recipe = "raw-wood-unfertilized"
			},
		},
		prerequisites = {"optics"},
		unit = {
			count = 20,
			ingredients = {
				{"science-pack-1", 15},
				{"science-pack-2", 2},
			},
			time = 20
		}
	},
	{
		type = "technology",
		name = "bio-fertilizer",
		icon_size = 128,
		icon = "__mojo-resource-processing__/graphics/technology/biofarm/fertilizer.png",
		effects = {
			{
				type = "unlock-recipe",
				recipe = "fertilizer-basic-charcoal-dust"
			},
			{
				type = "unlock-recipe",
				recipe = "fertilizer-basic-charcoal"
			},

			-- wood recipes
			{
				type = "unlock-recipe",
				recipe = "raw-wood-fertilized-1"
			},
		},
		prerequisites = {"bio-farming", "advanced-material-processing"},
		unit = {
			count = 20,
			ingredients = {
				{"science-pack-1", 20},
				{"science-pack-2", 5},
			},
			time = 20
		}
	},
	{
		type = "technology",
		name = "bio-fertilizer-advanced",
		icon_size = 128,
		icon = "__mojo-resource-processing__/graphics/technology/biofarm/fertilizer-advanced.png",
		effects = {
			{
				type = "unlock-recipe",
				recipe = "fertilizer-advanced"
			},
			{
				type = "unlock-recipe",
				recipe = "fertilizer-genetically-modified"
			},
			{
				type = "unlock-recipe",
				recipe = "phosphate"
			},

			-- wood recipes
			{
				type = "unlock-recipe",
				recipe = "raw-wood-fertilized-2"
			},
			{
				type = "unlock-recipe",
				recipe = "raw-wood-fertilized-3"
			},
		},
		prerequisites = {"bio-fertilizer"},
		unit = {
			count = 20,
			ingredients = {
				{"science-pack-1", 25},
				{"science-pack-2", 10},
				{"science-pack-3", 5},
			},
			time = 20
		}
	},
	{
		type = "technology",
		name = "biomass-processing",
		icon_size = 128,
		icon = "__mojo-resource-processing__/graphics/technology/biofarm/biomass-processing.png",
		effects = {
			{
				type = "unlock-recipe",
				recipe = "biomass"
			},
			{
				type = "unlock-recipe",
				recipe = "biomass-wood"
			},
			{
				type = "unlock-recipe",
				recipe = "cellulose"
			},
			{
				type = "unlock-recipe",
				recipe = "platic-bar-cellulose"
			},
			{
				type = "unlock-recipe",
				recipe = "biofuel"
			},
			{
				type = "unlock-recipe",
				recipe = "biofuel_conversion"
			},
		},
		prerequisites = {"bio-farming", "advanced-oil-processing" },
		unit = {
			count = 20,
			ingredients = {
				{"science-pack-1", 20},
				{"science-pack-2", 15},
				{"science-pack-3", 10},
			},
			time = 20
		}
	},
})

