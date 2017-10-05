module Codewars.AlanPartridge.AppleTurnover where

apple :: Either String Int -> String
apple (Left s)  = apple $ Right (read s :: Int)
apple (Right i) = if i * i > 1000 then "It's hotter than the sun!!"
                  else "Help yourself to a honeycomb Yorkie for the glovebox."
--
