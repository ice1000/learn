module DnaToRna where

dnaToRna :: String -> String
dnaToRna xs = (\x -> if 'T' == x then 'U' else x) <$> xs
