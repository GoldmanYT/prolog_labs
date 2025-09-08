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

