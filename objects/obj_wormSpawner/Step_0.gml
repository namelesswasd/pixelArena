delayWorm += 1 * global.game_speed;

if(delayWorm == 1) _xW = random_range(obj_arena.x - 595, obj_arena.x + 595);

if(delayWorm <= enemyIntervalWorm * 60 and alive){
	part_particles_create(global.partSystem, _xW + random_range(-30, 30), 279, global.partEWorm, 7);
}

if(delayWorm >= enemyIntervalWorm * 60 and alive){
	instance_create_layer(_xW, 283, "arena", obj_eWorm);
	instance_destroy();
}