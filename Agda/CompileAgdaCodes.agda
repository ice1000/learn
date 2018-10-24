module CompileAgdaCodes where

open import IO
open import Function
open import Data.Unit
open import Data.Nat.Show
open import Data.Nat
open import Relation.Binary.PropositionalEquality
open import Data.Empty

someProof : ∀ a b c -> a + b + c ≡ a + (b + c)
someProof zero b c = refl
someProof (suc a) b c = cong suc $ someProof a b c

main = run $ do
  -- putStrLn "WTF"
  putStrLn $ show $ 1 + 1
