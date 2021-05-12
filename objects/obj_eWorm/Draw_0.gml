draw_self();

if(hp < hp_max and image_xscale > 0){
	draw_healthbar(x - (sprite_width / 4), y - 40, x + (sprite_width / 4), y - 38, 100 * hp_perc, c_gray, c_red, c_purple, 0, true, false);
} else if (hp < hp_max and image_xscale < 0){
	draw_healthbar(x + (sprite_width / 4), y - 40, x - (sprite_width / 4), y - 38, 100 * hp_perc, c_gray, c_red, c_purple, 0, true, false);
}

