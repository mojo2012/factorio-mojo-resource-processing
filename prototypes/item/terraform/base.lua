data:extend({
	-- add new equipment to dig holes
 	--[[
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
	]]--

	{
		type = "item",
		name = "shovel",
		icon = "__mojo-resource-processing__/graphics/icons/terraform/shovel.png",
		flags = {"goes-to-main-inventory"},
		subgroup = "terrain",
		order = "c[shovel]-a[landfill]",
		stack_size = 100,
		place_as_tile =
		{
			result = "water",
			condition_size = 1,
			condition = { "water-tile" }
		}
  	},

	-- for placing land on water
	--[[
	{
		type = "item",
		name = "landfill",
		icon = "__mojo-resource-processing__/graphics/icons/terraform/landfill_big.png",
		flags = {"goes-to-main-inventory"},
		subgroup = "transport",
		order = "ca[landfill]",
		stack_size = 256
	},
	]]--
})
