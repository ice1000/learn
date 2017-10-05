module Kata (highAndLow) where

import Data.List.Split

sp :: String -> [String]
sp = splitOn " "

get :: String -> [Int]
get input = map read $ sp input :: [Int]

highAndLow :: String -> String
highAndLow = ap ((++) . show . maximum . get) ((' ' :) . show . minimum . get)
