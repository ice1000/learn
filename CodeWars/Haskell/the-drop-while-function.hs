module Codewars.Exercise.DropWhile where
import Prelude hiding (dropWhile, span, break)

dropWhile :: [a] -> (a -> Bool) -> [a]
dropWhile [      ] p = []
dropWhile (x : xs) p
  |p x       = dropWhile xs p
  |otherwise = x : xs
--
    
