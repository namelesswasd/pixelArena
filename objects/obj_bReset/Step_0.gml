if(position_meeting(mouse_x, mouse_y, obj_bReset)){
	image_index = 21;
	audioC++;
	if(tog == 0){
		var snd = audio_play_sound(snd_menuHover, 10, false);
		audio_sound_gain(snd, global.sfxVol / 10, 0);
		tog = 1;
	}
} else {
	image_index = 20;
	audioC = 0;
	tog = 0;
}

if(position_meeting(mouse_x, mouse_y, obj_bReset) and mouse_check_button_pressed(mb_left)){
	var snd = audio_play_sound(snd_menuSelect, 10, false);
	audio_sound_gain(snd, global.sfxVol / 10, 0);
	
	resetTog++;
}

if(resetTog == 2){
	ini_open("settings.ini"){
		global.kill_count = 0;
		global.death_count = 0;
		global.total_ms = 0;
		global.total_sec = 0;
		global.total_min = 0;
		obj_hudProfile.kd = 0;
		global.credits = 0;
		global.best_wave = 0;
		
		ini_write_real("Stats", "kill_count", global.kill_count);
		ini_write_real("Stats", "death_count", global.death_count);
		ini_write_real("Stats", "total_ms", global.total_ms);
		ini_write_real("Stats", "total_sec", global.total_sec);
		ini_write_real("Stats", "total_min", global.total_min);
		ini_write_real("Stats", "credits", global.credits);
		ini_write_real("Stats", "best_wave", global.best_wave);
		
		resetTogCool++;
		if(resetTogCool >= 200) {
			resetTog = 0;
			resetTogCool = 0;	
		}
	}
}
