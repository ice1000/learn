module HumanTime where

format :: Int -> String
format a|a < 10    = "0" ++ show a
        |otherwise = show a

humanReadable :: Int -> String
humanReadable x = format (div x 3600) ++ ":" ++ format (mod (div x 60) 60) ++ ":" ++ format (mod x 60)

