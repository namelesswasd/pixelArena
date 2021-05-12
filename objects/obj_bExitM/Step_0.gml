retryVal = lerp(retryVal, obj_hudMenu.hudMove / 3, 0.15);

image_alpha = global.alphaMenuToggle;

x = retryVal;

if(obj_hudMenu.menuSelect == 0){
	if(position_meeting(mouse_x, mouse_y, obj_bExitM)){
		image_index = 3;
		audioC++;
		if(tog == 0){
			var snd = audio_play_sound(snd_menuHover, 10, false);
			audio_sound_gain(snd, global.sfxVol / 10, 0);
			tog = 1;
		}
	} else {
		image_index = 2;
		audioC = 0;
		tog = 0;
	}

	if(position_meeting(mouse_x, mouse_y, obj_bExitM) and mouse_check_button_pressed(mb_left)){
		//audio_play_sound(snd_clickMenu, 0, false);
		var snd = audio_play_sound(snd_menuSelect, 10, false);
		audio_sound_gain(snd, global.sfxVol / 10, 0);
		game_end();	
	}

	if(audioC == 1){
		//audio_play_sound(snd_selectMenu, 0, false);	
	}
}