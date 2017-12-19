module Issue2869 where

data A : Set where
  a : A
  b : A

fun : (a : A) → (a : A) → A
fun x _ = x

fun₂ = fun a a
fun₃ = fun a b

