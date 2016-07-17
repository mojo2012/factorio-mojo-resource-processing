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
			ingredients =
			{
				{"gravel", 20}
			},
			result = "landfill"
		},
	}
)