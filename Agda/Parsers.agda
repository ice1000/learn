module Parsers where

module Tuple where
  data _×_ (A B : Set) : Set where
    <_,_> : A → B → A × B

  fst : ∀ {A B} → A × B → A
  fst < x , y > = x

  snd : ∀ {A B} → A × B → B
  snd < x , y > = y

  tuple : ∀ {n A B} {R : Set n} → (A → B → R) → A × B → R
  tuple f < x , y > = f x y

  mapFst : ∀ {A B R} → (A → R) → A × B → R × B
  mapFst f < x , y > = < f x , y >

  mapSnd : ∀ {A B R} → (B → R) → A × B → A × R
  mapSnd f < x , y > = < x , f y >

open Tuple public

open import Data.Char
open import Data.Bool
open import Data.List renaming (_++_ to _list++_)

open import Category.Monad
open import Category.Functor
open import Category.Applicative

open import Function

String : Set
String = List Char

data Parser (A : Set) : Set where
  MkParser : (String → List (A × String)) → Parser A

parse : ∀ {A} → Parser A → (String → List (A × String))
parse (MkParser f) = f

unitParser : ∀ {A} → A → Parser A
unitParser a = MkParser λ s → < a , s > ∷ []

instance
  ParserFunctor : RawFunctor Parser
  ParserFunctor = record {
    _<$>_ = λ f ps → MkParser λ p → map (mapFst f) $ parse ps p
    }

  ParserMonad : RawMonad Parser
  ParserMonad = record {
      return = unitParser
    ; _>>=_  = λ p f → MkParser $ concatMap (tuple $ parse ∘ f) ∘ parse p
    }

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

  -- ParserApplicative : RawApplicative Parser
  -- ParserApplicative = record {
  --     pure = unitParser
  --   ; _⊛_  = λ p1 p2 → MkParser λ p → []
  --   }

item : Parser Char
item = MkParser λ {
     []    → []
  ; (h ∷ t) → (< h , t >) ∷ []
  }

option0 : (b : Set) → Parser b → Parser b
option0 d p = {!!}

satisfy : (Char → Bool) → Parser Char
satisfy p = RawMonad._>>=_ item ? (λ c → if (p c) then (RawMonad.return c) else ?)

-- parse1 : Parser ⊤
-- parse1 = 
