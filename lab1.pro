parent(german, anatoliy).
parent(nikolay, zinaida).
parent(anatoliy, natalia).
parent(zinaida, natalia).
parent(natalia, daniil).
parent(andrey, daniil).

man(german).
man(nikolay).
man(anatoliy).
man(andrey).
man(daniil).
woman(zinaida).
woman(natalia).

maried(zinaida, anatoliy).
maried(natalia, andrey).

mother(X, Y) :- parent(X, Y), woman(X).
father(X, Y) :- parent(X, Y), man(X).
daughter(X, Y) :- parent(Y, X), woman(X).
son(X, Y) :- parent(Y, X), man(X).
grandmother(X, Y) :- parent(X, Z), parent(Z, Y), woman(X).
grandfather(X, Y) :- parent(X, Z), parent(Z, Y), man(X).
sister(X, Y) :- parent(Z, X), parent(Z, Y), woman(X).
brother(X, Y) :- parent(Z, X), parent(Z, Y), man(X).
uncle(X, Y) :- brother(X, Z), parent(Z, Y).
aunt(X, Y) :- sister(X, Z), parent(Z, Y).
nephew(X, Y) :- (brother(Z, Y); sister(Z, Y)), parent(Z, X), man(X).
niece(X, Y) :- (brother(Z, Y); sister(Z, Y)), parent(Z, X), woman(X).

% ?- mother(zinaida, natalia).

and_(0, 0, 0).
and_(0, 1, 0).
and_(0, 0, 0).
and_(1, 1, 1).

or_(0, 0, 0).
or_(0, 1, 1).
or_(1, 0, 1).
or_(1, 1, 1).

not_(0, 1).
not_(1, 0).

f(X1, X2, X3, X4, Y) :- not_(X1, Z1), not_(X2, Z2), not_(X3, Z3), not_(X4, Z4), and_(Z1, Z2, W1), and_(Z3, Z4, W2), or_(W1, W2, Y).

?- f(0, 1, 1, 0, X).
