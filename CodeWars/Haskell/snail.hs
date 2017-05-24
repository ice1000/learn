module Snail where

exampleArray :: [[Int]]
exampleArray = [[1,2,3],
                [8,9,4],
                [7,6,5]]
--

exampleArray2 :: [[Int]]
exampleArray2 = [[1,2,3],
                 [4,5,6],
                 [7,8,9]]
--

snail :: [[Int]] -> [Int]
snail [] = []
snail [[a]] = [a]
snail [[a, b], [c, d]] = [a, b, d, c]
snail (fir : arr) =
  let middle = init arr
      lst    = last arr in
    fir ++ (last <$> middle)
    ++ reverse lst ++
    reverse (head <$> middle)
    ++ snail (init . tail <$> middle)
---
