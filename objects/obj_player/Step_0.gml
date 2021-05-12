//start
if(obj_camera.cutsceneEndAlpha >= 0.1) part_particles_create(global.partSystem, x, y, global.ptPlayer, 1);

if(godmode) hp = 100;

if(alive){
	//keyboard check
	key_left = keyboard_check(ord("A"));
	key_right = keyboard_check(ord("D"));
	key_jump = keyboard_check_pressed(vk_space);
	key_dash = keyboard_check_pressed(vk_shift);

	//sprite flip
	if(!obj_camera.is_paused){
		if (mouse_x < x and image_xscale > 0){
			image_xscale *= -1;	
		} else if (mouse_x > x and image_xscale < 0){
			image_xscale *= -1;	
		}
	
		if (keyboard_check(ord("A")) or keyboard_check(ord("D"))){
			if(stance == 2){
				sprite_index = spr_playerMovingPistol;	
			} else {
				sprite_index = spr_playerMoving;	
			}
		} else if (keyboard_check_released(ord("A") or ord("D"))) {
			if(stance == 2){
				sprite_index = spr_playerIdlePistol;
			} else {
				sprite_index = spr_playerIdle;	
			}
		}
	}
	
	//pause
	if(obj_camera.is_paused) {
		sprite_scroll = 0;
	} else sprite_scroll = 0.05;
	image_index += sprite_scroll; 
	
	//movement calc
	if(!obj_camera.is_paused) var move = key_right - key_left;
	else var move = 0;

	walksp = 5 * global.game_speed;

	hsp = move * walksp + move * dashsp;

	vsp = vsp + grv * global.game_speed;

	if (key_dash == 1 and dash == 0 and place_empty(x, y + 1, obj_arena) and move != 0 and !obj_camera.is_paused) dash = 1;

	if (dash == 1){
		dashsp = 10 * global.game_speed;
		dash = 2;
	} else if (dash == 2){
		dashsp = lerp(dashsp, 0, 0.1);
		if(dashsp == 0 or place_meeting(x, y + 1, obj_arena)) {
			dash = 0;
			dashsp = 0;
		}
	}

	if(dash > 0) part_particles_create(global.partSystem, x, y + random_range(-20, 20), global.partDash, 3);

	if (place_meeting(x, y + 1, obj_arena)) and (key_jump){
		vsp = -8;
	}

	//v collision
	if (place_meeting(x, y + vsp, obj_arena)){
		while (!place_meeting(x, y + sign(vsp), obj_arena)){
			y = y + sign(vsp);	
		}
		vsp = 0;
	}

	//v movement
	y = y + vsp * global.game_speed;

	//h collision
	if (place_meeting(x + hsp, y, obj_arena)){
		while (!place_meeting(x + sign(hsp), y, obj_arena)){
			x = x + sign(hsp);	
		}
		hsp = 0;
	}

	//h movement
	x = x + hsp;

	//player inventory

	switch (obj_camera.selection){
		case "1":
		holding = string(inv1);
		obj_camera.selection = 0;
		break;
		case "2":
		holding = string(inv2);
		obj_camera.selection = 0;
		break;
		case "3":
		holding = string(inv3);
		obj_camera.selection = 0;
		break;
	}

	switch (holding){
		case "3": //sword
		if (!instance_exists(obj_pSword)){	
			global.isReloading = 0;
			stance = 1;
			holding = 0;
			ch_toggle = 0;
			obj_camera.holdingGUI = "sword";
			instance_create_layer(obj_player.x, obj_player.y, "arenahands_top", obj_playerRightHand);
			instance_create_layer(obj_player.x, obj_player.y, "arenahands_bot", obj_playerLeftHand);
			instance_create_layer(x, y, "arenahands", obj_pSword);
			instance_create_layer(mouse_x, mouse_y, "crosshair", obj_ch_sword);
		}
		break;
	
		case "4": //pistol
		if (!instance_exists(obj_pPistol)){
			stance = 2;
			ch_toggle = 0;
			holding = 0;
			obj_camera.holdingGUI = "pistol";
			if(!instance_exists(obj_playerRightHandStr)){
				instance_create_layer(obj_player.x, obj_player.y, "arenahands_top", obj_playerRightHandStr);
				instance_create_layer(obj_player.x, obj_player.y, "arenahands_bot", obj_playerLeftHandStr);
			}
			instance_create_layer(x, y, "arenahands", obj_pPistol);
			instance_create_layer(mouse_x, mouse_y, "crosshair", obj_ch_pistol);
			
		}
		break;
		
		case "5":
		if (!instance_exists(obj_pSmg)){
			stance = 3;
			ch_toggle = 0;
			holding = 0;
			obj_camera.holdingGUI = "smg";
			if(!instance_exists(obj_playerRightHandStr)){
				instance_create_layer(obj_player.x, obj_player.y, "arenahands_top", obj_playerRightHandStr);
				instance_create_layer(obj_player.x, obj_player.y, "arenahands_bot", obj_playerLeftHandStr);
			}
			instance_create_layer(x, y, "arenahands", obj_pSmg);
			instance_create_layer(mouse_x, mouse_y, "crosshair", obj_ch_smg);
		}
		break;
	
		case "-4": //empty
		global.isReloading = 0;
		stance = 0;
		if(ch_toggle == 0) {
			instance_create_layer(mouse_x, mouse_y, "crosshair", obj_ch_empty);
			ch_toggle = 1;	
		}
		obj_camera.holdingGUI = "empty";
		break;
	}
} else {
	for(var i=0; i<=10; i++) part_particles_create(global.partSystem, x, y, global.partPlayerDeath, 1);	
}

if(room == room0) if(y >= room_height + 300) hp = 0;
if(room == roomShop) if(y >= room_height + 800){
	var _x = random_range(270, obj_arena.sprite_width - 100);
	
	y = -300;
	obj_camera.y = -250;
	
	x = _x;
	obj_camera.x = _x;
}

//hp
if (hp <= 0){
	obj_camera.deathToggle = 1;
}

//store ammo
if(instance_exists(obj_pPistol)) ammo_last_pistol = obj_pPistol.ammo_pistol;
if(instance_exists(obj_pSmg)) ammo_last_smg = obj_pSmg.ammo_smg;

//dmg eff
hp_last = hp;

//GUI INIT
if(room == roomTutorial){
	if(x >= 2688) {
		obj_camera.hudMove_text_tog = 1;
		obj_camera.hudMove_hp_tog = 1;
	}
	if(x >= 3200) {
		obj_camera.hudMove_ammo_tog = 1;
	}
	if(x >= 3712) {
		obj_camera.hudMove_wave_tog = 1;
	}
	if(x >= 4224) {
		obj_camera.hudMove_init_tog = 1;
	}
}


