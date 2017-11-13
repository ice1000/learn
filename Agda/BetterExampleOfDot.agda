module BetterExampleOfDot where

open import Data.Nat

open import Agda.Builtin.Equality

data CannotContruct : ℕ → Set where

test : ∀ a b →
     ((a b : ℕ) → a + b ≡ b + a) →
     CannotContruct (a + b) →
     CannotContruct (b + a)
test a b theory p with  a + b  | theory a b
...                 | .(b + a) | refl = p
