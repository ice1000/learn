module Try10 where

open import Data.Nat
open import Data.Empty

data _+_≡_ : ℕ → ℕ → ℕ → Set where
  znn : ∀ {n} → 0 + n ≡ n
  sns : ∀ {m n k} → m + n ≡ k → suc m + n ≡ suc k

5+5=10 : 5 + 5 ≡ 10
5+5=10 = sns (sns (sns (sns (sns znn))))

2+2≠5 : 2 + 2 ≡ 5 → ⊥
2+2≠5 (sns (sns ()))

-- data _⊓₀_ : ℕ → ℕ → Set where

-- data _⊔₀_ : ℕ → ℕ → Set where

data _is-double-of_ : ℕ → ℕ → Set where
  intro : ∀ {n m} → n + n ≡ m → m is-double-of n

8=4*2 : 8 is-double-of 4
8=4*2 = intro (sns (sns (sns (sns znn))))

9≠4*2 : 9 is-double-of 4 → ⊥
9≠4*2 (intro (sns (sns (sns (sns ())))))

15≠7*2 : 15 is-double-of 7 → ⊥
15≠7*2 (intro (sns (sns (sns (sns (sns (sns (sns ()))))))))

-- data _*_≡_ : ℕ → ℕ → ℕ → Set where
--   zts : ∀ {n} → 0 * n ≡ 0
--   sts : ∀ {n m k} → m * n ≡ k → ???

