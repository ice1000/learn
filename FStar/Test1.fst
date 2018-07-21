module Test1

type date_unverified =
	| MkDate: y:nat -> m:nat -> d:nat -> date_unverified

// This is a very simple way just to show the syntax
let verify_date (ymd:date_unverified) =
  if ymd.m > 12 then false
  else if ymd.m = 1 || ymd.m = 3 || ymd.m = 5 || ymd.m = 7 || ymd.m = 8 || ymd.m = 10 || ymd.m = 12 then ymd.d <= 31
  else if ymd.m = 4 || ymd.m = 6 || ymd.m = 9 || ymd.m = 11 then ymd.d <= 30
  else if ymd.m = 2 then
		if ymd.y % 4 = 0 && ymd.y % 400 > 0 then ymd.d <= 29
		else ymd.d <= 28
	else true
  
type date = d:date_unverified{verify_date d}

let date_valid: date = MkDate 2000 2 8
let date_valid2: date = MkDate 1926 8 17
let date_valid3: date = MkDate 2001 2 28
// let date_invalid: date = MkDate 2000 2 32
// let date_invalid2: date = MkDate 2000 2 29
