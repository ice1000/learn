module Codewars.Kata.SplitStrings where

import Data.List.Split

solution :: String -> [String]
solution s
  |0 == mod (length s) 2 = chunksOf 2 s
  |otherwise             = solution $ s ++ "_"
--
