module AlternateCase where

import Data.Char

alternateCase :: String -> String
alternateCase = ((\x -> if isUpper x then toLower x else toUpper x) <$>)
