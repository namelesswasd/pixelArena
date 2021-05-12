if(global.music_tog == 6 and room == roomIntro and musicIntroVol != 0){
	if(bpmFlashSide == 1) draw_sprite_ext(spr_bpmFlash, 0, 0, 0 - sprite_height / 2, 1.5, 1.5, 0, c_white, bpmFlashAlpha);
	if(bpmFlashSide == 2) draw_sprite_ext(spr_bpmFlash, 0, room_width - sprite_width, 0 - sprite_height / 2, -1.5, 1.5, 0, c_white, bpmFlashAlpha);
	draw_sprite_ext(spr_whiteParticle, 0, 0, 0, 500, 500, 0, c_white, bpmFlashAlpha / 5);
}

if(room != roomIntro and global.musicLevel != 0 and global.bgFlash == 1){
	draw_sprite_ext(spr_whiteParticle, 0, 0, 0, 500, 500, 0, c_white, bpmFlashAlpha / 10);
}