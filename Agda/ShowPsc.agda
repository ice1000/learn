module ShowPsc where

open import Agda.Builtin.Equality

data Nat : Set where
  zero : Nat
  suc  : Nat -> Nat

thisIsZero : Nat
thisIsZero = suc (suc zero)

plus : Nat -> Nat -> Nat
plus zero m = m
plus (suc n) m = suc (plus n m)

mul : Nat -> Nat -> Nat
mul zero m = zero
mul (suc n) m = plus m (mul n m)

data _<_ : Nat -> Nat -> Set where
  case0 : (n : Nat) -> (zero < suc n)
  case1 : {n m : Nat} -> (n < m) -> (suc n < suc m)

simple : zero < suc zero
simple = case0 zero

simple2 : suc zero < suc (suc zero)
simple2 = case1 (case0 zero)

data False : Set where

simple4 : suc zero < zero -> False
simple4 ()

eq : plus (suc (suc (zero))) (suc zero) ≡ suc (suc (suc zero))
eq = refl

eq-trans : {a b c : Nat} -> a ≡ b -> b ≡ c -> a ≡ c
eq-trans refl refl = refl

sym : {a b : Nat} → a ≡ b → b ≡ a
sym refl = refl

cong : ∀ {ℓ} {A B : Set ℓ} {x y : A} → (f : A → B) → (x ≡ y) → (f x ≡ f y)
cong _ refl = refl

simplex : (n : Nat) -> plus n zero ≡ n
simplex zero = refl
simplex (suc x) = cong suc (simplex x)

simpley : (n m : Nat) -> plus n (suc m) ≡ suc (plus n m)
simpley zero m = refl
simpley (suc n) m = cong suc (simpley n m)

comm : (n m : Nat) -> plus n m ≡ plus m n
comm zero m = sym (simplex m)
comm (suc n) m = eq-trans (cong suc (comm n m)) (sym (simpley m n))

assoc : (a b c : Nat) -> plus a (plus b c) ≡ plus (plus a b) c
assoc zero b c = refl
assoc (suc a) b c = cong suc (assoc a b c)
