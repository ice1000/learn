||| In this Kata you'll learn Bisimulation
module Bisi

%default total
%access export

infixr 10 :=:
||| This is the definition of Bisimulation: the inductive parts should
||| equivalent, and the coinductive parts should bisimulate.
||| With Cubical Model we can prove that Bisimulation is an equivlance,
||| aka Coinductive Proof Principle.
||| However, you don't have Cubical Model in Idris :(
public export
codata Bisimulation : (x : Stream a) -> (y : Stream a) -> Type where
  (:=:) : {x : Stream a} -> {y : Stream a} ->
          (head x = head y) ->
          (Bisimulation (tail x) (tail y)) ->
          (Bisimulation x y)

||| Example: consider an infinite list of ones
Ones : Stream Nat
Ones = 1 :: Ones

||| We can prove that ones bisimulates ones, which is an identity
onesBisimulation : Bisimulation Ones Ones
onesBisimulation = Refl :=: onesBisimulation

-- Now let's do the exercise: we want functions to extract the
-- elements at odd/even indices of the input stream.

||| Sensei's (teacher) turn, odd:
public export
Odd : Stream a -> Stream a
Odd l = head (tail l) :: Odd (tail (tail l))

||| Gakusei's (student) turn, even:
public export
Even : Stream a -> Stream a
Even l = head l :: Even (tail (tail l))

||| Gakusei's turn again, merge two streams:
public export
Merge : Stream a -> Stream a -> Stream a
Merge a b = head a :: head b :: Merge (tail a) (tail b)

||| Final exam, open book: prove that `\x -> merge (even x) (odd x)` is a
||| Bisimulation:
public export
MergeOddEvenIsBisimulation : (x : Stream a) -> Bisimulation (Merge (Even x) (Odd x)) x
MergeOddEvenIsBisimulation x = Refl :=: Refl :=: MergeOddEvenIsBisimulation (tail (tail x))
