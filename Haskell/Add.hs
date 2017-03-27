module Add where

add' :: (Int, Int) -> Int
add' (x, y) = x + y

add'' :: Int -> Int -> Int
add'' x y = x + y

add''' :: Int -> Int -> Int
add''' = \x y -> x + y

add'''' :: Int -> Int -> Int
add'''' x = \y -> x + y

add :: Num a => a -> a -> a
add x = \y -> x + y

add''''' = (+)

