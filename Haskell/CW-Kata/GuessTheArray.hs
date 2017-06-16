module GuessTheArray where

guess :: Integral n => (Int -> Int -> n) -> Int -> [n]
guess f n = let threeSum = div (f 0 1 + f 1 2 + f 0 2) 2 in
  let zero = threeSum - f 1 2
      one  = threeSum - f 0 2
      two  = threeSum - f 0 1 in
    zero : one : findN (n - 2) two
  where findN 0  _ = []
        findN i' l = let i = n - i' in
          l : (findN (i' - 1) $ (f i $ i + 1) - l)
--

