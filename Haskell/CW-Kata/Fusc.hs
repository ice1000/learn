module Fusc where

fusc :: Int -> Int
fusc 0 = 0
fusc 1 = 1
fusc n
  |even n    = fusc $ div n 2
  |otherwise = (fusc $ div n 2) + (fusc $ 1 + div n 2)
--
