vsp += grv;
//v collision
if (place_meeting(x, y + vsp, obj_arena)){
	while (!place_meeting(x, y + sign(vsp), obj_arena)){
		y = y + sign(vsp);	
	}
	vsp = 0;
}
if (place_meeting(x, y + vsp, obj_pistolAmmo)){
	while (!place_meeting(x, y + sign(vsp), obj_pistolAmmo)){
		y = y + sign(vsp);	
	}
	vsp = 0;
}

//v movement
y = y + vsp * global.game_speed;


if(place_meeting(x, y, obj_player)){
	global.smgAmmoInv += 10;
	instance_destroy();
}

part_particles_create(global.partSystem, random_range(x - sprite_width / 2 + 2, x + sprite_width / 2 - 2), y, global.partAmmoCrate, 1);


