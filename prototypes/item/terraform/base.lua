data:extend({
	-- for placing land on water
	{
		type = "item",
		name = "landfill2by2",
		icon = "__mojo-resource-processing__/graphics/icons/terraform/landfill_small.png",
		flags = {"goes-to-main-inventory"},
		subgroup = "transport",
		order = "ca[landfill]",
		stack_size = 256
	},
	{
		type = "item",
		name = "landfill4by4",
		icon = "__mojo-resource-processing__/graphics/icons/terraform/landfill_big.png",
		flags = {"goes-to-main-inventory"},
		subgroup = "transport",
		order = "cb[landfill]",
		stack_size = 256
	},

	-- add new equipment to dig holes
 	{
		type = "mining-tool",
		name = "shovel",
		icon = "__mojo-resource-processing__/graphics/icons/terraform/shovel.png",
		flags = {"goes-to-main-inventory"},
		action = {
		  type="direct",
		  action_delivery = {
			type = "instant",
			target_effects = {
				type = "create-entity",
				entity_name = "shovel",
				check_buildability = true
			},
		  },
		},
		--action = {},
		durability = 4000,
		subgroup = "tool",
		order = "a[mining]-a[iron-axe]",
		speed = 2.5,
		stack_size = 20,
		place_result = "shovel",
	},
})
