module ShowGrosh where

open import Agda.Builtin.Equality

test : (A : Set) -> A -> A
test A a = a

test2 : (A B : Set) -> (A -> B) -> A -> B
test2 A B f a = f a

testEq : (A : Set) -> (a : A) -> a ≡ a
testEq A a = refl

sym : (A : Set) -> (a b : A) -> a ≡ b -> b ≡ a
sym A a .a refl = refl

trans : {A : Set} -> {a b c : A} -> a ≡ b -> b ≡ c -> a ≡ c
trans refl q = q

cong : {A B : Set} -> (f : A -> B) -> {a b : A} -> a ≡ b -> f a ≡ f b
cong f refl = refl

data Nat : Set where
  zero : Nat
  succ : Nat -> Nat

_+_ : Nat -> Nat -> Nat
zero + b = b
succ a + b = succ (a + b)

lemma1 : ∀ b → (zero + b) ≡ (b + zero)
lemma1 zero = refl
lemma1 (succ a) = cong succ (lemma1 a)

lemma2 : ∀ a b → succ (b + a) ≡ (b + succ a)
lemma2 a zero = refl
lemma2 a (succ b) = cong succ (lemma2 a b)

comm : (a b : Nat) -> a + b ≡ b + a
comm zero b = lemma1 b
comm (succ a) b = trans (cong succ (comm a b)) (lemma2 a b)

data Int : Set where
  pos-suc : Nat -> Int
  neg-suc : Nat -> Int
  oo-zero : Int

_-_ : Nat -> Nat -> Int
zero - zero = oo-zero
zero - succ b = neg-suc b
succ a - zero = pos-suc a
succ a - succ b = a - b

succInt : Int -> Int
succInt (pos-suc x) = pos-suc (succ x)
succInt (neg-suc zero) = oo-zero
succInt (neg-suc (succ x)) = neg-suc x
succInt oo-zero = pos-suc zero

predInt : Int -> Int
predInt (pos-suc zero) = oo-zero
predInt (pos-suc (succ x)) = pos-suc x
predInt (neg-suc x) = neg-suc (succ x)
predInt oo-zero = neg-suc zero

_+Int_ : Int -> Int -> Int
-- pos-suc zero +Int b = succInt b
-- pos-suc (succ x) +Int b = succInt (pos-suc x +Int b)
-- neg-suc zero +Int b = predInt b
-- neg-suc (succ x) +Int b = predInt (neg-suc x +Int b)
-- oo-zero +Int b = b
pos-suc x +Int pos-suc y = pos-suc (succ (x + y))
pos-suc x +Int neg-suc y = x - y
neg-suc x +Int pos-suc y = y - x
neg-suc x +Int neg-suc y = neg-suc (succ (x + y))
x +Int oo-zero = x
oo-zero +Int y = y

