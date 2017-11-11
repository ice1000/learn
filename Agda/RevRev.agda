module RevRev where

open import Data.Vec
open import Data.Nat
open import Agda.Builtin.Equality

rev : ∀ {n m} {A : Set n} → Vec A m → Vec A m
rev [] = []
rev (x ∷ xs) = rev xs ∷ʳ x

rev$v:a=a:rev$v : ∀ {n m} {A : Set n} (a : A) (v : Vec A m) →
                rev (v ∷ʳ a) ≡ a ∷ rev v
rev$v:a=a:rev$v _ [] = refl
rev$v:a=a:rev$v a (_ ∷ xs) with rev (xs ∷ʳ a) | rev$v:a=a:rev$v a xs
...                            | .(a ∷ rev xs) | refl = refl

-- rev$v:a=a:rev$v : ∀ {n m} {A : Set n} (a : A) (v : Vec A m) →
--                 rev (v ∷ʳ a) ≡ a ∷ rev v
-- rev$v:a=a:rev$v _ [] = refl
-- rev$v:a=a:rev$v a (_ ∷ xs)
--   rewrite rev$v:a=a:rev$v a xs
--           = refl

rev∘rev=id : ∀ {n m} {A : Set n} (v : Vec A m) → rev (rev v) ≡ v
rev∘rev=id [] = refl
rev∘rev=id (x ∷ xs)
  rewrite rev$v:a=a:rev$v x (rev xs)
        | rev∘rev=id xs
          = refl
