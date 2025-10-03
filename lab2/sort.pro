findMax([Elem], Elem).
findMax([LstHead | LstTail], Max) :-
	findMax(LstTail, PrevMax),
	Max is max(PrevMax, LstHead).

removeElem([Elem | LstTail], Elem, LstTail).
removeElem([LstHead | LstTail], Elem, [LstHead | ResultTail]) :-
	removeElem(LstTail, Elem, ResultTail).	

sort([], _).
sort(Lst, [Max | Result]) :- 
	findMax(Lst, Max), 
	removeElem(Lst, Max, Lst2), 
	sort(Lst2, Result).

?- sort([5, 1, 4, 23, 9, 1], Result),
	write(Result), nl.