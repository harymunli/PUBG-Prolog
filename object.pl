/* OBJECT -- INCLUDE */
:- include(helper).
:- include(player).

/* STAT */
weapon(smg, 15, 30).			% Weapon
weapon(riffle, 20, 25).			% type -- damage -- ammo
medicine(medicine_lv1, 20).		% Medicine
medicine(medicine_lv2, 40).		% type -- healing point
armor(armor_lv1, 20).			% Armor
armor(armor_lv2, 40).			% type -- armor point
ammo(ammo_smg, 30).				% Ammo
ammo(ammo_riffle, 25).			% type -- ammo point

/* OBJECT -- INIT OCCURENCE */
object_init :-
	% TODO	: What if I wanna 2 smg instead of 1? 
	%		  Randomize amount!
	randomize(X, Y), pos(X, Y, smg, 30),
	randomize(X, Y), pos(X, Y, riffle, 25),
	randomize(X, Y), pos(X, Y, medicine_lv1),
	randomize(X, Y), pos(X, Y, medicine_lv2),
	randomize(X, Y), pos(X, Y, armor_lv1),
	randomize(X, Y), pos(X, Y, armor_lv2),
	randomize(X, Y), pos(X, Y, ammo_smg),
	randomize(X, Y), pos(X, Y, ammo_riffle).