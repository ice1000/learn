module Test

data Square : Nat -> Type where
  Sq : (m : Nat) -> Square (m * m)

root : {n : Nat} -> Square n -> Nat
root {n = m * m} (Sq m) = m

