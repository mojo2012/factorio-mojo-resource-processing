data:extend(
	{
		{
			type = "item",
			name = "landfill2by2",
			icon = "__mojo-resource-processing__/graphics/icons/terraform/landfill_small.png",
			flags = {"goes-to-quickbar"},
			subgroup = "transport",
			order = "ca[landfill]",
			place_result = "landfill2by2",
			stack_size = 256
		},
		{
			type = "item",
			name = "landfill4by4",
			icon = "__mojo-resource-processing__/graphics/icons/terraform/landfill_big.png",
			flags = {"goes-to-quickbar"},
			subgroup = "transport",
			order = "cb[landfill]",
			place_result = "landfill4by4",
			stack_size = 256
		},
	}
)