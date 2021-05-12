if(round(credit) != round(creditLast)){
	creditZoomTog = 1;
	var snd = audio_play_sound(snd_credit, 10, false);
	audio_sound_gain(snd, global.sfxVol / 10, 0);
	audio_sound_pitch(snd, creditPitch);
}

