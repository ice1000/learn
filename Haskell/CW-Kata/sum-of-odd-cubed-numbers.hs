module OddCubed.JorgeVS.Kata where

oddCubed :: [Int] -> Int
oddCubed ls = sum $ (\x -> x * x * x) <$> [ x | x <- ls, odd x ]
