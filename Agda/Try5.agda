module Try5 where

open import Data.List
open import Data.Bool

filter′ : {A : Set} → (A → Bool) → List A → List A
filter′ f []      = []
filter′ f (h ∷ t) with f h
...                | true  = h ∷ filter′ f t
...                | false = filter′ f t

