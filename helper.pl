/* HELPER -- INCLUDE */
:- discontiguous(randomize/2).
:- discontiguous(del/3).

map_height(10).
map_width(10).

/* ARITHMATIC */
randomize(X, Y) :-
	map_height(H), map_width(W),
	random_between(1, W, X), 
	random_between(1, H, Y).

/* LIST CONSTRUCTION */
list_generate(X, Len, Result) :- 
    length(Result, Len), 
    maplist(=(X), Result).

matrix_generate(X, Row, Col, Result) :-
	length(Result, Row),
	list_generate(X, Col, List),
	maplist(=(List), Result).


/* LIST MANIPULATION */
del(X, [X | T], T).
del(X, [H | T], [H | T1]) :-
	del(X, T, T1).

/* INPUT/OUTPUT */
list_print([]).
list_print([H | T]) :- 
	write(H), list_print(T).

matrix_print([]).
matrix_print([H | T]) :- 
	list_print(H), nl, 
	matrix_print(T).	

/* TESTING */
tes :-
	map_height(H), map_width(W), 
	matrix_generate('-',H,W,Result),
	matrix_print(Result).