module Main where

import Control.Monad

guess :: Int -> IO ()
guess ran = do
  num <- getLine
  putStrLn $ case read num `compare` ran of
    EQ -> "Good Job!"
    GT -> "Too big!"
    LT -> "Too small!"
---

main = do
  putStrLn "Input a magic number, and guess that number!"
  num <- getLine
  forever . guess $ read num
--
