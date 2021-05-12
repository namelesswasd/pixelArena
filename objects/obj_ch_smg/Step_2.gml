x = mouse_x;
y = mouse_y;

image_index = 2;

if(obj_player.stance != 3) {
	instance_destroy();
}


var toggle = 0;

if (mouse_check_button(mb_left) and obj_pSmg.cool_smg == 0){
	toggle = 1;	
}

if (toggle == 1 and global.isReloadingSmg == 0){ //zoom function
	image_xscale = lerp(image_xscale, 2, 0.5);
	if(image_xscale >= 1.2)	toggle = 0;
} else {
	image_xscale = lerp(image_xscale, 1, 0.09);
}


//not reloading
if(global.isReloadingSmg == 0 or obj_player.stance == 0) {
	image_blend = c_white;
}

//reloading
if (global.isReloadingSmg == 1) {
	image_blend = c_yellow;
	image_xscale += global.cooldownSmg / 1500;
}

//out of ammo
if (global.outOfAmmoSmg == 1){
	image_blend = c_red;
}



image_yscale = image_xscale;

//hp
if(obj_player.hp <= 0) {
	window_set_cursor(cr_default);
	instance_destroy();
}

//paused
switch(obj_camera.is_paused){
	case 1:
		image_alpha = 0;
		window_set_cursor(cr_default);
	break
	case 0:
		if(room == roomTutorial and obj_camera.followWelcomeDelay <= 200) image_alpha = 0;
		else image_alpha = 1;
		window_set_cursor(cr_none);
	break;
}