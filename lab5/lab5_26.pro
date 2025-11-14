say(State, Type, Result) :- State = sane, Type = human, Result = true.
say(State, Type, Result) :- State = sane, Type = vampire, Result = false.
say(State, Type, Result) :- State = insane, Type = human, Result = false.
say(State, Type, Result) :- State = insane, Type = vampire, Result = true.

myfor() :-
	(MichaelState = sane; MichaelState = insane),
	myfor(MichaelState).
myfor(MichaelState) :-
	(MichaelType = human; MichaelType = vampire),
	myfor(MichaelState, MichaelType).
myfor(MichaelState, MichaelType) :-
	(PeterState = sane; PeterState = insane),
	myfor(MichaelState, MichaelType, PeterState).
myfor(MichaelState, MichaelType, PeterState) :-
	(PeterType = human; PeterType = vampire),
	myfor(MichaelState, MichaelType, PeterState, PeterType).
myfor(MichaelState, MichaelType, PeterState, PeterType) :-
	check(MichaelState, MichaelType, PeterState, PeterType).
check(MichaelState, MichaelType, PeterState, PeterType) :-
	say(MichaelState, MichaelType, MichaelSay),
	say(PeterState, PeterType, PeterSay),
	(MichaelSay = true, MichaelType = vampire;
	 MichaelSay = false, not(MichaelType = vampire)),
	(PeterSay = true, PeterType = human;
	 PeterSay = false, not(PeterType = human)),
	(MichaelSay = true, MichaelState = PeterState;
	 MichaelSay = false, not(MichaelState = PeterState)),
	write("Michael is "), write(MichaelState), write(" "), write(MichaelType), nl,
	write("Peter is "), write(PeterState), write(" "), write(PeterType), nl.

?- myfor().