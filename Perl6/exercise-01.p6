use v6;
use strict;

class Ice1k {
		has Int $.loli;
}

say Ice1k.new(loli => 233).loli;

subset Single of Int where * < 10;
my Single $s = 9;

subset Odd of Int where !(* %% 2);

multi sub isOdd(Odd) returns Bool { True; }
multi sub isOdd($) returns Bool { False; }

say isOdd(2);
say isOdd(1);
