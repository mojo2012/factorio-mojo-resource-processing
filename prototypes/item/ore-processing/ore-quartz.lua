require("ore-general")

-- Minable ressources
data.raw["resource"]["quartz"].minable.result = nil
data.raw["resource"]["quartz"].minable.results = {
  ressourceItemMinMaxProb("quartz",   1, 1, 0.3), -- 1 item at percentage 0.9 --
  ressourceItemMinMaxProb("gravel",     1, 1, 0.5),
  ressourceItemMinMaxProb("stone",     1, 1, 0.4),
  ressourceItemMinMaxProb("dirt",       1, 1, 0.7)
}
