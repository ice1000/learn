add :: Num a => a -> a -> a
add x y = x + y + 1

data Tree a = Leaf a
            | Node a (Tree a) (Tree a)
            deriving (Show)

leftMost :: Tree a -> a
leftMost (Leaf l) = l
leftMost (Node _ l _) = leftMost(l)

checkSomething :: String -> Maybe String
checkSomething "Hoshino" = Just "Vegtable!"
checkSomething _ = Nothing

head' :: [a] -> Maybe a
head' [] = Nothing
head' (x:xs) = Just x

filter' :: (a -> Bool) -> [a] -> [a]
filter' _ [] = []
filter' f (x:xs) = if f x then
                     x : (filter' f xs)
                   else
                     filter' f xs

validBraces :: String -> Bool
validBraces = validBraces' []

validBraces' :: String -> String -> Bool
validBraces' [] [] = True
validBraces' ('[' : stack) (']' : s) = validBraces' stack s
validBraces' ('{' : stack) ('}' : s) = validBraces' stack s
validBraces' ('(' : stack) (')' : s) = validBraces' stack s
validBraces' stack (c : cs) = validBraces' (c : stack) cs
validBraces' _ _ = False

isInt a = abs ((fromIntegral $ fromEnum a) - a) < 0.00001

countSquareable :: Int -> Int
countSquareable num = length $ filter checkSquareable [1..num]

checkSquareable :: Int -> Bool
checkSquareable num = (mod num 2 == 1) || (isInt . sqrt $ fromIntegral num)

newtype Inte = Inte { runInte :: Int } deriving Show
