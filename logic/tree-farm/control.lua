require "defines"

function initialise()
  global.th = {}
  global.th.cur_gp_tick = 0
  global.th.cur_tree_tick = 0

  global.th.houselist = {}
  --{tick, tree_state, house_state, houseentity, left, top, position, treedata[{curtime, efficiency, treeentity}]} 

  global.th.treelist = {}
  --{{housepos, treepos, curtime, efficiency, position, treeentity}}
  
  global.th.playerdata = {}

  global.th.grow_pick_per_time = 1 * 60
  global.th.grow_tree_per_time = 20 * 60
  global.th.grow_tree_time = 60 * 60
  
  global.th.tree_land_size = 10
  global.th.max_tree = math.pow(global.th.tree_land_size, 2)

  global.th.treehouse_state = {
    ["p_a_c"] = 1,
    ["p_o"] = 2,
    ["c_o"] = 3,
    
    ["planting_tree_02"] = 4,
    ["planting_tree_09"] = 5,
    
    ["none"] = -1
  }

  global.th.land_efficiency = {
    ["grass"] = 1,
    ["grass-medium"] = 1,
    ["grass-dry"] = 1,
    ["dirt"] = 0.75,
    ["dirt-dark"] = 0.75,
    ["sand"] = 0.3,
    ["sand-dark"] = 0.3,
  }
  
  global.th.tree_type = {
    ["treehouse-1"] = 1,
    ["treehouse-2"] = 2,
    ["treehouse-3"] = 3,
    ["treehouse-4"] = 4,
    
    ["treehouse-5"] = 5,
    ["treehouse-6"] = 6,
    ["treehouse-7"] = 7,
    ["treehouse-8"] = 8,
  }
end

Event.register(core_events.init, function()
   initialise()
end)

Event.register(core_events.load, function()
  --
end)

Event.register(core_events.configuration_changed, function(data)
	if data.mod_changes ~= nil and data.mod_changes["mojo-resource-processing"] ~= nil then
		initialise()
	end
end)

Event.register(defines.events.on_player_created, function(event)
    global.th.player_index = event.player_index
end)

Event.register(defines.events.on_built_entity, function(event)
  if event.created_entity.name == "treehouseOverlay" then
    local ent = game.get_surface("1").create_entity{name = "treehouse", position = event.created_entity.position, force = event.created_entity.force}
    event.created_entity.destroy()
    initTreehouse(event.tick, ent, event.player_index)
  elseif event.created_entity.name == "treehand" or event.created_entity.name == "treehand-red" then
    if not createTreeHand(event.created_entity, event.tick) then
      game.players[event.player_index].insert{name = event.created_entity.name, count = 1}
    end
    
    event.created_entity.destroy()
  end
end)

Event.register(defines.events.on_robot_built_entity, function(event)
  if event.created_entity.name == "treehouseOverlay" then
    local ent = game.get_surface("1").create_entity{name = "treehouse", position = event.created_entity.position, force = event.created_entity.force}
    event.created_entity.destroy()
    initTreehouse(event.tick, ent, event.player_index)
  elseif event.created_entity.name == "treehand" or event.created_entity.name == "treehand-red" then
    if not createTreeHand(event.created_entity, event.tick) then
      game.players[event.player_index].insert{name = event.created_entity.name, count = 1}
    end
    event.created_entity.destroy()
  end
end)

Event.register(defines.events.on_tick, function(event)
  

  if global.th.cur_gp_tick > 0 or global.th.cur_tree_tick > 0 then
    if global.th.cur_tree_tick > 0 and (event.tick > global.th.cur_tree_tick + global.th.grow_tree_per_time) then
      global.th.cur_tree_tick = event.tick
      growTrees(event)
    end
    if global.th.cur_gp_tick > 0 and (event.tick > global.th.cur_gp_tick + global.th.grow_pick_per_time) then
      global.th.cur_gp_tick = event.tick
      insertSeeds(event)
    end
  end
end)

