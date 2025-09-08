head(X, List, [X | List]).
?- head(z, [a, b, c], Y),
	write("Y = "),
	write(Y),
	nl.
