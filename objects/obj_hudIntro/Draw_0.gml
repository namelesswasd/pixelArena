draw_set_font(font_plateia);
draw_set_halign(fa_middle);

draw_sprite_ext(spr_nlxdev, 0, room_width / 2, room_height / 2, 0.6 + nlxZoom, 0.6 + nlxZoom, 0, c_white, logoalpha);

if(global.music_tog >= 4){
	draw_sprite_ext(spr_logo, 0, logoPixelPos - 170, room_height / 2 - 50, 0.15, 0.15, 0, c_white, 1);
	draw_sprite_ext(spr_logo, 1, logoArenaPos + 170, room_height / 2 - 50, 0.178, 0.178, 0, c_white, 1);
}

if(global.music_tog >= 6){
	draw_sprite_ext(spr_logo, 0, logoPixelPos - 170 + random_range(-10, 10), room_height / 2 - 50 + random_range(-10, 10), 0.15, 0.15, 0, c_white, 0.5);
	draw_sprite_ext(spr_logo, 1, logoArenaPos + 170 + random_range(-10, 10), room_height / 2 - 50 + random_range(-10, 10), 0.178, 0.178, 0, c_white, 0.5);	
}

if(global.music_tog == 5){
	draw_sprite_ext(spr_introScreen, 0, 0, 0, 1, 1, 0, c_white, whiteAlpha);
}

if(global.music_tog == 6){
	draw_set_halign(fa_left);
	draw_text_color(room_width / 2 + 340, room_height / 2 - 14, global.ver, c_white, c_white, c_white, c_white, 0.5);
	draw_set_halign(fa_middle);
	draw_sprite_ext(spr_introScreen, 0, 0, room_height / 2 + 50, 1, 0.05, 0, c_white, 1);	
	draw_text_ext_transformed_color(room_width / 2, room_height / 2 + 40, "press any key", 0, 1000, 1.5, 1.5, 0, c_black, c_black, c_black, c_black, textAlpha);
	draw_set_font(font_plateia);
	draw_text_ext_transformed_color(room_width / 2, room_height - 50, obj_music.musicText, 0, 1000, 1, 1, 0, c_white, c_white, c_white, c_white, 0.5);
}
