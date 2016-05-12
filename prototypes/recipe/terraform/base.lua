data:extend(
	{
		{
			type = "recipe",
			name = "landfill2by2",
			enabled = "true",
			ingredients =
			{
				{"stone", 20}
			},
			result = "landfill2by2"
		},
		{
			type = "recipe",
			name = "landfill4by4",
			enabled = "true",
			ingredients =
			{
				{"landfill2by2", 4}
			},
			result = "landfill4by4"
		},
	}
)