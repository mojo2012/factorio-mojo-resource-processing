data:extend({
	-- recipe categories
	{
		type = "recipe-category",
		name = "bioreactor"
	},
	{
		type = "recipe-category",
		name = "biofarm"
	},
	{
		type = "recipe-category",
		name = "biofarm-product"
	},
	{
		type = "recipe-category",
		name = "bioreactor-product"
	},


	{ --bio farm
		type = "recipe",
		name = "biofarm",
		enabled = "false",
		energy_required = 10,
		ingredients = {
			{"steel-plate", 20},
			{"glass-plate", 10},
			{"small-lamp", 3}
		},
		result = "biofarm"
	},
	{ --bio reactor
		type = "recipe",
		name = "bioreactor",
		enabled = "false",
		energy_required = 10,
		ingredients = {
			{"assembling-machine-1", 1},
			{"steel-plate", 5},
			{"electronic-circuit", 5}
		},
		result = "bioreactor"
	},

	-- resources
	{ 
		type = "recipe",
		name = "seedling",
		category = "bioreactor",
		enabled = "false",
		subgroup = "raw-material",
		icon = "__mojo-resource-processing__/graphics/icons/biofarm/seedling.png",
		energy_required = 2,
		ingredients = {
			{"raw-wood", 1}
		},
		results= {
			{type = "item", name = "seedling", amount = 5},
			{type = "item", name = "woodpulp", amount = 5}
		},
	},

	-- fertilizer
	{
		type = "recipe",
		name = "phosphate",
		category = "chemistry",
		energy_required = 6,
		icon = "__mojo-resource-processing__/graphics/icons/biofarm/phosphate.png",
		ingredients = {
			{ name="stone-crushed", amount = 1 },
		},
		results= {
			{ name="phosphate", amount = 5 }
		},
		enabled = "false"
	},
	{
		type = "recipe",
		name = "fertilizer-basic-charcoal-dust",
		category = "chemistry",
		energy_required = 3,
		icon = "__mojo-resource-processing__/graphics/icons/biofarm/fertilizer-basic.png",
		ingredients = {
			{type="item", name="charcoal-dust", amount = 1 }
		},
		results= {
			{ name="fertilizer-basic", amount = 1 }
		},
		enabled = "false"
	},
	{
		type = "recipe",
		name = "fertilizer-basic-charcoal",
		category = "chemistry",
		energy_required = 4.5,
		icon = "__mojo-resource-processing__/graphics/icons/biofarm/fertilizer-basic.png",
		ingredients = {
			{type="item", name="charcoal", amount = 1 }
		},
		results= {
			{ name="fertilizer-basic", amount = 2 }
		},
		enabled = "false"
	},
	{
		type = "recipe",
		name = "fertilizer-advanced",
		category = "chemistry",
		energy_required = 7,
		icon = "__mojo-resource-processing__/graphics/icons/biofarm/fertilizer-advanced.png",
		ingredients = {
			{ name = "fertilizer-basic", amount = 1 },
			{ name = "phosphate", amount = 1 },
			{ name = "woodpulp", amount = 2 },
		},
		results = {
			{name="fertilizer-advanced", amount=3}
		},
		enabled = "false"
	},
	{
		type = "recipe",
		name = "fertilizer-genetically-modified",
		category = "chemistry",
		energy_required = 15,
		icon = "__mojo-resource-processing__/graphics/icons/biofarm/fertilizer-genetically-modified.png",
		ingredients = {
			{type="item", name="fertilizer-advanced", amount=25},
			{type="item", name="alien-artifact", amount=1},
		},
		results= {
			{type="item", name="fertilizer-genetically-modified", amount=50}
		},
		enabled = "false"
	},

	-- wood products

	{
		type = "recipe",
		name = "raw-wood-unfertilized",
		category = "biofarm",
		enabled = "false",
	    energy_required = 150,
		subgroup = "raw-material",
		icon = "__base__/graphics/icons/raw-wood.png",
		ingredients = {
    		{type="item", name="seedling", amount=30},     
    		{type="fluid", name="water", amount=100},
    	},
		results = {
			{name = "raw-wood", amount = 50},
		},
	},
	{
		type = "recipe",
		name = "raw-wood-fertilized-1",
		category = "biofarm",
		enabled = "false",
	    energy_required = 100,
		subgroup = "raw-material",
		icon = "__base__/graphics/icons/raw-wood.png",
		ingredients = {
    		{type="item", name="seedling", amount=20},     
			{type="item", name="fertilizer-basic", amount=3},     
    		{type="fluid", name="water", amount=100},
    	},
		results = {
			{name = "raw-wood", amount = 50},
		},
	},
	{
		type = "recipe",
		name = "raw-wood-fertilized-2",
		category = "biofarm",
		enabled = "false",
	    energy_required = 65,
		subgroup = "raw-material",
		icon = "__base__/graphics/icons/raw-wood.png",
		ingredients = {
    		{type="item", name="seedling", amount=15},     
			{type="item", name="fertilizer-advanced", amount=2},     
    		{type="fluid", name="water", amount=100},
    	},
		results = {
			{name = "raw-wood", amount = 50},
		},
	},
	{
		type = "recipe",
		name = "raw-wood-fertilized-3",
		category = "biofarm",
		enabled = "false",
	    energy_required = 30,
		subgroup = "raw-material",
		icon = "__base__/graphics/icons/raw-wood.png",
		ingredients = {
    		{type="item", name="seedling", amount=10},     
			{type="item", name="fertilizer-genetically-modified", amount=1},     
    		{type="fluid", name="water", amount=100},
    	},
		results = {
			{name = "raw-wood", amount = 50},
		},
	},

	-- chemical products
	{ -- bio mass
		type = "recipe",
		name = "biomass",
		icon = "__mojo-resource-processing__/graphics/icons/biofarm/bio-mass.png",
		subgroup = "intermediate-product",
		category = "bioreactor",
		energy_required = 10,
		ingredients =
		{
			{type="fluid", name="water", amount=10},
			{type="item", name="woodpulp", amount=5}
		},
		results=
		{
			{type="fluid", name="biomass", amount=2},
		},
		enabled = "false"
	},
	{ -- bio mass
		type = "recipe",
		name = "biomass-wood",
		icon = "__mojo-resource-processing__/graphics/icons/biofarm/bio-mass.png",
		subgroup = "intermediate-product",
		category = "bioreactor",
		energy_required = 20,
		ingredients =
		{
			{type="fluid", name="water", amount=10},
			{type="item", name="raw-wood", amount=1}
		},
		results=
		{
			{type="fluid", name="biomass", amount=2},
		},
		enabled = "false"
	},
	{ -- cellulose
		type = "recipe",
		name = "cellulose",
		category = "bioreactor",
		energy_required = 10,
		ingredients =
		{
			{type="fluid", name="biomass", amount=1.6}
		},
		results=
		{
			{type="item", name="cellulose", amount=1 }
		},
		enabled = "false"
	},
	{ -- plastic bar
		type = "recipe",
		name = "platic-bar-cellulose",
		category = "chemistry",
		subgroup = "raw-material",
		order = "g[plastic-bar]",
		energy_required = 1.5,
		ingredients =
		{
			{type="item", name="cellulose", amount=2}
		},
		results=
		{
			{type="item", name="plastic-bar", amount=1}
		},
		enabled = "false"
	},

	-- fuel
	{
		type = "recipe",
		name = "biofuel",
		category = "bioreactor",
		energy_required = 10,
		enabled = false,
		ingredients = {
			{type="item", name="woodpulp", amount=25},
		},
		results= {
		  {type="fluid", name="biofuel", amount=10},
		},
		subgroup = "fluid-recipes",
		order = "a[oil-processing]-z[biofuel]"
	},
  
  {
    type = "recipe",
    name = "biofuel_conversion",
    category = "oil-processing",
    enabled = false,
    energy_required = 5,
    ingredients =
    {
		{type="fluid", name="biofuel", amount=8},
		{type="fluid", name="crude-oil", amount=2},
    },
    results=
    {
		{type="fluid", name="light-oil", amount=3},  
		{type="fluid", name="heavy-oil", amount=2},
    
    },
    icon = "__mojo-resource-processing__/graphics/icons/biofarm/biofuel_conversion.png",
    subgroup = "fluid-recipes",
    order = "a[oil-processing]-y[biofuel_conversion]"
  },
})