module Kata (noSpace) where

noSpace :: String -> String
noSpace str = [ a | a <- str, a /= ' ' ]
