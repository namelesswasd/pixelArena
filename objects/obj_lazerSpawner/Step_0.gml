delayLazer = delayLazer + 1 * global.game_speed;

if(delayLazer == 1) _xL = random_range(obj_arena.x - 595, obj_arena.x + 595);

if(delayLazer >= enemyIntervalLazer * 60 and alive){
	instance_create_layer(_xL, 290, "arena", obj_enemyLazer);
	instance_destroy();
}