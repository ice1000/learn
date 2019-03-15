{-# OPTIONS --safe #-}
module LambdaCalculusTypeChecker where

open import Data.String hiding (show)
open import Data.Product renaming (map₂ to second)
open import Data.Sum
open import Data.Empty

open import Relation.Nullary
open import Relation.Binary.PropositionalEquality

open import Function

open import Data.List hiding (_++_)
open import Data.Nat renaming (ℕ to Nat)
open import Data.Nat.Show
open import Agda.Builtin.Bool

Name = Nat
variable A : Set

infixr 7 _=>_
data Type : Set where
  nat  : Type
  _=>_ : Type -> Type -> Type

variable a b c d : Type
argEq : a => b ≡ c => d -> (a ≡ c × b ≡ d)
argEq refl = refl , refl

decEq : (a b : Type) -> Dec (a ≡ b)
decEq nat nat = yes refl
decEq nat (_ => _) = no (λ ())
decEq (a => b) nat = no (λ ())
decEq (a => b) (c => d) with decEq a c
... | no nrefl = no $ nrefl ∘ proj₁ ∘ argEq
... | yes refl with decEq b d
... | yes refl = yes refl
... | no nrefl = no $ nrefl ∘ proj₂ ∘ argEq

infix 4 _∈_
data _∈_ {A : Set} (a : A) : List A -> Set where
  emm : (as : List A) -> a ∈ a ∷ as
  hmm : ∀ {as c} -> (a ∈ as) -> a ∈ c ∷ as

Ctx = List (Name × Type)
variable Γ : Ctx

module Untyped where
  data Term : Set where
    var : Name -> Term
    lit : Nat  -> Term
    suc : Term
    app : Term -> Term -> Term
    lam : Name -> Type -> Term -> Term

module Typed where
  data Term (Γ : Ctx) : Type -> Set where
    var : ∀ {a} (x : Name) (i : (x , a) ∈ Γ) -> Term Γ a
    lit : (n : Nat) -> Term Γ nat
    suc : Term Γ (nat => nat)
    app : Term Γ (a => b) -> Term Γ a -> Term Γ b
    lam : (x : Name) (a : Type) -> Term ((x , a) ∷ Γ) b
        -> Term Γ (a => b)

module Erase where
  open Typed public
  open Untyped renaming (Term to Expr) public

  eraseType : Term Γ a -> Expr
  eraseType (var x _) = var x
  eraseType (lit n) = lit n
  eraseType suc = suc
  eraseType (app f x) = app (eraseType f) $ eraseType x
  eraseType (lam x t e) = lam x t $ eraseType e

module TypeCheck where
  open Erase
  TypeError = String
  TCM : Set -> Set
  TCM A = TypeError ⊎ A
  infixl 10 _>>=_
  _>>=_ : ∀ {B D : Set} -> TCM B -> (B -> TCM D) -> TCM D
  inj₁ x >>= f = inj₁ x
  inj₂ y >>= f = f y

  data Success (Γ : Ctx) : Expr -> Set where
    ok : ∀ a (v : Term Γ a) -> Success Γ (eraseType v)

  typeCheck : (Γ : Ctx) (e : Expr) -> TCM (Success Γ e)
  typeCheck Γ (var x) = map₂ checkVar $ lookupVar Γ x
    where
      checkVar : ∀ {x} -> (∃ λ a -> (x , a) ∈ Γ) -> Success Γ (var x)
      checkVar (a , t) = ok a $ var _ t

      lookupVar : (Γ : Ctx) (x : Name) -> TCM (∃ λ a -> (x , a) ∈ Γ)
      lookupVar [] x = inj₁ $ "Variable out of scope: " ++ show x
      lookupVar ((a , t) ∷ Γ) x with a ≟ x
      ... | yes refl = inj₂ $ t , emm Γ
      ... | no _ = map₂ (second hmm) $ lookupVar Γ x
  typeCheck Γ (lit n) = inj₂ $ ok nat $ lit n
  typeCheck Γ suc = inj₂ $ ok (nat => nat) suc
  typeCheck Γ (app f x) = do
            fv <- typeCheck Γ f
            xv <- typeCheck Γ x
            checkApp fv xv
    where
      checkApp : ∀ {f x} -> Success Γ f -> Success Γ x -> TCM (Success Γ $ app f x)
      checkApp (ok nat f) (ok at a) = inj₁ $ "Nat is not a function!"
      checkApp (ok (t => r) f) (ok at a) with decEq t at
      ... | yes refl = inj₂ $ ok r $ app f a
      ... | no _ = inj₁ $ "Argument type mismatch!"

  typeCheck Γ (lam x t e) = map₂ checkLam $ typeCheck ((x , t) ∷ Γ) e
    where
      checkLam : ∀ {x t e} -> Success ((x , t) ∷ Γ) e -> Success Γ (lam x t e)
      checkLam (ok a v) = ok (_ => a) $ lam _ _ v

module Tests where
  open TypeCheck
  open Untyped

  -- 233
  litTest : typeCheck [] (lit 233) ≡ inj₂ (ok nat (Erase.lit 233))
  litTest = refl

  -- λ x . x
  idFunc : typeCheck [] (lam 233 nat (var 233))
         ≡ inj₂ (ok (nat => nat)
                (Erase.lam 233 nat (Erase.var 233 (emm []))))
  idFunc = refl

  -- (λ x . x) 233
  idFuncApp : typeCheck [] (app (lam 233 nat (var 233)) (lit 233))
            ≡ inj₂ (ok nat (Erase.app (Erase.lam 233 nat
                   (Erase.var 233 (emm [])))
                   (Erase.lit 233)))
  idFuncApp = refl

  -- (λ x . x) (λ x . x) 233
  idFuncApp2 : typeCheck [] (app (app (lam 233 (nat => nat) (var 233))
                            (lam 666 nat (var 666))) (lit 233))
             ≡ inj₂ (ok nat (Erase.app
                    (Erase.app (Erase.lam 233 (nat => nat)
                    (Erase.var 233 (emm [])))
                    (Erase.lam 666 nat (Erase.var 666 (emm []))))
                    (Erase.lit 233)))
  idFuncApp2 = refl

  -- λ x . λ y . x
  curriedConst : typeCheck [] (lam 123 nat (lam 345 nat (var 123)))
               ≡ inj₂ (ok (nat => nat => nat)
                      (Erase.lam 123 nat (Erase.lam 345 nat
                      (Erase.var 123 (hmm (emm []))))))
  curriedConst = refl

  -- λ x . y
  badlyTyped : typeCheck [] (lam 234 nat (var 123))
             ≡ inj₁ "Variable out of scope: 123"
  badlyTyped = refl

  appOnNat : typeCheck [] (app (lit 233) (lit 666))
           ≡ inj₁ "Nat is not a function!"
  appOnNat = refl

  appOnNat2 : typeCheck [] (app (app (lam 1 nat (var 1)) (lit 2)) (lit 666))
            ≡ inj₁ "Nat is not a function!"
  appOnNat2 = refl

  argTypeMis : typeCheck [] (app (lam 1 (nat => nat) (app (var 1) (lit 23))) (lit 2))
             ≡ inj₁ "Argument type mismatch!"
  argTypeMis = refl

