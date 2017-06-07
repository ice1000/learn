module MiniStringFuck where

import Data.Char

plus1 :: Int -> Int
plus1 255 = 0
plus1 n   = n + 1

minus1 :: Int -> Int
minus1 0 = 255
minus1 n = n - 1

-- | Interprets the Brainfuck source code from the first argument, while
-- supplying it with input from the second. May fail on insufficient input.
myFirstInterpreter :: String -> String
myFirstInterpreter code = f code 0
  where f [       ] n = []
        f ('+' : c) n = f c $ plus1 n
        f ('.' : c) n = chr n : f c n
        f ( _  : c) n = f c n
--
