module Codwars.Kata.Duplicates where

import Data.Char
import Data.List

duplicateCount' :: String -> Int
duplicateCount' [ ]             = 0
duplicateCount' [_]             = 0
duplicateCount' (a:(b:c))|a == b= 1 + duplicateCount' (dropWhile (==a) c)
duplicateCount' str             = duplicateCount' (drop 1 str)

duplicateCount :: String -> Int
duplicateCount str = duplicateCount' $ sort (map toLower str)

