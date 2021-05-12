if(keyboard_check_pressed(vk_escape)) global.music_tog = 6;

if(logoalpha >= 4) {
	global.music_tog = 1;
} else if (logoalpha == 1 and global.music_tog == 1){
	global.music_tog = 2;
} else if (logoalpha <= 0.02 and global.music_tog == 2){
	logoalpha = 0;
	global.music_tog = 4;
}

if(global.music_tog == 0){
	logoalpha += 0.02;
	nlxZoom += 0.0005;
} else if (global.music_tog == 1){
	logoalpha = 1;
	nlxZoom += 0.0005;
} else if (global.music_tog == 2){
	logoalpha -= 0.02;	
	nlxZoom += 0.0005;
} else if(global.music_tog >= 4){
	logoPixelPos = lerp(logoPixelPos, room_width / 2, 0.05);
	logoArenaPos = lerp(logoArenaPos, room_width / 2, 0.05);
	if(logoPixelPos >= 500) global.music_tog = 5;
}
if(global.music_tog == 5) {
	whiteAlpha = lerp(whiteAlpha, 1, 0.05);
	if(whiteAlpha >= 0.98) global.music_tog = 6;
}
if(global.music_tog == 6) {
	part_particles_create(global.partSystem, 0,          room_height / 2 + 70, global.partIntroBarLeft, 1);
	part_particles_create(global.partSystem, room_width, room_height / 2 + 70, global.partIntroBarRight, 1);
	part_particles_create(global.partSystem, random_range(0, room_width), room_height, global.partIntro, 1);
}

if(textAlpha >= 0.95){
	togg = 0;	
} else if (textAlpha <= 0.75){
	togg = 1;	
}

if(togg){
	textAlpha = lerp(textAlpha, 1, 0.1);
} else {
	textAlpha = lerp(textAlpha, 0.7, 0.1);	
}

if((keyboard_check_pressed(vk_anykey)) and global.music_tog = 6) {
	startSnd = audio_play_sound(snd_menuStart, 10, false);	
	audio_sound_gain(startSnd, global.sfxVol / 10, 0);
	if(global.tutorialPlayed == 0) room_goto(roomTutorial);
	else room_goto(roomMenu);
}