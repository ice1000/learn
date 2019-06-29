{-# OPTIONS --safe #-}
module Reflec where

open import Agda.Builtin.Reflection

open import Relation.Nullary
open import Relation.Binary.PropositionalEquality
open import Function

open import Data.Nat
open import Data.Unit
open import Data.Bool
open import Data.String using (String)
open import Data.List using ([]; _∷_; List)
open import Data.Maybe using (Maybe; just; nothing; maybe′)

-- Engineering your proof with reflection

_==_ : Name → Name → Bool
_==_ = primQNameEquality

data Eval : Set where
  _!+_ : Eval → Eval → Eval
  _!*_ : Eval → Eval → Eval
  !lit : ℕ → Eval
  !zro : Eval
  !suc : Eval → Eval

defaultArg = arg-info visible relevant

module _ where
  open Data.Maybe

  parseℕ′ : Term → Maybe Term
  parseℕ′ (lit n) = just $ con (quote !lit) (arg defaultArg (lit n) ∷ [])
  parseℕ′ (def (quote _+_) ((arg x a) ∷ (arg y b) ∷ [])) = do
    a <- parseℕ′ a
    b <- parseℕ′ b
    just (con (quote _!+_) (arg x a ∷ arg y b ∷ []))
  parseℕ′ (def (quote _*_) ((arg x a) ∷ (arg y b) ∷ [])) = do
    a <- parseℕ′ a
    b <- parseℕ′ b
    just (con (quote _!*_) (arg x a ∷ arg y b ∷ []))
  parseℕ′ (con c []) = if (c == quote ℕ.zero) then just (quoteTerm !zro) else nothing
  parseℕ′ (con (quote ℕ.suc) (arg i x ∷ [])) = do
    x <- parseℕ′ x
    just (con (quote !suc) (arg i x ∷ []))
  parseℕ′ _ = nothing

private
  _>>=_ = bindTC
  _>>_ : ∀ {a b} {A : Set a} {B : Set b} → TC A → TC B → TC B
  a >> b = a >>= const b

macro
  parseℕ : Term → Term → TC ⊤
  parseℕ t hole with parseℕ′ t
  ... | just a = unify hole a
  ... | nothing = typeError (strErr "Failed to parse term" ∷ [])

_ : !lit 233 ≡ parseℕ 233
_ = refl
_ : (!lit 2 !+ !lit 2) ≡ parseℕ (2 + 2)
_ = refl
_ : (!lit 2 !+ (!lit 2 !* !lit 2)) ≡ parseℕ (2 + (2 * 2))
_ = refl
_ : ((!lit 2 !+ (!lit 2 !* !suc (!lit 2))) !+ !zro) ≡ parseℕ (2 + (2 * suc 2) + zero)
_ = refl
_ : (((!lit 1 !+ (!lit 2 !* !lit 3)) !+ (!lit 4 !* !lit 5)) !+
       !suc (!suc !zro)) ≡ parseℕ (1 + 2 * 3 + 4 * 5 + suc (suc zero))
_ = refl

joinMaybe : {A : Set} → Maybe (Maybe A) → Maybe A
joinMaybe (just (just x)) = just x
joinMaybe _ = nothing

countMaybe : Term → ℕ
countMaybe (def (quote Maybe) (_ ∷ arg x a ∷ [])) = suc $ countMaybe a
countMaybe t = 0

generateJojo : Term → ℕ → Term
generateJojo x zero = x
generateJojo x (suc zero) = x
generateJojo x (suc n) = def (quote joinMaybe) (arg defaultArg (generateJojo x n) ∷ [])

macro
  jojo : Term → Term → TC ⊤
  jojo t hole = inferType t >>= (unify hole ∘ generateJojo t ∘ countMaybe)

