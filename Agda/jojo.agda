module jojo where

open import Data.Maybe
open import Data.Nat
open import Relation.Binary.PropositionalEquality
open import Function

join : ∀ {ℓ} → {A : Set ℓ} → Maybe (Maybe A) → Maybe A
join (just (just x)) = just x
join _ = nothing

join2 : ∀ {ℓ} → {A : Set ℓ} → Maybe (Maybe (Maybe A)) → Maybe A
join2 (just (just (just x))) = just x
join2 _ = nothing

dio : ∀ {ℓ} → ℕ → Set ℓ → Set ℓ
dio zero = Maybe
dio (suc n) = Maybe ∘ dio n

jojo : ∀ {ℓ} → {A : Set ℓ} → (n : ℕ) → dio n A → Maybe A
jojo zero x = x
jojo (suc n) (just x) = jojo n x
jojo (suc n) nothing = nothing

test₀ : ∀ {ℓ} → {A : Set ℓ} → (Maybe ∘ Maybe) A → Maybe A
test₀ = jojo 1

test₁ : ∀ {ℓ} → {A : Set ℓ} → (Maybe ∘ Maybe ∘ Maybe ∘ Maybe) A → Maybe A
test₁ = jojo 3

test₂ : ∀ {ℓ} → {A : Set ℓ} → (Maybe ∘ Maybe ∘ Maybe ∘ Maybe) A → Maybe A
test₂ = jojo 4 ∘ just

test₃ : Maybe ℕ
test₃ = jojo 2 (just (just (just 0)))

test₄ : Maybe ℕ
test₄ = jojo 6 (just (just (just (just (just (just (just 0)))))))

-- test : Maybe ℕ
-- test = jojo 6 nothing

-- jotaro : ∀ {ℓ} → Set ℓ → Set ℓ
-- jotaro {ℓ} A with A ≟ (Maybe {ℓ} _)
-- ...   | _ | _ = ?
