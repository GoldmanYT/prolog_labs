and_(0, 0, 0).
and_(0, 1, 0).
and_(1, 0, 0).
and_(1, 1, 1).

or_(0, 0, 0).
or_(0, 1, 1).
or_(1, 0, 1).
or_(1, 1, 1).

not_(0, 1).
not_(1, 0).

not_and(X1, X2, Y) :- not_(X1, Z1), not_(X2, Z2), and_(Z1, Z2, Y).
not_and_or(X1, X2, X3, X4, Y) :-
	not_and(X1, X2, Z1), not_and(X3, X4, Z2),
	or_(Z1, Z2, Y).

?- not_and_or(X1, X2, X3, X4, Y),
	write(X1), write(" "),
	write(X2), write(" "),
	write(X3), write(" "),
	write(X4), write(" "),
	write(Y), write(nl).