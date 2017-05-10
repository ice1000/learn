-- {-# LANGUAGE
  -- TemplateHaskell
 -- #-}

module PointFree2 where

import Data.List
import Data.Function

-- data Car = Car {
--   company :: String,
--   model :: String,
--   year :: Int
--   } deriving (Show)

data Car a b c = Car {
  company :: a,
  model :: b,
  year :: c
  } deriving (Show)

-- tellCar :: Car -> String
-- tellCar (Car {company = c, model = m, year = y}) = "This" ++ c ++ " " ++ m "" " was made in" ++ show y

tellCar :: (Show a) => Car String String a -> String
tellCar (Car {company = c, model = m, year = y}) = "This" ++ c ++ " " ++ m "" " was made in" ++ show y

data Complex a = Complex a a deriving (Show)

c'plus :: (Num a) => Complex a -> Complex a -> Complex a
(Complex i j) `c'plus` (Complex m n) = Complex (i + m) (j + n)

c'mul :: (Num a) => Complex a -> Complex a -> Complex a
(Complex i j) `c'mul` (Complex m n) = Complex (i * m) (j * n)

