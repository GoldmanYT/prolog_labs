head(X, [X | List]).
?- head(Y, [a, b, c]),
	write("Y = "),
	write(Y),
	nl.
