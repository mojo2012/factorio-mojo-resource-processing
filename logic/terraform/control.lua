-- setup data structures

require("stdlib.area.position")
require("stdlib.area.tile")
require("stdlib.area.area")
require("lib.utilities")

TerraForm = {}

function TerraForm.initialise()
	global.landfill = {
		transformationDefinition = {
			["moat"] = {
				replacementTileName = "dirt-dark", 
				needed_resource = {
					name = "landfill",
					count = 1,
				},
				by_product = {}
			},
			["water"] = {
				replacementTileName = "dirt-dark", 
				needed_resource = {
					name = "landfill",
					count = 1,
				},
				by_product = {}
			},
			["deepwater"] = {
				replacementTileName = "dirt-dark",
				needed_resource = {
					name = "landfill",
					count = 1,
				},
				by_product = {}
			},
			["grass"] = {
				replacementTileName = "moat", 
				by_product = {
					name = "landfill",
					count = 1,
				}
			},
			["grass-medium"] = {
				replacementTileName = "moat", 
				by_product = {
					name = "landfill",
					count = 1,
				}
			},
			
			["grass-dry"] = {
				replacementTileName = "moat", 
				by_product = {
					name = "landfill",
					count = 1,
				}
			},
			["dirt"] = {
				replacementTileName = "moat", 
				by_product = {
					name = "landfill",
					count = 1,
				}
			},
			["dirt-dark"] = {
				replacementTileName = "moat", 
				by_product = {
					name = "landfill",
					count = 1,
				}
			},

			-- cannot dig a hole in the sand
			--[[
			["sand"] = {
				replacementTileName = "sand", 
				by_product = { }
			},
			["sand-dark"] = {
				replacementTileName = "sand", 
				by_product = { }
			},
			]]--
		},
		floodableTiles = {
			["moat"] = {
				floodableBy = {
					"water", "deep-water"
				}
			}
		},
		shovelTransformationSize = {
			{ name = "shovel", size = 2},
			{ name = "shovel-big", size = 4},
		},

		tilePlaceholder = "shovel-placeholder",

		transformTileSize = {
			["shovel"] = 2,
			["shovel-big"] = 4,
		},

		lastToolDurability = 1,

	}
end

-- event handling

Event.register(Event.core_events.init, function()
	TerraForm.initialise()
end)

Event.register(Event.core_events.configuration_changed, function(event)
    TerraForm.initialise()    
end)


Event.register(defines.events.on_built_entity, function(event)
	local player = game.players[event.player_index]
	local surface = player.surface
	local entity = event.created_entity
	local entityName = entity.name

	local destroyEntity = true
	local transformedTiles = 0

	
	if entityName == "shovel" or entityName == "shovel-big" then
		local tileSize = global.landfill.transformTileSize[entityName]

		byProduct, transformedTiles = transformSurface(entity.position, tileSize, surface, player)

		--LOG.log(byProduct.name)

		if byProduct.name ~= nil and byProduct.count ~= nil then
			player.insert({ name = byProduct.name, count = byProduct.count })
		end

		if entity.valid then entity.destroy() end

		--player.cursor_stack.set_stack({name = entityName, count = 1})
		reduceDurabilityOfTool(player.cursor_stack, global.landfill.lastToolDurability)
	end
end)

Event.register(defines.events.on_put_item, function(event)
	local item = game.players[event.player_index].cursor_stack

	if item.valid_for_read and (item.name == "shovel" or item.name == "shovel-big") then
		global.landfill.lastToolDurability = game.players[event.player_index].cursor_stack.durability
	end
end)

-- functions

function transformSurface(position, size, surface, player)
	local tiles = {}
	local xpos = position.x - (size / 2)
	local ypos = position.y - (size / 2)
	local count = 0

	local currentTileName = surface.get_tile(position.x, position.y).name
	local targetTile = global.landfill.transformationDefinition[currentTileName]

	-- if there is no no tile found for this source tile, we just stop here
	if targetTile == nil then
		player.print("Cannot terraform here")
		return {}, 0
	end

	if Config.debug_mode then
		LOG.log("current: " .. currentTileName)
		LOG.log("target: " .. targetTile.replacementTileName)
	end

	-- if we need resources for this surface transformation ....
	if targetTile.needed_resource ~= nil and targetTile.needed_resource.count > 0 then
		local inventoryItemCount = player.get_item_count(targetTile.needed_resource.name)

		if Config.debug_mode then
			LOG.log("needed resource: " .. targetTile.needed_resource.count)
			LOG.log("in inventory: " .. inventoryItemCount)
		end

		if inventoryItemCount < targetTile.needed_resource.count * (size / 2) then
			player.print("Not enough resources")

			return {}, 0
		end
		-- .. we removed them from the inventory
		player.remove_item(targetTile.needed_resource)
	end


	for x = 0, size - 1 do
		for y = 0, size - 1 do
			tileName = surface.get_tile(xpos + x, ypos + y).name

			local playerFound = surface.find_entity("player", { x = xpos + x, y = ypos + y})

			table.insert(tiles, {name=targetTile.replacementTileName, position={xpos + x, ypos + y}})
		end
	end

	if #tiles ~= 0 then
		count = #tiles

		-- try to flood tiles if possible
		floodHoles(tiles, surface)

		surface.set_tiles(tiles)

		-- avoid spamming
		placePlaceholder(position, targetTile.replacementTileName, surface)
	end

	return targetTile.by_product, count
end


-- if the new surface is a hole (=moat tile) then we try to flood it, if it is adjacent to a water tile
function floodHoles(tiles, surface)
	local floodedTiles = {}

	for i, tile in pairs(tiles) do
		-- run loop as long as no floodable tile is found
		local floodDefinition = global.landfill.floodableTiles[tile.name]

		if floodDefinition ~= nil then
			LOG.log("Flood: current tile: " .. tile.name )

			-- get surrounding tiles and check if its water
			local area = Position.expand_to_area(tile.position, 3)

			for x, y in Area.iterate(area) do
				--local tmpTile = Tile.from_position({x = x, y = y})
				local tmpTile = surface.get_tile(x, y)

				if tmpTile.name ~= nil then
					LOG.log("flood: iterate tile: " .. x .. "-" .. y .. ": " .. tmpTile.name)
				end

				for i, floodableBy in pairs(floodDefinition.floodableBy) do
					if tmpTile.name == floodableBy then
						tile.name = floodableBy
					end
				end
			end
		end
	end
end

-- place a placeholder above the newly created tiles, so we avoid spamming of new tiles
function placePlaceholder(position, tileName, surface)
	surface.create_entity({ name = global.landfill.tilePlaceholder, count = 1, position = position})
end

-- reduce durability of shovel
function reduceDurabilityOfTool(item, baseDurability)
	--LOG.log(item.durability)

	local newDurability = baseDurability - (item.durability / 100 * 5)

	if newDurability > 0 then
		item.durability = newDurability
		global.landfill.lastToolDurability = item.durability
		--LOG.log(item.durability)
	else
		if item.count > 1 then
			item.count = item.count - 1
		else
			item.clear()
		end
	end
end

function findAdjacentTiles(tile, tileLookingFor)

end




