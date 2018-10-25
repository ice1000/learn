{-# OPTIONS --without-K #-}
module book-example where

open import Data.Nat
open import Data.Bool hiding (not)

open import Agda.Builtin.List

open import Relation.Binary.PropositionalEquality

a b : ℕ
a = 1
b = 2

data _<=_ : (a b : ℕ) → Set where
  0ltn : ∀ {n} → 0 <= n
  nltm : ∀ {n m} → n <= m → suc n <= suc m

antiSym : ∀ a b -> a <= b -> b <= a -> a ≡ b
coerce : {A B : Set} -> A ≡ B -> A -> B
coerce refl x = x
antiSym .0 .0 0ltn 0ltn = refl
antiSym (suc a) (suc b) (nltm x) (nltm y) = cong suc (antiSym a b x y)

-- coerce-id : (e : Bool ≡ Bool) -> ℕ -- coerce e true ≡ true
-- coerce-id refl = zero

why : (e : 1 ≡ 1) -> ℕ
why refl = zero

data wa : ℕ -> Set where
  prf : ∀ n -> wa n

postulate comm : ∀ m n -> m + n ≡ n + m

wa' : ∀ m n -> wa (m + n) ≡ wa (n + m)
wa' m n with (m + n) | comm n m
wa' m n |   .(n + m) | refl = refl

Nat = ℕ

not : Bool -> Bool
even odd : Nat -> Bool
even zero = true
even (suc n) = odd n
odd n = not (even n)
not false = true
not true = false

evenP : even 12 ≡ true
evenP = refl

oddP : odd 11 ≡ true
oddP = refl

postulate _>>=_ : {A B : Set} -> List A
                -> (A -> List B) -> List B

filter : {A : Set} -> (A -> Bool) -> List A -> List A
filter p xs = do x    <- xs
                 true <- p x ∷ [] where false -> []
                 x ∷ []

data V (A : Set) : Nat → Set where
  [] : V A zero
  _∷_ : ∀{n} → A → V A n → V A (suc n)

record Vec : Set where
  field
    {length} : Nat
    vec      : V Nat length

check : 1 ≡ Vec.length record { vec = 2 ∷ [] }
check = refl

-- infixr 40 _>>=_
-- syntax _>>=_ a (λ x -> b) = x <- a , b
