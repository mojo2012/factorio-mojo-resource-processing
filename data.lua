-- needed during factorio startup to initialize the plugin

-- some helper functions necessary to deal some internal initialization
require("logic.helper")

-- the actual modded game items
require("prototypes.item.base")
require("prototypes.entity.base")
require("prototypes.recipe.base")
require("prototypes.technology.base")

-- some init stuff specific to the various sub parts of the mod
require("logic.ore-processing.init")
require("logic.no-hand-crafting.init")
require("logic.cokery.init")
require("logic.tree-farm.init")
require("logic.terraform.init")