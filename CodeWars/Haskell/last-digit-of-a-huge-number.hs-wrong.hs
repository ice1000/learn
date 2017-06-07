module LastDigit(lastDigit) where

get :: Integer -> Int -> Integer
get _ 0 = 1
get 0 _ = 0
get 1 _ = 1
get 2 n = (repeat [2, 4, 8, 6] >>= id) !! (n + 1)
get 3 n = (repeat [3, 9, 7, 1] >>= id) !! (n + 1)
get 4 n = (repeat [4, 6] >>= id) !! (n + 1)
get 5 n = 5
get 6 n = 6
get 7 n = (repeat [7, 9, 3, 1] >>= id) !! (n + 1)
get 8 n = (repeat [8, 4, 2, 6] >>= id) !! (n + 1)
get 9 n = (repeat [9, 1] >>= id) !! (n + 1)

lastDigit :: [Integer] -> Integer
lastDigit a = foldr f 1 ((`mod` 10) <$> reverse a)
  where f n = get n . fromInteger
--


