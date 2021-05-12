draw_set_font(font_plateia);
draw_set_valign(fa_middle);
draw_set_halign(fa_left);
if(global.deathToggle >= 0){
	//menu death text
	draw_text_transformed_color(-590 + hudMove * 3.2, 100 - nudge + random_range(-10, 10), "GAME", 3, 3, 0, c_red, c_red, c_red, c_red, 0.7);
	draw_text_transformed_color(-590 + hudMove * 3.2, 100 - nudge, "GAME", 3, 3, 0, c_white, c_white, c_white, c_white, 1);
	draw_text_transformed_color(room_width + 300 - hudMove * 3.2, 130 - nudge + random_range(-10, 10), "OVER", 3, 3, 0, c_red, c_red, c_red, c_red, 0.7);
	draw_text_transformed_color(room_width + 300 - hudMove * 3.2, 130 - nudge, "OVER", 3, 3, 0, c_white, c_white, c_white, c_white, 1);
	
	draw_set_halign(fa_right); //actual
	//time
	draw_text_transformed(moveLerpDeath - 10, room_height / 2 - 180 - nudge, "TIME", 2, 2, 0);
	draw_rectangle(moveLerpDeath - 400, room_height / 2 - 150 - nudge, moveLerpDeath - 10, room_height / 2 - 110 - nudge, false);
	draw_text_transformed_color(room_width / 2 - 20, room_height / 2 - 137 - nudge, global.finalTime, 2, 2, 0, c_black, c_black, c_black, c_black, 1);
	//kills
	draw_text_transformed(moveLerpDeath - 10, room_height / 2 - 80 - nudge, "KILLS", 2, 2, 0);
	draw_rectangle(moveLerpDeath - 400, room_height / 2 - 50 - nudge, moveLerpDeath - 10, room_height / 2 - 10 - nudge, false);
	draw_text_transformed_color(room_width / 2 - 20, room_height / 2 - 37 - nudge, global.kills, 2, 2, 0, c_black, c_black, c_black, c_black, 1);
	//style
	draw_text_transformed(moveLerpDeath - 10, room_height / 2 + 20 - nudge, "COMBO", 2, 2, 0);
	draw_rectangle(moveLerpDeath - 400, room_height / 2 + 50 - nudge, moveLerpDeath - 10, room_height / 2 + 90 - nudge, false);
	draw_text_transformed_color(room_width / 2 - 20, room_height / 2 + 63 - nudge, global.comboCurrent, 2, 2, 0, c_black, c_black, c_black, c_black, 1);
	//wave
	draw_text_transformed(moveLerpDeath - 10, room_height / 2 + 120 - nudge, "WAVE", 2, 2, 0);
	draw_rectangle(moveLerpDeath - 400, room_height / 2 + 150 - nudge, moveLerpDeath - 10, room_height / 2 + 190 - nudge, false);
	draw_text_transformed_color(room_width / 2 - 20, room_height / 2 + 163 - nudge, global.wave, 2, 2, 0, c_black, c_black, c_black, c_black, 1);
	
	
	draw_set_halign(fa_left); //best
	//time
	draw_text_transformed(room_width - moveLerpDeath + 10, room_height / 2 - 180 - nudge, "BEST", 2, 2, 0);
	draw_rectangle(room_width - moveLerpDeath + 400, room_height / 2 - 150 - nudge, room_width - moveLerpDeath + 10, room_height / 2 - 110 - nudge, false);
	draw_text_transformed_color(room_width / 2 + 20, room_height / 2 - 137 - nudge, bestTime, 2, 2, 0, c_black, c_black, c_black, c_black, 1);
	//kills
	draw_text_transformed(room_width - moveLerpDeath + 10, room_height / 2 - 80 - nudge, "BEST", 2, 2, 0);
	draw_rectangle(room_width - moveLerpDeath + 400, room_height / 2 - 50 - nudge, room_width - moveLerpDeath + 10, room_height / 2 - 10 - nudge, false);
	draw_text_transformed_color(room_width / 2 + 20, room_height / 2 - 37 - nudge, global.best_kills, 2, 2, 0, c_black, c_black, c_black, c_black, 1);
	//style
	draw_text_transformed(room_width - moveLerpDeath + 10, room_height / 2 + 20 - nudge, "BEST", 2, 2, 0);
	draw_rectangle(room_width - moveLerpDeath + 400, room_height / 2 + 50 - nudge, room_width - moveLerpDeath + 10, room_height / 2 + 90 - nudge, false);
	draw_text_transformed_color(room_width / 2 + 20, room_height / 2 + 63 - nudge, global.best_combo, 2, 2, 0, c_black, c_black, c_black, c_black, 1);
	//wave
	draw_text_transformed(room_width - moveLerpDeath + 10, room_height / 2 + 120 - nudge, "BEST", 2, 2, 0);
	draw_rectangle(room_width - moveLerpDeath + 400, room_height / 2 + 150 - nudge, room_width - moveLerpDeath + 10, room_height / 2 + 190 - nudge, false);
	draw_text_transformed_color(room_width / 2 + 20, room_height / 2 + 163 - nudge, global.best_wave, 2, 2, 0, c_black, c_black, c_black, c_black, 1);
	
	
	//credits
	draw_sprite_ext(spr_credit, 0, room_width / 2 + creditAnim + nudge * 3, room_height / 2 + 150 + nudge, creditScale / 2, creditScale / 2, 0, c_white, creditAlpha);
	draw_text_transformed_color(room_width / 2 + creditAnim + 70 + nudge * 3, room_height / 2 + 145 + nudge, round(credit), creditScale, creditScale, 0, c_yellow, c_yellow, c_orange, c_yellow, creditAlpha2);
	draw_text_transformed_color(room_width / 2 + creditAnim - 100 + nudge * 3, room_height / 2 + 145 + nudge, "+", creditScale, creditScale, creditAngleRan, c_yellow, c_orange, c_yellow, c_yellow, creditAlpha2);
	
	draw_text_transformed_color(room_width / 2 + creditAnim + 70 + nudge * 3, room_height / 2 + 145 + nudge, round(global.credits), creditScale, creditScale, 0, c_yellow, c_orange, c_yellow, c_yellow, creditAlpha3);
	draw_set_halign(fa_right);
	draw_text_transformed_color(room_width / 2 + creditAnim - 70 + nudge * 3, room_height / 2 + 145 + nudge, "TOTAL", creditScale, creditScale, 0, c_yellow, c_orange, c_yellow, c_yellow, creditAlpha3);
}

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