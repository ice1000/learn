module BisiNat

%default total
%access export

public export
codata Conat : Type where
  Coz : Conat
  Cos : Conat -> Conat

public export
codata Bisimulation : Conat -> Conat -> Type where
  Biz : Bisimulation Coz Coz
  Bis : {a : Conat} -> {b : Conat} ->
        (Bisimulation a b) ->
        (Bisimulation (Cos a) (Cos b))

Co1 : Conat
Co1 = Cos Coz

Co2 : Conat
Co2 = Cos Co1

public export
MuGen : Conat
MuGen = Cos MuGen

public export
MuGenSucc : Bisimulation (Cos MuGen) MuGen
MuGenSucc = Bis MuGenSucc

public export
Add : Conat -> Conat -> Conat
Add Coz b = b
Add (Cos a) b = Cos $ Add b a

public export
Trans : (b : Conat) -> Bisimulation a b -> Bisimulation b c -> Bisimulation a c
Trans Coz Biz Biz = Biz
Trans (Cos x) (Bis a) (Bis b) = Bis (Trans x a b)

public export
Reflx : (n : Conat) -> Bisimulation n n
Reflx Coz = Biz
Reflx (Cos x) = Bis (Reflx x)

public export
AddN : (n : Conat) -> Bisimulation a b -> Bisimulation (Add a n) (Add b n)
AddN Coz Biz = Biz
AddN Coz (Bis x) = Bis x
AddN (Cos x) Biz = Bis (Reflx x)
AddN (Cos x) (Bis y) = Bis (Bis (AddN x y))

public export
Lemma0 : Bisimulation (Add (Cos MuGen) MuGen) (Add MuGen MuGen)
Lemma0 = AddN MuGen MuGenSucc

-- public export
-- Lemma1 : Bisimulation MuGen (Add (Cos MuGen) MuGen)
-- public export
-- MuGenAdd : Bisimulation MuGen (Add MuGen MuGen)
-- Lemma1 = Bis MuGenAdd
-- MuGenAdd = Trans Lemma1 Lemma0

