{-# OPTIONS --safe #-}
module Iso-properties where

open import Function

open import Relation.Binary.PropositionalEquality public
open import Data.Nat public

record _⇔_ (A B : Set) : Set where
  constructor Bijection
  field
    A→B : A → B
    B→A : B → A
    A→B→A : ∀ (a : A) → B→A (A→B a) ≡ a
    B→A→B : ∀ (b : B) → A→B (B→A b) ≡ b

data ℕ+1 : Set where
  null : ℕ+1
  nat : ℕ → ℕ+1
data ℕ+ℕ : Set where
  left : ℕ → ℕ+ℕ
  right : ℕ → ℕ+ℕ

open _⇔_
open Relation.Binary.PropositionalEquality.≡-Reasoning
pattern bj a b c d = Bijection a b c d

-- Task 0 : Example of _⇔_ in finite sets
-- Task 0-1. Find a bijection between Bool and Bit. (provided for you as an example)
data Bool : Set where
  true false : Bool
  
data Bit : Set where
  0b 1b : Bit

Bool→Bit : Bool → Bit
Bool→Bit false = 0b
Bool→Bit true = 1b

Bit→Bool : Bit → Bool
Bit→Bool 0b = false
Bit→Bool 1b = true

Bool→Bit→Bool : ∀ (b : Bool) → Bit→Bool (Bool→Bit b) ≡ b
Bool→Bit→Bool true = refl
Bool→Bit→Bool false = refl

Bit→Bool→Bit : ∀ (b : Bit) → Bool→Bit (Bit→Bool b) ≡ b
Bit→Bool→Bit 0b = refl
Bit→Bool→Bit 1b = refl

Bool⇔Bit : Bool ⇔ Bit
Bool⇔Bit = bj Bool→Bit Bit→Bool Bool→Bit→Bool Bit→Bool→Bit

--------------------------------------------------------------------
-- Task 1 : General properties of ⇔
-- Task 1-1. Prove that any set has the same cardinality as itself.
⇔-refl : ∀ {A : Set} → A ⇔ A
⇔-refl = bj id id (λ a → refl) (λ b → refl)

-- Task 1-2. Prove that _⇔_ relation is symmetric.
⇔-sym : ∀ {A B : Set} → A ⇔ B → B ⇔ A
⇔-sym (bj A→B B→A A→B→A B→A→B) = bj B→A A→B B→A→B A→B→A

-- Task 1-3. Prove that _⇔_ relation is transitive.
⇔-trans : ∀ {A B C : Set} → A ⇔ B → B ⇔ C → A ⇔ C
⇔-trans {A = A} {C = C} (bj A→B B→A A→B→A B→A→B) (bj B→C C→B B→C→B C→B→C) =
  bj (B→C ∘ A→B) (B→A ∘ C→B) X Y
  where
    X : (a : A) → B→A (C→B (B→C (A→B a))) ≡ a
    X a = B→A (C→B (B→C (A→B a)))
      ≡⟨ cong B→A (B→C→B (A→B a)) ⟩
          B→A (A→B a)
      ≡⟨ A→B→A a ⟩
          a ∎
    Y : (c : C) → B→C (A→B (B→A (C→B c))) ≡ c
    Y c = B→C (A→B (B→A (C→B c)))
      ≡⟨ cong B→C (B→A→B (C→B c)) ⟩
          B→C (C→B c)
      ≡⟨ C→B→C c ⟩
         c ∎

-- Task 1-4. Prove the following statement:
--   Given two functions A→B and B→A, if A→B→A is satisfied and B→A is injective, A ⇔ B.
bijection-alt :
  ∀ {A B : Set} →
  (A→B : A → B) →
  (B→A : B → A) →
  (∀ a → B→A (A→B a) ≡ a) →
  (∀ b b' → B→A b ≡ B→A b' → b ≡ b') →
  A ⇔ B
bijection-alt A→B B→A A→B→A B→A-inj = bj A→B B→A A→B→A
 (λ b → B→A-inj (A→B (B→A b)) b (A→B→A (B→A b)))

--------------------------------------------------------------------
-- Task 2 : ⇔-relations between ℕ and various supersets of ℕ

-- ℕ+1 : A set having one more element than ℕ.
{- Preloaded code
data ℕ+1 : Set where
  null : ℕ+1
  nat : ℕ → ℕ+1
-}

-- Task 2-1. Prove that ℕ has the same cardinality as ℕ+1.
ℕ⇔ℕ+1 : ℕ ⇔ ℕ+1
ℕ⇔ℕ+1 = bj f g fg gf
  where
  f : ℕ → ℕ+1
  f zero = null
  f (suc n) = nat n
  g : ℕ+1 → ℕ
  g null = zero
  g (nat x) = suc x
  fg : ∀ n → g (f n) ≡ n
  fg zero = refl
  fg (suc n) = refl
  gf : ∀ b → f (g b) ≡ b
  gf null = refl
  gf (nat x) = refl

-- ℕ+ℕ : A set having size(ℕ) more elements than ℕ.
{- Preloaded code
data ℕ+ℕ : Set where
  left : ℕ → ℕ+ℕ
  right : ℕ → ℕ+ℕ
-}

-- Task 2-2. Prove that ℕ has the same cardinality as ℕ+ℕ.
ℕ⇔ℕ+ℕ : ℕ ⇔ ℕ+ℕ
ℕ⇔ℕ+ℕ = bj f g fg gf
  where
  s : ℕ+ℕ → ℕ+ℕ
  s (left x) = left (suc x)
  s (right x) = right (suc x)
  f : ℕ → ℕ+ℕ
  f zero = left zero
  f (suc zero) = right zero
  f (suc (suc n)) = s (f n)
  g : ℕ+ℕ → ℕ
  g (left zero) = zero
  g (left (suc x)) = suc (suc (g (left x)))
  g (right zero) = suc zero
  g (right (suc x)) = suc (suc (g (right x)))
  ss : ∀ {a} → g (f a) ≡ a → g (s (f a)) ≡ suc (suc a)
  ss {a} p with f a
  ss {a} p | left x = cong (λ z → suc (suc z)) p
  ss {a} p | right x = cong (λ z → suc (suc z)) p
  fg : ∀ a → g (f a) ≡ a
  fg zero = refl
  fg (suc zero) = refl
  fg (suc (suc a)) = ss (fg a)
  gf : ∀ b → f (g b) ≡ b
  gf (left zero) = refl
  gf (left (suc x)) rewrite gf (left x) = refl
  gf (right zero) = refl
  gf (right (suc x)) rewrite gf (right x) = refl
