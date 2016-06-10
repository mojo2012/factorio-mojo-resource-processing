require ("prototypes.entity.biofarm.pipe-connectors")
require ("util")

data:extend({
	{ -- Bio Farm
		type = "assembling-machine",
		name = "biofarm",
		icon = "__mojo-resource-processing__/graphics/icons/biofarm/biofarm.png",
		flags = {"placeable-neutral", "placeable-player", "player-creation"},
		minable = {hardness = 0.2, mining_time = 0.5, result = "biofarm"},
		max_health = 250,
		corpse = "big-remnants",
		dying_explosion = "medium-explosion",
		resistances = {{type = "fire", percent = 70}},
		fluid_boxes = {
			{
				production_type = "input",
				pipe_picture = assembler3pipepictures(),
				pipe_covers = pipecoverspictures(),
				base_area = 10,
				base_level = -1,		
				pipe_connections = {{ type="input", position = {-1, -5} }}
			},
			{
				production_type = "input",
				pipe_picture = assembler3pipepictures(),
				pipe_covers = pipecoverspictures(),
				base_area = 10,
				base_level = -1,
				pipe_connections = {{ type="input", position = {1, -5} }}
			},
			off_when_no_fluid_recipe = true,
		},
		collision_box = {{-4.2, -4.2}, {4.2, 4.2}},
		selection_box = {{-4.5, -4.5}, {4.5, 4.5}},
		animation = {
			filename = "__mojo-resource-processing__/graphics/entity/biofarm/biofarm_idle.png",
			priority = "high",
			width = 320,
			height = 320,
			frame_count = 1,
			shift = {0.75, 0},
		},
		working_visualisations = {
			animation = {
				filename = "__mojo-resource-processing__/graphics/entity/biofarm/biofarm_working.png",
				priority = "high",
				width = 320,
				height = 320,
				frame_count = 1,
				shift = {0.75, 0},
			},
		},
		crafting_categories = {"biofarm"},
		crafting_speed = 1,
		energy_source = {
			type = "electric",
			usage_priority = "primary-input",
			drain = "50kW",
			emissions = -0.2,
		},	
		energy_usage = "100kW",
		ingredient_count = 3,
		open_sound = { filename = "__base__/sound/machine-open.ogg", volume = 0.85 },
		close_sound = { filename = "__base__/sound/machine-close.ogg", volume = 0.75 },
		vehicle_impact_sound =	{ filename = "__base__/sound/car-metal-impact.ogg", volume = 0.65 },
		module_specification = {
			module_slots = 3
		},
		allowed_effects = {"consumption", "speed"}
	},

	{
		type = "assembling-machine",
		name = "bioreactor",
		icon = "__mojo-resource-processing__/graphics/icons/biofarm/bioreactor.png",
		flags = {"placeable-neutral", "player-creation"},
		minable = {hardness = 0.2, mining_time = 0.5, result = "bioreactor"},
		max_health = 100,
		corpse = "big-remnants",
		fluid_boxes =
		{
			{
				production_type = "input",
				pipe_picture = assembler2pipepicturesBioreactor(),
				pipe_covers = pipecoverspicturesBioreactor(),
				base_area = 10,
				base_level = -1,
				pipe_connections = {{ type="input", position = {0, -2} }}
			},
			{
				production_type = "input",
				pipe_picture = assembler2pipepicturesBioreactor(),
				pipe_covers = pipecoverspicturesBioreactor(),
				base_area = 10,
				base_level = -1,
				pipe_connections = {{ type="input", position = {2, 0} }}
			},
			{
				production_type = "input",
				pipe_picture = assembler2pipepicturesBioreactor(),
				pipe_covers = pipecoverspicturesBioreactor(),
				base_area = 10,
				base_level = -1,
				pipe_connections = {{ type="input", position = {0, 2} }}
			},
			{
				production_type = "output",
				pipe_picture = assembler2pipepicturesBioreactor(),
				pipe_covers = pipecoverspicturesBioreactor(),
				base_area = 10,
				base_level = 1,
				pipe_connections = {{ type="output", position = {-2, -1} }}
			},
			{
				production_type = "output",
				pipe_picture = assembler2pipepicturesBioreactor(),
				pipe_covers = pipecoverspicturesBioreactor(),
				base_area = 10,
				base_level = 1,
				pipe_connections = {{ type="output", position = {-2, 1} }}
			},
			off_when_no_fluid_recipe = false
		},
		collision_box = {{-1.2, -1.2}, {1.2, 1.2}},
		selection_box = {{-1.5, -1.5}, {1.5, 1.5}},
		animation = {
			filename = "__mojo-resource-processing__/graphics/entity/biofarm/bioreactor.png",
			priority = "high",
			width = 128,
			height = 150,
			frame_count = 26,
			line_length = 13,
			animation_speed = 0.4,
			shift = {0.55, -0.33}
		},
		energy_source = {
			type = "electric",
			usage_priority = "secondary-input"
		},
		crafting_categories = {"bioreactor"},
		ingredient_count = 3,
		crafting_speed = 1,
		energy_usage = "10kW"
	},
})