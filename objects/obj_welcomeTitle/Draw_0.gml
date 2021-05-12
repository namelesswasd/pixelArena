draw_set_font(font_plateia);
draw_set_halign(fa_middle);
draw_set_valign(fa_middle);
if(x == 480 && y == -1728){
	draw_text_transformed_color(x + random_range(-5, 5), y + random_range(5, -5), "WELCOME TO\nPIXEL ARENA.", scale * 1.1, scale * 1.1, random_range(-2, 2), $cfcfcf, $cfcfcf, $cfcfcf, $cfcfcf, 0.5);
	draw_text_transformed_color(x, y, "WELCOME TO\nPIXEL ARENA.", scale * 1.04, scale * 1.04, 0, c_black, c_black, c_black, c_black, 1);
	draw_text_transformed_color(x, y, "WELCOME TO\nPIXEL ARENA.", scale * 1.02, scale * 1.02, 0, c_white, c_white, c_white, c_white, 1);
}
if(x == 4606 && y == 314){
	draw_text_transformed_color(x - 5, y - 100 + arrow_sway, "<<<", 2, 2, 90, c_white, c_white, c_white, c_white, 1);	
}