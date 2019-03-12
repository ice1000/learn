{-# OPTIONS --cubical --safe #-}
module ProvingTheWrongThing where

open import Cubical.Core.Everything
open import Cubical.Data.Nat
open import Cubical.Data.Empty
open import Function using (_∘_; _$_)

theWrongThing : 1 + 1 ≡ 3 → ⊥
theWrongThing thatMoney = ⊥-elim $
              transport (cong (watchItBurn ∘ take) thatMoney) 0
  where
  take = predℕ ∘ predℕ
  watchItBurn : ℕ → Set
  watchItBurn zero = ℕ
  watchItBurn (suc p) = ⊥
