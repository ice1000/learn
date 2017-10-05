module Average where

avg :: [Float] -> Float
avg l = (sum l) / (fromIntegral $ length l :: Float)
