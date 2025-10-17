find(Target, Tree) :-
	Tree =.. [_, Elem, Left, Right],
	(
		Target =:= Elem;
		Target < Elem, find(Target, Left);
		Target > Elem, find(Target, Right)
	).

?- Tree is tree(
	7,
	tree(
		4,
		tree(
			2,
			tree(1, void, void),
			tree(3, void, void)
		),
		tree(
			5,
			void,
			tree(6, void, void)
		)
	),
	tree(
		8,
		void,
		tree(9, void, void)
	)
),
	find(5, Tree).
