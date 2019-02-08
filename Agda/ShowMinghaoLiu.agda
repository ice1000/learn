module ShowMinghaoLiu where

variable
  A : Set
  M : Set -> Set

record Functor (F : Set -> Set) : Set₁ where
  field _<$>_ : ∀ {A B} -> (A -> B) -> F A -> F B

record Monad (M : Set -> Set) : Set₁ where
  field {{ functor }} : Functor M
  field return  : ∀ {A B} -> (A -> M B) -> M A -> M B
  -- instance FunctorInstance = functor

open Functor {{ ... }}
open Monad   {{ ... }}

useFunctor : {{ _ : Functor M }} -> M A -> M A
useFunctor a = a

get<$> : {{ _ : Monad M }} -> M A -> M A
get<$> ma = let _ = useFunctor ma in ma

-- open import Agda.Builtin.List

