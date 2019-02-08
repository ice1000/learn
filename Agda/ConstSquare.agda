{-# OPTIONS --cubical #-}

open import Cubical.Core.Everything

Sq : {A : Set} {a0 a1 b0 b1 : A}
     (u  : a0 ≡ a1) (v  : b0 ≡ b1)
     (r0 : a0 ≡ b0) (r1 : a1 ≡ b1)
     → Set
Sq u v r0 r1 = PathP (λ i → r0 i ≡ r1 i) u v

ConstSq : {A : Set} {a : A} (p : a ≡ a) →
          Sq p p p p
ConstSq {A} p i j = compCCHM (λ _ → A)
  (~ i ∨ i ∨ ~ j ∨ j)
  (λ k → λ { (i = i0) → p j
           ; (i = i1) → p (k ∧ j)
           ; (j = i0) → p i
           ; (j = i1) → p (k ∧ i)
           })
  (p (i ∨ j))
