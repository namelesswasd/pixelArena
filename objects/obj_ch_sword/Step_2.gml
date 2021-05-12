x = mouse_x;
y = mouse_y;

image_index = 1;

if(obj_player.stance != 1) {
	instance_destroy();
}

var toggle = 0;

if (mouse_check_button_pressed(mb_left)){
	toggle = 1;	
}

if (toggle == 1){ //zoom function
	image_xscale = lerp(image_xscale, 2, 0.5);
	if(image_xscale >= 1.2)	toggle = 0;
} else {
	image_xscale = lerp(image_xscale, 1, 0.09);
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