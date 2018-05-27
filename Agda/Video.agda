module Video where

infixl 6 _∧_
-- P Q → P ∧ Q
data _∧_ (P Q : Set) : Set where
  ∧-intro : P → Q → P ∧ Q

_⇔_ : (P Q : Set) → Set
P ⇔ Q = (P → Q) ∧ (Q → P)

∧-comm′ : {P Q : Set} → (P ∧ Q) → (Q ∧ P)
∧-comm′ (∧-intro p q) = ∧-intro q p

∧-comm : (P Q : Set) → (P ∧ Q) ⇔ (Q ∧ P)
∧-comm p q = ∧-intro ∧-comm′ ∧-comm′

∧-assoc₀ : {P Q R : Set} → (P ∧ (Q ∧ R)) → ((P ∧ Q) ∧ R)
∧-assoc₀ (∧-intro p (∧-intro q r)) = ∧-intro (∧-intro p q) r

∧-assoc₁ : {P Q R : Set} → ((P ∧ Q) ∧ R) → (P ∧ (Q ∧ R))
∧-assoc₁ (∧-intro (∧-intro p q) r) = ∧-intro p (∧-intro q r)

∧-assoc : (P Q R : Set) → (P ∧ (Q ∧ R)) ⇔ ((P ∧ Q) ∧ R)
∧-assoc p q r = ∧-intro ∧-assoc₀ ∧-assoc₁

infixl 5 _∨_
data _∨_ (A B : Set) : Set where
  ∨-intro₀ : A → A ∨ B
  ∨-intro₁ : B → A ∨ B

∨-comm′ : {P Q : Set} → P ∨ Q → Q ∨ P
∨-comm′ (∨-intro₀ x) = ∨-intro₁ x
∨-comm′ (∨-intro₁ x) = ∨-intro₀ x

∨-comm : (P Q : Set) → (P ∨ Q) ⇔ (Q ∨ P)
∨-comm p q = ∧-intro ∨-comm′ ∨-comm′

∨-elim : {P Q R : Set} → (P → R) → (Q → R) → (P ∨ Q) → R
∨-elim pr qr (∨-intro₀ x) = pr x
∨-elim pr qr (∨-intro₁ x) = qr x

