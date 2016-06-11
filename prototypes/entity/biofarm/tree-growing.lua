require("prototypes.entity.biofarm.tree-definitions")

data:extend({
    {
    	type = "tree",
    	name = "seedling",
    	icon = "__mojo-resource-processing__/graphics/icons/biofarm/seedling.png",
        flags = {"placeable-neutral", "placeable-player", "player-creation", "breaths-air"},
    	minable = {
    		mining_particle = "wooden-particle",
    		mining_time = 0.5,
    		result = "seedling",
    		count = 1
    	},
    	emissions_per_tick = -0.0003,
    	max_health = 10,
    	collision_box = {{-0.8, -0.8}, {0.8, 0.8}},
    	selection_box = {{-0.8, -0.8}, {0.8, 0.8}},
    	drawing_box = {{-0.4, -0.6}, {0.2, 0.4}},
    	subgroup = "trees",
    	vehicle_impact_sound = { filename = "__base__/sound/car-wood-impact.ogg", volume = 1.0 },
    	variations =  {
    		{
    			trunk = {
    				filename = "__mojo-resource-processing__/graphics/entity/biofarm/seedling-trunk.png",
                    width = 38,
                    height = 71,
                    frame_count = 4,
                    shift = {0, -0.55}
    			},
    			leaves = {
    				filename = "__mojo-resource-processing__/graphics/entity/biofarm/seedling-leaves.png",
                    width = 45,
                    height = 50,
                    frame_count = 3,
                    shift = {0, -1.00}
    			}, 
    			leaf_generation = {
    				type = "create-particle",
    				entity_name = "leaf-particle",
    				offset_deviation = {{-0.35, -0.35}, {0.35, 0.35}},
    				initial_height = 1,
    				initial_height_deviation = 0.5,
    				speed_from_center = 0.01
    			},
    			branch_generation = {
                    type = "create-particle",
    				entity_name = "branch-particle",
    				offset_deviation = {{-0.35, -0.35}, {0.35, 0.35}},
    				initial_height = 1,
    				initial_height_deviation = 1,
    				speed_from_center = 0.01,
    				frame_speed = 0.1,
    				repeat_count = 5,
    			}
    		}
    	},
    	colors = {
    		{r = 81, g = 126, b = 85},
    		{r = 81, g = 166, b = 89},
    		{r = 101, g = 191, b = 110},
    		{r = 147, g = 192, b = 39},
    		{r = 162, g = 222, b = 19},
    		{r = 201, g = 236, b = 116},
    		{r = 179, g = 199, b = 12},
    		{r = 181, g = 189, b = 114},
    		{r = 179, g = 199, b = 12},
    		{r = 200, g = 214, b = 83}
    	}
    }
})

