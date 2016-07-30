data:extend(
	{
		{ -- shovel
			type = "recipe",
			name = "shovel",
			enabled = "false",
			ingredients =
			{
				{"wood", 1},
				{"iron-plate", 1},
			},
			result = "shovel"
		},

		-- landfills
		--[[
		{
			type = "recipe",
			name = "landfill",
			enabled = "false",
			energy_required = 0.5,
			ingredients =
			{
				{"stone", 20}
			},
			result = "landfill"
		},
		]]--
		{
			type = "recipe",
			name = "landfill-dirt",
			enabled = "false",
			energy_required = 0.5,
			ingredients =
			{
				{"dirt", 20}
			},
			result = "landfill"
		},
		{
			type = "recipe",
			name = "landfill-gravel",
			enabled = "false",
			energy_required = 0.5,
			ingredients =
			{
				{"gravel", 20}
			},
			result = "landfill"
		},
	}
)