randomize();

//start
cutsceneEndAlpha = lerp(cutsceneEndAlpha, 0, 0.1);

//camera
smoothness = 10;

x += (xTo - x) / smoothness;
y += (yTo - y) / smoothness;

if (lazerShake == 1 and global.camShake == 1){ //on enemy spawn
	y = lerp(y, y - intensity, 1);	
	lazerShake = 2;
} else if (lazerShake == 2){
	y = lerp(y, y + intensity, 0.1);
	lazerShake = 0;
}

//wave anim
wave_lerp = 0.05;

if(wave_tog == 1){
	wave_scale = lerp(wave_scale, 1.5, wave_lerp);
	wave_text_add_x = lerp(wave_text_add_x, view_wport[0] / 2 - 90, wave_lerp);
	wave_text_add_y = lerp(wave_text_add_y, view_hport[0] / 2 + 200, wave_lerp);
	wave_nr_add_x = lerp(wave_nr_add_x, view_wport[0] / 2 + 90, wave_lerp);
	wave_nr_add_y = lerp(wave_nr_add_y, view_hport[0] / 2 + 250, wave_lerp);
	if(wave_scale >= 1.45) {
		wave_tog = 2;
		wave_alpha = 1;
		obj_enemySpawner.waveVisual++;
	}
}
if(wave_tog == 2){
	wave_alpha = lerp(wave_alpha, 0, wave_lerp);
	wave_flash_scale_w = lerp(wave_flash_scale_w, 50, wave_lerp);
	if(wave_flash_scale_w >= 49.5) wave_tog = 0;
}
if(wave_tog == 0){
	wave_scale = lerp(wave_scale, 1, wave_lerp);
	wave_text_add_x = lerp(wave_text_add_x, 0, wave_lerp);
	wave_text_add_y = lerp(wave_text_add_y, 0, wave_lerp);
	wave_nr_add_x = lerp(wave_nr_add_x, 0, wave_lerp);
	wave_nr_add_y = lerp(wave_nr_add_y, 0, wave_lerp);
	wave_flash_scale_w = 0;
}

//welcome tutorial
if(room == roomTutorial){
	followWelcomeDelay++;
	if(followWelcomeDelay <= 200){
		follow = obj_welcomeTitle;
	} else {
		obj_welcomeTitle.x = 4606;
		obj_welcomeTitle.y = 314;
		if(obj_player.x >= 4287){
			follow = obj_welcomeTitle;
			zoom = lerp(zoom, 1.2, 0.15);
		} else {
			follow = obj_player;
			zoom = lerp(zoom, 1, 0.15);
		}
	}
	if(followWelcomeDelay > 201) followWelcomeDelay = 201;
}

if(follow == obj_welcomeTitle){
	hudMove_hp = 300;
	hudMove_ammo = 300;
	hudMove_wave = 300;
	if(obj_player.y >= 600 && obj_player.y <= 620) instance_create_layer(x, y, "crosshair", obj_blackScreen);
}

dir = point_direction(obj_player.x, obj_player.y, mouse_x, mouse_y);

//pause function
if(is_paused == 0 and keyboard_check_pressed(vk_escape)) is_paused = 1;
else if(is_paused == 1 and keyboard_check_pressed(vk_escape)) is_paused = 0;

if(is_paused){
	zoom = lerp(zoom, 0.8, 0.15);	
	speed = lerp(speed, 10, 0.15);
	direction = 0;
	pausedAlpha = lerp(pausedAlpha, 0.5, 0.15);
	global.game_speed = lerp(global.game_speed, 0, 0.15);
	if(keyboard_check_pressed(vk_backspace)){
		room_goto(roomMenu);	
	}
} else {
	zoom = lerp(zoom, 1, 0.15);	
	speed = lerp(speed, 0, 0.15);
	pausedAlpha = lerp(pausedAlpha, 0, 0.15);
	if(speed_tog == 0)global.game_speed = lerp(global.game_speed, 1, 0.15);
	else {
			if(keyboard_check_pressed(vk_add)) global.game_speed += 0.1;
		if(keyboard_check_pressed(vk_subtract)) global.game_speed -= 0.1;
	}
}

