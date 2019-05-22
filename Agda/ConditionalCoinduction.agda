{-# OPTIONS --guardedness #-}
module ConditionalCoinduction where

data Maybe : Set
record Conat : Set
data Maybe where
  instance Nothing : Maybe
  Just : Conat → Maybe
record Conat where
  coinductive
  constructor conat
  field force : Maybe
open Conat

mugen : Conat
force mugen = Just mugen

inf : Conat
inf = λ where .force → Just inf

inity : Conat
inity .force = Just inity

open import Agda.Builtin.Nat

F : Nat → Set
F zero = Nat
F (suc a) = Conat

nonTrivialId : Nat → Nat
nonTrivialId zero = zero
nonTrivialId (suc zero) = suc zero
nonTrivialId (suc (suc a)) = suc a

data ⊤ : Set where instance tt : ⊤

badMugen : {b : Nat} → ⊤ → F b
badMugen {zero} tt = zero
badMugen {suc a} tt .force = Just (badMugen {suc a} tt)
