module Try1 where

data Bool : Set where
  true false : Bool

data 𝕟 : Set where
  zero : 𝕟
  succ : 𝕟 -> 𝕟

data Id (A : Set) : Set where
  pack : A -> Id A

data ⊥ : Set where


id𝕟₀ : 𝕟 -> 𝕟
id𝕟₀ x = x

