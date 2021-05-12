
image_speed = 0;
image_index = 8;
retryVal = -590;
audioC = 0;


if(file_exists("settings.ini")){
	ini_open("settings.ini");
	//gameplay
	global.camShake = ini_read_real("Gameplay", "camera_shake", 1);
	global.statsHud = ini_read_real("Gameplay", "stats_hud", 1);
	global.skipMenuCut = ini_read_real("Gameplay", "skip_menu_cutscene", 0);
	global.dmgInt = ini_read_real("Gameplay", "dmg_intensity", 1);
	global.hud_sway_intensity = ini_read_real("Gameplay", "hud_sway", 2);
	
	//audio
	global.musicLevel = ini_read_real("Audio", "music_level", 10);
	global.bgFlash = ini_read_real("Audio", "bg_flash", 1);
	global.sfxLevel = ini_read_real("Audio", "sfx_level", 10);
}
