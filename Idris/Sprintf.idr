module Sprintf

%access export
%default total

-- Drammie's implementation

data Format
  = Fmt Char
  | FLit Char

ftype : Char -> Type
ftype 'd' = Integer
ftype 'f' = Double
ftype 'c' = Char
ftype _ = Void

format : (x : Char) -> ftype x -> String
format 'd' = cast
format 'f' = cast
format 'c' = cast
format _ = const ""

parseF : List Char -> List Format
parseF [] = []
parseF ('%' :: '%' :: cs) = FLit '%' :: parseF cs
parseF ('%' ::  c  :: cs) = Fmt c :: parseF cs
parseF ( c  ::  cs) = FLit c :: parseF cs

ptype : List Format -> Type
ptype [] = String
ptype (Fmt x :: xs) = ftype x -> ptype xs
ptype (FLit c :: xs) = ptype xs

printfType : String -> Type
printfType = ptype . parseF . unpack

pworker : (fmt : List Format) -> String -> ptype fmt
pworker [] pref = pref
pworker (Fmt x :: xs) pref = \v => pworker xs (pref ++ format x v)
pworker (FLit c :: xs) pref = pworker xs (pref ++ singleton c)

sprintf : (fmt : String) -> printfType fmt
sprintf fmt = pworker (parseF (unpack fmt)) ""

