logoalpha = 0;
global.music_tog = 0;
togg = 0;
logoPixelPos = 0;
logoArenaPos = room_width;
whiteAlpha = 0;
textAlpha = 1;
nlxZoom = 0;


if(file_exists("settings.ini")){ //initialize all of the config variables
	ini_open("settings.ini");
	global.statsHud = ini_read_real("Gameplay", "stats_hud", 0);
	global.skipMenuCut = ini_read_real("Gameplay", "skip_menu_cutscene", 0);
	global.camShake = ini_read_real("Gameplay", "camera_shake", 1);
	global.dmgInt = ini_read_real("Gameplay", "dmg_intensity", 2);
	global.hud_sway_intensity = ini_read_real("Gameplay", "hud_sway", 2);
	global.sfxLevel = ini_read_real("Audio", "sfx_level", 8);
	global.bgFlash = ini_read_real("Audio", "bg_flash", 1);
	global.musicLevel = ini_read_real("Audio", "music_level", 2);
	global.displayMode = ini_read_real("Video", "display_mode", 0);
	global.best_combo = ini_read_real("Stats", "best_combo", 0);
	global.best_kills = ini_read_real("Stats", "best_kills", 0);
	global.death_count = ini_read_real("Stats", "death_count", 0);
	global.kill_count = ini_read_real("Stats", "kill_count", 0);
	global.total_ms = ini_read_real("Stats", "total_ms", 0);
	global.total_sec = ini_read_real("Stats", "total_sec", 0);
	global.total_min = ini_read_real("Stats", "total_min", 0);
	global.credits = ini_read_real("Stats", "credits", 0);
	global.attempt = ini_read_real("Stats", "attempt", 0);
	global.tutorialPlayed = ini_read_real("Tutorial", "tut_played", 0);
	ini_close();
} else { //if the config file does not exist, assign these values
	global.statsHud = 0;
	global.skipMenuCut = 0;
	global.camShake = 1;
	global.dmgInt = 2;
	global.hud_sway_intensity = 2;
	global.sfxLevel = 8;
	global.bgFlash = 1;
	global.musicLevel = 2;
	global.displayMode = 0;
	global.best_combo = 0;
	global.best_kills = 0;
	global.death_count = 0;
	global.kill_count = 0;
	global.total_ms = 0;
	global.total_sec = 0;
	global.total_min = 0;
	global.credits = 0;
	global.attempt = 0;
	global.tutorialPlayed = 0;
}

global.ver = "v1.atestat  "; //game version

global.game_speed = 1; //gameplay speed

global.profileMenuToggle = 0;

instance_create_layer(0, 0, "Instances", obj_music);