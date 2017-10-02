module Main

import Data.Fin

plus : Int -> Int -> Int
plus a b = a + b -- \a b => a + b

-- data P = O | N P

infixl 0 $

($) : {a, b : Type} -> (a -> b) -> a -> b
($) f n = f n

data Vec : Nat -> Type -> Type where
  VNil : Vec Z e
  VSuc : e -> Vec p e -> Vec (S p) e

concatV : Vec a m -> Vec b m -> Vec (a + b) m
concatV  VNil       ys = ys
concatV (VSuc x xs) ys = VSuc x $ concatV xs ys

takeV : (a : Nat) -> Vec (a + b) m -> Vec a m
takeV  Z    _           = VNil
takeV (S n) (VSuc x xs) = VSuc x $ takeV n xs

dropV : (a : Nat) -> Vec (a + b) m -> Vec b m
dropV  Z    ls          = ls
dropV (S n) (VSuc x xs) = dropV n xs

lengthV : Vec a m -> Nat
lengthV  VNil       = Z
lengthV (VSuc x xs) = S $ lengthV xs

headV : Vec a m -> m
headV (VSuc x xs) = x

tailV : Vec (S a) m -> Vec a m
tailV (VSuc x xs) = xs


