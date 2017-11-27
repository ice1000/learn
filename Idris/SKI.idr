module SKI

data SKI : (a : Type) -> Type where
  Ap : SKI (a -> b) -> SKI a -> SKI b
  S  : SKI ((a -> b -> c) -> (a -> b) -> a -> c)
  K  : SKI (a -> b -> a)
  I  : SKI (a -> a)

rev : SKI (a -> (a -> b) -> b)
rev = ?first

