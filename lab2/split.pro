split([], [], []).
split([LstHead | LstTail], [LstHead | LstNumTail], LstAtom) :-
	number(LstHead), split(LstTail, LstNumTail, LstAtom).
split([LstHead | LstTail], LstNum, [LstHead | LstAtomTail]) :-
	atom(LstHead), split(LstTail, LstNum, LstAtomTail).

?- Lst is [atom1, atom2, 3, 4, atom5, 10],
	split(Lst, LstNum, LstAtom),
	write("Lst: "), write(Lst), nl,
	write("LstNum: "), write(LstNum), nl,
	write("LstAtom: "), write(LstAtom), nl.