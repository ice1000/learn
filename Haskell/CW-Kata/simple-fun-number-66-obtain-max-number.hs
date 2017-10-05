module Kata where

import Data.List

obtain_max_number :: [Int] -> Int
obtain_max_number [a, b] = if a == b then a + b else max a b
obtain_max_number lst    = let (a : (b : c)) = sort lst in
  obtain_max_number $ if a == b then (a + b) : c else b : c
--
                                                        
