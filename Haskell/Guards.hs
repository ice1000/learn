module Guards where

guess :: Int -> String
guess input
     |input < magicNum = "Too small."
     |input > magicNum = "Too big."
     |otherwise        = "You win."
     where magicNum = 233
--

short :: String -> String -> String
short fn ln = [f] ++ "." ++ [l] ++ "."
      where (f : _) = fn
            (l : _) = ln
--


