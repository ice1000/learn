module CreatePhoneNumber where

createPhoneNumber :: [Int] -> String
createPhoneNumber ls = let [a, b, c, d, e, f, g, h, i, j] = show <$> ls in
  "(" ++ a ++ b ++ c ++ ") " ++ d ++ e ++ f ++ "-" ++ g ++ h ++ i ++ j
--

    
