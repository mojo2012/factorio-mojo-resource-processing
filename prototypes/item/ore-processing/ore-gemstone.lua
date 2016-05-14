require("ore-general")

-- Minable ressources
data.raw["resource"]["gem-ore"].minable.result = nil
data.raw["resource"]["gem-ore"].minable.results = {
  ressourceItemMinMaxProb("gem-ore",   1, 1, 0.3), -- 1 item at percentage 0.9 --
  ressourceItemMinMaxProb("gravel",     1, 1, 0.5),
  ressourceItemMinMaxProb("stone",     1, 1, 0.4),
  ressourceItemMinMaxProb("dirt",       1, 1, 0.7)
}
