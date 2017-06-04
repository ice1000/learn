module MultiplesOf3And5 where

evalSeq :: Integer -> Integer -> Integer
evalSeq a n = sum $ tail [0, a .. n - 1]

solution :: Integer -> Integer
solution n = evalSeq 3 n + evalSeq 5 n - evalSeq 15 n