if(!is_paused){
	//bullet camera shake
	if(instance_exists(obj_pPistol)){
		if(obj_player.stance > 1 and mouse_check_button_pressed(mb_left) and global.isReloadingPistol == 0 and global.camShake == 1 and obj_pPistol.cool_pistol == 0){
			bulletShake = 1;
			direction = dir;
		}
	} else if (instance_exists(obj_pSmg)){
		if(obj_player.stance > 1 and mouse_check_button(mb_left) and global.isReloadingSmg == 0 and global.camShake == 1 and obj_pSmg.cool_smg == 0){
			bulletShake = 1;
			direction = dir;
		}
	}

	if(bulletShake == 1){
		speed = lerp(speed, speed + intensity / 3, 1);
		bulletShake = 2;
	}
	else if(bulletShake == 2){
		speed = lerp(speed, speed - intensity / 3, 1);
		bulletShake = 0;
	}
	
	//aiming down sights
	instance_exists(obj_player) if(obj_player.stance > 1 and mouse_check_button(mb_right) and alive){
		zoomBack = 0;
		zoom = lerp(zoom, 1.1, 0.15);
		speed = lerp(speed, 10, 0.15);
		direction = dir;
	} else if (obj_player.stance > 1 and mouse_check_button_released(mb_right) and alive){
		zoomBack = 1;
	}

	if(zoomBack == 1 or obj_player.stance < 2 and alive){
		zoom = lerp(zoom, 1, 0.15);
		speed = lerp(speed, 0, 0.15);
		direction = dir;
	}
}

//hud sway
switch(global.hud_sway_intensity){
	case 0:
		s_int = 1000;
	break;
	case 1:
		s_int = 5;
	break;
	case 2:
		s_int = 1;
	break;
	case 3:
		s_int = 0.5;
	break;
}
hud_sway_h = lerp(hud_sway_h, -obj_player.hsp / s_int, 0.05);
hud_sway_v = lerp(hud_sway_v, -obj_player.vsp / s_int, 0.05);


if (follow != noone){
	xTo = follow.x;
	yTo = follow.y;
}


var vm = matrix_build_lookat(x, y, -10, x, y, 0, 0, 1, 0);
camera_set_view_mat(camera, vm);

//misc
hp_perc = hp_draw / obj_player.hp_max;

hp_draw = lerp(hp_draw, obj_player.hp, 0.15);

//secret
if(keyboard_check_pressed(vk_ralt) and secret_tog == 0) secret_tog = 1;
else if(keyboard_check_pressed(vk_ralt) and secret_tog >= 1) secret_tog = 0;

if(secret_tog == 1){
	keyboard_string = "";
	secret_message = "";
	secret_tog = 2;
}

if(secret_tog == 2){
	secret_message = keyboard_string;	
	
	if(keyboard_check_pressed(vk_enter)){
		switch(secret_message){
			case "godmode":
				if(obj_player.godmode == 0) obj_player.godmode = 1;
				else if(obj_player.godmode == 1) obj_player.godmode = 0;
			break;
			
			case "spawn":
				if(obj_enemySpawner.spawn_tog == 0) obj_enemySpawner.spawn_tog = 1;
				else if(obj_enemySpawner.spawn_tog == 1) obj_enemySpawner.spawn_tog = 0;
			break;
			
			case "bossbar":
				//bossbar anim
				if(bossbar_tog == 0) bossbar_tog = 1;
				else if(bossbar_tog == 1) bossbar_tog = 0;
			break;
			
			case "speed":
				if(speed_tog == 0) speed_tog = 1;
				else if(speed_tog == 1) speed_tog = 0;
			break;
		}
		secret_tog = 0;
	}
	
}

bossbar_anim_speed = 0.05;

if(bossbar_tog == 1){
	bossbar_width = lerp(bossbar_width, 100, bossbar_anim_speed);
	bossbar_alpha = lerp(bossbar_alpha, 1, bossbar_anim_speed);
}
if(bossbar_tog == 0){
	bossbar_width = lerp(bossbar_width, 1, bossbar_anim_speed);
	bossbar_alpha = lerp(bossbar_alpha, 0, bossbar_anim_speed);
}

if(keyboard_check(ord("O"))) bossbar_value -= 0.5;
if(keyboard_check(ord("P"))) bossbar_value += 0.5;

if(bossbar_value >= 100) bossbar_value = 100;
if(bossbar_value <= 0) bossbar_value = 0;

bossbar_health_anim++;
if(bossbar_health_anim >= 120) bossbar_health_anim = 0;

