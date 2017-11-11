module Try4 where

data _∧_ (P Q : Set) : Set where
  ∧-intro : P → Q → (P ∧ Q)

_⇔_ : (P Q : Set) → Set
p ⇔ q = (p → q) ∧ (q → p)

proof₃ : ∀ {P Q} → (P ∧ Q) → P
proof₃ (∧-intro p q) = p

∧-comm′ : ∀ {P Q} → (P ∧ Q) → (Q ∧ P)
∧-comm′ (∧-intro p q) = (∧-intro q p)

∧-comm : ∀ {P Q} → (P ∧ Q) ⇔ (Q ∧ P)
∧-comm = ∧-intro ∧-comm′ ∧-comm′

∧-assoc₀ : ∀ {P Q R} → ((P ∧ Q) ∧ R) → (P ∧ (Q ∧ R))
∧-assoc₀ (∧-intro (∧-intro p q) r) = ∧-intro p (∧-intro q r)

∧-assoc₁ : ∀ {P Q R} → (P ∧ (Q ∧ R)) → ((P ∧ Q) ∧ R)
∧-assoc₁ (∧-intro p (∧-intro q r)) = ∧-intro (∧-intro p q) r

∧-assoc : ∀ {P Q R} → (P ∧ (Q ∧ R)) ⇔ ((P ∧ Q) ∧ R)
∧-assoc = ∧-intro ∧-assoc₁ ∧-assoc₀

data _∨_ (P Q : Set) : Set where
  ∨-intro₀ : P → P ∨ Q
  ∨-intro₁ : Q → P ∨ Q

∨-elim : ∀ {P Q} {R : Set} → (P → R) → (Q → R) → (P ∨ Q) → R
∨-elim pr _ (∨-intro₀ p) = pr p
∨-elim _ qr (∨-intro₁ q) = qr q

∨-comm′ : ∀ {P Q} → (P ∨ Q) → (Q ∨ P)
∨-comm′ (∨-intro₀ p) = ∨-intro₁ p
∨-comm′ (∨-intro₁ q) = ∨-intro₀ q

∨-comm : ∀ {P Q} → (P ∨ Q) ⇔ (Q ∨ P)
∨-comm = ∧-intro ∨-comm′ ∨-comm′

data ⊥ : Set where

¬ : Set → Set
¬ a = a → ⊥

absurd₀ : ∀ {A} → ⊥ ∧ A → ⊥
absurd₀ (∧-intro () a)

absurd₁ : ∀ {A} → ⊥ ∨ A → A
absurd₁ (∨-intro₀ ())
absurd₁ (∨-intro₁ x) = x
