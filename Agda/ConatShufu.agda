module ConatShufu where

open import lib.Basics

data Maybe (A : Set) : Set where
  Null : Maybe A
  New  : A -> Maybe A

record Conat : Set where
  coinductive
  constructor succ
  field pred : Maybe Conat
open Conat

zero = succ Null
one = succ (New zero)
two = succ (New one)

succ' : Conat -> Conat
pred (succ' n) = New n

mugen : Conat
pred mugen = New mugen

_ = idp :> (pred two == New one)
_ = idp :> (pred (succ' one) == New one)
