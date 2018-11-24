/* ENEMY -- DYNAMIC PREDICATE */

/* ENEMY -- ATTRIBUTE */
enemy_init :-
	randomize(X,Y), enemy(1, pos(X,Y), weapon(smg, 30)),
	randomize(X,Y), enemy(2, pos(X,Y), weapon(riffle, 25)),
	randomize(X,Y), enemy(3, pos(X,Y), weapon(smg, 30)).
