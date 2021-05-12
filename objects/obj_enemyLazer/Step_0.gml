image_xscale = lerp(image_xscale, 2, 0.07 * global.game_speed);

if(image_xscale >= 1.9) {
	lazerPart = 1;

	instance_destroy(obj_enemyLazer);
	obj_camera.lazerShake = 1;
}

if(lazerPart == 1){
	for(var i = 0; i <= 30; i++){
		part_particles_create(global.partSystem, x + random_range(-50, 50), random_range(y, y - 300), global.partLazer, 1);
		if(i == 30) lazerPart = 0;
	}
}