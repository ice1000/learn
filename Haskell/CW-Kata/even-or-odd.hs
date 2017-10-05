module EvenOrOdd where

evenOrOdd :: Integral a => a -> [Char]
evenOrOdd n = if mod n 2 == 0 then "Even" else "Odd"
