require("ore-general")

-- Minable ressources
data.raw["resource"]["rutile-ore"].minable.result = nil
data.raw["resource"]["rutile-ore"].minable.results = {
  ressourceItemMinMaxProb("rutile-ore",   1, 1, 0.3), -- 1 item at percentage 0.9 --
  ressourceItemMinMaxProb("gravel",     1, 1, 0.5),
  ressourceItemMinMaxProb("stone",     1, 1, 0.4),
  ressourceItemMinMaxProb("dirt",       1, 1, 0.7)
}
