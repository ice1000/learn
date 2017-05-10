valid([])
valid([Head|Tail]) :-
	fd_all_different(Head),
	valid(Tail).

sudoku(Puzzle, Solution) :-
	Solution = Puzzle
	
	Puzzle = [P00, P01, P02, P03,
	          P10, P11, P12, P13,
		  P20, P21, P22, P23,
		  P30, P31, P32, P33],

	fd_domain(Solution, 1, 4),

	R1 = [P00, P01, P02, P03],
	R2 = [P10, P11, P12, P13],
	R3 = [P20, P21, P22, P23],
	R4 = [P30, P31, P32, P33],

	C1 = [P00, P10, P20, P30],
	C2 = [P01, P11, P21, P31],
	C3 = [P02, P12, P22, P32],
	C4 = [P03, P13, P23, P33],

	S1 = [P00, P01, P10, P11],
	S2 = [P02, P03, P12, P13],
	S3 = [P20, P21, P30, P31],
	S4 = [P22, P23, P32, P33],

	valid([R1, R2, R3, R4, C1, C2, C3, C4, S1, S2, S3, S4]).