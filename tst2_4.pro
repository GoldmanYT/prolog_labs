Lst = [a, b, c].

member(X, [X | _]).
member(X, [_, Tail]) :- member(X, Tail).

?- member(a, Lst).