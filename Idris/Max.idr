module Max

mx : Nat -> Nat -> Nat
mx Z n = n
mx n Z = n
mx (S a) (S b) = S $ mx a b

iRejectMyHumanity : (n : Nat) -> mx Z n = n
iRejectMyHumanity n = Refl
