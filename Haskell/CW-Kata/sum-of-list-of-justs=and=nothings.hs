module SumOfJustsAndNothings where

sumJusts :: [Maybe Integer] -> Maybe Integer
sumJusts ls = Just $ sum $ sum <$> ls

