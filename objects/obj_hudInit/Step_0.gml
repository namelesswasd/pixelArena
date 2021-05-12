pa_bg_add += 0.5;
pa_bg_alpha = lerp(pa_bg_alpha, 0.2, 0.1);

if(pa_attempt_text_time <= pa_attempt_text_len){
	pa_attempt_text_time+=0.3;
	pa_attempt_text_current = string_copy(pa_attempt_text, 0, pa_attempt_text_time);
} else {
	global.attempt++;
	ini_open("settings.ini");
	ini_write_real("Stats", "attempt", global.attempt);
	ini_close();
	room_goto(room0);	
}

#region //metering

interval++;
if(interval >= 60){
	interval = 0;
	
	//fps
	fpsreal = floor(fps_real);

}
#endregion