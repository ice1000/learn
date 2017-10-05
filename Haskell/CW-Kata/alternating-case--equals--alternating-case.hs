module Codewars.Kata.AlternatingCase where

import Data.Char

toAlternatingCase :: String -> String
toAlternatingCase = map (\x -> if isUpper x then toLower x else toUpper x)
