module MaybeConcat where

import Data.Maybe

concatMaybe :: Maybe String -> Maybe String -> Maybe String
concatMaybe a b = Just (fromJust a ++ " " ++ fromJust b)
