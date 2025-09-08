head(X, [X | List]).
?- List=[a,s,d], head(X, List),
	write("X = "),
	write(X),	
	nl,
	write("List = "),
	write(List),
	nl.