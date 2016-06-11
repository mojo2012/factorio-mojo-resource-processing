data:extend({
	-- machines
	{
		type= "item",
		name= "biofarm",
		icon = "__mojo-resource-processing__/graphics/icons/biofarm/biofarm.png",
		flags= { "goes-to-quickbar" },
		subgroup = "production-machine",
		place_result = "biofarm",
		stack_size= 10,
	},
	{
		type= "item",
		name= "bioreactor",
		icon = "__mojo-resource-processing__/graphics/icons/biofarm/bioreactor.png",
		flags= { "goes-to-quickbar" },
		subgroup = "production-machine",
		place_result = "bioreactor",
		stack_size= 10,
	},

	-- resources
	{
		type = "item",
		name = "woodpulp",
		icon = "__mojo-resource-processing__/graphics/icons/biofarm/woodpulp.png",
		flags = {"goes-to-main-inventory"},
		fuel_value = "2MJ",
		subgroup = "raw-material",
		order = "b[woodpulp]",
		stack_size = 200
	},
	{
		type = "item",
		name = "seedling",
		icon = "__mojo-resource-processing__/graphics/icons/biofarm/seedling.png",
		flags = {"goes-to-main-inventory"},
		subgroup = "raw-material",
		stack_size= 50,
		order = "a-a-a",
    	place_result = "seedling",
	},

	-- fertilizers
	{
		type = "item",
		name = "phosphate",
		icon = "__mojo-resource-processing__/graphics/icons/biofarm/phosphate.png",
		flags = {"goes-to-main-inventory"},
		subgroup = "intermediate-product",
		stack_size= 50,
	},
	{
		type = "item",
		name = "fertilizer-basic",
		icon = "__mojo-resource-processing__/graphics/icons/biofarm/fertilizer-basic.png",
		flags = {"goes-to-main-inventory"},
		subgroup = "intermediate-product",
		stack_size= 50,
	},
	{
		type = "item",
		name = "fertilizer-advanced",
		icon = "__mojo-resource-processing__/graphics/icons/biofarm/fertilizer-advanced.png",
		flags = {"goes-to-main-inventory"},
		subgroup = "intermediate-product",
		stack_size= 50,
	},
	{
		type = "item",
		name = "fertilizer-genetically-modified",
		icon = "__mojo-resource-processing__/graphics/icons/biofarm/fertilizer-genetically-modified.png",
		flags = {"goes-to-main-inventory"},
		subgroup = "intermediate-product",
		stack_size= 50,
	},

	-- chemical products
	{
		type = "fluid",
		name = "biomass",
		default_temperature = 25,
		heat_capacity = "1KJ",
		base_color = {r=0, g=0, b=0},
		flow_color = {r=0.1, g=1.0, b=0.0},
		max_temperature = 50,
		icon = "__mojo-resource-processing__/graphics/icons/biofarm/bio-mass.png",
		pressure_to_speed_ratio = 0.4,
		flow_to_energy_ratio = 0.59,
		order = "a[fluid]-b[biomass]"
	},
	{
		type = "item",
		name = "cellulose",
		icon = "__mojo-resource-processing__/graphics/icons/biofarm/cellulose.png",
		flags = {"goes-to-main-inventory"},
		subgroup = "intermediate-product",
		stack_size= 50,
	},
	{
		type = "fluid",
		name = "biofuel",
		default_temperature = 25,
		max_temperature = 100,
		heat_capacity = "1KJ",
		base_color = {r=1.00, g=0.35, b=0.35},
		flow_color = {r=1.00, g=0.35, b=0.35},
		icon = "__mojo-resource-processing__/graphics/icons/biofarm/bio-fuel.png",
		pressure_to_speed_ratio = 0.4,
		flow_to_energy_ratio = 0.59,
  },
})