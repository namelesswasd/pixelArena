if(arrow_toggle){
	arrow_sway = lerp(arrow_sway, 50, 0.05);
	if(arrow_sway >= 49.5) arrow_toggle = 0;
} else {
	arrow_sway = lerp(arrow_sway, 0, 0.05);
	if(arrow_sway <= 0.5) arrow_toggle = 1;
}