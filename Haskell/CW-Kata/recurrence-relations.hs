module FunctionEvaluator where

import qualified Data.Map.Strict as M


-- factorial i | i == 0    = Left 1
--             | otherwise = Right ([i-1], (*i).head)
--
-- fibonacci i | i < 2     = Left i
--             | otherwise = Right ([i-1, i-2], sum)
--
-- coinchange (a, i) | a == 0          = Left 1
--                   | a < 0 || i == 0 = Left 0
--                   | otherwise       = Right ([(a, i-1), (a-coinlist!!(i-1), i)], sum)
--

-- coinlist = [1, 3, 5, 10]

-- heigth (n, m) | m <= 0 || n <= 0 = Left 0
--               | otherwise        = Right ([(n, m-1), (n-1, m-1)], (+1).sum)
--
-- foo  i | i <= 2    = Left 1
--        | odd i     = Right ([6*i`div`7, 2*i`div`3], sum)
--        | otherwise = Right ([i-1, i-3], sum)
--

type MP = M.Map

evaluate :: Ord a => MP a b -> (a -> Either b ([a], [b] -> b)) -> a -> (MP a b, b)
evaluate m f a = case M.lookup a m of
  (Just some)              -> (m, some)
  _ -> case f a of
    (Left n)               -> (M.insert a n m, n)
    (Right (prm, fn))      -> let (m2, ls) = foldl fun (m, []) prm
                                  b = fn ls in
      (M.insert a b m2, b)
    where fun = \(m, ls) a -> let (m1, b) = evaluate m f a in
            (M.insert a b m1, b:ls)
--

evaluateFunction :: Ord a => (a -> Either b ([a], [b] -> b)) -> a -> b
evaluateFunction f n = snd $ evaluate M.empty f n
