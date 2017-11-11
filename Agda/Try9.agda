module Try9 where

open import Function

infixl 50 _to_
infixl 50 _$$_

postulate _to_ : Set → Set → Set
postulate SKI  : Set → Set
postulate _go_ : ∀ {a b} → a to b
postulate _$$_ : ∀ {a b} → SKI (a to b) → SKI a → SKI b
postulate S    : ∀ {a b c} → SKI ((a to b to c) to (a to b) to a to c)
postulate K    : ∀ {a b} → SKI (a to b to a)
postulate I    : ∀ {a} → SKI (a to a)

true : ∀ {a} → SKI (a to a to a)
true = K $$ I

rev : ∀ {a b} → SKI (a to (a to b) to b)
rev = S $$ (K $$ (S $$ I)) $$ K
