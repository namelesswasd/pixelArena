if(alive)image_index = 0;
else image_index = 1;

if(global.game_speed >= 0.1){
	if (obj_player.stance == 2){ //holding anim
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
	if(global.isReloadingPistol == 0 and alive and obj_camera.hudMove <= 50){
		if(mouse_check_button_pressed(mb_left) and cool_pistol == 0){
			var snd = audio_play_sound(snd_pistolShoot, 10, false);
			audio_sound_gain(snd, global.sfxVol / 10, 0);
			ammo_pistol -= 1;
			if(mouse_x < obj_player.x){
				instance_create_layer(obj_pPistol.x - lengthdir_x(8, image_angle), obj_pPistol.y + lengthdir_y(12, -image_angle), "arena", obj_bulletPistol);
			} else if(mouse_x > obj_player.y){
				instance_create_layer(obj_pPistol.x + lengthdir_x(8, image_angle), obj_pPistol.y - lengthdir_y(12, -image_angle), "arena", obj_bulletPistol);
			}
			cool_pistol = 10;
		}
	}

	if(cool_pistol > 0)cool_pistol--;
}

//ammo
if(ammo_pistol != ammo_max_pistol and alive and !obj_camera.is_paused){
	if(ammo_pistol == 0 or keyboard_check_pressed(ord("R")) and global.pistolAmmoInv != 0) global.isReloadingPistol = 1;
}

if(ammo_pistol == 0 and global.pistolAmmoInv == 0) global.outOfAmmoPistol = 1;
else if(global.isReloadingPistol == 1 and alive and !obj_camera.is_paused){
	global.outOfAmmoPistol = 0;
	if(global.cooldownPistol > 0){
		if(audio_is_playing(snd_pistolReload) == false){
			var snd = audio_play_sound(snd_pistolReload, 10, false);	
			audio_sound_gain(snd, global.sfxVol / 10, 0);
		}
		global.cooldownPistol--;
	} else {
		global.isReloadingPistol = 0;
		global.cooldownPistol = cooldown_max_pistol;
	}
	
	if(global.pistolAmmoInv > 0 and global.cooldownPistol <= 25){
		if(ammo_pistol != ammo_max_pistol){	
			ammo_pistol++;
			global.pistolAmmoInv--;
		}
	}
}