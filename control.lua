--config
require "config.config"

require "util"
require "defines"
require "stdlib.log.logger"
require "stdlib.event.event"

global.logger = Logger.new("mojo-resource-processing", nil, Config.debug_mode, nil)

--some helper function
require("lib.helper")

-- specific event handling for the various sub parts of the mod
require("logic.ore-processing.control")
require("logic.cokery.control")
require("logic.no-hand-crafting.control")
require("logic.terraform.control")
require("logic.biofarm.control")

--require("logic.tree-farm.control")