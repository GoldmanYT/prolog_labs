max([], -1e1000).
max([LstHead | LstTail], Result) :-
	max(LstTail, PrevResult),
	Result is max(LstHead, PrevResult).

min([], 1e1000).
min([LstHead | LstTail], Result) :-
	min(LstTail, PrevResult),
	Result is min(LstHead, PrevResult).

sum([], 0).
sum([LstHead | LstTail], Result) :-
	sum(LstTail, PrevResult),
	Result is PrevResult + LstHead.

len([], 0).
len([_ | LstTail], Result) :-
	len(LstTail, PrevResult),
	Result is PrevResult + 1.

mean([], 0) :- !.
mean(Lst, Result) :-
	sum(Lst, Sum), len(Lst, Len),
	Result is Sum / Len.

findMMM3(Lst, Result) :-
	max(Lst, Max), min(Lst, Min), mean(Lst, Mean),
	Result is (Max + Min + Mean) / 3.

removeMMM3([], []).
removeMMM3([], [], _).
removeMMM3(Lst, Result) :-
	findMMM3(Lst, MMM3), removeMMM3(Lst, Result, MMM3).
removeMMM3([LstHead | LstTail], Result, MMM3) :-
	LstHead =:= MMM3, removeMMM3(LstTail, Result, MMM3).
removeMMM3([LstHead | LstTail], [LstHead | Result], MMM3) :-
	LstHead =\= MMM3, removeMMM3(LstTail, Result, MMM3).

?- Lst is [1, 2, 3, 4, 5],
	removeMMM3(Lst, Result),
	write(Result), nl.

?- Lst is [1, 1, 1],
	removeMMM3(Lst, Result),
	write(Result), nl.

?- Lst is [1, 2, 3, 4, 5, 6],
	removeMMM3(Lst, Result),
	write(Result), nl.
