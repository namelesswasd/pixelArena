draw_set_font(font_plateia);
draw_set_halign(fa_middle);
draw_set_valign(fa_top);

if(comboTog){
	draw_sprite_ext(spr_dmc, comboRank, obj_camera.x + 345 + hud_sway_h + comboShakeH, obj_camera.y - 110 + hud_sway_v + comboShakeV, 0.5, 0.5, 0, c_white, comboAlpha);
	draw_sprite_stretched_ext(spr_whiteParticle, 0, obj_camera.x + 270 + hud_sway_h, obj_camera.y - 100 + hud_sway_v, 130, 2, c_white, comboAlpha / 3);
	draw_sprite_stretched_ext(spr_whiteParticle, 0, obj_camera.x + 270 + hud_sway_h, obj_camera.y - 100 + hud_sway_v, 130 * comboPerc, 2, c_white, comboAlpha);
	draw_text_transformed_color(obj_camera.x + 335 + hud_sway_h, obj_camera.y - 100 + hud_sway_v, "x" + string(global.combo) + " combo", comboScale / 2, 0.5, 0, c_white, c_white, c_white, c_white, comboAlpha);
}