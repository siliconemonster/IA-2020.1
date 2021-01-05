flatten1([HEAD | TAIL], RES) :-
    flatten1(HEAD, RES1),
	flatten1(TAIL, RES2),
	append(RES1, RES2, RES).
flatten1([], []).
flatten1(HEAD, [HEAD]).