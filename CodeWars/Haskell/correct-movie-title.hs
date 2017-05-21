module MovieTitle where

import Data.Char
import Data.List.Split

correctMovieTitle :: String -> String
correctMovieTitle ls = tail $ (f <$> splitOn " " ls) >>= id
  where f (h : t) = ' ' : toUpper h : (toLower <$> t)
--
