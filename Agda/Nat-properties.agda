{-# OPTIONS --safe #-}
module Nat-properties where

open import Data.Nat public
open import Relation.Binary.PropositionalEquality
open import Data.Empty
open import Data.Nat.Properties

-- Task 1. Prove that the successor of a Nat cannot be ≤ zero.
s≰z : ∀ {n} → suc n ≰ zero
s≰z = λ ()

-- Task 2. Prove that you can add any Nat to the right side of a ≤-property.
≤-step-k : ∀ {m n} (k : ℕ) → m ≤ n → m ≤ k + n
≤-step-k zero m≤n = m≤n
≤-step-k (suc k) m≤n = ≤-step (≤-step-k k m≤n)

≤-step-k′ : ∀ {m n} k → m ≤ n → m ≤ n + k
≤-step-k′ {n = n} k rewrite +-comm n k = ≤-step-k k

-- Task 3. Prove that you can remove "addition on the left" from both sides of a ≤-property.
+-≤-injˡ : ∀ (a : ℕ) {b c} → a + b ≤ a + c → b ≤ c
+-≤-injˡ zero ab≤ac = ab≤ac
+-≤-injˡ (suc a) {b = b} {c = c} ab≤ac
  rewrite sym (+-suc a b) | sym (+-suc a c) = ≤-pred (+-≤-injˡ a ab≤ac)

<-pred : ∀ {m n} → suc m < suc n → m < n
<-pred (s≤s p) = p

+-<-inj : ∀ {m n} k → k + m < k + n → m < n
+-<-inj zero p = p
+-<-inj (suc k) p = +-<-inj k (<-pred p)

<-inj-k : ∀ {m n} k → k + m < n → m < n
<-inj-k zero p = p
<-inj-k (suc k) (s≤s p) = ≤-step (<-inj-k k p)

≤-cong : ∀ {m n} k → m ≤ n → k + m ≤ k + n
≤-cong zero p = p
≤-cong (suc k) p = s≤s (≤-cong k p)

<-zero : ∀ n → n < 0 → ⊥
<-zero n ()

-- Task 4. Prove that you can remove "multiplication on the left" from both sides of a <-property.
*-+-<-injˡ : ∀ (a b c : ℕ) → a * b < a * c → b < c
*-+-<-injˡ (suc a) _ zero ab<ac rewrite *-comm a zero = ⊥-elim (<-zero _ ab<ac)
*-+-<-injˡ (suc a) zero (suc c) _ = s≤s z≤n
*-+-<-injˡ (suc a) (suc b) (suc c) ab<ac rewrite
    *-comm a (suc b) | +-comm b (a + b * a) | +-assoc a (b * a) b
  | *-comm a (suc c) | +-comm c (a + c * a) | +-assoc a (c * a) c
  | *-comm b a | +-comm (a * b) b
  | *-comm c a | +-comm (a * c) c
  = let lem = +-<-inj a (<-pred ab<ac)
    in s≤s (*-+-<-injˡ (suc a) b c lem)

-- Task 5. Prove this.
*-<-cross : ∀ (a b c d : ℕ) → a * b < c * d → c ≤ a → b < d
*-<-cross (suc a) b (suc c) d ab<cd (s≤s c≤a) with compare c a
*-<-cross (suc a) b (suc c) d ab<cd (s≤s c≤a) | less .c k =
  *-<-cross (c + k) b c d (+-≤-injˡ d (≤-cong d (lemma (c + k) b c d (<-inj-k b ab<cd)))) (≤-step-k′ k ≤-refl)
  where
  postulate lemma : ∀ a b c d → suc a * b < suc c * d → a * b < c * d
*-<-cross (suc _) b (suc c) d ab<cd (s≤s c≤a) | equal .c = *-+-<-injˡ (suc c) b d ab<cd
*-<-cross (suc a) b (suc _) d ab<cd (s≤s c≤a) | greater .a k = ⊥-elim (lemma c≤a)
  where
  lemma : ∀ {a k} → suc a + k ≤ a → ⊥
  lemma {suc zero} p = <-zero _ (<-pred p)
  lemma {suc (suc k)} p = lemma (<-pred p)
