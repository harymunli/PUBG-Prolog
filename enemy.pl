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

