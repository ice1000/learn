module Tactics where

import Reflection
open import Data.Nat.Solver
-- open import Data.Nat.Properties.SemiringSolver
open import Data.Nat
open import Relation.Binary.PropositionalEquality

open +-*-Solver

simple : ∀ a b c d e → a + b * (c + d * e) ≡ e * b * d + c * b + a
simple = solve 5
  (λ a b c d e → a :+ b :* (c :+ d :* e) := e :* b :* d :+ c :* b :+ a)
  refl

