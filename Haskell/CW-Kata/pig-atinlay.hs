module Kata(pigLatin) where

pigLatin :: String -> String
pigLatin [] = []
pigLatin [a] = [a]
pigLatin [a, b] = [a, b]
pigLatin [a, b, c] = [a, b, c]
pigLatin (a : b) = b ++ [a] ++ "ay"
