module Main where

double x = x + x

removeNonUppercase :: [Char] -> [Char]   
removeNonUppercase st = [ c | c <- st, elem c ['A'..'Z']]

factorial :: Integer -> Integer
factorial n = product [2 .. n]

if' :: Bool -> a -> a -> a
if' True x _ = x
if' False _ y = y

guess :: Int -> IO ()
guess input = putStrLn (if' (input == 233)
                            "Good Job!"
                            (if' (input > 233)
                                    "Too big!"
                                    "Too small!"))
---

main = do putStrLn "Call guess and input a number from 1 to 500!"
          guess (read "233")

--
