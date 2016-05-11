require "defines"


script.on_init(function()
	debug("on_init")
end)

script.on_load(function()
	debug("on_load")
end)


script.on_event(defines.events.on_tick, function(event)
	debug("on_event")

end)