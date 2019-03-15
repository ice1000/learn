{-# OPTIONS --cubical #-}
module DrammieCubical where

open import Cubical.Core.Everything renaming (_≡_ to _==_)
open import Cubical.Data.Unit
open import Cubical.Data.Empty

data maybe (A : Set) : Set where
  just : A -> maybe A
  nothing : maybe A

-- Unwrap : (a : maybe A) → Set
-- Unwrap {A = A} (just x) = A
-- Unwrap nothing = Unit
-- unwrap : (a : maybe A) → Unwrap a
-- unwrap (just x) = x
-- unwrap nothing = tt

just-injective : ∀ {A : Set} (a b : A) → just a == just b → a == b
just-injective {A} a b p = subst diagnose p refl
  -- unwrap (p i)
  where
  diagnose : maybe A → Set
  diagnose (just x) = a == x
  diagnose nothing = ⊥

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
(ax ÷ bx) + (ay ÷ by) = ay ÷ ay
(ax ÷ bx) + reduce ay by cy y = {!!}
reduce ax bx cx x + y = {!!}

