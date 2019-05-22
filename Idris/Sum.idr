module Sum

%access public export
%default total

sumSimple : (Nat -> Nat) -> Nat -> Nat
sumSimple _ Z = Z
sumSimple f (S n) = f (S n) + sumSimple f n

sumAux : Nat -> (Nat -> Nat) -> Nat -> Nat
sumAux acc _ Z = acc
sumAux acc f (S n) = sumAux (f (S n) + acc) f n

sumTail : (Nat -> Nat) -> Nat -> Nat
sumTail = sumAux 0

%access export
%default total

myCong : (f : a -> b) -> {x : a} -> {y : a} -> x = y -> f x = f y
myCong _ p = rewrite p in Refl

sumEq : (f : Nat -> Nat) -> (n : Nat) -> sumTail f n = sumSimple f n
sumEq f Z = Refl
sumEq f (S k) =
  rewrite plusCommutative (f (S k)) 0 in
  myCong (plus (f $ S k)) ?write_a_proof_4
