module Palindroms where

import Data.Char

firstLast :: [a] -> [a]
firstLast []  = []
firstLast [x] = []
firstLast xs  = tail (init xs)

isPalindrom :: String -> Bool
isPalindrom []  = True
isPalindrom [x] = True
isPalindrom str = (toUpper (str !! 0)) == (toUpper $ last str) && isPalindrom (firstLast str)

