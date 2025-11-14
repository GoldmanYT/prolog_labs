say(State, Result) :- State = sane, Result = true.
say(State, Result) :- State = insane, Result = false.

myfor() :-
	(HumanState = sane; HumanState = insane),
	myfor(HumanState).
myfor(HumanState) :-
	(HumanType = patient; HumanType = doctor),
	myfor(HumanState, HumanType).
myfor(HumanState, HumanType) :-
	check(HumanState, HumanType).
check(HumanState, HumanType) :-
	say(HumanState, HumanSay),
	(HumanSay = true, HumanType = patient, HumanState = insane;
	 HumanSay = false, not(HumanType = patient, HumanState = insane)),
	write("Human is "), write(HumanState), write(" "), write(HumanType), nl.

?- myfor().
% Expression: I'm insane patient.