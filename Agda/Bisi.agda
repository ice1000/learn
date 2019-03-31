{-# OPTIONS --guardedness #-}
module Bisi where

open import Agda.Builtin.Equality

variable A : Set

record List (A : Set) : Set where
  coinductive
  field
    head : A
    tail : List A
open List

-- | Bisimulation as equality
record _==_ (x : List A) (y : List A) : Set where
  coinductive
  field
    refl-head : head x ≡ head y
    refl-tail : tail x == tail y
open _==_

data Nat : Set where
  zero : Nat
  succ : Nat -> Nat

ones : List Nat
head ones = succ zero
tail ones = ones

proof : (a : List A) -> a == a
refl-head (proof a) = refl
refl-tail (proof a) = proof (tail a)

refl′ : (a : List A) -> a == a
refl-head (refl′ a) = refl
refl-tail (refl′ a) = refl′ (tail a)

even : List A -> List A
head (even a) = head a
tail (even a) = even (tail (tail a))

odd : List A -> List A
head (odd a) = head (tail a)
tail (odd a) = odd (tail (tail a))

simple : (a : List A) -> odd a == even (tail a)
refl-head (simple a) = refl
refl-tail (simple a) = {!!}

merge : List A -> List A -> List A
head (merge a _) = head a
head (tail (merge _ b)) = head b
tail (tail (merge a b)) = merge (tail a) (tail b)

proof₂ : (a : List A) -> (merge (even a) (odd a) == a)
refl-head (proof₂ a) = refl
refl-tail (proof₂ a) = {!refl-tail (refl′ (merge (even a) (odd a)))!}
