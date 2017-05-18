module AlphabeticAnagrams where

import Data.List
-- import Data.Bits

-- type BIT = [Int]

extract :: Maybe a -> a
extract (Just a) = a

mapChar :: [Char] -> Char -> Integer
mapChar cs c = toInteger $ extract $ elemIndex c cs

mapString :: [Char] -> String -> [Integer]
mapString cs = map $ \x -> toInteger $ mapChar cs x

-- lowbit :: Int -> Int
-- lowbit n = n .&. (-n)

-- bitSum :: [Int] -> Int -> Int
-- bitSum bit 0 = 0
-- bitSum bit x = (bit !! x) + (bitSum bit (x - lowbit x))

-- bitAdd :: [Int] -> Int -> Int -> [Int]
-- bitAdd bit l i
--   |i > l     = bit
--   |otherwise = bitAdd (update bit l l i) (i + lowbit i)
--

justDoIt :: Integer -> [Char] -> [Integer] -> Integer
justDoIt n cs [     ] = 0
justDoIt n cs (h : t) = h + n * justDoIt n cs t
--

lexiPos :: String -> Integer
lexiPos s = justDoIt (toInteger $ length values) values str
  where values = sort $ nub s
        str =  mapString values s
--
