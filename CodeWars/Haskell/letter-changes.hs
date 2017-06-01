module Codewars.Kata.Letter where

import Data.Char

change :: Char -> Char
change 'z' = 'a'
change 'Z' = 'A'
change c
  |elem c ls = chr $ fromEnum c + 1
  |otherwise = c
  where ls = ['a' .. 'y'] ++ ['A' .. 'Y']
--

-- | Takes a string that contains only ASCII letters
--   and strings and shifts them according to the
--   description.
letterChange :: String -> String
letterChange = (change <$>)

