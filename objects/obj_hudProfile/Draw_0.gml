//profile text
draw_set_font(font_holding);
draw_set_halign(fa_left);
draw_set_valign(fa_top);

draw_text_ext_transformed_color(profileTextMove + random_range(-10, 10), 20, profileText, 9999, 9999, 1.5, 1.5, 0, c_white, c_white, c_white, c_white, 0.5);
draw_text_ext_transformed_color(profileTextMove, 20, profileText, 9999, 9999, 1.5, 1.5, 0, c_white, c_white, c_white, c_white, 1);
draw_rectangle(profileTextMove - 50, 120, profileTextMove + 300, 130, false);

draw_set_font(font_plateia);

draw_set_halign(fa_right);
//total time played
draw_text_transformed_color(room_width - 50, 100, "TOTAL TIME PLAYED:", 1.25, 1.25, 0, c_white, c_white, c_white, c_white, 1);
if(global.total_sec < 10) draw_text_transformed_color(room_width - 50, 130, string(global.total_min) + ":0" + string(global.total_sec) + "." + string(global.total_ms), 1.25, 1.25, 0, c_white, c_white, c_white, c_white, 0.7);
else draw_text_transformed_color(room_width - 50, 130, string(global.total_min) + ":" + string(global.total_sec) + "." + string(global.total_ms), 1.25, 1.25, 0, c_white, c_white, c_white, c_white, 0.7);

//kill count
draw_text_transformed_color(room_width - 50, 180, "KILL COUNT:", 1.25, 1.25, 0, c_white, c_white, c_white, c_white, 1);
draw_text_transformed_color(room_width - 50, 210, string(global.kill_count), 1.25, 1.25, 0, c_white, c_white, c_white, c_white, 0.7);

//death count
draw_text_transformed_color(room_width - 50, 260, "DEATH COUNT:", 1.25, 1.25, 0, c_white, c_white, c_white, c_white, 1);
draw_text_transformed_color(room_width - 50, 290, string(global.death_count), 1.25, 1.25, 0, c_white, c_white, c_white, c_white, 0.7);

//KD ratio
draw_text_transformed_color(room_width - 50, 340, "K/D RATIO:", 1.25, 1.25, 0, c_white, c_white, c_white, c_white, 1);
draw_text_transformed_color(room_width - 50, 370, string(kd), 1.25, 1.25, 0, c_white, c_white, c_white, c_white, 0.7);

//KD ratio
draw_text_transformed_color(room_width - 50, 420, "BEST WAVE:", 1.25, 1.25, 0, c_white, c_white, c_white, c_white, 1);
draw_text_transformed_color(room_width - 50, 450, string(global.best_wave), 1.25, 1.25, 0, c_white, c_white, c_white, c_white, 0.7);

//credits
draw_sprite_ext(spr_credit, 0, room_width - 100, 540, 1, 1, 0, c_white, 1);
draw_set_halign(fa_right);
draw_text_transformed_color(room_width - 175, 506, global.credits, 2, 2, 0, c_yellow, c_orange, c_yellow, c_yellow, 1);

show_debug_message("total_ms: " + string(global.total_ms) + "\ntotal_sec: " + string(global.total_sec) + "\ntotal_min: " + string(global.total_min));

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