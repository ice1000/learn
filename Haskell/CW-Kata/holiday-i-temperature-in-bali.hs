module BaliTemp where

bareable :: Int -> Float -> Bool
bareable heat humidity
  | (heat >35) || (humidity > 0.5) || (humidity >0.4) && (heat >25) && (heat <36) = False
  | otherwise = True
--
