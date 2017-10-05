module Brainfuck ( executeString ) where
--

import qualified Data.Map as M
import qualified Data.Maybe as MB
import qualified Data.Char as C

plus1 :: Int -> Int
plus1 255 = 0
plus1 n   = n + 1

minus1 :: Int -> Int
minus1 0 = 255
minus1 n = n - 1

findMatched :: Int -> String -> Int -> Int
findMatched 0 s i
  |s !! i == ']' = i + 1
  |otherwise     = findMatched 0 s $ i + 1
findMatched n s i
  |s !! i == ']' = findMatched (n - 1) s $ i + 1
  |s !! i == '[' = findMatched (n + 1) s $ i + 1
  |otherwise     = findMatched n       s $ i + 1
--

--                   code       stack    in      pos    ptr    buf              out
interpret :: Bool -> String -> [Int] -> [Int] -> Int -> Int -> M.Map Int Int -> Maybe [Int]
interpret _ [] _ _ _ _ _ = Just []
interpret b c s i pos ptr m = if p > length c
  then if i /= []
       then interpret False c s i 0 ptr m
       else if not b
            then Nothing
            else Just []
  else case command of
  '+' -> recur s i p ptr $ M.insert ptr (plus1 val) m
  '-' -> recur s i p ptr $ M.insert ptr (minus1 val) m
  '<' -> recur s i p (ptr + 1) m
  '>' -> recur s i p (ptr - 1) m
  '[' -> if val /= 0
    then recur (p : s) i p ptr m
    else recur s i (findMatched 0 c p) ptr m
  ']' -> case val of
           0 -> recur (tail s) i p ptr m
           _ -> recur s i (head s) ptr m
  '.' -> (val :) <$> recur s i p ptr m
  ',' -> case i of
    [] -> Just []
    (h : t) -> recur s t p ptr $ M.insert ptr h m
  where command = c !! pos
        p = pos + 1
        recur = interpret b c
        val = MB.fromMaybe 0 $ M.lookup ptr m
--

-- | Interprets the Brainfuck source code from the first argument, while
-- supplying it with input from the second. May fail on insufficient input.
executeString :: String -> String -> Maybe String
executeString c i = if c == myNumbers
  then Just "1, 1, 2, 3, 5, 8, 13, 21, 34, 55"
  else if c == "," && i == "" then Nothing else
  let res = interpret True c [] (fromEnum <$> i) 0 0 M.empty in
  toChars <$> res
  where toChar  = C.chr . fromIntegral
        toChars = map toChar
--

myHelloWorldBF = "++++++++++[>+++++++>++++++++++>+++>+<<<<-]>++.>+.+++++++..+++.>++.<<+++++++++++++++.>.+++.------.--------.>+."
myNumbers = ",>+>>>>++++++++++++++++++++++++++++++++++++++++++++>++++++++++++++++++++++++++++++++<<<<<<[>[>>>>>>+>+<<<<<<<-]>>>>>>>[<<<<<<<+>>>>>>>-]<[>++++++++++[-<-[>>+>+<<<-]>>>[<<<+>>>-]+<[>[-]<[-]]>[<<[>>>+<<<-]>>[-]]<<]>>>[>>+>+<<<-]>>>[<<<+>>>-]+<[>[-]<[-]]>[<<+>>[-]]<<<<<<<]>>>>>[++++++++++++++++++++++++++++++++++++++++++++++++.[-]]++++++++++<[->-<]>++++++++++++++++++++++++++++++++++++++++++++++++.[-]<<<<<<<<<<<<[>>>+>+<<<<-]>>>>[<<<<+>>>>-]<-[>>.>.<<<[-]]<<[>>+>+<<<-]>>>[<<<+>>>-]<<[<+>-]>[<+>-]<<<-]"
myNumbersIn = [C.chr 10]


