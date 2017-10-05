module SumOfJusts where

sumJusts :: [Maybe Integer] -> Maybe Integer
sumJusts ls = Just $ sum $ sum <$> ls
