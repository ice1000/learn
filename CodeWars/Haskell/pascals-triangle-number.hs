module Codewars.Kata.PascalsTriangle where

calculate :: Num a => [a] -> [a]
calculate n = [1] ++ (zipWith (+) n $ tail n) ++ [1]

pascal :: Num a => Int -> [[a]]
pascal 0 = [[]]
pascal 1 = [[1]]
pascal n = let l = pascal $ n - 1 in l ++ [(calculate $ last l)]
--

pascalsTriangle :: Int -> [Int]
pascalsTriangle n = foldl (++) [] $ pascal n
--
