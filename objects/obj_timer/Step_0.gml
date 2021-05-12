
if(global.deathToggle == 0){
	global.ms = global.ms + 1 * global.game_speed;
	if(global.ms >= 60) {
		global.seconds++;
		global.ms = 0;
	}
	if(global.seconds >= 60) {
		global.minutes++;
		global.seconds = 0;
	}
}

if(global.seconds >= 10) global.finalTime = string(global.minutes) + ":" + string(global.seconds) + "." + string(round(global.ms));
else global.finalTime = string(global.minutes) + ":0" + string(global.seconds) + "." + string(round(global.ms));

show_debug_message("total time: " + string(global.minutes * 3600 + global.seconds * 60 + global.ms))