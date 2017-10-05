module Codewars.AlanPartridge.PartridgeWatch where

part :: [String] -> String
part ls = let n = length [ a | a <- ls, a `elem` stuffs ] in
            if n > 0 then "Mine's a Pint" ++ (take n $ repeat '!')
            else "Lynn, I've pierced my foot on a spike!!"
  where stuffs = ["Partridge", "PearTree", "Chat", "Dan", "Toblerone", "Lynn", "AlphaPapa", "Nomad"]
--
