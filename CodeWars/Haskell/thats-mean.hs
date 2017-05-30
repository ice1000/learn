module Mean where

mean :: (Integral a, Fractional b) => [a] -> b
mean a = (fromIntegral $ sum a) / (fromIntegral $ length a)
