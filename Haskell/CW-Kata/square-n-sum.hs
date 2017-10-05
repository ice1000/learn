module SquareSum where

squareSum :: [Integer] -> Integer
squareSum n = sum $ (^ 2) <$> n
