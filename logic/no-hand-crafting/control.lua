require "defines"


-- as the player cannot craft by hand anymore, he needs to have an assembly machine
Event.register(core_events.init, function()
	game.player.insert{name = "burner-assembling-machine", count = 1}
end)

Event.register(defines.events.on_player_created, function(event)
	game.get_player(event.player_index).insert{name="burner-assembling-machine", count = 1}
end)
