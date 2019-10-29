module Test where

-- http://ice1000.org

open import Data.Nat
open import Agda.Builtin.Equality

open import Data.Empty

proof₀ : 10 ≡ 10
proof₀ = refl

proof₁ : 10 ≡ 9 → ⊥
proof₁ ()

-- ffmpeg -i a+b=b+a.ogv \
--        -c:v libx264 -preset veryslow -crf 22 \
--        -c:a libmp3lame -qscale:a 2 -ac 2 -ar 44100 \
--        a+b=b+a.mp4

-- b + 0 ≡ b
lemma₀ : ∀ b → b + 0 ≡ b
lemma₀  zero   = refl
lemma₀ (suc b)
  rewrite lemma₀ b = refl

-- 1 + (b + a) ≡ b + (1 + a)
lemma₁ : ∀ a b → suc (b + a) ≡ b + suc a
lemma₁ a  zero   = refl
lemma₁ a (suc b)
  rewrite lemma₁ a b = refl

-- a + b ≡ b + a
plus-comm : ∀ a b → a + b ≡ b + a
plus-comm  zero   b
  rewrite lemma₀ b = refl
plus-comm (suc a) b
  rewrite plus-comm a b
        | lemma₁ a b
          = refl

open import Agda.Builtin.Bool

-- test-non-terminating : Bool → Bool
-- test-non-terminating true = false
-- test-non-terminating false = test-non-terminating true

