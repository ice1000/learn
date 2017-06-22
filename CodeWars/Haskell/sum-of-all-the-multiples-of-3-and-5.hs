module SumOfMultiples where

evalSeq :: Int -> Int -> Int
evalSeq a n = sum $ tail [0, a .. n]

findSum :: Int -> Int
findSum n = evalSeq 3 n + evalSeq 5 n - evalSeq 15 n
