{-# OPTIONS --cubical #-}
module DrammieCubical where

open import Agda.Primitive.Cubical
open import Agda.Builtin.Cubical.Path renaming (_≡_ to _==_)

data GirardParadox : Set where
  omegaSet     : GirardParadox
  omegaInOmega : omegaSet == omegaSet

postulate
  girardParadoxProp : GirardParadox -> Set

testOmega : (a : GirardParadox) -> (a == a) -> GirardParadox
testOmega  omegaSet        b = omegaSet
testOmega (omegaInOmega x) b = b x

-- Segment
data MarisaShop : Set where
  al-ice : MarisaShop
  marisa : MarisaShop
  love   : al-ice == marisa

testSegment : (a : MarisaShop) -> (a == a) -> MarisaShop
testSegment  al-ice  b = al-ice
testSegment  marisa  b = marisa
testSegment (love x) b = b x

funcExt : (A B : Set) -> (f g : A -> B) -> (ev : ∀ a -> f a == g a) -> f == g
funcExt A B f g ev = λ i a → ev a i

open import Agda.Builtin.Nat
  renaming (_==_ to _:==:_; _+_ to _:+:_; _*_ to _:*:_)

data _>0 : Nat -> Set where
  proof : (n : Nat) -> suc n >0

infixl 7 _÷_
data Q : Set where
  _÷_    : (a b : Nat) -> Q
  reduce : ∀ a b c     -> a ÷ b == (a :*: c) ÷ (b :*: c)

someTest : 2 ÷ 1 == 4 ÷ 2
someTest = reduce 2 1 2

_+_ : Q -> Q -> Q
(ax ÷ bx) + (ay ÷ by) = ?
(ax ÷ bx) + reduce ay by cy y = ?
reduce ax bx cx x + y = {!!}

