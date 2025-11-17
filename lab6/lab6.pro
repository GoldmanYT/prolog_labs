capital("Russia", "Moscow").
capital("USA", "Washington").
capital("Kazakhstan", "Astana").

writeCapital(Country, Capital) :-
	write(Capital),
	write(" is the capital of "),
	write(Country), nl.

inp(Mode) :-
	Mode = "C",
	read(Country, "Enter a country", s),
	capital(Country, Capital),
	writeCapital(Country, Capital).

inp(Mode) :-
	Mode = "c",
	read(Capital, "Enter the capital", s),
	capital(Country, Capital),
	writeCapital(Country, Capital).

inp(Mode) :-
	Mode = "i",
	read(Country, "Enter a country", s),
	read(Capital, "Enter the capital", s),
	asserta_in(capital(Country, Capital)),
	writeCapital(Country, Capital).

inp(Mode) :-
	Mode = "u",
	read(Country, "Enter a country", s),
	read(NewCapital, "Enter new capital", s),
	capital(Country, OldCapital),
	retract_in(capital(Country, OldCapital)),
	asserta_in(capital(Country, NewCapital)),
	writeCapital(Country, NewCapital).

?- read(Mode, "C - Country, c - capital, i - insert, u - update", s),
	inp(Mode).
