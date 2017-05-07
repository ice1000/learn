module RectangleRot.JorgeVS.Kata where

rectangleRot :: Int -> Int -> Int
rectangleRot a b = (k + k - 1) * (div p 2) + if ((mod p 4) == 1) == ((mod k 2) == 1) then k else k - 1
             where k = (floor (fromIntegral a / 1.41421)) + 1
                   p = (floor (fromIntegral b / 1.41421) * 2) + 1
--
