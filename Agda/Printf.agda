module Printf where

open import Data.List using (List; _∷_; [])
open import Data.Char renaming (Char to ℂ; show to showℂ)
open import Data.Nat using (ℕ; _+_)
open import Data.Nat.Show renaming (show to showℕ)
open import Data.Empty
open import Relation.Binary.PropositionalEquality using (_≡_; _≢_; refl)
open import Relation.Nullary using (yes; no)
open import Function
open import Codata.Musical.Notation

open import Data.String using (toList; fromList; String; _++_)

data Fmt : Set where
  fmt : ℂ → Fmt
  lit : ℂ → Fmt

ftype : ℂ → Set
ftype 'd' = ℕ
ftype 'c' = ℂ
ftype 's' = String
ftype _ = ⊥

format : (c : ℂ) → ftype c → String
format 'd' = showℕ
format 'c' c = fromList $ c ∷ []
format 's' = id
format _ = const ""

-- parseF : List ℂ → List Fmt
-- parseF [] = []
-- parseF (x ∷ xs) with xs | x ≟ '%'
-- ...         | '%' ∷ xss | yes _ = lit '%' ∷ parseF xss
-- ...         |  c  ∷ xss | yes _ = fmt c ∷ parseF xss
-- ...         | [] | yes _ = lit '%' ∷ []
-- ...         | _  | no  _ = lit x ∷ parseF xs

parseF : List ℂ → List Fmt
parseF [] = []
parseF ('%' ∷ '%' ∷ cs) = lit '%' ∷ parseF cs
parseF ('%' ∷  c  ∷ cs) = fmt c ∷ parseF cs
parseF ( c  ∷  cs) = lit c ∷ parseF cs

ptype : List Fmt → Set
ptype [] = String
ptype (fmt x ∷ xs) = ftype x → ptype xs
ptype (lit x ∷ xs) = ptype xs

printfType : String → Set
printfType = ptype ∘ parseF ∘ toList

printfImpl : (fmt : List Fmt) → String → ptype fmt
printfImpl [] pref = pref
printfImpl (fmt x ∷ xs) pref val = printfImpl xs $ pref ++ format x val
printfImpl (lit x ∷ xs) pref = printfImpl xs $ pref ++ (fromList $ x ∷ [])

printf : (fmt : String) → printfType fmt
printf s = printfImpl (parseF $ toList s) ""

proof₀ : printf "Hello, World!"
              ≡ "Hello, World!"
proof₀ = refl

proof₁ : printf "%% %% (%d + %d = %d) (toChar %d = %c)" 114 514 628 6 '6'
              ≡ "% % (114 + 514 = 628) (toChar 6 = 6)"
proof₁ = refl

proof₂ : printf "%d岁，是%s" 24 "学生"
              ≡ "24岁，是学生"
proof₂ = refl

-- proof₃ : printf "%d岁，是%s" 25 "学生"
--               ≢ "24岁，是学生"
-- proof₃ ()
