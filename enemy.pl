
:- dynamic(enemy/3).
map_width(10).
map_height(10).
enemy(1, pos(2,2), weapon(smg, 30)).
enemy(2, pos(8,8), weapon(riffle, 25)).
enemy(3, pos(2,8), weapon(smg, 30)).
enemy(4, pos(8,2), weapon(smg, 30)).



%------------------------------%
%%%%% random move x dan y %%%%%%
%------------------------------%

% enemy_random_move/1
% move enemy with id [1..MaxEnemyId] sekaligus
enemy_random_move(0):- !. %basis
enemy_random_move(MaxEnemyId):- %main
	enemy_random_move_x(MaxEnemyId),
	enemy_random_move_y(MaxEnemyId),
	fail.	
enemy_random_move(MaxEnemyId):- 
	I is MaxEnemyId-1,
	enemy_random_move(I).


enemy_random_move_x(ID) :-
%tidak perlu ditambahkan kondisi enemynya hidup karena retract sudah mevalidasi
	map_width(W),
	enemy(ID, pos(OldPosX,_),_),
	OldPosX<W, OldPosX>1,!, %condition
	random(-1, 2, DPosX), % catatan random [-1,2) atau [-1,1]
	NewPosX is OldPosX + DPosX,
	retract( enemy(ID, pos(OldPosX,OldPosY), Weapon) ),
	asserta( enemy(ID, pos(NewPosX,OldPosY), Weapon) ).

enemy_random_move_x(ID) :-
	map_width(W),
	enemy(ID, pos(OldPosX,_),_),
	OldPosX=:=W,!, %condition
	random(-1, 1, DPosX), 
	NewPosX is OldPosX + DPosX,
	retract( enemy(ID, pos(OldPosX,OldPosY), Weapon) ),
	asserta( enemy(ID, pos(NewPosX,OldPosY), Weapon) ).

enemy_random_move_x(ID) :-
	enemy(ID, pos(OldPosX,_),_),
	OldPosX=:=1,!, %condition
	random(0, 2, DPosX), 
	NewPosX is OldPosX + DPosX,
	retract( enemy(ID, pos(OldPosX,OldPosY), Weapon) ),
	asserta( enemy(ID, pos(NewPosX,OldPosY), Weapon) ).

enemy_random_move_y(ID) :-
	map_height(H),
	enemy(ID, pos(_,OldPosY),_),
	OldPosY<H, OldPosY>1,!, %condition
	random(-1, 2, DPosY), % catatan random [-1,2) atau [-1,1]
	NewPosY is OldPosY + DPosY,
	retract( enemy(ID, pos(OldPosX,OldPosY), Weapon) ),
	asserta( enemy(ID, pos(OldPosX,NewPosY), Weapon) ).

enemy_random_move_y(ID) :-
	map_height(H),
	enemy(ID, pos(_,OldPosY),_),
	OldPosY =:= H,!, %condition
	random(-1, 1, DPosY), % catatan random [-1,2) atau [-1,1]
	NewPosY is OldPosY + DPosY,
	retract( enemy(ID, pos(OldPosX,OldPosY), Weapon) ),
	asserta( enemy(ID, pos(OldPosX,NewPosY), Weapon) ).

enemy_random_move_y(ID) :-
	enemy(ID, pos(_,OldPosY),_),
	OldPosY =:= 1,!, %condition
	random(0, 2, DPosY), % catatan random [-1,2) atau [-1,1]
	NewPosY is OldPosY + DPosY,
	retract( enemy(ID, pos(OldPosX,OldPosY), Weapon) ),
	asserta( enemy(ID, pos(OldPosX,NewPosY), Weapon) ).

