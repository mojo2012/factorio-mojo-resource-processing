-- setup data structures


global.landfill = {
	transformationDefinition = {
		["water"] = {
			replacementTileName = "sand", 
			needed_resource = {
				name = "landfill2by2",
				count = 1,
			},
			by_product = {}
		},
		["deepwater"] = {
			replacementTileName = "sand",
			needed_resource = {
				name = "landfill2by2",
				count = 1,
			},
			by_product = {}
		},
		["grass"] = {
			replacementTileName = "water", 
			by_product = {
				name = "landfill2by2",
				count = 1,
			}
		},
		["grass-dry"] = {
			replacementTileName = "water", 
			by_product = {
				name = "landfill2by2",
				count = 1,
			}
		},
		["dirt"] = {
			replacementTileName = "water", 
			by_product = {
				name = "landfill2by2",
				count = 1,
			}
		},
		["sand"] = {
			replacementTileName = "water", 
			by_product = {
				name = "landfill2by2",
				count = 1,
			}
		},
		["sand-dark"] = {
			replacementTileName = "water", 
			by_product = {
				name = "landfill2by2",
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
	}
}



Event.register(defines.events.on_built_entity, function(event)
	local player = game.get_player(event.player_index)
	local surface = player.surface
	local entity = event.created_entity
	local entityName = entity.name

	local destroyEntity = true
	local transformedTiles = 0

	
	if entityName:find("^shovel") ~= nil then
		local size = 2

		if entityName == "shovel-big" then size = 4 end

		byProduct, transformedTiles = transformSurface(entity.position, size, surface, player)

		global.logger.log(byProduct.name)

		if byProduct.name ~= nil and byProduct.count ~= nil then
			player.insert({ name = byProduct.name, count = byProduct.count })
		end
	end
	
	if entity.valid then entity.destroy() end

	player.cursor_stack.set_stack({name = entityName, count = 1})

end)


function transformSurface(position, size, surface, player)
	local tiles = {}
	local xpos = position.x - (size / 2)
	local ypos = position.y - (size / 2)
	local count = 0

	local currentTileName = surface.get_tile(position.x, position.y).name
	local targetTile = global.landfill.transformationDefinition[currentTileName]

	global.logger.log("current: " .. currentTileName)
	global.logger.log("target: " .. targetTile.replacementTileName)

	if targetTile.needed_resource ~= nil and targetTile.needed_resource.count > 0 then
		local inventoryItemCount = player.get_item_count("landfill2by2")

		--global.logger.log("needed resource: " .. targetTile.needed_resource.count)
		--global.logger.log("in inventory: " .. inventoryItemCount)

		if inventoryItemCount < targetTile.needed_resource.count * (size / 2) then
			player.print("Not enough resources")

			return {}, 0
		end

		player.remove_item({ name = "landfill2by2", count = targetTile.needed_resource.count})
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

-- build an invisible blocking entity to prevent the user from spawning to many tiles
function buildBlockingEntity(position, size)

end






