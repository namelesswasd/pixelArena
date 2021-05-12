draw_set_font(font_plateia);
draw_set_halign(fa_left);

draw_sprite_ext(spr_menuLogo, 0, -150 + logoMove * 1.1 + random_range(-10,10), 0, 0.15, 0.15, 0, c_white, 0.5);
draw_sprite_ext(spr_menuLogo, 1, -218 + logoMove * 1.1 + random_range(-10,10), 120, 0.15, 0.15, 0, c_white, 0.5);

draw_sprite_ext(spr_menuLogo, 0, -150 + logoMove * 1.1, 0, 0.15, 0.15, 0, c_white, 1);
draw_sprite_ext(spr_menuLogo, 1, -218 + logoMove * 1.1, 120, 0.15, 0.15, 0, c_white, 1);

/*
draw_sprite_ext(spr_playerMenu, 0, 
				room_width / 1.5 + random_range(-2 * playerShakeCut, 2 * playerShakeCut) - playerMoveCut, 
				playerMove * 1.4 + random_range(-2 * playerShakeCut, 2 * playerShakeCut),
				7 * playerZoomCut, 
				7 * playerZoomCut, 
				rot, 
				c_white, 1);
				*/

draw_sprite_ext(spr_whiteParticle, 0, room_width / 2, room_height / 2, 100, 100, 0, c_white, playerEndAlpha)

draw_set_halign(fa_right);
draw_set_valign(fa_bottom);
draw_text_color(room_width - 30, room_height, "de Stanescu Vladut-George", c_white, c_white, c_white, c_white, 0.3);

#region //misc
draw_set_font(font_plateia);
draw_set_halign(fa_left);
draw_set_valign(fa_bottom);
if(global.statsHud > 0){
	//fps
	draw_text_color(10, 25, string("FPS: " + string(fpsreal)), c_gray, c_gray, c_white, c_white, 0.8);
}
//misc
draw_set_halign(fa_right);
draw_text_color(room_width - 10, 25, global.ver, c_white, c_white, c_white, c_white, 0.2);
#endregion