module NumberFactors where

getFactors :: Int -> [Int]
getFactors n = [x | x <- [1 .. n], n `mod` x == 0 ]
