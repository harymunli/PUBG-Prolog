/* OBJECT -- INCLUDE */
:- include(helper).
:- include(player).

/* STAT */
weapon(smg, 15, 30).			% Weapon
weapon(riffle, 20, 25).			% type -- damage -- ammo
medicine(medicine_lv1, 20).		% Medicine
medicine(medicine_lv2, 40).		% type -- heal
armor(armor_lv1, 20).			% Armor
armor(armor_lv2, 40).			% type -- armor
ammo(ammo_smg, 30).				% Ammo
ammo(ammo_riffle, 25).			% type -- ammo

/* OBJECT -- INIT OCCURENCE */
