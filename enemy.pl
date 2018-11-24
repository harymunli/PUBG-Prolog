/* ENEMY -- INCLUDE */
:- include(helper).

/* ENEMY -- DYNAMIC PREDICATE */
:- dynamic(enemy/3).

/* ENEMY -- ATTRIBUTE */
enemy_init :-
	asserta( enemy(1, pos(2,2), weapon(smg, 30)) 	),
	asserta( enemy(2, pos(8,8), weapon(riffle, 25))	),
	asserta( enemy(3, pos(2,8), weapon(smg, 30))	),
	asserta( enemy(4, pos(8,2), weapon(smg, 30))	).

enemy_movement(List) :-
	List = [n(0,-1),
			e(1,0),
			s(0,1),
			w(-1,0)].

enemy_count(Count) :-
	findall(X, enemy(_, _, _), List),
	length(List, Count).

enemy_move(ID) :-
	enemy(ID, pos(X,Y), _).
