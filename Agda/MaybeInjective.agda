{-# OPTIONS --cubical --safe #-}
module MaybeInjective where

open import Data.Maybe
open import Cubical.Core.Everything
open import Cubical.Foundations.Everything
open import Cubical.Data.Everything renaming ([_] to list-init)

-- -- maybe helpful
record Reveal_·_is_ {a b} {A : Set a} {B : A → Set b}
                    (f : (x : A) → B x) (x : A) (y : B x) :
                    Set (ℓ-max a b) where
  constructor [_]
  field eq : f x ≡ y

inspect : ∀ {a b} {A : Set a} {B : A → Set b}
          (f : (x : A) → B x) (x : A) → Reveal f · x is f x
inspect f x = [ refl ]

just-injective : ∀ {A : Set} (a b : A) → just a ≡ just b → a ≡ b
just-injective {A} a b p = subst diagnose p refl
  where
  diagnose : Maybe A → Set
  diagnose (just x) = a ≡ x
  diagnose nothing = ⊥

-- prove it!
maybeInjective : {A B : Set} → Maybe A ≡ Maybe B → A ≡ B
maybeInjective {A} {B} mp = ua (isoToEquiv (iso f g sec ret))
  where
  ma=mb = pathToEquiv mp
  fwd = fst ma=mb
  bwd = invEq ma=mb
  fwdEq : ∀ a → bwd (fwd a) ≡ a
  fwdEq a = secEq ma=mb a
  bwdEq : ∀ a → fwd (bwd a) ≡ a
  bwdEq a = retEq ma=mb a

  diagnose : ∀ {A} → Maybe A → Set
  diagnose (just _) = Unit
  diagnose nothing = ⊥

  die : ∀ {A : Set} {a : A} → just a ≡ nothing → ⊥
  die p = transport (cong diagnose p) tt

  f : A → B
  f a with fwd (just a) | inspect fwd (just a) | fwd nothing | inspect fwd nothing
  f a | just x  | [ _ ] | _       | [ _ ] = x
  ... | nothing | [ _ ] | just x  | [ _ ] = x
  f a | nothing | [ p ] | nothing | [ q ] = ⊥-elim (die jj)
    where
    jj = sym (fwdEq (just a)) ∙ cong bwd (p ∙ sym q) ∙ fwdEq nothing

  g : B → A
  g b with bwd (just b) | inspect bwd (just b) | bwd nothing | inspect bwd nothing
  g b | just x  | [ _ ] | _       | [ _ ] = x
  g b | nothing | [ _ ] | just x  | [ _ ] = x
  g b | nothing | [ p ] | nothing | [ q ] = ⊥-elim (die bb)
    where
    bb = sym (bwdEq (just b)) ∙ cong fwd (p ∙ sym q) ∙ bwdEq nothing

  fjj : ∀ a b → fwd (just a) ≡ just b → f a ≡ b
  fjj a b p with fwd (just a)
  fjj a b p | just a′ = just-injective a′ b p
  fjj a b p | nothing = ⊥-elim (die (sym p))

  fn : ∀ a b → fwd (just a) ≡ nothing → fwd nothing ≡ just b → f a ≡ b
  fn a b p q with fwd (just a) | fwd nothing
  fn a b p q | just _  | just _  = ⊥-elim (die p)
  fn a b p q | just _  | nothing = ⊥-elim (die p)
  fn a b p q | nothing | nothing = ⊥-elim (die (sym q))
  fn a b p q | nothing | just b′
    = just-injective b′ b q

  sec : ∀ b → f (g b) ≡ b
  sec b with bwd (just b) | inspect bwd (just b)
  sec b | just a  | [ p ] = fjj a b (
    fwd (just a)       ≡⟨ sym (cong fwd p) ⟩
    fwd (bwd (just b)) ≡⟨  bwdEq (just b)  ⟩
    just b             ∎)
  sec b | nothing | [ p ] with bwd nothing | inspect bwd nothing
  sec b | nothing | [ p ] | just a  | [ q ] = fn a b (
    fwd (just a)       ≡⟨ sym (cong fwd q) ⟩
    fwd (bwd nothing)  ≡⟨  bwdEq  nothing  ⟩
    nothing            ∎) (
    fwd nothing        ≡⟨ sym (cong fwd p) ⟩
    fwd (bwd (just b)) ≡⟨  bwdEq (just b)  ⟩
    just b             ∎)
  sec b | nothing | [ p ] | nothing | [ q ] = ⊥-elim (die jb)
    where
    jb = sym (bwdEq (just b)) ∙ cong fwd (p ∙ sym q) ∙ bwdEq nothing

  gjj : ∀ b a → bwd (just b) ≡ just a → g b ≡ a
  gjj b a p with bwd (just b)
  gjj b a p | just b′ = just-injective b′ a p
  gjj b a p | nothing = ⊥-elim (die (sym p))

  gn : ∀ b a → bwd (just b) ≡ nothing → bwd nothing ≡ just a → g b ≡ a
  gn b a p q with bwd (just b) | bwd nothing
  gn b a p q | just _  | just _  = ⊥-elim (die p)
  gn b a p q | just _  | nothing = ⊥-elim (die p)
  gn b a p q | nothing | nothing = ⊥-elim (die (sym q))
  gn b a p q | nothing | just b′
    = just-injective b′ a q

  ret : ∀ a → g (f a) ≡ a
  ret a with fwd (just a) | inspect fwd (just a)
  ret a | just b  | [ p ] = gjj b a (
    bwd (just b)       ≡⟨ sym (cong bwd p) ⟩
    bwd (fwd (just a)) ≡⟨  fwdEq (just a)  ⟩
    just a             ∎)
  ret a | nothing | [ p ] with fwd nothing | inspect fwd nothing
  ret a | nothing | [ p ] | just b  | [ q ] = gn b a (
    bwd (just b)       ≡⟨ sym (cong bwd q) ⟩
    bwd (fwd nothing)  ≡⟨  fwdEq  nothing  ⟩
    nothing            ∎) (
    bwd nothing        ≡⟨ sym (cong bwd p) ⟩
    bwd (fwd (just a)) ≡⟨  fwdEq (just a)  ⟩
    just a             ∎)
  ret a | nothing | [ p ] | nothing | [ q ] = ⊥-elim (die ja)
    where
    ja = sym (fwdEq (just a)) ∙ cong bwd (p ∙ sym q) ∙ fwdEq nothing
