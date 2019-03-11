{-# OPTIONS --cubical --safe #-}
module SymInt where

open import Cubical.Core.Everything
open import Cubical.Data.Nat
  renaming ( +-comm to :+:-comm
           ; +-zero to :+:-zero
           ; _+_ to _:+:_
           )
open import Cubical.HITs.HitInt renaming (_+ℤ_ to _+_; ℤ to Z)

+-zero : ∀ a → pos 0 + a ≡ a
+-zero (pos zero) = refl
+-zero (pos (suc n)) = cong sucℤ (+-zero (pos n))
+-zero (neg zero) = posneg
+-zero (neg (suc n)) = cong predℤ (+-zero (neg n))
+-zero (posneg i) j = posneg (i ∧ j)

+-i-zero : ∀ a i → posneg i + a ≡ a
+-i-zero a i = cong (_+ a) (λ j → posneg (i ∧ ~ j)) ∙ +-zero a

+-pos-suc : ∀ a b → sucℤ (pos b + a) ≡ (pos (suc b) + a)
+-pos-suc (pos zero) b = refl
+-pos-suc (pos (suc n)) b = cong sucℤ (+-pos-suc (pos n) b)
+-pos-suc (neg zero) b = refl
+-pos-suc (neg (suc n)) b =
  sucPredℤ (pos b + neg n)
  ∙ sym (predSucℤ (pos b + neg n))
  ∙ cong predℤ (+-pos-suc (neg n) b)
+-pos-suc (posneg i) b = refl

+-neg-pred : ∀ a b → predℤ (neg b + a) ≡ (neg (suc b) + a)
+-neg-pred (pos zero) b = refl
+-neg-pred (pos (suc n)) b =
  predSucℤ (neg b + pos n)
  ∙ sym (sucPredℤ (neg b + pos n))
  ∙ cong sucℤ (+-neg-pred (pos n) b)
+-neg-pred (neg zero) b = refl
+-neg-pred (neg (suc n)) b = cong predℤ (+-neg-pred (neg n) b)
+-neg-pred (posneg i) b = refl

+-comm : (a b : Z) → a + b ≡ b + a
+-comm a (pos zero) = sym (+-zero a)
+-comm a (neg zero) = sym (cong (_+ a) (sym posneg) ∙ +-zero a)
+-comm a (pos (suc b)) = cong sucℤ (+-comm a (pos b)) ∙ +-pos-suc a b
+-comm a (neg (suc b)) = cong predℤ (+-comm a (neg b)) ∙ +-neg-pred a b
-- a ≡ (posneg i + a)
+-comm a (posneg i) = sym (+-i-zero a i)
