/* START -- INCLUDE */
%:- include(player).
%:- include(enemy).
%:- include(object).
%:- include(map).

start :-
	write('Title'),nl,
	help,
	player_init, 
	enemy_init, 
	object_init,
	map_init,
	write('Please, insert your command!'), nl.

help :-
	write('Command List'), nl.

quit :-
	write('See you next time!'), nl,
	halt.
