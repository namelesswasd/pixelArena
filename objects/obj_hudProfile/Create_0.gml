profileTextMove = -400;
profileText = "PROFILE / WIP";

if(file_exists("settings.ini")){
	ini_open("settings.ini");

	global.total_ms = ini_read_real("Stats", "total_ms", 0);
	global.total_sec = ini_read_real("Stats", "total_sec", 0);
	global.total_min = ini_read_real("Stats", "total_min", 0);
	global.kill_count = ini_read_real("Stats", "kill_count", 0);
	global.death_count = ini_read_real("Stats", "death_count", 0);
	global.best_wave = ini_read_real("Stats", "best_wave", 0);

	ini_close();
} else { //first time boot
	global.total_ms = 0;
	global.total_sec = 0;
	global.total_min = 0;
	global.kill_count = 0;
	global.death_count = 0;
	global.best_wave = 0;
}

kd = 0;

global.profileMenuToggle = 1;

interval = 0;
fpsreal = 0;