module testblah where

data Result (a b : Set) : Set where
  Ok : a → Result a b
  Err : b → Result a b

isomorphism : ∀ {A B C} → Result A (Result B C) → Result (Result A B) C
isomorphism (Ok x) = Ok (Ok x)
isomorphism (Err (Ok x)) = Ok (Err x)
isomorphism (Err (Err x)) = Err x

data Result2 : (a b : Set) → Set where
  Ok : {A : Set} → A → {B : Set} → Result2 A B
  Err : {B : Set} → B → {A : Set} → Result2 A B

isomorphism2 : ∀ {A B C} → Result2 A (Result2 B C) → Result2 (Result2 A B) C
isomorphism2 (Ok x) = Ok (Ok x)
isomorphism2 (Err (Ok x)) = Ok (Err x)
isomorphism2 (Err (Err x)) = Err x

