TreeGrowing = {}

-- setup data structures
function TreeGrowing.initialise()   
    --LOG.log("init tree growing")

    global.ts = {}

    -- config
    global.ts.growingInterval = 120
    global.ts.treeMargin = 1

    global.ts.growTreeTickInterval = 800
    global.ts.growNaturalPointMin = 200
    global.ts.growNaturalPointMax = 350
   

    -- list of all seedling with current state
    global.ts.seedlings = {}
    
    -- influences growing speed
    global.ts.landEfficiency = {
        ["grass"] = 1,
        ["grass-medium"] = 1,
        ["grass-dry"] = 1,
        ["dirt"] = 0.75,
        ["dirt-dark"] = 0.75,
        ["sand"] = 0.3,
        ["sand-dark"] = 0.3,
    }

    global.ts.treeType = {
        ["seedling-1"] = 1,
        ["seedling-2"] = 2,
        ["seedling-3"] = 3,
        ["seedling-4"] = 4,

        ["seedling-5"] = 5,
        ["seedling-6"] = 6,
        ["seedling-7"] = 7,
        ["seedling-8"] = 8,
    }

    global.ts.landEfficiencyDefault = 2
end


Event.register(Event.core_events.init, function()
    TreeGrowing.initialise()
end)


Event.register(Event.core_events.configuration_changed, function(event)
    TreeGrowing.initialise()
end)

Event.register(defines.events.on_tick, function(event)
	if  event.tick % global.ts.growingInterval == 0 then
		growTrees(event)
	end
end)


Event.register(defines.events.on_built_entity, function(event)
	-- hook when the player plants a seedling
	if event.created_entity.valid and event.created_entity.name == "seedling" then
		if not plantSeedling(event.created_entity, event.tick) then
			game.players[event.player_index].insert{name = event.created_entity.name, count = 1}
		end

		-- destroy the actually created seedling (it is replaced by another entity)
		event.created_entity.destroy()
	end
end)

-- when planting a seedling, we replace it with an actual seedling-x tree entity
function plantSeedling(entity, tick)
	local treeName = "seedling-5"
	local hasBeenPlaced = false
	
	local x = math.floor(entity.position.x)
	local y = math.floor(entity.position.y)

	local tilename = game.surfaces[1].get_tile(x, y).name
    local landEfficiency = global.ts.landEfficiency[tilename]

	if landEfficiency == nil then
        landEfficiency = global.ts.landEfficiencyDefault
    end

    -- check if there are no trees too near, so we can plant
	if #(game.surfaces[1].find_entities_filtered{area = {{x - global.ts.treeMargin, y - global.ts.treeMargin}, 
            {x + global.ts.treeMargin, y + global.ts.treeMargin}}, type = "tree"}) == 1 then

        -- setup definition for newly planted tree
		local tempTree = {
			tickAtPlantingTime = tick,
			efficiency = landEfficiency,
			position = {x = x, y = y},
			entity = game.surfaces[1].create_entity{name = treeName, position = {x, y}, force = game.forces.player},
		}

        -- store next grow tick in tree definition
        setNextGrowTick(tempTree, tick)

		table.insert(global.ts.seedlings, tempTree)

		hasBeenPlaced = true
	end
	
	-- return false if the seedling couldn't be planted, then it will be readded to the players inventory
	return hasBeenPlaced
end

function setNextGrowTick(treeDefinition, tick)
    -- sets the next grow tick
    -- less efficiency means it takes longer to grow. But we add a random number to the land efficiency as well to make it more interesting
    -- TODO: if efficiency is below a certain level (like on sand) roll out a chance for the tree to die.

    -- init random generator
    math.randomseed(tick)

    if Config.debug_mode then
        LOG.log("landEfficiency " .. treeDefinition.efficiency)
    end

    
    local efficiencyInfluence = 1 - (math.random(1, 100 * treeDefinition.efficiency) / 100)

    if Config.debug_mode then
        LOG.log("landEfficiency influence " .. efficiencyInfluence)
    end

    treeDefinition.growAtTick = tick + math.floor(
        global.ts.growTreeTickInterval + 
        (global.ts.growTreeTickInterval * efficiencyInfluence)
    )
    
    if Config.debug_mode then
        LOG.log("tick " .. tick .. ": grow at tick " ..  treeDefinition.growAtTick)
    end
end

function growTrees(event)
    -- loop over all recorded seedlings
	for index, seedling in pairs(global.ts.seedlings) do

        -- if seedling is valid
    	if seedling ~= nil and seedling.entity.valid then

            -- see if seedling is ready to grow
			if event.tick >= seedling.growAtTick then

                -- get new (grown) entity
                local treeType = global.ts.treeType[seedling.entity.name] + 1
				local position = seedling.entity.position

                --destroy old entity
				seedling.entity.destroy()
				
                -- grow tree
                if treeType ~= 5 and treeType ~= 9 then
					seedling.entity = game.surfaces[1].create_entity{name = "seedling-" .. treeType, position = position, force = game.forces.player}

                    -- update next grow tick in tree definition
                    setNextGrowTick(seedling, event.tick)

                -- replace with final tree
				else
					local treeName = ""
				
                	if treeType == 9 then
						treeName = "tree-02-red"
					else
						treeName = "tree-09-red"
					end
					
					seedling.entity = game.surfaces[1].create_entity{name = treeName, position = position, force = game.forces.player}

                    -- remove from seedling table, as already grown up
					table.remove(global.ts.seedlings, index)
				end
			end
		end
	end
end