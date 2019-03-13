module Modulo

import Data.Fin

%access export
%default total

negate : Fin k -> Fin k
negate FZ = FZ
negate (FS FZ) = last
negate (FS x) = weaken (negate x)

subt : Fin k -> Fin k -> Fin k
subt FZ x = negate x
subt x FZ = x
subt (FS x) (FS y) = subt (weaken x) (weaken y)

-- 3 + 3 (5) ->
-- 2 + 2 (4) ->
-- 1 + 1 (3) ->
-- 0 (2) -> S 1
-- <- S 2 -> 3 -> 3
-- 2
add : Fin k -> Fin k -> Fin k
add FZ m = m
add n FZ = n
add (FS x) (FS y) with (strengthen . FS $ add x y)
 | (Left _) = FZ
 | (Right r) = FS r

mult : Fin k -> Fin k -> Fin k
mult FZ m = FZ
mult (FS n) m = add m (mult (weaken n) m)
