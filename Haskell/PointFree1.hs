-- {-# LANGUAGE
  -- TemplateHaskell
 -- #-}

module PointFree1 where

import Data.List
import Data.Function

-- 生成函数
-- 等比数列

generate :: (Num a, Enum a) => [a] -> [a]
-- point free
generate = zipWith (*) [0..]

-- generate [1, 1, 2, 3, 5, 8, 13, 21]

-- map ($ 233) [(+ 1), (* 2), (/ 3)]

---------------- 再来一个 -----------------

if' :: Bool -> a -> a -> a
if' True x _ = x
if' False _  y = y

zipIf :: [Bool] -> [a] -> [a] -> [a]
zipIf = zipWith3 if'

-- zipIf [True , False ] [1, 2] [3, 4]
-- [1,4]

---------------- 不行，上瘾了 -----------------

add' :: (Num a) => a -> a -> a
-- add' a = (a +)
-- add' a b = a + b
add' = (+)

applyTwice :: (a -> a) -> a -> a
-- applyTwice f a = f (f a)
-- applyTwice f a = f . f a
applyTwice f = f . f

applyThreeTimes :: (a -> a) -> a -> a
-- applyThreeTimes f a = (f (f (f a)))
-- applyThreeTimes f a = f . f . f a
applyThreeTimes f = f . f . f

-- applyThreeTimes (* 2) 5
-- 40

removeAll :: Eq a => a -> [a] -> [a]
-- removeAll a ls = filter (/= a) ls
-- removeAll a = filter (/= a)
removeAll = filter . (/=)

-- removeAll 2 [1, 2, 3]
-- [1,3]

splitIntoSeqOfNumWithSameSym :: [Integer] -> [[Integer]]
splitIntoSeqOfNumWithSameSym = groupBy ((==) `on` (> 0))
