module TotallyFree where

data General (S : Set) (T : S -> Set) (X : Set) : Set where
  !!    : X -> General S T X
  _??_  : (s : S) -> (T s -> General S T X) -> General S T X
infixr 5 _??_

fold : ∀ {l S T X} {Y : Set l} ->
     (X -> Y) -> ((s : S) -> (T s -> Y) -> Y) ->
     General S T X -> Y
fold r c (!! x) = r x
fold r c (s ?? x) = c s (λ z -> fold r c (x z))

_G>=_ :  forall {S T X Y} -> General S T X ->
         (X -> General S T Y) -> General S T Y
g G>= k  = fold k _??_ g
infixl 4 _G>=_
