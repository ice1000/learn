module RevRevId

-- With this definitoin, Idris deduces better
rev : List x -> List x
rev [] = []
rev (y :: xs) = rev xs ++ [y]

revA : (a : List x) -> (b : x) -> rev (a ++ [b]) = b :: rev a
revA [] _ = Refl
revA (x :: xs) b = rewrite revA xs b in Refl

revrevid : (a : List x) -> (rev (rev a)) = a
revrevid [] = Refl
revrevid (x :: xs) = rewrite revA (rev xs) x in
                     rewrite revrevid xs in Refl
