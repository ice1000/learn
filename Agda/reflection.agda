
module reflection where

open import Agda.Primitive
open import Agda.Builtin.Char
open import Agda.Builtin.Float
open import Agda.Builtin.FromNat
open import Agda.Builtin.FromNeg
open import Agda.Builtin.FromString
open import Agda.Builtin.Int
open import Agda.Builtin.Sigma
open import Agda.Builtin.Size
open import Agda.Builtin.Strict
open import Agda.Builtin.String
open import Agda.Builtin.TrustMe
open import Agda.Builtin.Unit
open import Agda.Builtin.Word

open import Data.Maybe
open import Data.Nat
open import Data.List
open import Data.Bool
open import Relation.Binary.PropositionalEquality
open import Data.Empty
open import Reflection
open import IO

-- trans : {A : Set} -> (a b c : A) -> a ≡ b -> b ≡ c -> a ≡ c
-- trans a .a .a refl refl = {!!}

example₀ : {a : Set} -> quoteTerm a ≡ var zero []
example₀ = refl

dioType : Type -> Set
dioType (def (quote Maybe) args) = ℕ
dioType (var x args) = ⊥
dioType (con c args) = ⊥
dioType (def f args) = ⊥
dioType (lam v t) = ⊥
dioType (pat-lam cs args) = ⊥
dioType (pi a b) = ⊥
dioType (sort s) = ⊥
dioType (lit l) = ⊥
dioType (meta x y) = ⊥
dioType unknown = ⊥

dio : {A : Set} -> (a : A) -> dioType (quoteTerm A)
dio {A} a with (quoteTerm A)
...  | def (quote Maybe) args = {!!}
dio {A} a | var x args = {!!}
dio {A} a | con c args = {!!}
dio {A} a | def f args = {!!}
dio {A} a | lam v t = {!!}
dio {A} a | pat-lam cs args = {!!}
dio {A} a | pi a₁ b = {!!}
dio {A} a | sort s = {!!}
dio {A} a | lit l = {!!}
dio {A} a | meta x x₁ = {!!}
dio {A} a | unknown = {!!}


-- getMaybeCount : 

