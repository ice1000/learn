module Fusc where

import qualified Data.Map as M

fusc :: Integer -> Integer
fusc = snd . fuscBTFS M.empty

fuscBTFS :: M.Map Integer Integer -> Integer -> (M.Map Integer Integer, Integer)
fuscBTFS m 0 = (m, 0)
fuscBTFS m 1 = (m, 1)
fuscBTFS m n = case M.lookup n m of
  (Just v) -> (m, v)
  Nothing  ->
    let (mp, v) = if even n
          then fuscBTFS m $ div n 2
          else let (mm, v1) = fuscBTFS m $ div n 2 in
          let (mmm, v2) = fuscBTFS mm $ 1 + div n 2 in
            (mmm, v1 + v2)
    in (M.insert n v mp, v)
--

