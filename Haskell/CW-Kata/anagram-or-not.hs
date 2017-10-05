module Codewars.Kata.Anagram where

import Data.List
import Data.Char

isAnagramOf :: String -> String -> Bool
isAnagramOf a b = (filter f $ sort $ toUpper <$> a) == (filter f $ sort $ toUpper <$> b)
  where ls = ['A' .. 'Z'] ++ ['0' .. '9']
        f x = x `elem` ls
--
