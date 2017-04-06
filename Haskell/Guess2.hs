module TreeFunctor where

guess :: Int -> String
guess input
     |input < 233 = "Too small."
     |input > 233 = "Too big."
     |otherwise   = "You win."
--
