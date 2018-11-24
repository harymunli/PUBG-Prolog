/* START -- INCLUDE */
:- include(player).

start :-
	write('Title'),nl,
	help,
	player_init, 
	enemy_init, 
	map_init,
	write('Please, insert your command!'), nl.

help :-
	write('Command List'), nl.

quit :-
	write('See you next time!'), nl,
	halt.
	
enemy_init.
map_init.