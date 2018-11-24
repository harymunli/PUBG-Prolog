/* MAP -- INCLUDE */
%:- include(object).
:- include(player).
%:- include(enemy).

/* PLAYER -- STATE PREDICATE*/
:- discontiguous(map_height/1).
:- discontiguous(map_width/1).
:- discontiguous(pos/3).
:- discontiguous(map_show/1).
:- discontiguous(map_init/0).
:- discontiguous(map_init_plain/0).
:- dynamic(pos/3).
:- dynamic(map_current/3).

/* MAP -- SIZE */
map_height(10).
map_width(10).

/* MAP -- SHOW */
map_show(Map) :- 
	map_current(Map),
	matrix_print(Map).

/* MAP -- CREATE */
map_current_row(Row, 0, []) :- !.
map_current_row(Row, Col, [H | T]) :-
	map_width(W),
	Rev is W - Col + 1,
	( player(pos(Row,Rev)) -> H = 'P', fail ;
	  	H = '-'),
	NewCol is Col-1,
	map_current_row(Row,NewCol,T).

map_current(0, Col, []) :- !.
map_current(Row, Col, [H | T]) :-
	map_height(HH),
	RevC is HH - Row + 1,
	map_current_row(RevC, Col, H),
	NewRow is Row-1,
	map_current(NewRow, Col, T).