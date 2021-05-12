global.wave = 1;
waveLast = 1;
waveVisual = global.wave;

waveEnemyNumber = round(global.wave * 1.2);
waveEnemyI = 0;

waveEnemyCheck = 0;

lazerInterval = 0;

switch(room){
	case room0:
		spawn_tog = 0;
	break;
	case roomTutorial:
		spawn_tog = 1;
	break;
}
