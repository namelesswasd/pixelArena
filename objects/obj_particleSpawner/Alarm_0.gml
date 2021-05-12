if(global.game_speed){
	instance_create_layer(random_range(-300, room_width + 300), room_height + 50, "particles", obj_whiteParticle);
	part_interval_bg = 0;
}