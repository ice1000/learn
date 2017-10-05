module Awesome.Numbers where

data Answer = No | Almost | Yes deriving (Show, Read, Eq, Ord)

judge1 :: Integer -> Bool
judge1 a|a < 10    = True
        |otherwise = (mod a 10) == 0 && judge1 (div a 10)
--

judge2 :: Integer -> Bool
judge2 a|a < 10    = True
        |otherwise = (elem (mod a 100) [11, 22 .. 99]) && judge2 (div a 10)
--

judge3 :: Integer -> Bool
judge3 a = show a == reverse (show a)

fuckList = [890, 7890, 67890, 567890, 4567890, 34567890, 234567890, 1234567890]

judge4 :: Integer -> Bool
judge4 a|last ls /= '0' = [ls !! 0, ls !! 1 .. last ls] == ls
        |otherwise      = [ls !! 0, ls !! 1 .. last ls] == ls || elem a fuckList
        where ls = show a
--

isInteresting' :: Integer -> Bool
isInteresting' x = x > 99 && (judge1 x || judge2 x || judge3 x || judge4 x)

isInteresting :: Integer -> [Integer] -> Answer
isInteresting x xs|x < 97 = No
                  |isInteresting'    x    || (elem    x    xs) = Yes
                  |isInteresting' (x + 1) || (elem (x + 1) xs) = Almost
                  |isInteresting' (x + 2) || (elem (x + 2) xs) = Almost
                  |otherwise = No
--
