
-- as the player cannot craft by hand anymore, he needs to have an assembly machine

Event.register(defines.events.on_player_created, function(event)
	game.players[event.player_index].insert({name="burner-assembling-machine", count = 1})
end)
