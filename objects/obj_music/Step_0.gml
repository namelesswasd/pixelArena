randomize();



if(!is_playing){
	sndRand = round(random_range(0, 3));
	if(sndRandPrev == sndRand) sndRand = round(random_range(0, 3));
	sndRandPrev = sndRand;
	switch(sndRand){	
		case 0:
			if(!audio_is_playing(snd_nexus) and global.music_tog != -1){
				bpm = 175;
				global.musicSnd = audio_play_sound(snd_nexus, 10, false); //175 70.88
				if(!is_first) {
					audio_sound_gain(global.musicSnd, 0, 0);
					audio_sound_gain(global.musicSnd, musicIntroVol / 10, 6000);
					audio_sound_set_track_position(global.musicSnd, 60.48);
				} else audio_sound_gain(global.musicSnd, musicIntroVol / 10, 100);
			}
			musicText = "Nexus & Tight - Spectrum";
		break;
		
		case 1:
			if(!audio_is_playing(snd_timeout) and global.music_tog != -1){
				bpm = 175;
				global.musicSnd = audio_play_sound(snd_timeout, 10, false); //180 20.5
				if(!is_first) {
					audio_sound_gain(global.musicSnd, 0, 0);
					audio_sound_gain(global.musicSnd, musicIntroVol / 10, 6000);
					audio_sound_set_track_position(global.musicSnd, 38.28);
				} else audio_sound_gain(global.musicSnd, musicIntroVol / 10, 100);
			}
			musicText = "Malaky - Time Out";
		break;
		
		case 2:
			if(!audio_is_playing(snd_generations) and global.music_tog != -1){
				bpm = 162;
				global.musicSnd = audio_play_sound(snd_generations, 10, false); //175
				if(!is_first) {
					audio_sound_gain(global.musicSnd, 0, 0);
					audio_sound_gain(global.musicSnd, musicIntroVol / 10, 6000);
					audio_sound_set_track_position(global.musicSnd, 112.18); 
				} else audio_sound_gain(global.musicSnd, musicIntroVol / 10, 100);
			}
			musicText = "Intensity - Generations";
		break;
	}
} else is_first++;

if(audio_is_playing(snd_nexus) or
   audio_is_playing(snd_timeout) or
   audio_is_playing(snd_generations)) {
	   is_playing = 1;
	   if(keyboard_check_pressed(ord("N"))) {
		   global.musicSnd = audio_stop_sound(global.musicSnd);
	   }
   }
else is_playing = 0;



//bpm calculator
bpmToMs = 3600 / bpm;
bpmTemp++;
if(bpmTemp >= bpmToMs){
	bpmTemp = 0;	
	if(bpmFlashSide == 1) bpmFlashSide = 2;
	else bpmFlashSide = 1;
	
	bpmFlashAlpha = 1;
	temp++;
} else {
	bpmFlashAlpha = lerp(bpmFlashAlpha, 0, 0.15);	
}

if(is_first > 2) is_first = 2;

//show_debug_message("\n////MUSIC////\nsndRand: " + string(sndRand) + "\nsndRandPrev: " + string(sndRandPrev) +  "\nis_first: " + string(is_first) + "\nmusicIntroVol: " + string(musicIntroVol) + "\n/////////////");
//show_debug_message("\n////BPM////\nbpm: " + string(bpm) + "\nbpmToMs: " + string(bpmToMs) + "\nbpmTemp: " +string(bpmTemp) + "\nbpmFlashSide: " + string(bpmFlashSide) + "\nbpmFlashAlpha: " + string(bpmFlashAlpha) + "\n/////////");



//this does not make sense do not judge me
//why is there some fullscreen setting in the music object, i do not know, but it works, and that's what matters babyyy
if(global.displayMode) window_set_fullscreen(true);
else window_set_fullscreen(false);

if(window_get_fullscreen()) global.displayMode = 1;
else global.displayMode = 0;
