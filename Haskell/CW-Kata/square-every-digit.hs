module SquareDigit where
import Data.Char

sqr :: Integer -> Integer
sqr a = a * a

sym :: Integer -> Integer
sym a |a >= 0 = 1
      |otherwise = -1
--

digitize :: Integer -> String
digitize s |s < 10 && s > -10 = (show $ sqr s)
           |otherwise = digitize (div s 10) ++ (show $ sqr (mod s 10))
--

squareDigit :: Integer -> Integer
squareDigit a = sym a * (read $ digitize $ abs a :: Integer)
