--config
require "config.config"

require "util"
require "stdlib.log.logger"
require "stdlib.event.event"

--some helper function
require("lib.helper")

LOG = Logger.new("mojo-resource-processing", nil, Config.debug_mode, nil)


-- specific event handling for the various sub parts of the mod
--require("logic.terraform.control")
require("logic.ore-processing.control")
require("logic.cokery.control")
require("logic.no-hand-crafting.control")
require("logic.biofarm.control")
