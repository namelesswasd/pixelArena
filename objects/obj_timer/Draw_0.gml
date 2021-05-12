draw_set_halign(fa_center);
draw_set_valign(fa_bottom);
if(global.seconds >= 10) {
	draw_text_transformed_color(room_width / 2, room_height / 4, string(global.minutes) + ":" + string(global.seconds) + "." + string(round(global.ms)), textTimerScale, textTimerScale, 0, c_white, c_white, c_gray, c_gray, 0.3);
}
else {
	draw_text_transformed_color(room_width / 2, room_height / 4, string(global.minutes) + ":0" + string(global.seconds) + "." + string(round(global.ms)), textTimerScale, textTimerScale, 0, c_white, c_white, c_gray, c_gray, 0.3);
}