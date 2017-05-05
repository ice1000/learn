module Kata.NPointCrossover where

import Data.List

crossOver :: [Int] -> [a] -> [a] -> [(a, a)]
crossOver  [ ]      a       b    = zip   a  b
crossOver  [0]      a       b    = zip   b  a
crossOver (0:ns) (hx:tx) (hy:ty) = (hy, hx) : (crossOver (map (\x -> x - 1) (filter (>0) ns)) ty tx)
crossOver   ns   (hx:tx) (hy:ty) = (hx, hy) : (crossOver (map (\x -> x - 1) ns) tx ty)

crossover :: [Int] -> [a] -> [a] -> ([a],[a])
crossover ns x y = unzip (crossOver (sort ns) x y)
