module Kata where

countPositivesSumNegatives :: Maybe [Int] -> [Int]
countPositivesSumNegatives Nothing = []
countPositivesSumNegatives (Just []) = []
countPositivesSumNegatives (Just xs) = [length [ x | x <- xs, x > 0 ], sum [ x | x <- xs, x < 0 ]]

