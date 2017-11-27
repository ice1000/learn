module SKI where

data SKI : (a : Set) → Set₁ where
  Ap : ∀ {a b} → SKI (a → b) → SKI a → SKI b
  S  : ∀ {a b c} → SKI ((a → b → c) → (a → b) → a → c)
  K  : ∀ {a b} → SKI (a → b → a)
  I  : ∀ {a} → SKI (a → a)

rev : ∀ {a b} → SKI (a → (a → b) → b)
rev = Ap (Ap S (Ap K (Ap S I))) K

comp : ∀ {a b c} → SKI ((b → c) → (a → b) → (a → c))
comp = Ap (Ap S (Ap K S)) K

flip′ : ∀ {a b c} → SKI ((a → b → c) → (b → a → c))
flip′ = {!!}

rotr : ∀ {a b c} → SKI (a → (c → a → b) → c → b)
rotr = {!-t 300!}

rotv : ∀ {a b c} → SKI (a → b → (a → b → c) → c)
rotv = {!-t 300!}

join : ∀ {a b} → SKI ((a → a → b) → a → b)
join = Ap (Ap S S) (Ap S K)

Bool′ : ∀ A → Set
Bool′ A = A → A → A

true : ∀ {A} → SKI (Bool′ A)
true = Ap I K

false : ∀ {A} → SKI (Bool′ A)
false = Ap K I

not′ : ∀ {A} → SKI (Bool′ (Bool′ A) → Bool′ A)
not′ = Ap K K

and′ : ∀ {A} → SKI (Bool′ (Bool′ A) → Bool′ A → Bool′ A)
and′ = Ap S (Ap I K)

or′ : ∀ {A} → SKI (Bool′ (Bool′ A) → Bool′ A → Bool′ A)
or′ = Ap S K

xor′ : ∀ {A} → SKI (Bool′ (Bool′ A → Bool′ A) → Bool′ A → Bool′ A)
xor′ = Ap K I
