module LastDigit(lastDigit) where

fastContAppendOp :: Integral a => (b -> b -> b) -> b -> b -> a -> b
fastContAppendOp _ e _ 0 = e
fastContAppendOp f e a k
               |mod k 2 == 1 = f a (fastContAppendOp f e a (k - 1))
               |otherwise = fastContAppendOp f e (f a a) (div k 2)
--

fastExpModOpti :: Integral a => a -> a -> a -> a
fastExpModOpti a k m = fastContAppendOp (\a b -> (mod (a * b) m)) 1 a k

lastDigit' :: [Integer] -> Integer
lastDigit' [   ] = 1
lastDigit' [ a ] = a
lastDigit' [a,b] = fastExpModOpti b a 10
lastDigit' (a:b) = fastExpModOpti (lastDigit' b) a 10

lastDigit :: [Integer] -> Integer
lastDigit [   ] = 1
lastDigit [ a ] = a
lastDigit [a,b] = fastExpModOpti a b 10
lastDigit (0:_) = 0
-- lastDigit (a:b) = fastExpModOpti a (lastDigit b) 10
lastDigit  exs  = lastDigit' $ reverse exs
