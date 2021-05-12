draw_set_font(font_plateia);
draw_set_halign(fa_right);

if(resetTog == 1){
	draw_text(x + sprite_width, y - 60, "are you sure? this action is IRREVERSIBLE.\nclick again to confirm.");
	resetTogCool++;
	if(resetTogCool >= 200){
		resetTog = 0;
		resetTogCool = 0;
	}
}

if(resetTog == 2){
	draw_text(x + sprite_width, y - 30, "DATA WAS RESET.");
}