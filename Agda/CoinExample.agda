module CoinExample where

open import Codata.Conat hiding (pred)
open import Codata.Thunk
open import Data.Nat hiding (pred) renaming (ℕ to Nat)
open import Size
open import Function

size : ∀ {i} -> (n : Conat $ ↑ i) -> Size
size {i} zero = ↑ i
size {i} (suc x) = i

pred : ∀ {i} -> (n : Conat $ ↑ i) -> Conat $ size {i} n
pred zero = zero
pred (suc x) = x .force

wrong : ∀ {i} -> Conat i -> Nat
wrong zero = zero
wrong    n = wrong $ pred n

