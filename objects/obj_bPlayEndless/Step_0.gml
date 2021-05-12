retryVal = lerp(retryVal, obj_hudMenu.hudMove / 3 - 600, 0.15);

x = retryVal;

if(position_meeting(mouse_x, mouse_y, obj_bPlayEndless)){
	image_index = 11;
	audioC++;
	if(tog == 0){
		var snd = audio_play_sound(snd_menuHover, 10, false);
		audio_sound_gain(snd, global.sfxVol / 10, 0);
		tog = 1;
	}
} else {
	image_index = 10;
	audioC = 0;
	tog = 0;
}

if(position_meeting(mouse_x, mouse_y, obj_bPlayEndless) and mouse_check_button_pressed(mb_left)){
	//audio_play_sound(snd_clickMenu, 0, false);
	room_goto(roomInit);
	cutsceneMenu = 1;
	var snd = audio_play_sound(snd_menuSelect, 10, false);
	audio_sound_gain(snd, global.sfxVol / 10, 0);
}

if(audioC == 1){
	//audio_play_sound(snd_selectMenu, 0, false);	
}