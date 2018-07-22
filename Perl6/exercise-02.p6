use v6;
use strict;

subset Odd of Int where !(* %% 2);
subset Even of Int where (* %% 2);

multi sub isOdd(Odd) returns Bool { True; }
multi sub isOdd(Even) returns Bool { False; }
multi sub isOdd($) returns Str { "WTF"; }

for 0..10 {
		say isOdd($_);
}

isOdd("1233").say;
