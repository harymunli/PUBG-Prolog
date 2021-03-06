/* PLAYER -- MOVEMENT */
:- discontiguous(n/0).
:- discontiguous(e/0).
:- discontiguous(s/0).
:- discontiguous(w/0).

map_height(10). 
map_width(10).

n :-
	player(pos, _, Y), 
	Y > 1,
	player_move(0,-1), 
	player_modify(move_count,1).

e :-
	player(pos, X, _), 
	map_width(W),
	X < W,
	player_move(1,0), 
	player_modify(move_count,1).

s :-
	player(pos, _, Y), 
	map_height(H),
	Y < H,
	player_move(0,1), 
	player_modify(move_count,1).

w :-
	player(pos, X, _), 
	X > 1,
	player_move(-1,0), 
	player_modify(move_count,1).