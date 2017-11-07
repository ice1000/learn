module Parsers where

module Tuple where
  data _×_ (A B : Set) : Set where
    <_,_> : A → B → A × B

  fst : {A B : Set} → A × B → A
  fst < x , y > = x

  snd : {A B : Set} → A × B → B
  snd < x , y > = y

  tuple : ∀ {n} {A B : Set} {R : Set n} → (A → B → R) → A × B → R
  tuple f < x , y > = f x y

  mapFst : {A B R : Set} → (A → R) → A × B → R × B
  mapFst f < x , y > = < f x , y >

  mapSnd : {A B R : Set} → (B → R) → A × B → A × R
  mapSnd f < x , y > = < x , f y >

open Tuple public

open import Data.Char
open import Data.List renaming (_++_ to _list++_)
open import Data.String using (String)

open import Category.Monad
open import Category.Functor
open import Category.Applicative

open import Function

data Parser (A : Set) : Set where
  MkParser : (String → List (A × String)) → Parser A

parse : ∀ {A} → Parser A → (String → List (A × String))
parse (MkParser f) = f

unitParser : ∀ {A} → A → Parser A
unitParser a = MkParser λ s → < a , s > ∷ []

ParserFunctor : RawFunctor Parser
ParserFunctor = record {
    _<$>_ = λ f ps → MkParser λ p → map (mapFst f) $ parse ps p
  }

ParserMonad : RawMonad Parser
ParserMonad = record {
    return = unitParser
  ; _>>=_  = λ p f → MkParser $ concatMap (tuple $ parse ∘ f) ∘ parse p
  }

-- ParserApplicative : RawApplicative Parser
-- ParserApplicative = record {
--     pure = unitParser
--   ; _⊛_  = λ p1 p2 → MkParser λ p → --
--   }

ParserMonadZero : RawMonadZero Parser
ParserMonadZero = record {
    monad = ParserMonad
  ; ∅     = MkParser $ const []
  }

ParserMonadPlus : RawMonadPlus Parser
ParserMonadPlus = record {
    monadZero = ParserMonadZero
  ; _∣_       = λ p q → MkParser λ s → parse p s list++ parse q s
  }

-- item : Parser Char
-- item = MkParser λ { "" → [] ; or → < h , t > ∷ [] }

-- parse1 : Parser ⊤
-- parse1 = 
