module TestImplicit where

data Simple : Set where
  A : Simple
  B : Simple

F : Simple -> Set₁
F A = {A : Set} -> A -> A
F B = (A : Set) -> A -> A

postulate
  f : (a : Simple) -> F a

x : (x : Simple) -> Simple
x A = f A A
x B = f B _ A


