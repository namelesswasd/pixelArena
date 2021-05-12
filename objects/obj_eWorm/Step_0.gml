randomise();

if(instance_exists(obj_player)){
	if (x < obj_player.x) {
			x += 1.5 * global.game_speed;
			if (image_xscale < 0) image_xscale *= -1;
		} else if (x > obj_player.x){
			x -= 1.5 * global.game_speed;
			if (image_xscale > 0) image_xscale *= -1;
		}
}
vsp = (vsp + grv) * global.game_speed;

//v collision
if (place_meeting(x, y + vsp, obj_arena)){
	while (!place_meeting(x, y + sign(vsp), obj_arena)){
		y = y + sign(vsp);	
	}
	vsp = 0;
}

//v movement
y = y + vsp * global.game_speed;

//if mob is below area
if (y >= 600) instance_destroy();

//detect collision with player
if (place_meeting(x, y, obj_player)){
	part_particles_create(global.partSystem, obj_player.x, obj_player.y, global.ptPlayerHit, 6);	
	instance_destroy();	
	obj_player.hp -= 20;
	obj_enemySpawner.waveEnemyCheck++;
	global.combo = 0;
}

//sword collision

if (place_meeting(x, y, obj_pSword) and obj_pSword.damageToggle == 1){
	cooldown++;
	if (cooldown == 1) {
		hp--;
		global.combo++;
		switch(round(random_range(0, 1))){
			case 0: var snd = audio_play_sound(snd_swordHit1, 10, false); break;
			case 1: var snd = audio_play_sound(snd_swordHit2, 10, false); break;
		}
		audio_sound_gain(snd, global.sfxVol / 10, 0);
	}
}

if (place_empty(x, y, obj_pSword)){
	cooldown = 0;	
}



if (hp <= 0 and place_empty(x, y, obj_player)) {//death	
	if(file_exists("settings.ini")){
		ini_open("settings.ini");
		global.kill_count = ini_read_real("Stats", "kill_count", 0);
		global.kill_count++;
		ini_write_real("Stats", "kill_count", global.kill_count);	
	} else global.kill_count++;
	
	global.kills++;
	
	obj_enemySpawner.waveEnemyCheck++;
	
	part_particles_create(global.partSystem, x, y - 10, global.ptDeathEnemy, 1);
	
	var rand = random_range(0, 100);
	
	if(rand <= 30) instance_create_layer(x, y - 20, "timer", obj_pistolAmmo);
	else if (rand >= 80) instance_create_layer(x, y - 20, "timer", obj_smgAmmo);
	instance_destroy(); 
}

//pause
if(obj_camera.is_paused) {
	sprite_scroll = 0;
} else sprite_scroll = 0.05;
image_index += sprite_scroll; 

//hp draw
hp_draw = lerp(hp_draw, hp, 0.15);

hp_perc = hp_draw / hp_max;

//show_debug_message("-eWorm-\nhp: " + string(hp) + "\nhp_draw: " + string(hp_draw) + "\nhp_perc: " + string(hp_perc))

image_speed = 5;