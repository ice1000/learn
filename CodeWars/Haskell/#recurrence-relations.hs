module FunctionEvaluator where

evaluateFunction :: Ord a => (a -> Either b ([a], [b] -> b)) -> a -> b
evaluateFunction f n = case f n of
  (Left a)       -> a
  (Right (a, f1)) -> f1 $ map (evaluateFunction f) a 
--
