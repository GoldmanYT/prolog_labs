volumeOfFourAnglePyramid(Side, Height, Result) :-
	Result is 1 / 3 * Side ** 2 * Height.

?- 0, volumeOfFourAnglePyramid(10, 6, Result),
	write(Result), nl.

op(400, yfx, parent).

grandfather parent father parent son.

?- grandfather parent father parent son.