retryVal = lerp(retryVal, obj_hudDeath.hudMove / 6, 0.15);

x = retryVal;

if(position_meeting(mouse_x, mouse_y, obj_bRetry)){
	image_index = 7;	
	audioC++;
	if(tog == 0){
		var snd = audio_play_sound(snd_menuHover, 10, false);
		audio_sound_gain(snd, global.sfxVol / 10, 0);
		tog = 1;
	}
} else {
	image_index = 6;
	audioC = 0;
	tog = 0;
}

if(position_meeting(mouse_x, mouse_y, obj_bRetry) and mouse_check_button_pressed(mb_left)){
	//audio_play_sound(snd_clickMenu, 0, false);
	room_goto(roomInit);	
}

if(audioC == 1){
	//audio_play_sound(snd_selectMenu, 0, false);	
}