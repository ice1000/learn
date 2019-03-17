module Fib

%access export
%default total

fibAux : Nat -> Nat -> Nat -> Nat
fibAux a b Z = a
fibAux a b (S n) = fibAux b (a + b) n

fib2 : Nat -> Nat
fib2 = fibAux 0 1

fibLin' : Nat -> Nat -> Nat -> Nat
fibLin' Z a b = a
fibLin' (S n) b a = fibLin' n (a + b) b

fibLin : Nat -> Nat
fibLin n = fibLin' n 1 0

lemma : (d : Nat) -> (u : Nat) ->
    fibAux (fib u) (fib (1+u)) d = fib (u+d)
lemma Z u = rewrite plusCommutative u 0 in Refl
lemma (S d) u =
    rewrite plusCommutative u (S d) in
    rewrite plusCommutative (fib u) (fib (S u)) in
    rewrite lemma d (S u) in
    rewrite plusCommutative d u in
    Refl

fibEq : (n : Nat) -> fib2 n = fib n
fibEq n =
  rewrite lemma n 0 in
  rewrite plusCommutative 0 n in
  Refl
