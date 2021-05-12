if(obj_player.stance == 0 or obj_player.stance == 1){
	instance_destroy();	
}

if(global.game_speed >= 0.1){
	if(obj_player.stance == 2 or obj_player.stance == 3){
		if (mouse_x > obj_player.x){
			x = obj_player.x + 5;
			image_angle = point_direction(x, y, mouse_x, mouse_y);
			if (image_xscale < 0) image_xscale *= -1;
		} else if (mouse_x < obj_player.x){
			x = obj_player.x - 5;
			image_angle = point_direction(-x, -y, -mouse_x, -mouse_y);
			if (image_xscale > 0) image_xscale *= -1;
		}
		y = obj_player.y + 3;
	}
}