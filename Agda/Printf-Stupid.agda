-- too stupid, given up
module Printf-Stupid where

open import Data.List using (List; _++_) renaming ([] to [List]; _∷_ to _::_)
open import Data.Char using (Char)
open import Data.Nat using (ℕ; _+_)
open import Data.Nat.Show using (show)
open import Data.Bool
open import Relation.Binary.PropositionalEquality
open import Function
open import Coinduction

open import Data.String using (toList)

data arg : Set where
  nat : ℕ → arg
  char : Char → arg

data arg′ : Set where
  nat : arg′
  char : arg′

matchOne : arg → arg′ → Bool
matchOne (nat _) nat = true
matchOne (nat _) char = false
matchOne (char _) nat = false
matchOne (char _) char = true

match : List arg → List arg′ → Bool
match [List] [List] = true
match [List] (x :: b) = false
match (x :: a) [List] = false
match (x :: a) (y :: b) = matchOne x y ∧ match a b

printfArgs : List Char → List arg′
printfArgs [List] = [List]
printfArgs ('%' :: [List]) = [List]
printfArgs ('%' :: 'd' :: xs) = nat :: printfArgs xs
printfArgs ('%' :: 'c' :: xs) = char :: printfArgs xs
printfArgs (x   :: xs) = printfArgs xs

printfImpl : {f : List Char → Set} →
             (cos : List Char) → (args : List arg) →
             (match args (printfArgs cos) ≡ true) → List Char
printfImpl [List] [List] refl = [List]
printfImpl [List] (x :: a) ()
printfImpl ('%' :: 'd' :: xs) (nat x :: ls) r = toList (show x) ++ printfImpl xs ls r
printfImpl ('%' :: 'd' :: xs) [List] ()
printfImpl ('%' :: 'd' :: xs) (char x :: ls) ()
printfImpl ('%' :: 'c' :: xs) (char x :: ls) r = (x :: [List]) ++ printfImpl xs ls r
printfImpl ('%' :: 'c' :: xs) [List] ()
printfImpl ('%' :: 'c' :: xs) (nat x :: ls) ()
printfImpl (x :: xs) [List] r = {!!}
printfImpl (x :: xs) (y :: args) r = {!!}

