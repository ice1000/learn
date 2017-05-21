module PasswordMaker where

import Data.List.Split

makePassword :: String -> String
makePassword s = f <$> head <$> splitOn " " s
  where f = \x -> case x of
                'i' -> '1'
                'I' -> '1'
                'o' -> '0'
                'O' -> '0'
                's' -> '5'
                'S' -> '5'
                a   ->  a
--
