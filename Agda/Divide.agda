{-# OPTIONS --cubical --safe #-}
module Divide where

open import Cubical.Data.Nat
  renaming (_+_ to _:+:_; _*_ to _:*:_; ℕ to Nat)
open import Cubical.Core.Everything
open import Function using (_$_)

module Lemmas where
  open import Cubical.Data.Nat
  *-distribʳ-+ : ∀ a b c → (b + c) * a ≡ b * a + c * a
  *-distribʳ-+ m zero    o = refl
  *-distribʳ-+ m (suc n) o =
    m + (n + o) * m     ≡⟨ cong (m +_) (*-distribʳ-+ m n o) ⟩
    m + (n * m + o * m) ≡⟨ +-assoc m (n * m) (o * m) ⟩
    suc n * m + o * m   ∎

  *-assoc : ∀ a b c → a * b * c ≡ a * (b * c)
  *-assoc zero    n o = refl
  *-assoc (suc m) n o =
    (suc m * n) * o     ≡⟨ refl ⟩
    (n + m * n) * o     ≡⟨ *-distribʳ-+ o n (m * n) ⟩
    n * o + (m * n) * o ≡⟨ cong (n * o +_) (*-assoc m n o) ⟩
    n * o + m * (n * o) ∎

  *-comm : ∀ a b → a * b ≡ b * a
  *-comm zero b = *-zero b
    where
      *-zero : ∀ b → 0 ≡ b * 0
      *-zero zero = refl
      *-zero (suc b) = *-zero b
  *-comm (suc m) n =
    suc m * n  ≡⟨ refl ⟩
    n + m * n  ≡⟨ cong (n +_) (*-comm m n) ⟩
    n + n * m  ≡⟨ sym (+-*-suc n m) ⟩
    n * suc m  ∎
    where
      +-*-suc : ∀ m n → m * suc n ≡ m + m * n
      +-*-suc zero    n = refl
      +-*-suc (suc m) n =
        suc m * suc n         ≡⟨ refl ⟩
        suc n + m * suc n     ≡⟨ cong (suc n +_) (+-*-suc m n) ⟩
        suc n + (m + m * n)   ≡⟨ refl ⟩
        suc (n + (m + m * n)) ≡⟨ cong suc (+-assoc n m (m * n)) ⟩
        suc (n + m + m * n)   ≡⟨ cong (λ x → suc (x + m * n)) (+-comm n m) ⟩
        suc (m + n + m * n)   ≡⟨ cong suc (sym (+-assoc m n (m * n))) ⟩
        suc (m + (n + m * n)) ≡⟨ refl ⟩
        suc m + suc m * n     ∎

open Lemmas

infixl 7 _÷_
data Q : Set where
  _÷_ : Nat → Nat → Q
  kora : ∀ n a b → a ÷ b ≡ (a :*: n) ÷ (b :*: n)

infixl 6 _+_
_+_ : Q → Q → Q
a ÷ b + c ÷ d = (a :*: d :+: b :*: c) ÷ (b :*: d)
-- (a :*: d :+: b :*: c) ÷ (b :*: d)
-- (a :*: (d :*: n) :+: b :*: (c :*: n)) ÷ (b :*: (d :*: n))
a ÷ b + kora n c d i = kora n {!!} {!!} i
kora n a b i + c ÷ d = kora n {!!} {!!} i
kora n a b i + kora m c d j = kora {!!} {!!} {!!} {!!}
