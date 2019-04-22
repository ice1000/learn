module Overlap where

open import Agda.Builtin.Nat

max : Nat -> Nat -> Nat
max zero b = b
max a zero = a
max (suc a) (suc b) = suc (max a b)
