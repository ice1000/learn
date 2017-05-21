module Codewars.Arrays where

import Data.List

uniqueSum :: [Int] -> Int
uniqueSum = sum . nub
