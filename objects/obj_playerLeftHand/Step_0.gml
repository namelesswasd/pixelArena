
if(global.game_speed >= 0.1){
	if (obj_player.stance == 0){ //empty
		if (mouse_x > obj_player.x){
			x = obj_player.x + 4;
			image_angle = point_direction(x, y, mouse_x, mouse_y);
			if (image_xscale < 0) image_xscale *= -1;
		} else if (mouse_x < obj_player.x){
			x = obj_player.x - 4;
			image_angle = point_direction(-x, -y, -mouse_x, -mouse_y);
			if (image_xscale > 0) image_xscale *= -1;
		}
		y = obj_player.y + 3;
	}
}

if (obj_player.stance == 1){ //sword
	if (mouse_x > obj_player.x){
		x = obj_player.x + 8;
		image_angle = point_direction(x, y, mouse_x, mouse_y);
		if (image_xscale > 0) image_xscale *= -1;
	} else if (mouse_x < obj_player.x){
		x = obj_player.x - 8;
		image_angle = point_direction(-x, -y, -mouse_x, -mouse_y);
		if (image_xscale < 0) image_xscale *= -1;
	}
	y = obj_player.y + 3;
}

if(obj_player.stance == 2 or obj_player.stance == 3){
	instance_destroy();
}

if (image_angle <= 310 and image_angle >= 90) image_angle = 310;
if (image_angle >= 50 and image_angle <= 90) image_angle = 50;