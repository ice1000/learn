module ParseFloat where

import Data.Maybe

parseFloat :: String -> Maybe Float
parseFloat s
  |1 >= (length $ filter (== '.') s) && all (\x -> elem x ('.' : ['0' .. '9'])) s = Just (read s :: Float)
  |otherwise = Nothing
--
    
