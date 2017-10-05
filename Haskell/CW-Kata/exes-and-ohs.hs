module Codewars.Kata.XO where

count s = length . filter s

-- | Returns true if the number of
-- Xs is equal to the number of Os
-- (case-insensitive)
xo :: String -> Bool
xo str = (count ('o'==) str) + (count ('O'==) str) == (count ('x'==) str) + (count ('X'==) str)

