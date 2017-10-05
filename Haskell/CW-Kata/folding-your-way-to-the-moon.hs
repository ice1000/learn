{-# LANGUAGE FlexibleContexts #-}
module Codewars.Kata.Fold where

foldTo :: Double -> Maybe Int
foldTo distance = if distance > 0 then Just $ f 0.0001 else Nothing
  where f n = if n >= distance then 0 else 1 + f (n + n)
--
  
