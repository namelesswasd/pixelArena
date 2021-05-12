hsp = 0;
vsp = 0;
grv = 0.4;
walksp = 5;
dashsp = 0;
dash = 0;
hp = 100;
hp_max = 100;
hp_last = hp_max;
holding = "-4";
stance = 0;

sprite_scroll = 0.05;

//inventory
switch(room){
	case room0:
		inv1 = obj_pSword;
		inv2 = obj_pPistol;
		inv3 = obj_pSmg;
	break;
	
	case roomTutorial:
		inv1 = noone;
		inv2 = noone;
		inv3 = noone;
	break;
}


//store ammo
ammo_last_pistol = 10;
ammo_last_smg = 20;

//store kills
global.kills = 0;

//godmode tog
godmode = 0;

//crosshair toggle (this is used so that the ch does not multiply itself to infinity, and thus optimising the game A LOT)
ch_toggle = 0;

//inv ammo
//pistol
global.pistolAmmoInv = 5;

//smg
global.smgAmmoInv = 10;

global.isAlive = 1;

#macro alive (global.isAlive)
