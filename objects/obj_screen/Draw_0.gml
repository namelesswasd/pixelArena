draw_self();
draw_set_font(font_plateia);
draw_set_halign(fa_middle);
draw_set_valign(fa_middle);
if(x == 544) {
	var tempString = "press\n|A| or |D|\n to move.";
} else if(x == 1120) {
	var tempString = "press\n|SPACE|\nto jump.";
} else if(x == 1792) {
	var tempString = "press\n|SHIFT| +\n|A| or |D|\nto dash.";
} else if(x == 2270) {
	var tempString = "press |E|\nto interact\nwith\nobjects.";
} else if(x == 2368){
	var tempString = "use |1|, |2|\nand |3| to\nswitch\nweapons";
} else if(x == 2462){
	var tempString = "this is your\nsword.\npress |LMB|\nto swing."
} else {
	var tempString = "empty\nx: " + string(x);	
}

draw_text_transformed_color(x, y + 1, tempString, 0.5, 0.5, 0, $cfcfcf, $cfcfcf, $cfcfcf, $cfcfcf, 1);
draw_text_transformed_color(x, y, tempString, 0.5, 0.5, 0, c_white, c_white, c_white, c_white, 1);