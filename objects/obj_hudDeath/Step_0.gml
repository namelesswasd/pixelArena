randomize();

hudMove = lerp(hudMove, 300, 0.05);
moveLerpDeath = lerp(moveLerpDeath, room_width / 2, 0.05);

creditLast = credit;
creditPitch = 1 + credit / creditCalc;

if(creditTog == 0){
	creditAlpha = lerp(creditAlpha, 1, 0.05);
	creditAlpha2 = lerp(creditAlpha2, 1, 0.05);
}

interval++;
if(interval >= 60){
	interval = 0;
	
	//fps
	fpsreal = floor(fps_real);
}


//time

if(file_exists("settings.ini")){
	ini_open("settings.ini");
	
	var _min = ini_read_real("Time", "min", 0);
	var _sec = ini_read_real("Time", "sec", 0);
	var _ms = ini_read_real("Time", "ms", 0);
	
	var best = _min * 3600 + _sec * 60 + _ms;
	var actual = global.minutes * 3600 + global.seconds * 60 + global.ms;
	
	//calculating how many credits should the player receive
	creditCalc = round(actual / 100) + global.kills + global.comboCurrent + global.wave;
	
	//debugging
	//creditCalc = 500000000;
	
	saveTogg++;
	if(saveTogg == 1){
		
		global.death_count = ini_read_real("Stats", "death_count", 0);
		
		global.death_count++;
		ini_write_real("Stats", "death_count", global.death_count);
		
		global.total_ms = ini_read_real("Stats", "total_ms", 0);
		global.total_sec = ini_read_real("Stats", "total_sec", 0);
		global.total_min = ini_read_real("Stats", "total_min", 0);
		global.best_kills = ini_read_real("Stats", "best_kills", 0);
		global.best_combo = ini_read_real("Stats", "best_combo", 0);
		global.best_wave = ini_read_real("Stats", "best_wave", 0);
		
		global.total_ms += global.ms;
		global.total_sec += global.seconds;
		global.total_min += global.minutes;
		global.credits += creditCalc;
		
		if(global.total_ms > 60) {
			global.total_sec++;
			global.total_ms = 0;
		}
		if(global.total_sec > 60) {
			global.total_min++; 
			global.total_sec = 0;
		}
		
		if(global.kills > global.best_kills){
			global.best_kills = global.kills;	
		}
		
		if(global.comboCurrent > global.best_combo){
			global.best_combo = global.comboCurrent;	
		}
		
		if(global.wave > global.best_wave){
			global.best_wave = global.wave;	
		}
		
		ini_write_real("Stats", "credits", global.credits);
		ini_write_real("Stats", "total_ms", global.total_ms);
		ini_write_real("Stats", "total_sec", global.total_sec);
		ini_write_real("Stats", "total_min", global.total_min);
		ini_write_real("Stats", "best_kills", global.best_kills);
		ini_write_real("Stats", "best_combo", global.best_combo);
		ini_write_real("Stats", "best_wave", global.best_wave);
	}
	
	if(actual > best){
		ini_write_real("Time", "min", global.minutes);
		ini_write_real("Time", "sec", global.seconds);
		ini_write_real("Time", "ms", global.ms);
		
		if(global.seconds < 10) bestTime = string(global.minutes) + ":0" + string(global.seconds) + "." + string(round(global.ms));
		else bestTime = string(global.minutes) + ":" + string(global.seconds) + "." + string(round(global.ms));
	} else {
		if(_sec < 10) bestTime = string(_min) + ":0" + string(_sec) + "." + string(round(_ms));
		else bestTime = string(_min) + ":" + string(_sec) + "." + string(round(_ms));
	}
} else {
	var _min = 0;
	var _sec = 0;
	var _ms = 0;
	
	global.death_count++;
}

if(creditAlpha >= 0.7) {
	credit = lerp(credit, creditCalc, 0.05);
	show_debug_message("\n\ncredit: " + string(credit));
}

if(credit >= creditCalc){
	creditTog = 1;
}

if(creditTog == 1){
	creditAlpha2 = lerp(creditAlpha2, 0, 0.05);
	creditAlpha3 = lerp(creditAlpha3, 1, 0.05);
	creditAnim = lerp(creditAnim, 0, 0.05);	
}

if(creditZoomTog == 1){
	creditScale = lerp(creditScale, 2.5, 1);
	if(creditScale >= 2.4) {
		creditAngleRan = random_range(-5, 5);
		creditZoomTog = 2;
	}
} else {
	creditScale = lerp(creditScale, 2, 0.1);
}

ini_close();

show_debug_message("\n\nglobal.minutes: " + string(global.minutes) + "\nglobal.seconds: " + string(global.seconds) + "\nglobal.ms: " + string(global.ms) + "\nbest: " + string(best) + "\nactual: " + string(actual));