Event.register(defines.events.on_gui_click, function(event)
  local player = game.players[event.player_index]
  local playerdata = global.th.playerdata[event.player_index]
  if event.element.name == "th-ok" then
    if playerdata ~= nil and playerdata.treehousepos ~= nil and global.th.houselist[playerdata.treehousepos] ~= nil then
      if player.gui.center.treehouseframe.treesframe.planting_tree_09.state then
        global.th.houselist[playerdata.treehousepos].tree_state = "planting_tree_09"
      else
        global.th.houselist[playerdata.treehousepos].tree_state = "planting_tree_02"
      end

      if player.gui.center.treehouseframe.houseframe.c_o.state then
        global.th.houselist[playerdata.treehousepos].house_state = "c_o"
      elseif player.gui.center.treehouseframe.houseframe.p_o.state then
        global.th.houselist[playerdata.treehousepos].house_state = "p_o"
      else
        global.th.houselist[playerdata.treehousepos].house_state = "p_a_c"
      end
      
      initHouseTick(global.th.houselist[playerdata.treehousepos].house_state, event.tick)
      global.th.playerdata[event.player_index] = nil
    end
    player.gui.center.treehouseframe.destroy()
  elseif event.element.name == "planting_tree_09" then
    player.gui.center.treehouseframe.treesframe.planting_tree_02.state = false
  elseif event.element.name == "planting_tree_02" then
    player.gui.center.treehouseframe.treesframe.planting_tree_09.state = false
  elseif event.element.name == "p_a_c" then
    player.gui.center.treehouseframe.houseframe.p_o.state = false
    player.gui.center.treehouseframe.houseframe.c_o.state = false
  elseif event.element.name == "p_o" then
    player.gui.center.treehouseframe.houseframe.p_a_c.state = false
    player.gui.center.treehouseframe.houseframe.c_o.state = false
  elseif event.element.name == "c_o" then
    player.gui.center.treehouseframe.houseframe.p_a_c.state = false
    player.gui.center.treehouseframe.houseframe.p_o.state = false
  end
end)

function initHouseTick(house_state, tick)
  if global.th.treehouse_state[house_state] ~= nil and global.th.treehouse_state[house_state] > 0 then
    if global.th.cur_gp_tick == 0 then
      global.th.cur_gp_tick = tick
    end
    if global.th.cur_tree_tick == 0 and global.th.treehouse_state[house_state] ~= 3 then
      global.th.cur_tree_tick = tick
    end
  end
end

function initTreehouse(tick, houseentity, player_index)
  local index = #global.th.houselist + 1
  global.th.houselist[index] = {}
  global.th.houselist[index].tick = tick
  global.th.houselist[index].tree_state = "none"
  global.th.houselist[index].house_state = "none"
  global.th.houselist[index].houseentity = houseentity
  global.th.houselist[index].position = global.th.houselist[index].houseentity.position
  global.th.houselist[index].left = math.floor(global.th.houselist[index].position.x) - (global.th.tree_land_size - 1)
  global.th.houselist[index].top = math.floor(global.th.houselist[index].position.y) - (global.th.tree_land_size - 1)
  global.th.houselist[index].treedata = {}
  chooseOptionwithHouse(player_index, index)
end

