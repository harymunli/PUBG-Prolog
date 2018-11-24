/* MAP -- INCLUDE */
:- include(object).
:- include(player).
:- include(enemy).

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
map_init_plain :- 
	map_height(H), map_width(W),
	matrix_generate('-', H, W, Map), 
	asserta( map_current(Map) ).

map_init :-
	map_init_plain.	