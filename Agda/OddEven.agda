module OddEven where

open import Data.Nat
open import Function

data _is-even : ℕ → Set where
  Zero    : zero is-even
  EvenSuc : ∀ {n} → (n is-even) → suc (suc n) is-even

data _is-odd : ℕ → Set where
  One     : 1 is-odd
  OddSuc  : ∀ {n} → (n is-odd) → suc (suc n) is-odd

even+1 : ∀ {n} → n is-even → suc n is-odd
even+1  Zero        = One
even+1 (EvenSuc n)  = OddSuc $ even+1 n

odd+1  : ∀ {n} → n is-odd  → suc n is-even
odd+1   One         = EvenSuc Zero
odd+1  (OddSuc  n)  = EvenSuc $ odd+1 n

even+even : ∀ {n m} → n is-even → m is-even → (n + m) is-even
even+even  Zero       m  = m
even+even (EvenSuc n) m  = EvenSuc $ even+even n m

odd+odd   : ∀ {n m} → n is-odd  → m is-odd  → (n + m) is-even
odd+odd    One        m  = odd+1 m
odd+odd   (OddSuc  n) m  = EvenSuc $ odd+odd n m

even+odd  : ∀ {n m} → n is-even → m is-odd  → (n + m) is-odd
even+odd   Zero       m  = m
even+odd  (EvenSuc n) m  = OddSuc (even+odd n m)

odd+even  : ∀ {n m} → n is-odd  → m is-even → (n + m) is-odd
odd+even   One        m  = even+1 m
odd+even  (OddSuc  n) m  = OddSuc (odd+even n m)

even*1 : ∀ {n} → n is-even → (1 * n) is-even
even*1  Zero        = Zero
even*1 (EvenSuc n)  = EvenSuc (even*1 n)

odd*1  : ∀ {n} → n is-odd  → (1 * n) is-odd
odd*1   One         = One
odd*1  (OddSuc  n)  = OddSuc (odd*1 n)

even*even : ∀ {n m} → n is-even → m is-even → (n * m) is-even
even*even  Zero       m  = Zero
even*even (EvenSuc n) m  = even+even m (even+even m (even*even n m))

odd*odd   : ∀ {n m} → n is-odd  → m is-odd  → (n * m) is-odd
odd*odd  One  One        = One
odd*odd  One (OddSuc m)  = OddSuc (odd*odd One m)
odd*odd (OddSuc  n) m    = odd+even m (odd+odd m (odd*odd n m))

even*odd  : ∀ {n m} → n is-even → m is-odd  → (n * m) is-even
even*odd   Zero       m  = Zero
even*odd  (EvenSuc n) m  = odd+odd m (odd+even m (even*odd n m))

odd*even  : ∀ {n m} → n is-odd  → m is-even → (n * m) is-even
odd*even One  Zero       = Zero
odd*even One (EvenSuc m) = EvenSuc (odd*even One m)
odd*even (OddSuc n) m    = even+even m (even+even m (odd*even n m))
