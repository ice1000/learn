module Codewars.AlanPartridge.London where

alan :: [String] -> String
alan ls = if all (`elem` ls) cities then "Smell my cheese you mother!"
          else "No, seriously, run. You will miss it."
  where cities = ["Rejection", "Disappointment", "Backstabbing Central", "Shattered Dreams Parkway"]
--
