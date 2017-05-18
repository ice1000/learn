{-# LANGUAGE
OverloadedStrings,
TypeSynonymInstances,
FlexibleInstances
#-}

module TypeClassses where

import Data.Text (Text)

class SaySomething a where
  something :: a -> IO ()
--

instance SaySomething String where
  something _ = putStrLn "WhatTheFuck niconiconi~"
--

instance SaySomething Text where
  something _ = putStrLn "Yoyoyo I want goldkela"
--

instance SaySomething Int where
  something _ = putStrLn "This is an Int"
--

saySomething :: IO ()
saySomething = something ("Shit" :: String)
