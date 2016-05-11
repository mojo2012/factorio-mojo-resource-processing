require "defines"


-- as the player cannot craft by hand anymore, he needs to have an assembly machine
script.on_init(function()
  pcall(function()
    game.player.insert{name = "burner-assembling-machine", count = 1}
  end)
end)

script.on_event(defines.events.on_player_created, function(event)
  pcall(function()
    game.get_player(event.player_index).insert{name="burner-assembling-machine", count = 1}
  end)
end)
