module PowISO

import Control.Isomorphism

%default total

pow0 : Iso (Void -> a) ()
pow0 = MkIso (const ()) (const absurd) left right
  where
    left : (x : ()) -> const () x = x
    left () = Refl

    right : (x : Void -> a) -> const absurd () = x
    right f = ?y
