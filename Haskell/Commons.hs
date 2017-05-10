module Commons where

data Option e = Some e
              | None
              deriving (Show)
--

nullableToString :: Option String -> String
nullableToString (Some e) = e
nullableToString None     = "null"

-- nullableToString $ Some "2333"
-- "2333"
-- nullableToString $ None
-- "null"

data MyEither l r = MyLeft l
                  | MyRight r
--

eitherToString :: MyEither Int String -> String
eitherToString (MyLeft l) = "Success: " ++ show l
eitherToString (MyRight r) = "Fail: " ++ r

-- eitherToString $ MyLeft 2333
-- "Success: 2333"
-- eitherToString $ MyRight "2333"
-- "Fail: 2333"

-- let f = fmap (*2) (+1)

main = putStrLn ""
