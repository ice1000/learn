module Haskell.Codewars.RemoveChar where

removeChar :: String -> String
removeChar (_ : str) = init str
