shiftLeft([], []).
shiftLeft([], [Elem], Elem).
shiftLeft([LstHead | LstTail], [LstHead | ResultTail], Elem) :-
	shiftLeft(LstTail, ResultTail, Elem).
shiftLeft([LstHead | LstTail], ResultTail) :-
	shiftLeft(LstTail, ResultTail, LstHead).

?- false, Lst is [a, b, c, d],
	shiftLeft(Lst, Result),
	write(Lst), write(" -> "),
	write(Result), nl.
?- false, Lst is [],
	shiftLeft([], Result),
	write(Lst), write(" -> "),
	write(Result), nl.

shiftLeftN(Lst, 1, Result) :- shiftLeft(Lst, Result).
shiftLeftN(Lst, N, Result) :-
	N > 1, N1 is N - 1,
	shiftLeft(Lst, TempResult),
	shiftLeftN(TempResult, N1, Result).

?- false, Lst is [a, b, c, d],
	shiftLeftN(Lst, 2, Result),
	write(Lst), write(" -> "),
	write(Result), nl.

shiftRight(Lst, Result) :- 
	N is list_length(Lst) - 1,
	shiftLeftN(Lst, N, Result).
shiftRightN(Lst, N, Result) :- 
	N1 is list_length(Lst) - N,
	shiftLeftN(Lst, N1, Result).

?- false, Lst is [a, b, c, d],
	shiftRight(Lst, Result),
	write(Lst), write(" -> "),
	write(Result), nl.

?- Lst is [a, b, c, d, e],
	shiftRightN(Lst, 2, Result),
	write(Lst), write(" -> "),
	write(Result), nl.

