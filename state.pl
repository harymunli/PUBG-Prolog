:- include(player).
:- include(enemy).

state_fail :-
	player(health, HP), 
	HP =< 0, 
	write('You are dead!').

state_goal :-
	enemy_count(0), 
	write('You win!').