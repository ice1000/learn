module hoshino0 where

open import Agda.Builtin.Nat

data List (a : Set) : (n : Nat) -> Set where
  Nil : List a 0
  Cat : ∀ {n} -> a -> List a n -> List a (suc n)

App : ∀ {n m} {a} -> List a n -> List a m -> List a (n + m)
App Nil b = b
App (Cat x a) b = Cat x (App a b)

data _≤_ : Nat -> Nat -> Set where
  z≤n : ∀ {n}                 → zero  ≤ n
  s≤s : ∀ {m n} (m≤n : m ≤ n) → suc m ≤ suc n

data Nothing : Set where

l1 : 6 ≤ 10
l1 = s≤s (s≤s (s≤s (s≤s (s≤s (s≤s z≤n)))))

l2 : 10 ≤ 6 -> Nothing
l2 (s≤s (s≤s (s≤s (s≤s (s≤s (s≤s ()))))))


