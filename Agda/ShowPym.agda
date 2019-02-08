{-# OPTIONS --cubical #-}
module ShowPym where

open import Agda.Primitive.Cubical
  renaming (primIMin to _∨_; primIMax to _∧_)
open import Agda.Builtin.Cubical.Path

data Nat : Set where
  zero : Nat
  suc  : Nat -> Nat

data Int : Set where
  pos : Nat → Int
  neg : Nat → Int
  rel : pos zero ≡ neg zero

refl : ∀ {ℓ} {A : Set ℓ} {a : A} → a ≡ a
refl {a = a} i = a

succ : Int → Int
succ (neg zero) = pos (suc zero)
succ (neg (suc x)) = neg x
succ (pos zero) = pos (suc zero)
succ (pos (suc x)) = pos (suc (suc x))
succ (rel x) = pos (suc zero)

pred : Int → Int
pred (pos zero) = neg (suc zero)
pred (pos (suc x)) = pos x
pred (neg zero) = neg (suc zero)
pred (neg (suc x)) = neg (suc (suc x))
pred (rel x) = neg (suc zero)

proof : ∀ n → pred (succ n) ≡ n
proof (pos zero) = refl
proof (pos (suc x)) = refl
proof (neg zero) = rel
proof (neg (suc zero)) = refl
proof (neg (suc (suc x))) = refl
proof (rel x) i = rel (x ∨ i)
