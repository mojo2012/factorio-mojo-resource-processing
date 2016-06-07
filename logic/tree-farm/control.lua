require "defines"

function initialise()
  global.th = {}
  global.th.cur_gp_tick = 0
  global.th.cur_tree_tick = 0
  global.th.cur_robot_tick = 0
  global.th.cur_ghost_tick = 0

  global.th.houselist = {}
  --{tick, tree_state, house_state, house_size, houseentity, fertilizerchest, left, top, position, robotdata[{state, secstate, curtime, cargo, amount, treeinfo, robotentity}], treedata[{curtime, feeding, treeinfo, efficiency, treeentity}]} 

  global.th.treelist = {}
  --{{housepos, treepos, curtime, naturalpoint, feeding, seedname, efficiency, position, treeentity}}
  
  global.th.robotlist = {}
  --{{state, robotentity}}
  
  global.th.playerdata = {}

  global.th.grow_pick_per_time = 1 * 60
  global.th.grow_tree_per_time = 5 * 60
  global.th.grow_tree_time = 60 * 60
  
  global.th.grow_naturalpoint_min = 200
  global.th.grow_naturalpoint_max = 350
  
  global.th.robot_per_time = 20
  
  global.th.small_house_size = 4
  global.th.default_house_size = 6
  global.th.big_house_size = 8

  global.th.feeding_point = {
    ["charcoal-dust"] = 180250,
    ["none"] = 0
  }

  global.th.treerobot_state = {
    ["free"] = 1,
    ["planting"] = 2,
    ["cutting"] = 3,
    ["gohome"] = 4,
    ["feeding"] = 5,
    ["ghost"] = 6,
    ["follow"] = 7
  }

  global.th.treehouse_state = {
    ["p_a_c"] = 1,
    ["p_o"] = 2,
    ["c_o"] = 3,
    
    ["planting_tree_02"] = 4,
    ["planting_tree_09"] = 5,
    
    ["small_house"] = 6,
    ["big_house"] = 7,
    
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
Event.register(Event.core_events.init, function()
  initialise()
end)

Event.register(Event.core_events.load, function()
  if global.th == nil then
    initialise()
  end
end)

Event.register(Event.core_events.configuration_changed, function(data)
	if data.mod_changes ~= nil and data.mod_changes["mojo-resource-processing"] ~= nil then
		initialise()
	end
end)

Event.register(defines.events.on_player_created, function(event)
    global.th.player_index = event.player_index
end)

Event.register(defines.events.on_entity_died, function(event)
  if event.entity.name == "tree-robot" then
    removeghostRobot(event.entity)
  elseif event.entity.name == "treehouse" then
    for index, player in pairs(game.players) do
      if player ~= nil then
        if player.gui.center.treehouseframe ~= nil then
          if global.th.playerdata[index] ~= nil then
            createTreehouseSize(global.th.playerdata[index], 0)
            global.th.playerdata[index] = nil
          end
          player.gui.center.treehouseframe.destroy()
        end
      end
    end
  end
end)

Event.register(defines.events.on_preplayer_mined_item, function(event)
  if event.entity.name == "tree-robot" then
    removeghostRobot(event.entity)
  end
end)

Event.register(defines.events.on_player_mined_item, function(event)
  if event.item_stack.name == "treehouse" then
    for index, player in pairs(game.players) do
      if player ~= nil then
        if player.gui.center.treehouseframe ~= nil then
          if global.th.playerdata[index] ~= nil then
            createTreehouseSize(global.th.playerdata[index], 0)
            global.th.playerdata[index] = nil
          end
          player.gui.center.treehouseframe.destroy()
        end
      end
    end
  end
end)

Event.register(defines.events.on_robot_pre_mined, function(event)
  if event.entity.name == "tree-robot" then
    removeghostRobot(event.entity)
  end
end)

Event.register(defines.events.on_robot_mined, function(event)
  if event.item_stack.name == "treehouse" then
    for index, player in pairs(game.players) do
      if player ~= nil then
        if player.gui.center.treehouseframe ~= nil then
          if global.th.playerdata[index] ~= nil then
            createTreehouseSize(global.th.playerdata[index], 0)
            global.th.playerdata[index] = nil
          end
          player.gui.center.treehouseframe.destroy()
        end
      end
    end
  end
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
  elseif event.created_entity.name == "tree-robot" then
    createTreeRobots(event)
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
  elseif event.created_entity.name == "tree-robot" then
    createTreeRobots(event)
  end
end)

Event.register(defines.events.on_tick, function(event)
  if global.th.cur_gp_tick > 0 or global.th.cur_tree_tick > 0 or global.th.cur_robot_tick > 0 then
    if global.th.cur_robot_tick > 0 and (event.tick > global.th.cur_robot_tick + global.th.robot_per_time) then
      global.th.cur_robot_tick = event.tick
      dealRobots(event)
    end
    
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
    if playerdata ~= nil and playerdata.treehouse ~= nil and playerdata.treehouse.houseentity ~= nil and playerdata.treehouse.houseentity.valid then
      local treehouse = playerdata.treehouse
      if player.gui.center.treehouseframe.sizeframe.big_house.state then
        treehouse.house_size = global.th.big_house_size
      elseif player.gui.center.treehouseframe.sizeframe.small_house.state then
        treehouse.house_size = global.th.small_house_size
      else
        treehouse.house_size = global.th.default_house_size
      end

      treehouse.left = math.floor(treehouse.position.x) - (treehouse.house_size - 1)
      treehouse.top = math.floor(treehouse.position.y) - (treehouse.house_size - 1)

      if player.gui.center.treehouseframe.treesframe.planting_tree_09.state then
        treehouse.tree_state = "planting_tree_09"
      else
        treehouse.tree_state = "planting_tree_02"
      end

      if player.gui.center.treehouseframe.houseframe.c_o.state then
        treehouse.house_state = "c_o"
      elseif player.gui.center.treehouseframe.houseframe.p_o.state then
        treehouse.house_state = "p_o"
      else
        treehouse.house_state = "p_a_c"
      end
      
      initHouseTick(treehouse.house_state, event.tick)
    end
    createTreehouseSize(playerdata, 0)
    global.th.playerdata[event.player_index] = nil
    player.gui.center.treehouseframe.destroy()
  elseif playerdata ~= nil and playerdata.treehouse ~= nil and playerdata.treehouse.houseentity ~= nil and playerdata.treehouse.houseentity.valid then
    if event.element.name == "small_house" then
      player.gui.center.treehouseframe.sizeframe.medium_house.state = false
      player.gui.center.treehouseframe.sizeframe.big_house.state = false
      if not player.gui.center.treehouseframe.sizeframe.small_house.state then
        player.gui.center.treehouseframe.sizeframe.small_house.state = true
      end
      createTreehouseSize(playerdata, global.th.small_house_size)
    elseif event.element.name == "medium_house" then
      player.gui.center.treehouseframe.sizeframe.small_house.state = false
      player.gui.center.treehouseframe.sizeframe.big_house.state = false
      if not player.gui.center.treehouseframe.sizeframe.medium_house.state then
        player.gui.center.treehouseframe.sizeframe.medium_house.state = true
      end
      createTreehouseSize(playerdata, global.th.default_house_size)
    elseif event.element.name == "big_house" then
      player.gui.center.treehouseframe.sizeframe.small_house.state = false
      player.gui.center.treehouseframe.sizeframe.medium_house.state = false
      if not player.gui.center.treehouseframe.sizeframe.big_house.state then
        player.gui.center.treehouseframe.sizeframe.big_house.state = true
      end
      createTreehouseSize(playerdata, global.th.big_house_size)
    elseif event.element.name == "planting_tree_09" then
      player.gui.center.treehouseframe.treesframe.planting_tree_02.state = false
      if not player.gui.center.treehouseframe.treesframe.planting_tree_09.state then
        player.gui.center.treehouseframe.treesframe.planting_tree_09.state = true
      end
    elseif event.element.name == "planting_tree_02" then
      player.gui.center.treehouseframe.treesframe.planting_tree_09.state = false
      if not player.gui.center.treehouseframe.treesframe.planting_tree_02.state then
        player.gui.center.treehouseframe.treesframe.planting_tree_02.state = true
      end
    elseif event.element.name == "p_a_c" then
      player.gui.center.treehouseframe.houseframe.p_o.state = false
      player.gui.center.treehouseframe.houseframe.c_o.state = false
      if not player.gui.center.treehouseframe.houseframe.p_a_c.state then
        player.gui.center.treehouseframe.houseframe.p_a_c.state = true
      end
    elseif event.element.name == "p_o" then
      player.gui.center.treehouseframe.houseframe.p_a_c.state = false
      player.gui.center.treehouseframe.houseframe.c_o.state = false
      if not player.gui.center.treehouseframe.houseframe.p_o.state then
        player.gui.center.treehouseframe.houseframe.p_o.state = true
      end
    elseif event.element.name == "c_o" then
      player.gui.center.treehouseframe.houseframe.p_a_c.state = false
      player.gui.center.treehouseframe.houseframe.p_o.state = false
      if not player.gui.center.treehouseframe.houseframe.c_o.state then
        player.gui.center.treehouseframe.houseframe.c_o.state = true
      end
    end
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
  global.th.houselist[index].house_size = global.th.default_house_size
  global.th.houselist[index].houseentity = houseentity
  global.th.houselist[index].position = houseentity.position
  global.th.houselist[index].left = math.floor(global.th.houselist[index].position.x) - (global.th.default_house_size - 1)
  global.th.houselist[index].top = math.floor(global.th.houselist[index].position.y) - (global.th.default_house_size - 1)
  global.th.houselist[index].treedata = {}
  global.th.houselist[index].robotdata = {}

  local fertilizerchest = findFertilizerchest(houseentity)
  local position = {houseentity.position.x, houseentity.position.y + 2}
  if fertilizerchest == nil and game.get_surface("1").can_place_entity{name = "treehouse-chest", position = position, force = game.forces.player} then
    fertilizerchest = game.get_surface("1").create_entity{name = "treehouse-chest", position = position, force = game.forces.player}
  end
  global.th.houselist[index].fertilizerchest = fertilizerchest

  chooseOptionwithHouse(player_index, global.th.houselist[index])
end

function findFertilizerchest(houseentity)
  return game.get_surface(1).find_entity("treehouse-chest", {houseentity.position.x, houseentity.position.y + 2})
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
      local robotfreeinfo = {}
      local robotworkinfo = {}
      for index, robot in pairs(treehouse.robotdata) do
        if robot ~= nil and robot.robotentity ~= nil and robot.robotentity.valid then
          if robot.state == "free" then
            robotfreeinfo[#robotfreeinfo + 1] = robot
          elseif robot.treeinfo ~= nil then
            robotworkinfo[#robotworkinfo + 1] = robot
          end
        end
      end
      local robotfreenum = #robotfreeinfo
      
      if treehouse.houseentity.valid then
        hasTreehouse = true
      end

      if treehouse.houseentity.valid and robotfreenum > 0 then
        local robotworknum = 1
        if house_state == 3 then
          local treeEnts = game.get_surface("1").find_entities_filtered{area = {{treehouse.left, treehouse.top}, {treehouse.left + treehouse.house_size * 2 - 1, treehouse.top + treehouse.house_size * 2 - 1}}, type = "tree"}
          for _, tree in ipairs(treeEnts) do
            if robotfreenum <= 0 then
              break
            end

            local robotworking = false
            for _, robot in ipairs(robotworkinfo) do
              if robot.treeinfo.treeentity == tree then
                robotworking = true
                break
              end
            end

            if not robotworking then
              robotfreeinfo[robotworknum].state = "cutting"
              robotfreeinfo[robotworknum].curtime = event.tick
              robotfreeinfo[robotworknum].treeinfo = {}
              robotfreeinfo[robotworknum].treeinfo.treeentity = tree
              robotGoPosition(robotfreeinfo[robotworknum], robotfreeinfo[robotworknum].treeinfo.treeentity.position)
              robotworknum = robotworknum + 1
              robotfreenum = robotfreenum - 1
            end
          end
        else
          local max_tree = math.pow(treehouse.house_size, 2)
          for i = 1, max_tree, 1 do
            if robotfreenum <= 0 then
              break
            end
            
            local x = treehouse.left + ((i - 1) % treehouse.house_size) * 2 + 0.5
            local y = treehouse.top + math.floor((i - 1) / treehouse.house_size) * 2 + 0.5
            
            if not checkEntityEdge(treehouse.houseentity, x, y, 0) then
              if treehouse.treedata[i] ~= nil and treehouse.treedata[i].treeentity ~= nil then
                local treeentity = treehouse.treedata[i].treeentity
                if not treeentity.valid then
                  treehouse.treedata[i].treeentity = nil
                elseif house_state == 1 and treeentity.type == "tree" and global.th.tree_type[treeentity.name] == nil then
                  local robotworking = false
                  for _, robot in ipairs(robotworkinfo) do
                    if robot.treeinfo.treeentity == treeentity then
                      robotworking = true
                      break
                    end
                  end
                  
                  if not robotworking then
                    robotfreeinfo[robotworknum].state = "cutting"
                    robotfreeinfo[robotworknum].curtime = event.tick
                    robotfreeinfo[robotworknum].treeinfo = {}
                    robotfreeinfo[robotworknum].treeinfo.treeentity = treeentity
                    robotGoPosition(robotfreeinfo[robotworknum], robotfreeinfo[robotworknum].treeinfo.treeentity.position)
                    robotworknum = robotworknum + 1
                    robotfreenum = robotfreenum - 1
                  end
                end
              else
                local canplace = true
                local treeEnts = game.get_surface("1").find_entities_filtered{area = {{x - 1.5, y - 1.5}, {x + 1.5, y + 1.5}}, type = "tree"}
                if house_state == 2 and #treeEnts > 0 then
                  canplace = false
                else
                  for _, tree in ipairs(treeEnts) do
                    canplace = false
                    if robotfreenum <= 0 then
                      break
                    end
                    
                    if global.th.tree_type[tree.name] == nil then
                      local robotworking = false
                      for _, robot in ipairs(robotworkinfo) do
                        if robot.treeinfo.treeentity == tree then
                          robotworking = true
                          break
                        end
                      end
                      
                      if not robotworking then
                        robotfreeinfo[robotworknum].state = "cutting"
                        robotfreeinfo[robotworknum].curtime = event.tick
                        robotfreeinfo[robotworknum].treeinfo = {}
                        robotfreeinfo[robotworknum].treeinfo.treeentity = tree
                        robotGoPosition(robotfreeinfo[robotworknum], robotfreeinfo[robotworknum].treeinfo.treeentity.position)
                        robotworknum = robotworknum + 1
                        robotfreenum = robotfreenum - 1
                      end
                    end
                  end
                end
                
                if robotfreenum <= 0 then
                  break
                end

                local tilename = "none"
                if canplace then
                  tilename = game.get_surface("1").get_tile(x, y).name
                end
                if canplace and global.th.land_efficiency[tilename] ~= nil then
                  local robotworking = false
                  for _, robot in ipairs(robotworkinfo) do
                    if robot.treeinfo.treepos == i then
                      robotworking = true
                      break
                    end
                  end
                  if (not robotworking) and game.get_surface("1").can_place_entity{name = "treehouse-4", position = {x, y}, force = game.forces.player} then
                    robotfreeinfo[robotworknum].state = "gohome"
                    robotfreeinfo[robotworknum].secstate = "planting"
                    robotfreeinfo[robotworknum].curtime = event.tick
                    robotfreeinfo[robotworknum].treeinfo = {}
                    robotfreeinfo[robotworknum].treeinfo.housepos = index
                    robotfreeinfo[robotworknum].treeinfo.treepos = i
                    robotfreeinfo[robotworknum].treeinfo.seedname = tree_name
                    math.randomseed(game.tick)
                    robotfreeinfo[robotworknum].treeinfo.feeding = 0
                    robotfreeinfo[robotworknum].treeinfo.naturalpoint = math.random(global.th.grow_naturalpoint_min, global.th.grow_naturalpoint_max) / 1000
                    robotfreeinfo[robotworknum].treeinfo.efficiency = global.th.land_efficiency[tilename]
                    robotfreeinfo[robotworknum].treeinfo.position = {x = x, y = y}
                    robotGoPosition(robotfreeinfo[robotworknum], {x=treehouse.position.x, y=treehouse.position.y-2.5})
                    robotworknum = robotworknum + 1
                    robotfreenum = robotfreenum - 1
                  end
                end
              end
            end
          end

          if treehouse.fertilizerchest == nil or (not treehouse.fertilizerchest.valid) then
            treehouse.fertilizerchest = findFertilizerchest(treehouse.houseentity)
          end

          if robotfreenum > 0 and treehouse.fertilizerchest ~= nil then
            local max_tree = math.pow(treehouse.house_size, 2)
            for i = 1, max_tree, 1 do
              if robotfreenum <= 0 then
                break
              end
            
              local x = treehouse.left + ((i - 1) % treehouse.house_size) * 2 + 0.5
              local y = treehouse.top + math.floor((i - 1) / treehouse.house_size) * 2 + 0.5
              if not checkEntityEdge(treehouse.houseentity, x, y, 0) then
                if treehouse.treedata[i] ~= nil and treehouse.treedata[i].treeentity ~= nil and treehouse.treedata[i].treeentity.valid then
                  local treeentity = treehouse.treedata[i].treeentity
                  if treehouse.treedata[i].feeding == "none" and global.th.tree_type[treeentity.name] ~= nil and treehouse.fertilizerchest.get_item_count("charcoal-dust") > 0 then
                    local robotworking = false
                    for _, robot in ipairs(robotworkinfo) do
                      if robot.treeinfo.treeentity == treeentity then
                        robotworking = true
                        break
                      end
                    end
                    
                    if not robotworking then
                      robotfreeinfo[robotworknum].state = "gohome"
                      robotfreeinfo[robotworknum].secstate = "feeding"
                      robotfreeinfo[robotworknum].curtime = event.tick
                      robotfreeinfo[robotworknum].treeinfo = treehouse.treedata[i].treeinfo
                      robotGoPosition(robotfreeinfo[robotworknum], {x=treehouse.position.x, y=treehouse.position.y-2.5})
                      robotworknum = robotworknum + 1
                      robotfreenum = robotfreenum - 1
                    end
                  end
                end
              end
            end
          end
        end
      elseif not treehouse.houseentity.valid then
        treehouse.houseentity = nil
        treehouse.treedata = {}
        robotGoHome(treehouse.robotdata)
        treehouse.robotdata = {}
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
        if event.tick >= treeinfo.curtime + (1 + treeinfo.naturalpoint - treeinfo.feeding) * global.th.grow_tree_time / treeinfo.efficiency then
          local treetype = global.th.tree_type[treeinfo.treeentity.name] + 1
          local position = treeinfo.treeentity.position
          treeinfo.treeentity.destroy()
          if treetype ~= 5 and treetype ~= 9 then
            treeinfo.curtime = event.tick
            treeinfo.feeding = 0
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
            global.th.houselist[treeinfo.housepos].treedata[treeinfo.treepos].feeding = "none"
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
  if not hastrees then
    global.th.cur_tree_tick = 0
    global.th.treelist = {}
    if global.th.cur_gp_tick == 0 then
      global.th.houselist = {}
    end
  end
end

function dealRobots(event)
  local hasTreerobot = false
  for index, treehouse in pairs(global.th.houselist) do
    local house_state = global.th.treehouse_state[treehouse.house_state]
    if treehouse ~= nil and treehouse.houseentity ~= nil and treehouse.houseentity.valid and #treehouse.robotdata > 0 and house_state > 0 then
      hasTreerobot = true
      checkRobotPosition(treehouse, robotbaseworking(event, treehouse))
    end
  end
  
  if #global.th.robotlist > 0 then
    hasTreerobot = true
  end
  
  if (global.th.cur_ghost_tick == 0 or (event.tick > global.th.cur_ghost_tick + global.th.grow_pick_per_time)) and (game.players[global.th.player_index] ~= nil and #global.th.robotlist > 0) then
    global.th.cur_ghost_tick = event.tick
    
    local position = game.players[global.th.player_index].position
    local left = math.floor(position.x) - 6
    local top = math.floor(position.y) - 6
    local right = math.floor(position.x) + 6
    local buttom = math.floor(position.y) + 6
    for index, robotinfo in pairs(global.th.robotlist) do
      if robotinfo ~= nil and robotinfo.robotentity ~= nil and robotinfo.robotentity.valid then
        hasTreerobot = true
        local x = robotinfo.robotentity.position.x
        local y = robotinfo.robotentity.position.y
        if not (x > left and x < right and y > top and y < buttom) then
          local pos = position
          math.randomseed(game.tick)
          if math.random() > 0.5 then
            pos.x = pos.x + math.random(1, 2) + math.random(1, 2)
          else
            pos.x = pos.x - math.random(1, 2) - math.random(1, 2)
          end
          if math.random() > 0.5 then
            pos.y = pos.y + math.random(1, 2) + math.random(1, 2)
          else
            pos.y = pos.y - math.random(1, 2) - math.random(1, 2)
          end
          
          local compoundcommand = {
              {type = defines.command.go_to_location, destination = pos, distraction = defines.distraction.none},
              {type = defines.command.wander, distraction = defines.distraction.none}
          }
          robotinfo.robotentity.set_command({type = defines.command.compound, structure_type = defines.compoundcommandtype.return_last, commands = compoundcommand})
        end
      else
        global.th.robotlist[index] = nil
      end
    end
  end

  if not hasTreerobot then
    global.th.cur_robot_tick = 0
    global.th.cur_ghost_tick = 0
  end
end

function checkHomeEdge(entity, x, y)
  local selection = entity.prototype.selection_box
  if selection.right_bottom.x - selection.left_top.x < 1 then
    local dx = (1 - (selection.right_bottom.x - selection.left_top.x)) / 2
    selection.left_top.x = selection.left_top.x - dx
    selection.right_bottom.x = selection.right_bottom.x + dx
  end
  if selection.right_bottom.y - selection.left_top.y < 1 then
    local dy = (1 - (selection.right_bottom.y - selection.left_top.y)) / 2
    selection.left_top.y = selection.left_top.y - dy
    selection.right_bottom.y = selection.right_bottom.y + dy
  end

  local left = entity.position.x + selection.left_top.x
  local top = entity.position.y + selection.left_top.y - 2
  local right = entity.position.x + selection.right_bottom.x
  local buttom = entity.position.y + (selection.left_top.y / 2)
  
  if x > left and x < right and y > top and y < buttom then
    return true
  end
  
  return false
end

function checkEntityEdge(entity, x, y, shift)
  if entity ~= nil and entity.valid then
    local selection = entity.prototype.selection_box
    if selection.right_bottom.x - selection.left_top.x < 1 then
      local dx = (1 - (selection.right_bottom.x - selection.left_top.x)) / 2
      selection.left_top.x = selection.left_top.x - dx
      selection.right_bottom.x = selection.right_bottom.x + dx
    end
    if selection.right_bottom.y - selection.left_top.y < 1 then
      local dy = (1 - (selection.right_bottom.y - selection.left_top.y)) / 2
      selection.left_top.y = selection.left_top.y - dy
      selection.right_bottom.y = selection.right_bottom.y + dy
    end

    local left = entity.position.x + selection.left_top.x - (0.1 + shift)
    local top = entity.position.y + selection.left_top.y - (0.1 + shift)
    local right = entity.position.x + selection.right_bottom.x + (0.1 + shift)
    local buttom = entity.position.y + selection.right_bottom.y + (0.1 + shift)
    
    if x > left and x < right and y > top and y < buttom then
      return true
    end
  end
  
  return false
end

function checkPositionEdge(position, x, y)
  local left = position.x - 1.1
  local top = position.y - 1.1
  local right = position.x + 1.1
  local buttom = position.y + 1.1
  
  if x > left and x < right and y > top and y < buttom then
    return true
  end
  
  return false
end

function chooseOptionwithHouse(player_index, treehouse)
  local player = game.players[player_index]
  if player.gui.center.treehouseframe == nil then
    local treehouseframe = player.gui.center.add{type = "frame", name = "treehouseframe", caption = {"treehouseframe"}, direction = "vertical"}

    treesframe = treehouseframe.add{type = "frame", name = "treesframe", caption = {"treesframe"}, direction = "horizontal"}
    treesframe.add{type = "checkbox", name = "planting_tree_02", caption = {"planting-tree-02"}, state = true}
    treesframe.add{type = "checkbox", name = "planting_tree_09", caption = {"planting-tree-09"}, state = false}
    
    sizeframe = treehouseframe.add{type = "frame", name = "sizeframe", caption = {"sizeframe"}, direction = "horizontal"}
    sizeframe.add{type = "checkbox", name = "small_house", caption = {"small-house"}, state = false}
    sizeframe.add{type = "checkbox", name = "medium_house", caption = {"medium-house"}, state = true}
    sizeframe.add{type = "checkbox", name = "big_house", caption = {"big-house"}, state = false}

    houseframe = treehouseframe.add{type = "frame", name = "houseframe", caption = {"houseframe"}, direction = "horizontal"}
    houseframe.add{type = "checkbox", name = "p_a_c", caption = {"planting-and-cutting"}, state = true}
    houseframe.add{type = "checkbox", name = "p_o", caption = {"planting-only"}, state = false}
    houseframe.add{type = "checkbox", name = "c_o", caption = {"cutting-only"}, state = false}
    
    treehouseframe.add{type = "button", name = "th-ok", caption = {"th-ok"}}

    global.th.playerdata[player_index] = {}
    global.th.playerdata[player_index].treehouse = treehouse
    global.th.playerdata[player_index].house_size = 0
    global.th.playerdata[player_index].sizelist = {}
    createTreehouseSize(global.th.playerdata[player_index], global.th.default_house_size)
  end
end

function createTreehouseSize(playerdata, house_size)
  if playerdata ~= nil and playerdata.house_size ~= nil and playerdata.house_size ~= house_size then
    playerdata.house_size = house_size
    if playerdata.sizelist ~= nil and #playerdata.sizelist > 0 then
      for _, sizeentity in ipairs(playerdata.sizelist) do
        sizeentity.destroy()
      end
      playerdata.sizelist = {}
    end

    if playerdata.treehouse ~= nil and playerdata.treehouse.houseentity ~= nil and playerdata.treehouse.houseentity.valid then
      if house_size > 0 then
        local line = 2 * house_size - 1
        local max_size = math.pow(line, 2)
        local left = math.floor(playerdata.treehouse.position.x) - (house_size - 1)
        local top = math.floor(playerdata.treehouse.position.y) - (house_size - 1)
        for i = 1, max_size, 1 do
          local x = left + (i - 1) % line + 0.5
          local y = top + math.floor((i - 1) / line) + 0.5
          table.insert(playerdata.sizelist, game.get_surface("1").create_entity{name = "treehouse-size", position = {x = x, y = y}, force = game.forces.player})
        end
      end
    end
  end
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
          math.randomseed(game.tick)
          treetemp.feeding = 0
          treetemp.naturalpoint = math.random(global.th.grow_naturalpoint_min, global.th.grow_naturalpoint_max) / 1000
          table.insert(global.th.treelist, treetemp)
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

function robotGoHome(robotdata)
  local player = game.players[global.th.player_index]
  for index, robot in pairs(robotdata) do
    if robot ~= nil and robot.robotentity ~= nil and robot.robotentity.valid then
      if player.can_insert{name = robot.robotentity.name, count = 1} then
        player.insert{name = robot.robotentity.name, count = 1}
        if robot.amount > 0 and robot.cargo ~= nil then
          player.insert{name = robot.cargo, count = robot.amount}
        end
        robot.robotentity.destroy()
      else
        game.players[global.th.player_index].print({"treehouse-gone"})
        table.insert(global.th.robotlist, {state = "ghost", robotentity = robot.robotentity})
      end
    end
  end
end

function calculateDistance(pos1, pos2)
  return math.sqrt(math.pow((pos2.y-pos1.y), 2) + math.pow((pos2.x-pos1.x), 2))
end

function createTreeRobots(event)
  local position = event.created_entity.position
  local areapos = {{position.x - 16, position.y - 16}, {position.x + 16, position.y + 16}}
  local treehouseents = game.get_surface("1").find_entities_filtered{area = areapos, name = "treehouse"}
  local robotdata = nil
  local distance = 10000;
  for _, foundtreehouse in ipairs(treehouseents) do
    for index, treehouse in pairs(global.th.houselist) do
      if treehouse ~= nil and treehouse.houseentity == foundtreehouse then
        local tempdis = calculateDistance(position, treehouse.position)
        if distance > tempdis then
          distance = tempdis
          robotdata = treehouse.robotdata
        end
        break
      end
    end
  end
  
  if robotdata ~= nil then
    local robotinfo = {}
    robotinfo.robotentity = event.created_entity
    table.insert(robotdata, robotinfo)
    initTreeRobot(robotinfo)
  else
    game.players[global.th.player_index].print({"treehouse-gone"})
    table.insert(global.th.robotlist, {state = "ghost", robotentity = event.created_entity})
  end
  
  if global.th.cur_robot_tick == 0 then
    global.th.cur_robot_tick = event.tick
  end
end

function checkRobotPosition(treehouse, robotfreeinfo)
  local left = math.floor(treehouse.position.x) - treehouse.house_size
  local top = math.floor(treehouse.position.y) - treehouse.house_size
  local right = math.floor(treehouse.position.x) + treehouse.house_size + 1
  local buttom = math.floor(treehouse.position.y) + treehouse.house_size + 1
  
  local compoundcommand = {
    {type = defines.command.go_to_location, destination = {x=treehouse.position.x, y=treehouse.position.y-3}, distraction = defines.distraction.none},
    {type = defines.command.wander, distraction = defines.distraction.none}
}
  local robotcommand = {type = defines.command.compound, structure_type = defines.compoundcommandtype.return_last, commands = compoundcommand}
      
  for index, robot in ipairs(robotfreeinfo) do
    local x = robot.robotentity.position.x
    local y = robot.robotentity.position.y
    if not (x > left and x < right and y > top and y < buttom) then
      robot.robotentity.set_command(robotcommand)
    end
  end
end

function initTreeRobot(robot)
  robot.state = "free"
  robot.secstate = nil
  robot.curtime = 0
  robot.treeinfo = nil
  robot.amount = 0
  robot.cargo = nil
  robot.robotentity.set_command({type = defines.command.wander, distraction = defines.distraction.none})
end

function robotGoPosition(robot, position)
  if position ~= nil then
    local x = robot.robotentity.position.x
    local y = robot.robotentity.position.y
    if x >= position.x + 0.8 then
      x = position.x - 2.5
    elseif x <= position.x - 0.8 then
      x = position.x + 2.5
    else
      x = position.x
    end
    
    if y >= position.y + 0.8 then
      y = position.y - 2.5
    elseif y <= position.y - 0.8 then
      y = position.y + 2.5
    else
      y = position.y
    end
    robot.robotentity.set_command({type = defines.command.go_to_location, destination = {x, y}, distraction = defines.distraction.none})
  end
end

function removeghostRobot(entity)
  local hasfound = false
  for _, treehouse in pairs(global.th.houselist) do
    if hasfound then
      break
    end

    if treehouse ~= nil and treehouse.robotdata ~= nil and #treehouse.robotdata > 0 then
      for index, robot in pairs(treehouse.robotdata) do
        if robot ~= nil and robot.robotentity ~= nil then
          if robot.robotentity == entity then
            table.remove(treehouse.robotdata, index)
            hasfound = true
            break
          end
        end
      end
    end
  end
end

function robotbaseworking(event, treehouse)
  local robotfreeinfo = {}
  for index, robot in pairs(treehouse.robotdata) do
    if robot ~= nil then
      if robot.robotentity.valid then
        if robot.state == "free" then
          robotfreeinfo[#robotfreeinfo + 1] = robot
        elseif robot.curtime > 0 and event.tick > robot.curtime + 15 * 60 then
          robot.state = "gohome"
          robot.secstate = nil
          robot.curtime = event.tick
          robot.robotentity.teleport({x = treehouse.position.x, y = treehouse.position.y - 3})
          robotGoPosition(robot, {x=treehouse.position.x, y=treehouse.position.y-2.5})
        elseif robot.state == "gohome" then
          if checkHomeEdge(treehouse.houseentity, robot.robotentity.position.x, robot.robotentity.position.y) then
            if robot.amount > 0 and robot.cargo ~= nil then
              if robot.cargo == "charcoal-dust" and findFertilizerchest(treehouse.houseentity) ~= nil then
                findFertilizerchest(treehouse.houseentity).insert{name = robot.cargo, count = robot.amount}
              else
                treehouse.houseentity.insert{name = robot.cargo, count = robot.amount}
              end
              robot.amount = 0
            end

            if robot.secstate ~= nil then
              robot.state = robot.secstate
              robot.secstate = nil
              robot.curtime = event.tick
              if robot.state == "cutting" then
                robotGoPosition(robot, robot.treeinfo.treeentity.position)
              elseif robot.state == "feeding" then
                if treehouse.fertilizerchest ~= nil and treehouse.fertilizerchest.valid and treehouse.fertilizerchest.remove_item{name = "charcoal-dust", count = 1} > 0 then
                  robot.cargo = "charcoal-dust"
                  robot.amount = 1
                  robotGoPosition(robot, robot.treeinfo.position)
                else
                  initTreeRobot(robot)
                  robotfreeinfo[#robotfreeinfo + 1] = robot
                end
              else
                robotGoPosition(robot, robot.treeinfo.position)
              end
            else
              initTreeRobot(robot)
              robotfreeinfo[#robotfreeinfo + 1] = robot
            end
          else
            robotGoPosition(robot, {x=treehouse.position.x, y=treehouse.position.y-2.5})
          end
        elseif robot.state == "planting" then
          if checkPositionEdge(robot.treeinfo.position, robot.robotentity.position.x, robot.robotentity.position.y) then
            local x = robot.treeinfo.position.x
            local y = robot.treeinfo.position.y
            if #game.get_surface("1").find_entities_filtered{area = {{x - 1.5, y - 1.5}, {x + 1.5, y + 1.5}}, type = "tree"} == 0 and game.get_surface("1").can_place_entity{name = robot.treeinfo.seedname, position = robot.treeinfo.position, force = game.forces.player} then
              treehouse.treedata[robot.treeinfo.treepos] = {}
              treehouse.treedata[robot.treeinfo.treepos].treeentity = game.get_surface("1").create_entity{name = robot.treeinfo.seedname, position = robot.treeinfo.position, force = game.forces.player}
              treehouse.treedata[robot.treeinfo.treepos].curtime = event.tick
              treehouse.treedata[robot.treeinfo.treepos].efficiency = robot.treeinfo.efficiency
              treehouse.treedata[robot.treeinfo.treepos].treeinfo = robot.treeinfo
              treehouse.treedata[robot.treeinfo.treepos].feeding = "none"

              robot.treeinfo.curtime = event.tick
              robot.treeinfo.treeentity = treehouse.treedata[robot.treeinfo.treepos].treeentity
              table.insert(global.th.treelist, robot.treeinfo)

              if global.th.cur_tree_tick == 0 then
                global.th.cur_tree_tick = event.tick
              end
            end
          
            initTreeRobot(robot)
            robotfreeinfo[#robotfreeinfo + 1] = robot
          else
            robotGoPosition(robot, robot.treeinfo.position)
          end
        elseif robot.state == "feeding" then
          if checkPositionEdge(robot.treeinfo.position, robot.robotentity.position.x, robot.robotentity.position.y) then
            local treeinfo = robot.treeinfo
            if treeinfo ~= nil and treeinfo.treeentity.valid and global.th.tree_type[treeinfo.treeentity.name] ~= nil and robot.amount > 0 and robot.cargo ~= nil and global.th.feeding_point[robot.cargo] ~= nil and global.th.feeding_point[robot.cargo] > 0 and treehouse.treedata[robot.treeinfo.treepos].feeding == "none" then
              treehouse.treedata[robot.treeinfo.treepos].feeding = robot.cargo
              
              local treetype = global.th.tree_type[treeinfo.treeentity.name] - global.th.tree_type[treeinfo.seedname] + 1
              local point = global.th.feeding_point[robot.cargo]
              
              math.randomseed(event.tick)
              if treetype == 1 then
                treeinfo.feeding = math.floor(point % 1000) / 1000
              elseif treetype ~= 4 then
                treeinfo.feeding = math.random(math.floor(point / 1000), math.floor(point % 1000)) / 1000
              else
                treeinfo.feeding = math.random(100, math.floor(point / 1000)) / 1000
              end

              initTreeRobot(robot)
              robotfreeinfo[#robotfreeinfo + 1] = robot
            else
              robot.state = "gohome"
              robot.secstate = nil
              robot.curtime = event.tick
              robotGoPosition(robot, {x=treehouse.position.x, y=treehouse.position.y-2.5})
            end
          else
            robotGoPosition(robot, robot.treeinfo.position)
          end
        elseif robot.state == "cutting" then
          if robot.treeinfo.treeentity.valid then
            if checkEntityEdge(robot.treeinfo.treeentity, robot.robotentity.position.x, robot.robotentity.position.y, 0.7) then
              robot.state = "gohome"
              robot.cargo = "raw-wood"
              robot.curtime = event.tick
              robot.amount = robot.treeinfo.treeentity.prototype.mineable_properties.products[1].amount_min
              robot.treeinfo.treeentity.destroy()
              robotGoPosition(robot, {x=treehouse.position.x, y=treehouse.position.y-2.5})
            else
              robotGoPosition(robot, robot.treeinfo.treeentity.position)
            end
          else
            initTreeRobot(robot)
            robotfreeinfo[#robotfreeinfo + 1] = robot
          end
        else
          game.players[global.th.player_index].print("robotbaseworking something wrond!!")
          initTreeRobot(robot)
          robotfreeinfo[#robotfreeinfo + 1] = robot
        end
      else
        local entity = game.get_surface("1").create_entity{name = "tree-robot", position = {x = treehouse.position.x, y = treehouse.position.y - 3}, force = game.forces.player}
        robot.robotentity = entity
        if robot.state == "free" then
          robotfreeinfo[#robotfreeinfo + 1] = robot
          initTreeRobot(robot)
        end
        --table.remove(treehouse.robotdata, index)
      end
    end
  end
  
  return robotfreeinfo
end