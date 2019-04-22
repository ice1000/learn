module TeachRed

import Data.Vect

appendLast : Vect a n -> n -> Vect (S a) n
appendLast [] x = x :: []
appendLast (y :: xs) x = y :: appendLast xs x

reverse_vect : Vect a n -> Vect a n
reverse_vect [] = []
reverse_vect (x :: xs) = appendLast (reverse_vect xs) x

popPush : (x: t) -> (ys: Vect n2 t) -> (xs: Vect n1 t) -> xs ++ x :: ys = (appendLast xs x) ++ ys
popPush x ys [] = Refl
popPush x ys (y :: xs) = rewrite popPush x ys xs in Refl

lemma2 : (x: t) -> (ys: Vect n2 t) -> (xs: Vect n1 t) -> (reverse_vect xs) ++ x :: ys = reverse_vect (x :: xs) ++ ys
lemma2 x ys xs = rewrite popPush x ys (reverse_vect xs) in Refl
