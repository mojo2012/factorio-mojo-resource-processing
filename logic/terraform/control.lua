require "defines"

local displaceDirt = true
local throwRocks = true
local maximumRockThrowDistance = 10
local bombs
local replaceableTiles =
{
  ["water"] = "grass",
  ["deepwater"] = "grass"
}

Event.register(defines.events, function(event)
  if event.name == defines.events.on_built_entity then
    local player = game.get_player(event.player_index)
    
    if event.created_entity.name == "landfill2by2"
      or event.created_entity.name == "landfill4by4" then
        
        if event.created_entity.name == "landfill2by2" then
          landfill2by2(event.created_entity.position, player)
        elseif event.created_entity.name == "landfill4by4" then
          landfill4by4(event.created_entity.position, player)
        end
        
        if event.created_entity.valid then
          event.created_entity.destroy()
        end
    end
  end
end)



function throwDirt(x, y, size, surface)
  local dirtTiles = {}
  local tileName
  local floor = math.floor
  local distX,distY
  
  if displaceDirt == true then
    x = floor(x)
    y = floor(y)
    
    for xx = x - (size + 2), x + (size + 2), 1 do
      for yy = y - (size + 2), y + (size + 2), 1 do
        distX = math.abs(x - xx)
        distY = math.abs(y - yy)
        
        if floor(math.sqrt((distX * distX) + (distY * distY))) >= 2 then
          table.insert(dirtTiles, {name = "grass", position = {xx, yy}})
        end
      end
    end
    
    if #dirtTiles ~= 0 then
      surface.set_tiles(dirtTiles)
    end
  end
end

function createRandomStone(position, surface)
  local x,y
  local tileName
  local floor = math.floor
  local random = math.random
  
  if throwRocks == true then
    x = position.x
    y = position.y
    
    if random() > 0.5 then
      x = x - floor(random(2, maximumRockThrowDistance))
    else
      x = x + floor(random(2, maximumRockThrowDistance))
    end
    
    if random() < 0.5 then
      y = y - floor(random(2, maximumRockThrowDistance))
    else
      y = y + floor(random(2, maximumRockThrowDistance))
    end
    
    tileName = surface.get_tile(floor(x), floor(y)).name
    
    if replaceableTiles[tileName] then
      surface.set_tiles({{name=replaceableTiles[tileName], position={floor(x), floor(y)}}})
    else
      surface.create_entity({name = "stone", position = {x, y}}).amount = floor(random(13, 27))
      surface.create_entity({name = "explosion", position = {x, y}})
      surface.create_entity({name = "smoke", position = {x, y}})
    end
  end
end

function landfill(position, size, surface)
  local tileName
  local tiles = {}
  local holes
  local xpos = position.x - (size / 2)
  local ypos = position.y - (size / 2)
  local count
  
  for x = 0,size - 1 do
    for y = 0,size - 1 do
      tileName = surface.get_tile(xpos + x, ypos + y).name
      if replaceableTiles[tileName] then
        table.insert(tiles,{name=replaceableTiles[tileName], position={xpos + x, ypos + y}})
      end
    end
  end
  
  if #tiles ~= 0 then
    count = #tiles
    surface.set_tiles(tiles)
    return count
  else
    holes = surface.find_entities_filtered({area = {{x = xpos, y = ypos}, {x = xpos + (size / 2), y = ypos + (size / 2)}}, name = "holes"})
    if #holes ~= 0 then
      for _,v in pairs(holes) do
        v.destroy()
      end
    end
    return 0
  end
end

function landfill2by2(position, player)
  if landfill(position, 2, player.surface) == 0 then
    player.insert({name = "landfill2by2", count = 1})
  end
  
  player.surface.create_entity({name = "landfill-fade", position = position, force = player.force})
end

function landfill4by4(position, player)
  local count = landfill(position, 4, player.surface)
  
  if count == 0 then
    player.insert({name="landfill4by4", count=1})
  elseif math.ceil(count / 4) < 4 then
    player.insert({name = "landfill2by2", count = 4 - math.ceil(count / 4)})
  end
  
  player.surface.create_entity({name = "landfill-fade-2", position = position, force = player.force})
end

function setTilesAndUpdateChunks(tiles, chunks, player)
  player.surface.set_tiles(tiles)
  
  -- Creates a stone entity in each chunk effected by the flood fill triggering a minimap update and then destroys it
  if chunks ~= nil then
    local force = player.force
    for x in pairs(chunks) do
      for y in pairs(chunks[x]) do
        player.surface.create_entity({name = "stone", position = {x * 32, y * 32}, force = force}).destroy()
      end
    end
  end
end

function useLandfills(tileCount, player)
  if player.controller_type == defines.controllers.god then
    return true
  end
  
  -- Checks if the player has enough landfills to fill the tile count
  local landfill2by2Count = player.get_item_count("landfill2by2")
  local landfill4by4Count = player.get_item_count("landfill4by4")
  
  if landfill2by2Count * 4 + landfill4by4Count * 16 >= tileCount then
    tileCount = tileCount - (player.remove_item({name = "landfill2by2", count = math.ceil(tileCount / 4)}) * 4)
    
    if tileCount > 0 then
      player.remove_item({name = "landfill4by4", count = math.ceil(tileCount / 16)})
    end
    
    return true
  else
    player.print("Insufficient landfills to fill water body. Requires: " .. math.ceil(tileCount / 4) .. " Landfills or " .. math.ceil(tileCount / 16) .. " Bigger Landfills or a mixture.")
    return false
  end
end

function modifyReplaceableTile(sourceTile, replaceTile)
  if not replaceableTiles[sourceTile] or replaceableTiles[sourceTile] ~= replaceTile then
    replaceableTiles[sourceTile] = replaceTile
  end
end

remote.add_interface("landfill", {
  landfill,
  throwDirt,
  createRandomStone,
  useLandfills,
  modifyReplaceableTile
})