module SumList where
import Prelude hiding (sum)

sumList :: [Integer] -> Integer
sumList [     ] = 0
sumList (a : b) = (+) a $ sumList b
