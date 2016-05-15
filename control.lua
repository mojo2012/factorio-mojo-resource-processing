require "defines"
require "stdlib.log.logger"
require "stdlib.event.event"

--config
require "config.config"

--some helper function
require("lib.helper")

-- specific event handling for the various sub parts of the mod
require("logic.ore-processing.control")
require("logic.cokery.control")
require("logic.tree-farm.control")
require("logic.no-hand-crafting.control")
require("logic.terraform.control")