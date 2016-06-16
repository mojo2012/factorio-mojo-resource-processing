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
		{
			type = "recipe",
			name = "landfill-stone",
			enabled = "false",
			ingredients =
			{
				{"stone", 10}
			},
			result = "landfill"
		},
		{
			type = "recipe",
			name = "landfill-dirt",
			enabled = "false",
			ingredients =
			{
				{"dirt", 10}
			},
			result = "landfill"
		},
		{
			type = "recipe",
			name = "landfill-gravel",
			enabled = "false",
			ingredients =
			{
				{"gravel", 10}
			},
			result = "landfill"
		},
	}
)