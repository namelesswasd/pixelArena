if(alive)image_index = 0;
else image_index = 1;

if(global.game_speed >= 0.1){
	if (obj_player.stance == 3){ //holding anim
		if(image_yscale > 0) image_yscale = -1;
		if (mouse_x < obj_player.x ){
			x = obj_playerRightHandStr.x + lengthdir_x(8, image_angle);
			y = obj_playerRightHandStr.y + lengthdir_y(8, image_angle);
			image_angle = point_direction(x, y, mouse_x, mouse_y);
			image_angle += 10;
			if (obj_player.image_xscale < 0 and image_xscale < 0) image_xscale *= -1;
		} else if (mouse_x > obj_player.x ){
			x = obj_playerRightHandStr.x - lengthdir_x(8, image_angle);
			y = obj_playerRightHandStr.y + lengthdir_y(8, -image_angle);
			image_angle = point_direction(-x, -y, -mouse_x, -mouse_y);
			image_angle -= 10;
			if (obj_player.image_xscale > 0 and image_xscale > 0) image_xscale *= -1;
		}
	} else {
		instance_destroy();	
	}
	
	//shooting
	if(global.isReloadingSmg == 0 and alive and obj_camera.hudMove <= 50){
		if(mouse_check_button(mb_left) and cool_smg == 0){
			var snd = audio_play_sound(snd_smgShoot, 10, false);
			audio_sound_gain(snd, global.sfxVol / 10, 0);
			ammo_smg -= 1;
			if(mouse_x < obj_player.x){
				instance_create_layer(obj_pSmg.x - lengthdir_x(8, image_angle), obj_pSmg.y + lengthdir_y(12, -image_angle), "arena", obj_bulletSmg);
			} else if(mouse_x > obj_player.y){
				instance_create_layer(obj_pSmg.x + lengthdir_x(8, image_angle), obj_pSmg.y - lengthdir_y(12, -image_angle), "arena", obj_bulletSmg);
			}
			cool_smg = 5;
		}
	}

	if(cool_smg > 0)cool_smg--;
}

//ammo
if(ammo_smg != ammo_max_smg and alive and !obj_camera.is_paused){
	if(ammo_smg == 0 or keyboard_check_pressed(ord("R")) and global.smgAmmoInv != 0) global.isReloadingSmg = 1;
}

if(ammo_smg == 0 and global.smgAmmoInv == 0) global.outOfAmmoSmg = 1;
else if(global.isReloadingSmg == 1 and alive and !obj_camera.is_paused){
	global.outOfAmmoSmg = 0;
	if(global.cooldownSmg > 0){
		if(audio_is_playing(snd_smgReload) == false){
			var snd = audio_play_sound(snd_smgReload, 10, false);	
			audio_sound_gain(snd, global.sfxVol / 10, 0);
		}
		global.cooldownSmg--;
	} else {
		global.isReloadingSmg = 0;
		global.cooldownSmg = cooldown_max_smg;
	}
	
	if(global.smgAmmoInv > 0 and global.cooldownSmg <= 25){
		if(ammo_smg != ammo_max_smg){	
			ammo_smg++;
			global.smgAmmoInv--;
		}
	}
}
