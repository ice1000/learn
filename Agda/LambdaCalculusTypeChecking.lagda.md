# Lambda 演算类型检查器

这是一个 Agda Introduction 课程的内容。

```agda
module LambdaCalculusTypeChecking where

open import Data.String
open import Data.String.Unsafe
open import Data.Product renaming (map₂ to second)
open import Data.Sum
open import Data.Empty

open import Relation.Nullary
open import Relation.Binary.PropositionalEquality

open import Function
open import Level renaming (suc to lsucc; zero to lzero)

open import Agda.Builtin.List
open import Agda.Builtin.Nat using (Nat)
open import Agda.Builtin.Bool

Name = String
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
  TC : Set -> Set
  TC A = TypeError ⊎ A
  infixl 10 _>>=_
  _>>=_ : ∀ {B D : Set} -> TC B -> (B -> TC D) -> TC D
  inj₁ x >>= f = inj₁ x
  inj₂ y >>= f = f y

  data Success (Γ : Ctx) : Expr -> Set where
    ok : ∀ a (v : Term Γ a) -> Success Γ (eraseType v)

  typeCheck : (Γ : Ctx) (e : Expr) -> TC (Success Γ e)
  typeCheck Γ (var x) = map₂ checkVar $ lookupVar Γ x
    where
      checkVar : ∀ {x} -> (∃ λ a -> (x , a) ∈ Γ)
               -> Success Γ (var x)
      checkVar (a , t) = ok a $ var _ t

      lookupVar : (Γ : Ctx) (x : Name)
                -> TC (∃ λ a -> (x , a) ∈ Γ)
      lookupVar [] x = inj₁ $
                "Variable out of scope: " ++ x
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
      checkApp : ∀ {f x} -> Success Γ f -> Success Γ x
               -> TC (Success Γ $ app f x)
      checkApp (ok nat f) (ok at a) = inj₁ $
               "Nat is not a function!"
      checkApp (ok (t => r) f) (ok at a) with decEq t at
      ... | yes refl = inj₂ $ ok r $ app f a
      ... | no _ = inj₁ $ "Argument type mismatch!"

  typeCheck Γ (lam x t e) = map₂ checkLam
            (typeCheck ((x , t) ∷ Γ) e)
    where
      checkLam : ∀ {x t e} -> Success ((x , t) ∷ Γ) e
                 -> Success Γ (lam x t e)
      checkLam (ok a v) = ok (_ => a) $ lam _ _ v

module Tests where
  open TypeCheck
  open Untyped

  -- 233
  litTest : typeCheck [] (lit 233) ≡ inj₂ (ok nat _)
  litTest = refl

  -- λ x . x
  idFunc : typeCheck [] (lam "x" nat (var "x")) ≡ inj₂ (ok (nat => nat) _)
  idFunc = refl

  -- (λ x . x) 233
  idFuncApp : typeCheck [] (app (lam "x" nat (var "x")) (lit 233)) ≡ inj₂ (ok nat _)
  idFuncApp = refl

  -- (λ x . x) (λ x . x) 233
  idFuncApp2 : typeCheck [] (app (app (lam "x" (nat => nat) (var "x"))
                            (lam "x" nat (var "x"))) (lit 233))
             ≡ inj₂ (ok nat _)
  idFuncApp2 = refl

  -- λ x . λ y . x
  curriedConst : typeCheck [] (lam "x" nat (lam "y" nat (var "x")))
               ≡ inj₂ (ok (nat => nat => nat) _)
  curriedConst = refl

  -- λ x . y
  badlyTyped : typeCheck [] (lam "x" nat (var "y"))
             ≡ inj₁ "Variable out of scope: y"
  badlyTyped = refl
```
