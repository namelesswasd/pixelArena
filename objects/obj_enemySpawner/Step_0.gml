randomise();

//worm
if(waveEnemyI < waveEnemyNumber and obj_camera.wave_tog == 0 and spawn_tog == 0){
	instance_create_layer(0, 0, "arena", obj_wormSpawner);
	waveEnemyI++;
}

//lazer
if(obj_camera.wave_tog == 0 and spawn_tog == 0) lazerInterval += 1 * global.game_speed;
if(lazerInterval >= 2 * 60){
	instance_create_layer(0, 0, "arena", obj_lazerSpawner);
	lazerInterval = 0;
}

if(waveEnemyCheck >= waveEnemyNumber){
	global.wave++;	
	waveEnemyCheck = 0;
	waveEnemyI = 0;
}

waveEnemyNumber = round(global.wave * 1.2);

