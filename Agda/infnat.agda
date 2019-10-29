{-# OPTIONS --cubical #-}

open import Cubical.Core.Everything
open import Cubical.Data.Maybe
open import Cubical.Data.Nat

open import Cubical.Foundations.Prelude
open import Cubical.Foundations.Isomorphism

data ω : Type₀ where
  zero : ω
  suc : ω → ω
  inf : ω
  suc-inf : inf ≡ suc inf

ω′ : Type₀
ω′ = Maybe ℕ

zero′ : ω′
zero′ = just zero

suc′ : ω′ → ω′
-- suc′ = map-Maybe suc
suc′ nothing = nothing
suc′ (just x) = just (suc x)

inf′ : ω′
inf′ = nothing

ω→ω′ : ω → ω′
ω→ω′ zero = zero′
ω→ω′ (suc n) = suc′ (ω→ω′ n)
ω→ω′ inf = inf′
ω→ω′ (suc-inf i) = inf′

ℕ→ω : ℕ → ω
ℕ→ω zero = zero
ℕ→ω (suc n) = suc (ℕ→ω n)

ω′→ω : ω′ → ω
ω′→ω nothing = inf
ω′→ω (just n) = ℕ→ω n

ℕ→ω→ω′ : ∀ n → ω→ω′ (ℕ→ω n) ≡ just n
ℕ→ω→ω′ zero = refl
ℕ→ω→ω′ (suc n) = cong suc′ (ℕ→ω→ω′ n)

ω′→ω→ω′ : ∀ n → ω→ω′ (ω′→ω n) ≡ n
ω′→ω→ω′ nothing = refl
ω′→ω→ω′ (just n) = ℕ→ω→ω′ n

suc-hom : ∀ n → ω′→ω (suc′ n) ≡ suc (ω′→ω n)
suc-hom nothing = suc-inf
suc-hom (just x) = refl

ω→ω′→ω : ∀ n → ω′→ω (ω→ω′ n) ≡ n
ω→ω′→ω zero = refl
ω→ω′→ω inf = refl
ω→ω′→ω (suc n) = suc-hom (ω→ω′ n) ∙ cong suc (ω→ω′→ω n)
ω→ω′→ω (suc-inf i) = lemma i
  where
  lemma : (λ i → inf ≡ suc-inf i) [ refl ≡ suc-inf ∙ refl ]
  lemma i j = hcomp (λ k → λ
    { (i = i0) → inf
    ; (i = i1) → compPath-filler suc-inf refl k j
    ; (j = i0) → inf
    ; (j = i1) → suc-inf i
    }) (suc-inf (i ∧ j))

open Iso

ω⇔ω′ : Iso ω ω′
ω⇔ω′ .fun = ω→ω′
ω⇔ω′ .inv = ω′→ω
ω⇔ω′ .leftInv = ω→ω′→ω
ω⇔ω′ .rightInv = ω′→ω→ω′
