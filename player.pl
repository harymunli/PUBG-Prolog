/* PLAYER -- INCLUDE */
:- include(map).
:- include(helper).
:- include(move).
%:- include(object).

/* PLAYER -- STATE PREDICATE*/
:- discontiguous(player/2).
:- discontiguous(player/3).
:- discontiguous(player_init/3).
:- dynamic(player/2).
:- dynamic(player/3).

/* ================================================================ */
/* ================================================================ */
/* ================================================================ */
/* PLAYER -- INIT ATTRIBUTE*/
player_init :- % Initialize player's attribute & position!
	randomize(X,Y), 
	asserta( player(pos,X,Y) ),		  % P's at <X,Y>
	asserta( player(health,100) ),	  % P's health == 100
	asserta( player(armor,0) ),		  % P's armor == 0
	asserta( player(move_count,0) ),  % P has been moved 0 times
	asserta( player(inventory,[],3) ),% P's limit inventory is 3
	asserta( player(equip,hand, 0) ). % P's equipped weapon is hand

/* PLAYER -- MODIFY ATTRIBUTE */
player_modify(Attrib, Change):-
	/*	use		: player_modify(health,-20)
		effect	: player(health,100) --> player(health,80) */		
	player(Attrib,Current),
	New is Current + Change,
	retract(player(Attrib,Current)),
	asserta(player(Attrib,New)).	

player_move(ChangeX, ChangeY):-
	/* 	use		: player_move(1,-1)
		effect	: player(pos,5,5) --> player(pos,6,4) */
	player(pos, OldX, OldY),
	NewX is OldX + ChangeX,
	NewY is OldY + ChangeY,
	retract(player(pos, OldX, OldY)),
	asserta(player(pos, NewX, NewY)).	

/* PLAYER -- STATUS */
status :- % Show current player status!
	player(health, HP),
	player(armor, AP),
	player(equip, EqWeapon, Ammo),
	write('Health : '), write(HP), nl,
	write('Armor  : '), write(AP), nl,
	write('Weapon : '), write(EqWeapon), nl, 
	write('Ammo   : '), write(Ammo),nl.	