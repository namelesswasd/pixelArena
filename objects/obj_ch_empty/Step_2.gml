x = mouse_x;
y = mouse_y;

image_index = 0;

if(obj_player.stance != 0) {
	instance_destroy();
}



image_blend = c_white;

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