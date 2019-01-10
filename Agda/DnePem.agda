module DnePem where

data Void : Set where
variable A B : Set

wtf : Void -> A
wtf ()

from :  ({A : Set} -> ((A -> Void) -> Void) -> A)
     -> ({A B : Set} -> (A -> B) -> ((A -> Void) -> B) -> B)
from dne = λ z z₁ → dne (λ z₂ → z₂ (z₁ (λ z₃ → z₂ (z z₃))))

to :  ({A B : Set} -> (A -> B) -> ((A -> Void) -> B) -> B)
   -> ({A : Set} -> ((A -> Void) -> Void) -> A)
to pem = λ avv → pem (λ z → z) (λ av -> wtf (avv av))
