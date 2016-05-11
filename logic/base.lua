require("lib.basic_extensions")
require("lib.logging")

-- Used to change minable results from ore fields
function ressourceItemMinMaxProb(itemName, amountMin, amountMax, probability)
  return {
    type = "item",
    name = itemName,
    amount_min = amountMin,
    amount_max = amountMax,
    probability = probability
  }
end