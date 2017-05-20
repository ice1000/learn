module Codewars.Kata.FakeBinary where

fakeBin :: String -> String
fakeBin xs = (\c -> if (read [c] :: Int) > 4 then '1' else '0') <$> xs
