module Replace where

open import Agda.Builtin.Nat
  hiding (_==_)
  renaming (zero to O; suc to S)
open import Agda.Builtin.Equality
  renaming (_≡_ to _==_)
open import Agda.Primitive
  renaming (Level to ULevel)

variable
  i : ULevel

replace : {A : Set i} {a b : A} -> a == b -> {P : A -> Set i} -> P a -> P b
replace refl a = a

test : ∀ n -> n + 0 == n
test O = refl
-- ???
test (S n) = replace {A = Nat} (test n) (0 + n)

