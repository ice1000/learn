module Parsers where

open import Data.Product using (_×_; _,_)

module Tuple where
  open import Level

  variable
    a b r : Level
    A : Set a
    B : Set b
    R : Set r

  fst : A × B → A
  fst (x , y) = x

  snd : A × B → B
  snd (x , y) = y

  tuple : (A → B → R) → A × B → R
  tuple f (x , y) = f x y

  mapFst : (A → R) → A × B → R × B
  mapFst f (x , y) = f x , y

  mapSnd : (B → R) → A × B → A × R
  mapSnd f (x , y) = x , f y

open Tuple using (fst; snd; tuple; mapFst; mapSnd) public

open import Data.Char
open import Data.Bool
open import Data.Unit
open import Data.List renaming (_++_ to _+++_)
import Data.List.Categorical as LC

open import Category.Monad
open import Category.Functor
open import Category.Applicative

open import Function
open import Level

open RawMonad
open RawMonadZero
open RawMonadPlus
open RawFunctor
open RawApplicative
String = List Char

variable A : Set

record Parser (A : Set) : Set where
  inductive
  constructor MkParser
  field parse : (String → List (A × String))
open Parser

instance
  ParserFunctor : RawFunctor Parser
  _<$>_ ParserFunctor f ps = MkParser $ map (mapFst f) ∘ parse ps

  ParserMonad : RawMonad Parser
  return ParserMonad a = MkParser λ s → (a , s) ∷ []
  _>>=_  ParserMonad p f = MkParser $ concatMap (tuple $ parse ∘ f) ∘ parse p

  ParserMonadZero : RawMonadZero Parser
  monad ParserMonadZero = ParserMonad
  ∅     ParserMonadZero = MkParser $ const []

  ParserMonadPlus : RawMonadPlus Parser
  monadZero ParserMonadPlus = ParserMonadZero
  _∣_       ParserMonadPlus p q = MkParser λ s → parse p s +++ parse q s

  ParserApplicative : RawApplicative Parser
  pure ParserApplicative = return where open module M = RawMonad ParserMonad
  _⊛_  ParserApplicative p1 p2 = MkParser λ p → []

open RawMonad ⦃ ... ⦄
open RawMonadZero ⦃ ... ⦄
open RawMonadPlus ⦃ ... ⦄
open RawFunctor ⦃ ... ⦄
open RawApplicative ⦃ ... ⦄

open LC
test = suc <$> (1 ∷ 2 ∷ [])

item : Parser Char
parse item [] = []
parse item (h ∷ t) = (h , t) ∷ []

option0 : (b : Set) → Parser b → Parser b
option0 d p = {!!}

satisfy : (Char → Bool) → Parser Char
satisfy p = item M.>>= (λ c → if p c then (M.return c) else MZ.∅)
  where module M  = RawMonad ParserMonad
        module MZ = RawMonadZero ParserMonadZero

parse1 : Parser ⊤
parse1 = M.return tt where module M = RawMonad ParserMonad
