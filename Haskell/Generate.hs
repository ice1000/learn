module Generated where

-- 生成函数
-- 等比数列

generate :: (Num a, Enum a) => [a] -> [a]
generate ls = zipWith (*) ls [0..]

-- generate [1, 1, 2, 3, 5, 8, 13, 21]
