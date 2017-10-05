module FindMaxRecursively where
import Prelude hiding (maximum)

maxR :: [Int] -> Int
maxR [n] = n
maxR (a : b) = max a $ maxR b
