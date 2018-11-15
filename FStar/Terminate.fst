module Terminate

open FStar.List.Tot

val zipWith : ('a -> 'b -> 'c) -> list 'a -> list 'b -> Tot (list 'c)
let rec zipWith f a b = match (a, b) with
	| (Nil, _) -> Nil
	| (_, Nil) -> Nil
	| (a :: as, b :: bs) -> f a b :: zipWith f as bs

val plus : nat -> nat -> nat
let plus a b = a + b

// val fib : list nat
// let rec fib = 0 :: 1 :: zipWith plus fib (tail fib)

val test_proof : (n:nat) -> (m:nat) -> Lemma (m + n >= n && m + n >= m)
let test_proof n m = admit()

let test_eq1 = 1 = 2
let test_eq2 = 1 == 2
let test_eq3 = 1 === 2


