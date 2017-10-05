module Foldmap where

import Data.Foldable (foldMap, Foldable)
import Data.Monoid

myToList :: Foldable t => t a -> [a]
myToList = foldr (:) []

myMinimum :: (Ord a, Foldable t) => t a -> Maybe a
myMinimum a = case myToList a of
  [] -> Nothing
  ls -> Just $ minimum ls
--

myFoldr :: Foldable t => (a -> b -> b) -> b -> t a -> b
myFoldr = foldr
