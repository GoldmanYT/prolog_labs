tree(
	14,
	tree(
		8,
		tree(
			4,
			tree(2, void, void),
			tree(6, void, void)
		),
		tree(
			10,
			void,
			tree(12, void, void)
		)
	),
	tree(
		16,
		void,
		tree(18, void, void)
	)
).

find(Target, tree(Target, _, _)) :- !.
find(Target, tree(Elem, Left, Right)) :- 
	Target < Elem, find(Target, Left), !;
	Target > Elem, find(Target, Right).

add(Target, Tree, Tree) :- find(Target, Tree), !.
add(Target, void, tree(Target, void, void)) :- !.
add(Target, tree(Elem, Left, Right), tree(Elem, ResLeft, Right)) :-
	Target < Elem, add(Target, Left, ResLeft), !.
add(Target, tree(Elem, Left, Right), tree(Elem, Left, ResRight)) :-
	Target > Elem, add(Target, Right, ResRight), !.

delete(Target, Tree, Tree) :- not(find(Target, Tree)), !.
delete(Target, tree(Elem, Left, Right), tree(Elem, ResLeft, Right)) :-
	Target < Elem, delete(Target, Left, ResLeft), !.
delete(Target, tree(Elem, Left, Right), tree(Elem, Left, ResRight)) :-
	Target > Elem, delete(Target, Right, ResRight), !.
delete(Target, tree(Target, void, Right), Right) :- !.
delete(Target, tree(Target, tree(LeftElem, LeftLeft, LeftRight), Right), tree(LeftElem, ResLeft, Right)) :-
	delete(LeftElem, tree(LeftElem, LeftLeft, LeftRight), ResLeft).

?- tree(Elem, Left, Right),
	find(4, tree(Elem, Left, Right)),
	write("1. 4 was found"), nl.

?- tree(Elem, Left, Right),
	find(5, tree(Elem, Left, Right)),
	write("2. 5 was found"), nl.

?- tree(Elem, Left, Right),
	add(5, tree(Elem, Left, Right), NewTree),
	find(5, NewTree),
	write("3. 5 was added"), nl.

?- tree(Elem, Left, Right),
	delete(14, tree(Elem, Left, Right), NewTree),
	not(find(14, NewTree)),
	write("4. 14 was deleted"), nl.
