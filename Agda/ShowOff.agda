module ShowOff where

data _∧_ (P Q : Set) : Set where
  ∧-intro : P → Q → (P ∧ Q)

_⇔_ : (P Q : Set) → Set
p ⇔ q = (p → q) ∧ (q → p)

proof₃ : ∀ {P Q} → (P ∧ Q) → P
proof₃ (∧-intro x x₁) = x

∧-comm′ : ∀ {P Q} → (P ∧ Q) → (Q ∧ P)
∧-comm′ (∧-intro x x₁) = ∧-intro x₁ x

∧-comm : ∀ {P Q} → (P ∧ Q) ⇔ (Q ∧ P)
∧-comm = ∧-intro ∧-comm′ ∧-comm′

∧-assoc₀ : ∀ {P Q R} → ((P ∧ Q) ∧ R) → (P ∧ (Q ∧ R))
∧-assoc₀ (∧-intro (∧-intro x₁ x₂) x) = ∧-intro x₁ (∧-intro x₂ x)

∧-assoc₁ : ∀ {P Q R} → (P ∧ (Q ∧ R)) → ((P ∧ Q) ∧ R)
∧-assoc₁ (∧-intro x (∧-intro x₁ x₂)) = ∧-intro (∧-intro x x₁) x₂

∧-assoc : ∀ {P Q R} → (P ∧ (Q ∧ R)) ⇔ ((P ∧ Q) ∧ R)
∧-assoc = ∧-intro ∧-assoc₁ ∧-assoc₀

data ⊥ : Set₁ where

¬ : Set₁ → Set₁
¬ a = a → ⊥

data _∨_ (P Q : Set₁) : Set₁ where
  ∨-intro₀ : P → P ∨ Q
  ∨-intro₁ : Q → P ∨ Q

prop : {p : Set₁} → p → p ∨ (¬ p)
prop p = ∨-intro₀ p

∨-elim : ∀ {P Q} {R : Set} → (P → R) → (Q → R) → (P ∨ Q) → R
∨-elim pr qr (∨-intro₀ x) = pr x
∨-elim pr qr (∨-intro₁ x) = qr x

∨-comm′ : ∀ {P Q} → (P ∨ Q) → (Q ∨ P)
∨-comm′ (∨-intro₀ x) = ∨-intro₁ x
∨-comm′ (∨-intro₁ x) = ∨-intro₀ x

-- ∨-comm : ∀ {P Q} → (P ∨ Q) ⇔ (Q ∨ P)
-- ∨-comm = ∧-intro ∨-comm′ ∨-comm′

-- absurd₀ : ∀ {A} → ⊥ ∧ A → ⊥
-- absurd₀ (∧-intro () a)

-- absurd₁ : ∀ {A} → ⊥ ∨ A → A
-- absurd₁ (∨-intro₀ ())
-- absurd₁ (∨-intro₁ x) = x
