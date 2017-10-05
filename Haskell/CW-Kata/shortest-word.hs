module FindShortest where

import Data.List.Split

find_shortest :: String -> Integer
find_shortest str = toInteger $ minimum $ map length $ splitOn " " str