function insertSeeds(event)
  local hasTreehouse = false
  for index, treehouse in pairs(global.th.houselist) do
    local house_state = global.th.treehouse_state[treehouse.house_state]
    local tree_name = ""
    if global.th.treehouse_state[treehouse.tree_state] ~= nil and global.th.treehouse_state[treehouse.tree_state] == 4 then
      tree_name = "treehouse-5"
    else
      tree_name = "treehouse-1"
    end
    
    if treehouse ~= nil and treehouse.houseentity ~= nil and house_state > 0 then
      if treehouse.houseentity.valid then
        hasTreehouse = true
        
        local grownum = 0
        if house_state == 3 then
          local treeEnts = game.get_surface("1").find_entities_filtered{area = {{treehouse.left, treehouse.top}, {treehouse.left + global.th.tree_land_size * 2 - 1, treehouse.top + global.th.tree_land_size * 2 - 1}}, type = "tree"}
          for _, tree in ipairs(treeEnts) do
            if global.th.tree_type[tree.name] == nil then
              if insertWood(treehouse, tree) then
                tree.destroy()
                break
              end
            end
          end
        else
          for i = 1, global.th.max_tree, 1 do
            if grownum >= 1 then
              break
            end
            
            local x = treehouse.left + ((i - 1) % global.th.tree_land_size) * 2 + 0.5
            local y = treehouse.top + math.floor((i - 1) / global.th.tree_land_size) * 2 + 0.5
            
            if not checkHouseBuilding(treehouse.position, x, y) then
              if treehouse.treedata[i] ~= nil and treehouse.treedata[i].treeentity ~= nil then
                local treeentity = treehouse.treedata[i].treeentity
                if not treeentity.valid then
                  treehouse.treedata[i].treeentity = nil
                elseif house_state == 1 and treeentity.type == "tree" and global.th.tree_type[treeentity.name] == nil then
                  if insertWood(treehouse, treeentity) then
                    treehouse.treedata[i].treeentity.destroy()
                    treehouse.treedata[i].treeentity = nil
                  end
                  grownum = grownum + 1
                end
              else
                local canplace = true
                local treeEnts = game.get_surface("1").find_entities_filtered{area = {{x - 1.5, y - 1.5}, {x + 1.5, y + 1.5}}, type = "tree"}
                if house_state == 2 and #treeEnts > 0 then
                  canplace = false
                else
                  for _, tree in ipairs(treeEnts) do
                    if global.th.tree_type[tree.name] == nil then
                      if insertWood(treehouse, tree) then
                        tree.destroy()
                      end
                      grownum = grownum + 1
                    else
                      canplace = false
                    end
                  end
                end
                
                if grownum >= 1 then
                  break
                end

                local tilename = "none"
                if canplace then
                  tilename = game.get_surface("1").get_tile(x, y).name
                end
                if canplace and global.th.land_efficiency[tilename] ~= nil then
                  if game.get_surface("1").can_place_entity{name = "treehouse-4", position = {x, y}, force = game.forces.player} then
                    treehouse.treedata[i] = {}
                    treehouse.treedata[i].treeentity = game.get_surface("1").create_entity{name = tree_name, position = {x, y}, force = game.forces.player}
                    treehouse.treedata[i].curtime = event.tick
                    treehouse.treedata[i].efficiency = global.th.land_efficiency[tilename]
                    grownum = grownum + 1
                    
                    local treetemp = {
                      housepos = index,
                      treepos = i,
                      curtime = treehouse.treedata[i].curtime,
                      efficiency = treehouse.treedata[i].efficiency,
                      position = {x = x, y = y},
                      treeentity = treehouse.treedata[i].treeentity,
                    }

                    for k, treeinfo in pairs(global.th.treelist) do
                      if treeinfo == nil then
                        global.th.treelist[k] = treetemp
                        game.players[global.th.player_index].print("insertSeeds pos = " .. k)
                        break
                      end
                    end
                    global.th.treelist[#global.th.treelist + 1] = treetemp
                  end
                end
              end
            end
          end
        end
      else
        treehouse.houseentity = nil
        treehouse.treedata = {}
      end
    end
  end
  if not hasTreehouse then
    global.th.cur_gp_tick = 0
  end
end

function growTrees(event)
  local hastrees = false
  for index, treeinfo in pairs(global.th.treelist) do
    if treeinfo ~= nil then
      if treeinfo.treeentity.valid then
        hastrees = true
        
        if event.tick >= treeinfo.curtime + global.th.grow_tree_time / treeinfo.efficiency then
          local treetype = global.th.tree_type[treeinfo.treeentity.name] + 1
          local position = treeinfo.treeentity.position
          treeinfo.treeentity.destroy()
          if treetype ~= 5 and treetype ~= 9 then
            treeinfo.curtime = event.tick
            treeinfo.treeentity = game.get_surface("1").create_entity{name = "treehouse-" .. treetype, position = position, force = game.forces.player}
          else
            local tree_name = ""
            if treetype == 9 then
              tree_name = "tree-02-red"
            else
              tree_name = "tree-09-red"
            end
            
            treeinfo.treeentity = game.get_surface("1").create_entity{name = tree_name, position = position, force = game.forces.player}
            global.th.treelist[index] = nil
          end
          
          if global.th.houselist[treeinfo.housepos] ~= nil and global.th.houselist[treeinfo.housepos].houseentity ~= nil and global.th.houselist[treeinfo.housepos].treedata[treeinfo.treepos] ~= nil and global.th.houselist[treeinfo.housepos].treedata[treeinfo.treepos].treeentity ~= nil then
            if global.th.houselist[treeinfo.housepos].treedata[treeinfo.treepos].treeentity.valid then
              global.th.houselist[treeinfo.housepos].treedata[treeinfo.treepos].treeentity.destroy()
            end
            global.th.houselist[treeinfo.housepos].treedata[treeinfo.treepos].treeentity = treeinfo.treeentity
          end
        end
      else
        if global.th.houselist[treeinfo.housepos] ~= nil and global.th.houselist[treeinfo.housepos].houseentity ~= nil and global.th.houselist[treeinfo.housepos].treedata[treeinfo.treepos] ~= nil and global.th.houselist[treeinfo.housepos].treedata[treeinfo.treepos].treeentity ~= nil then
          if global.th.houselist[treeinfo.housepos].treedata[treeinfo.treepos].treeentity.valid then
            global.th.houselist[treeinfo.housepos].treedata[treeinfo.treepos].treeentity.destroy()
          end
          global.th.houselist[treeinfo.housepos].treedata[treeinfo.treepos].treeentity = nil
        end
        global.th.treelist[index] = nil
			end
    end
  end
  if not hastrees  then
    global.th.cur_tree_tick = 0
    global.th.treelist = {}
    if global.th.cur_gp_tick == 0 then
      global.th.houselist = {}
    end
  end
end

function insertWood(treehouse, treeentity)
  local num = treeentity.prototype.mineable_properties.products[1].amount_min
  if treehouse.houseentity.can_insert{name = "raw-wood", count = num} then
    treehouse.houseentity.insert{name = "raw-wood", count = num}
    return true
  end
  return false
end

function checkHouseBuilding(position, x, y)
  local left = math.floor(position.x - 1.5)
  local top = math.floor(position.y - 1.5)
  local right = math.floor(position.x + 1.5)
  local buttom = math.floor(position.y + 1.5)
  
  if x > left and x < right and y > top and y < buttom then
    return true
  end
  
  return false
end

function chooseOptionwithHouse(player_index, index)
  local player = game.players[player_index]
	if player.gui.center.treehouseframe == nil then
    local treehouseframe = player.gui.center.add{type = "frame", name = "treehouseframe", caption = {"treehouseframe"}, direction = "vertical"}

    treesframe = treehouseframe.add{type = "frame", name = "treesframe", caption = {"treesframe"}, direction = "horizontal"}
    treesframe.add{type = "checkbox", name = "planting_tree_02", caption = {"planting-tree-02"}, state = false}
    treesframe.add{type = "checkbox", name = "planting_tree_09", caption = {"planting-tree-09"}, state = true}
    
    houseframe = treehouseframe.add{type = "frame", name = "houseframe", caption = {"houseframe"}, direction = "horizontal"}
    houseframe.add{type = "checkbox", name = "p_a_c", caption = {"planting-and-cutting"}, state = true}
    houseframe.add{type = "checkbox", name = "p_o", caption = {"planting-only"}, state = false}
    houseframe.add{type = "checkbox", name = "c_o", caption = {"cutting-only"}, state = false}
    
    treehouseframe.add{type = "button", name = "th-ok", caption = {"th-ok"}}
  end
  global.th.playerdata[player_index] = {}
  global.th.playerdata[player_index].treehousepos = index
end

function createTreeHand(entity, tick)
  local treename = ""
  local hasplace = false
  if entity.name == "treehand" then
    treename = "treehouse-5"
  elseif entity.name == "treehand-red" then
    treename = "treehouse-1"
  else
    return hasplace
  end
  
  local left = math.floor(entity.position.x) - 2
  local top = math.floor(entity.position.y) - 2
  for i = 1, 9, 1 do
    local x = left + ((i - 1) % 3) * 2 + 0.5
    local y = top + math.floor((i - 1) / 3) * 2 + 0.5
    local tilename = game.get_surface("1").get_tile(x, y).name
    if global.th.land_efficiency[tilename] ~= nil then
      if #(game.get_surface("1").find_entities_filtered{area = {{x - 1.5, y - 1.5}, {x + 1.5, y + 1.5}}, type = "tree"}) == 0 then
        if game.get_surface("1").can_place_entity{name = treename, position = {x, y}, force = game.forces.player} then
          local treeentity = game.get_surface("1").create_entity{name = treename, position = {x, y}, force = game.forces.player}
          local treetemp = {
            housepos = 0,
            treepos = 0,
            curtime = tick,
            efficiency = global.th.land_efficiency[tilename],
            position = {x = x, y = y},
            treeentity = treeentity,
          }

          for k, treeinfo in pairs(global.th.treelist) do
            if treeinfo == nil then
              global.th.treelist[k] = treetemp
              game.players[global.th.player_index].print("insertSeeds pos = " .. k)
              break
            end
          end
          global.th.treelist[#global.th.treelist + 1] = treetemp
          
          hasplace = true
        end
      end
    end
  end
  
  if hasplace then
    if global.th.cur_tree_tick == 0 then
      global.th.cur_tree_tick = tick
    end
  end
  
  return hasplace
end