var dir = random_range(-8, 8);

speed = 0;
direction = point_direction(x, y, mouse_x, mouse_y);
image_angle = point_direction(x, y, mouse_x, mouse_y);

if(mouse_check_button(mb_right)){
	dir = random_range(-0.5, 0.5);	
}

direction += dir * global.game_speed;
image_angle += dir;