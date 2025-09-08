Lst = [a, b, c].

shift(X, [_, Tail]).

write(Lst).
?- shift(X, Lst),
	write(X), nl,
	write(Lst), nl.