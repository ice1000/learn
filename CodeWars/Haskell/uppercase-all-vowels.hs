module UppercaseVowels where

import Data.Char

uppercaseVowels :: String -> String
uppercaseVowels str = (\x -> if elem x "aeiou" then toUpper x else x) <$> str
