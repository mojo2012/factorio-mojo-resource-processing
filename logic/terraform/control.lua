-- setup data structures

TerraForm = {}

function TerraForm.initialise()
	global.landfill = {
		transformationDefinition = {
			["water"] = {
				replacementTileName = "sand", 
				needed_resource = {
					name = "landfill",
					count = 1,
				},
				by_product = {}
			},
			["deepwater"] = {
				replacementTileName = "sand",
				needed_resource = {
					name = "landfill",
					count = 1,
				},
				by_product = {}
			},
			["grass"] = {
				replacementTileName = "water", 
				by_product = {
					name = "landfill",
					count = 1,
				}
			},
			["grass-medium"] = {
				replacementTileName = "water", 
				by_product = {
					name = "landfill",
					count = 1,
				}
			},
			
			["grass-dry"] = {
				replacementTileName = "water", 
				by_product = {
					name = "landfill",
					count = 1,
				}
			},
			["dirt"] = {
				replacementTileName = "water", 
				by_product = {
					name = "landfill",
					count = 1,
				}
			},
			["dirt-dark"] = {
				replacementTileName = "water", 
				by_product = {
					name = "landfill",
					count = 1,
				}
			},
			["sand"] = {
				replacementTileName = "water", 
				by_product = {
					name = "landfill",
					count = 1,
				}
			},
			["sand-dark"] = {
				replacementTileName = "water", 
				by_product = {
					name = "landfill",
					count = 1,
				}
			},
		},
		shovelTransformationSize = {
			{ name = "shovel", size = 2},
			{ name = "shovel-big", size = 4},
		},
		tilePlaceholder = {
			["water"] = "shovel-placeholder-water",
			default = "shovel-placeholder-land",
		},

		lastToolDurability = 1,

	}
end

-- event handling

Event.register(Event.core_events.init, function()
  TerraForm.initialise()
end)

Event.register(Event.core_events.load, function()
  if global.landfill == nil then
    TerraForm.initialise()
  end
end)


Event.register(defines.events.on_built_entity, function(event)
	local player = game.get_player(event.player_index)
	local surface = player.surface
	local entity = event.created_entity
	local entityName = entity.name

	local destroyEntity = true
	local transformedTiles = 0

	
	if entityName == "shovel" or entityName == "shovel-big" then
		local size = 2

		if entityName == "shovel-big" then size = 4 end

		byProduct, transformedTiles = transformSurface(entity.position, size, surface, player)

		--global.logger.log(byProduct.name)

		if byProduct.name ~= nil and byProduct.count ~= nil then
			player.insert({ name = byProduct.name, count = byProduct.count })
		end

		if entity.valid then entity.destroy() end

		player.cursor_stack.set_stack({name = entityName, count = 1})
		reduceDurabilityOfTool(player.cursor_stack, global.landfill.lastToolDurability)
	end
end)

Event.register(defines.events.on_put_item, function(event)
	local item = game.players[event.player_index].cursor_stack

	if item.valid and (item.name == "shovel" or item.name == "shovel-big") then
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

	if Config.debug_mode then
		--global.logger.log("current: " .. currentTileName)
		--global.logger.log("target: " .. targetTile.replacementTileName)
	end

	if targetTile.needed_resource ~= nil and targetTile.needed_resource.count > 0 then
		local inventoryItemCount = player.get_item_count("landfill")

		if Config.debug_mode then
			--global.logger.log("needed resource: " .. targetTile.needed_resource.count)
			--global.logger.log("in inventory: " .. inventoryItemCount)
		end

		if inventoryItemCount < targetTile.needed_resource.count * (size / 2) then
			player.print("Not enough resources")

			return {}, 0
		end

		player.remove_item({ name = "landfill", count = targetTile.needed_resource.count})
	end


	for x = 0, size - 1 do
		for y = 0, size - 1 do
			tileName = surface.get_tile(xpos + x, ypos + y).name

			local playerFound = surface.find_entity("player", { x = xpos + x, y = ypos + y})

			table.insert(tiles,{name=targetTile.replacementTileName, position={xpos + x, ypos + y}})
		end
	end

	if #tiles ~= 0 then
		count = #tiles
		surface.set_tiles(tiles)
	end

	local placeholderName = global.landfill.tilePlaceholder.default

	if global.landfill.tilePlaceholder[targetTile.replacementTileName] ~= nil then
		placeholderName = global.landfill.tilePlaceholder[targetTile.replacementTileName]
	end	

	surface.create_entity({ name = placeholderName, count = 1, position = position})


	return targetTile.by_product, count
end

-- reduce durability of shovel
function reduceDurabilityOfTool(item, baseDurability)
	--global.logger.log(item.durability)

	local newDurability = baseDurability - (item.durability / 100 * 5)

	if newDurability > 0 then
		item.durability = newDurability
		global.landfill.lastToolDurability = item.durability
		--global.logger.log(item.durability)
	else
		item.clear()
	end
end






