module Lightsabers where

import Data.List.Split

howManyLightsabersDoYouOwn :: Num a => [Char] -> a
howManyLightsabersDoYouOwn str = if 1 < length (splitOn "Zach" str) then 18 else 0
