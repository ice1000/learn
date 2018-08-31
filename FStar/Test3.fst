module Test3

type result (a:Type) (b:Type) =
  | Ok  : a -> result a b
  | Err : b -> result a b

val isomorphism : result 'a (result 'b 'c) -> result (result 'a 'b) 'c
let isomorphism x =
	match x with
	| Ok       x  -> Ok (Ok x)
	| Err (Ok  x) -> Ok (Err x)
	| Err (Err x) -> Err x

// val isomorphism_good : result 'a (result 'b 'c) -> result (result 'a 'b) 'c
// let isomorphism_good x =
// 	match x with
// 	| Ok       x  -> Ok (Ok x)
// 	| Err (Ok  x) -> Ok (Err x)
// 	| Err x -> x