//inventory

if(!is_paused){
	if(keyboard_check_pressed(ord("1")) or
	   keyboard_check_pressed(ord("2")) or
	   keyboard_check_pressed(ord("3"))){
		invToggle = 1;
		invTimer = 0;
	}
}

if (invToggle == 1) {
	animInv = lerp(animInv, view_hport[0] - 23, 0.1); //active
	animInvAlpha = lerp(animInvAlpha, 1, 0.1);
	invTimer++;
	if(invTimer >= 200) invToggle = 0;
} else if (invToggle == 0) {
	invTimer = 0;
	invToggle = 0;
	animInv = lerp(animInv, view_hport[0] + 100, 0.1); //disabled
	animInvAlpha = lerp(animInvAlpha, 0, 0.1);
}

if(!is_paused){
	if (keyboard_check_pressed(ord("1"))){
		selection = 1;
		selectionGUI = 1;
	} else if (keyboard_check_pressed(ord("2"))){
		selection = 2;
		selectionGUI = 2;
	} else if (keyboard_check_pressed(ord("3"))){
		selection = 3;	
		selectionGUI = 3;
	}
}




//metering

interval++;
if(interval >= 60){
	interval = 0;
	
	//fps
	fpsreal = floor(fps_real);
}

//camera zoom
pm = matrix_build_projection_ortho(854 * zoom, 480 * zoom, 1, 10000);
camera_set_proj_mat(camera,pm);

//on player death
if(deathToggle == 0){
	hudMove = lerp(hudMove, 0, 0.05);
}
if(deathToggle == 1){
	zoom = lerp(zoom, 10, 0.005);
	hudMove = lerp(hudMove, 300, 0.05);
	deathToggle = 2;
	alive = 0;
}
if(deathToggle == 2){
	instance_create_layer(0, 0, "hud", obj_blackScreen);
	global.profileMenuToggle = 0;
	deathToggle = 3;
}

//gui start anim
hudMove_text_shake = random_range(-5, 5);

if(hudMove_hp != 0 and hudMove_ammo != 0 and hudMove_wave != 0) hudMove_text_alpha = random_range(0.5, 1);
else hudMove_text_alpha = 1;
if(hudMove_hp != 0) hudMove_hp_alpha = random_range(0.5, 1);
else hudMove_hp_alpha = 1;
if(hudMove_ammo != 0) hudMove_ammo_alpha = random_range(0.5, 1);
else hudMove_ammo_alpha = 1;
if(hudMove_wave != 0) hudMove_wave_alpha = random_range(0.5, 1);
else hudMove_wave_alpha = 1;

if(hudMove_hp_tog){
	hudMove_text = "INITIALIZING HEALTH POINT MODULE.";
	hudMove_hp = lerp(hudMove_hp, 0, 0.15);
} if (hudMove_ammo_tog){
	hudMove_text = "INITIALIZING AMMUNITION MODULE.";
	hudMove_ammo = lerp(hudMove_ammo, 0, 0.15);
} if (hudMove_wave_tog){
	hudMove_text = "INITIALIZING WAVE MODULE.";	
	hudMove_wave = lerp(hudMove_wave, 0, 0.15);
} if (hudMove_init_tog){
	hudMove_text = "INITIALIZATION COMPLETE.";
	hudMove_init_complete = 1;
	hudMove_text_shake = 0;
	hudMove_init_timer++;
	hudMove_text_alpha = 1 / (hudMove_init_timer / 10);
	if(hudMove_init_timer >= 100){
		hudMove_text_tog = 0;
	}
}

if(hudMove_text_tog and gui_text_time <= gui_text_length) {
	gui_text_time+=4;
	gui_text_current = string_copy(gui_text, 0, gui_text_time);
}

//dmg eff
if(global.dmgEffect == 1){
	switch(global.dmgInt){
		case 0:
			dmgEffectAlpha = 0.1;
		break;
		case 1:
			dmgEffectAlpha = 0.2;
		break;
		case 2:
			dmgEffectAlpha = 0.3;
		break;
		case 3:
			dmgEffectAlpha = 0.5;
		break;
}
	global.dmgEffect = 2;
}
if(global.dmgEffect == 2){
	dmgEffectAlpha = lerp(dmgEffectAlpha, 0, 0.15);
	if(dmgEffectAlpha == 0) global.dmgEffect = 0;
}