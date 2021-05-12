randomize();

if(alive) image_index = 0;
else image_index = 1;

if((global.isReloadingPistol == 1 or global.isReloadingSmg == 1) and alive) {
	global.isReloadingSmg = 0; 
	global.isReloadingPistol = 0;
	global.outOfAmmoPistol = 0;
	global.outOfAmmoSmg = 0;
}

if(global.game_speed >= 0.1){
	if (obj_player.stance == 1){ //holding anim
		if (mouse_x > obj_player.x){
			x = obj_playerRightHand.x + lengthdir_x(8, image_angle);
			y = obj_playerRightHand.y + lengthdir_y(8, image_angle);
			image_angle = point_direction(x, y, mouse_x, mouse_y);
			if (obj_player.image_xscale > 0 and image_xscale > 0) image_xscale *= -1;
		} else if (mouse_x < obj_player.x){
			x = obj_playerRightHand.x - lengthdir_x(8, image_angle);
			y = obj_playerRightHand.y + lengthdir_y(8, -image_angle);
			image_angle = point_direction(-x, -y, -mouse_x, -mouse_y);
			if (obj_player.image_xscale < 0 and image_xscale < 0) image_xscale *= -1;
		}
	} else {
		instance_destroy();	
	}

	depth = 10;

	if (image_angle <= 310 and image_angle >= 90) image_angle = 310;
	if (image_angle >= 50 and image_angle <= 90) image_angle = 50;

	//attack anim

	if (mouse_check_button_pressed(mb_left) and cool == 0 and alive){
		switch(round(random_range(0, 3))){
			case 0: var snd = audio_play_sound(snd_swordSwing1, 10, false); break;
			case 1: var snd = audio_play_sound(snd_swordSwing2, 10, false); break;
			case 2: var snd = audio_play_sound(snd_swordSwing3, 10, false); break;
			case 3: var snd = audio_play_sound(snd_swordSwing4, 10, false); break;
		}
		audio_sound_gain(snd, global.sfxVol / 10, 0);
		if (mouse_x > obj_player.x){
			animToggle = 1;
		} else if (mouse_x < obj_player.x){
			animToggle = 2;
		}
		cool = 30;
	}

	if(cool > 0) cool--;
	if(cool < 0) cool = 0;
}

show_debug_message("cool: "+string(cool));

if (animToggle == 1){ //right side
	global.animLerp = lerp(global.animLerp, -50, 0.7);
	if (global.animLerp <= -49) animToggle = -1;
} else if (animToggle == -1){
	global.animLerp = lerp(global.animLerp, 0, 0.2);
}

if (animToggle == 2){ //left side
	global.animLerp = lerp(global.animLerp, 50, 0.7);
	if (global.animLerp >= 49) animToggle = -2;
} else if (animToggle == -2){
	global.animLerp = lerp(global.animLerp, 0, 0.2);
}

if(animToggle > 0){
	damageToggle = 1;	
} else if (animToggle < 0){
	damageToggle = 0;	
}

image_angle += global.animLerp;

show_debug_message("animToggle: " + string(animToggle));