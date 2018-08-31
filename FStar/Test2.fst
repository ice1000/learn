module Test2

// open FStar.ST

// val is_true : bool -> Tot bool
// let is_true = id

// val new_counter: int -> St (unit -> St int)
// let new_counter init =
//   let c = ST.alloc init in
//   fun () -> c := !c + 1; !c

val max : nat -> nat -> nat
let max a b = if a > b then a else b

let _ = assert (max 2 3 = 3)
// let _ = assert (max 4 3 = 3)

let _ = assert (forall a b. max a b >= a
							 && max a b >= b)

