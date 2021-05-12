y -= mov * global.game_speed;

image_angle += rot * global.game_speed;

if (y <= 0) instance_destroy();