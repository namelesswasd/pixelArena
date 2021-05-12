//health bar

if(hp_draw >= 99){
	draw_rectangle_color(view_wport[0] - 201 + hudMove + hudMove_hp + hud_sway_h, view_hport[0] - 38 + hud_sway_v, view_wport[0] - 46 + hudMove + hudMove_hp + hud_sway_h, view_hport[0] - 23 + hud_sway_v, c_white, c_gray, c_gray, c_white, false);
} else draw_sprite_part(spr_healthBar, image_index, 0, 0, 156 * (hp_perc), 16, view_wport[0] - 201 + hudMove + hudMove_hp + hud_sway_h, view_hport[0] - 38 + hud_sway_v);

draw_set_halign(fa_right);
draw_set_valign(fa_bottom);
draw_set_font(font_health);
if(instance_exists(obj_player)) {
	if(!secret_tog) draw_text_color(view_wport[0] - 210 + hudMove + hudMove_hp + hud_sway_h, view_hport[0] - 17 + hud_sway_v, string(obj_player.hp), c_white, c_white, c_white, c_white, hudMove_hp_alpha);
	else draw_text_color(view_wport[0] - 210 + hudMove + hudMove_hp + hud_sway_h, view_hport[0] - 17 + hud_sway_v, secret_message, c_white, c_white, c_white, c_white, hudMove_hp_alpha);
}

if(speed_tog) draw_text_color(view_wport[0] - 250 + hudMove + hudMove_hp + hud_sway_h, view_hport[0] - 17 + hud_sway_v, string(global.game_speed), c_white, c_white, c_white, c_white, hudMove_hp_alpha);

//separator
draw_rectangle(view_wport[0] - 201 + hudMove + hudMove_ammo + hud_sway_h, view_hport[0] - 45 + hud_sway_v, view_wport[0] - 46 + hudMove + hudMove_ammo + hud_sway_h, view_hport[0] - 46 + hud_sway_v, false);


//hp dmg eff
if(global.dmgEffect >= 1){
	draw_sprite_ext(spr_dmgScreen, 0, 0, 0, 1, 1, 0, c_white, dmgEffectAlpha);
}

//weapon holding
draw_set_font(font_holding);
draw_text_color(view_wport[0] - 46 + hudMove + hudMove_ammo + hud_sway_h, view_hport[0] - 25 + hud_sway_v, holdingGUI, c_white, c_white, c_black, c_black, 0.3 * hudMove_ammo_alpha);

draw_set_font(font_holdingB);
if(instance_exists(obj_pPistol)){
	draw_text_transformed(view_wport[0] - 100 + hudMove + hudMove_ammo + hud_sway_h, view_hport[0] - 30 + hud_sway_v, string(obj_pPistol.ammo_pistol), 1.2, 1.2, 0);
	draw_text_transformed(view_wport[0] - 50 + hudMove + hudMove_ammo + hud_sway_h, view_hport[0] - 40 + hud_sway_v, "/" + string(global.pistolAmmoInv), 0.8, 0.8, 0);
}
if(instance_exists(obj_pSmg)){
	draw_text_transformed(view_wport[0] - 100 + hudMove + hudMove_ammo + hud_sway_h, view_hport[0] - 30 + hud_sway_v, string(obj_pSmg.ammo_smg), 1.2, 1.2, 0);
	draw_text_transformed(view_wport[0] - 50 + hudMove + hudMove_ammo + hud_sway_h, view_hport[0] - 40 + hud_sway_v, "/" + string(global.smgAmmoInv), 0.8, 0.8, 0);
}

if (room == roomShop){
	//weapon holding
	draw_set_font(font_holding);
	draw_text_color(view_wport[0] - 46 + hudMove + hud_sway_h, view_hport[0] - 10 + hud_sway_v, holdingGUI, c_white, c_white, c_black, c_black, 0.3);

	draw_set_font(font_holdingB);
	if(instance_exists(obj_pPistol)){
		draw_text_transformed(view_wport[0] - 90 + hudMove + hud_sway_h, view_hport[0] - 10 + hud_sway_v, string(obj_pPistol.ammo_pistol), 1.2, 1.2, 0);
		draw_text_transformed(view_wport[0] - 50 + hudMove + hud_sway_h, view_hport[0] - 20 + hud_sway_v, "/" + string(global.pistolAmmoInv), 0.8, 0.8, 0);
	}
	if(instance_exists(obj_pSmg)){
		draw_text_transformed(view_wport[0] - 100 + hudMove + hud_sway_h, view_hport[0] - 30 + hud_sway_v, string(obj_pSmg.ammo_smg), 1.2, 1.2, 0);
		draw_text_transformed(view_wport[0] - 50 + hudMove + hud_sway_h, view_hport[0] - 40 + hud_sway_v, "/" + string(global.smgAmmoInv), 0.8, 0.8, 0);
	}
}

//inventory
draw_sprite_ext(spr_slot1, 0, view_wport[0] / 2 - 129 + hud_sway_h, animInv + hudMove + hud_sway_v, 1, 1, 0, c_white, animInvAlpha)
draw_sprite_ext(spr_slot2, 0, view_wport[0] / 2 + hud_sway_h, animInv + hudMove + hud_sway_v, 1, 1, 0, c_white, animInvAlpha)
draw_sprite_ext(spr_slot3, 0, view_wport[0] / 2 + 129 + hud_sway_h, animInv + hudMove + hud_sway_v, 1, 1, 0, c_white, animInvAlpha)

if(selectionGUI == 0){
	draw_sprite_ext(spr_slot1, 0, view_wport[0] / 2 - 129 + hud_sway_h, animInv + hudMove + hud_sway_v, 1, 1, 0, c_white, animInvAlpha)
} else if (selectionGUI == 1){
 	draw_sprite_ext(spr_slot1selected, 0, view_wport[0] / 2 - 129 + hud_sway_h, animInv + hudMove + hud_sway_v, 1, 1, 0, c_white, animInvAlpha)
}

if(selectionGUI == 0){
	draw_sprite_ext(spr_slot2, 0, view_wport[0] / 2 + hud_sway_h, animInv + hudMove + hud_sway_v, 1, 1, 0, c_white, animInvAlpha)
} else if (selectionGUI == 2){
 	draw_sprite_ext(spr_slot2selected, 0, view_wport[0] / 2 + hud_sway_h, animInv + hudMove + hud_sway_v, 1, 1, 0, c_white, animInvAlpha)
}

if(selectionGUI == 0){
	draw_sprite_ext(spr_slot3, 0, view_wport[0] / 2 + 129 + hud_sway_h, animInv + hudMove + hud_sway_v, 1, 1, 0, c_white, animInvAlpha)
} else if (selectionGUI == 3){
 	draw_sprite_ext(spr_slot3selected, 0, view_wport[0] / 2 + 129 + hud_sway_h, animInv + hudMove + hud_sway_v, 1, 1, 0, c_white, animInvAlpha)
}

//slots
draw_set_font(font_weapon)

switch(obj_player.inv1){
	case obj_pSword:
		draw_sprite_ext(spr_icon, 0, view_wport[0] / 2 - 117 + hud_sway_h, animInv - 15 + hudMove + hud_sway_v, 1, 1, 0, c_white, animInvAlpha);
	break;
	case obj_pPistol:
		draw_sprite_ext(spr_icon, 1, view_wport[0] / 2 - 117 + hud_sway_h, animInv - 15 + hudMove + hud_sway_v, 1, 1, 0, c_white, animInvAlpha);
	break;
	case obj_pSmg:
		draw_sprite_ext(spr_icon, 2, view_wport[0] / 2 - 117 + hud_sway_h, animInv - 15 + hudMove + hud_sway_v, 1, 1, 0, c_white, animInvAlpha);
	break;
}
switch(obj_player.inv2){
	case obj_pSword:
		draw_sprite_ext(spr_icon, 0, view_wport[0] / 2 + 9 + hud_sway_h, animInv - 15 + hudMove + hud_sway_v, 1, 1, 0, c_white, animInvAlpha);	
	break;
	case obj_pPistol:
		draw_sprite_ext(spr_icon, 1, view_wport[0] / 2 + 9 + hud_sway_h, animInv - 15 + hudMove + hud_sway_v, 1, 1, 0, c_white, animInvAlpha);	
	break;
	case obj_pSmg:
		draw_sprite_ext(spr_icon, 2, view_wport[0] / 2 + 9 + hud_sway_h, animInv - 15 + hudMove + hud_sway_v, 1, 1, 0, c_white, animInvAlpha);	
	break;
}
switch(obj_player.inv3){
	case obj_pSword:
		draw_sprite_ext(spr_icon, 0, view_wport[0] / 2 + 140 + hud_sway_h, animInv - 15 + hudMove + hud_sway_v, 1, 1, 0, c_white, animInvAlpha);	
	break;
	case obj_pPistol:
		draw_sprite_ext(spr_icon, 1, view_wport[0] / 2 + 140 + hud_sway_h, animInv - 15 + hudMove + hud_sway_v, 1, 1, 0, c_white, animInvAlpha);	
	break;
	case obj_pSmg:
		draw_sprite_ext(spr_icon, 2, view_wport[0] / 2 + 140 + hud_sway_h, animInv - 15 + hudMove + hud_sway_v, 1, 1, 0, c_white, animInvAlpha);	
	break;
}

//wave

draw_set_halign(fa_left);
draw_set_valign(fa_bottom);
draw_set_font(font_plateia);
draw_sprite_ext(spr_whiteParticle, 0, view_wport[0] / 2, view_hport[0] / 2 - 240, wave_flash_scale_w, 5, 0, c_white, wave_alpha);
draw_text_transformed_color(20 - hudMove - hudMove_wave + hud_sway_h + wave_text_add_x, view_hport[0] - 70 + hud_sway_v - wave_text_add_y, "WAVE", 1 * wave_scale, 1 * wave_scale, 0, c_white, c_white, c_white, c_white, hudMove_wave_alpha);
draw_text_transformed_color(20 - hudMove - hudMove_wave + hud_sway_h + wave_nr_add_x,   view_hport[0] - 20 + hud_sway_v - wave_nr_add_y, obj_enemySpawner.waveVisual, 2 * wave_scale, 2 * wave_scale, 0, c_white, c_white, c_white, c_white, hudMove_wave_alpha);


//bossbar
if(room == room0){
	draw_set_halign(fa_middle);
	draw_text_transformed_color(view_wport[0] / 2 + hud_sway_h, view_hport[0] / 2 - 330 + hud_sway_v, "PLACEHOLDER", bossbar_alpha * 2, bossbar_alpha * 2, 0, c_white, c_white, c_black, c_black, bossbar_alpha);
	draw_sprite_part_ext(spr_bossbarHealth, bossbar_health_anim, 0, 0, bossbar_width * (bossbar_value / 10), 30, view_wport[0] / 2 - (bossbar_width * 5) + hud_sway_h, view_hport[0] / 2 - 310 + hud_sway_v - 16, 1, 1, c_white, bossbar_alpha); //hp
	draw_sprite_ext(spr_bossbarMid, 0, view_wport[0] / 2 + hud_sway_h, view_hport[0] / 2 - 310 + hud_sway_v, bossbar_width, 1, 0, c_white, bossbar_alpha); //mid
	draw_sprite_ext(spr_bossbarSideLeft, 0, view_wport[0] / 2 - (bossbar_width * 5) + hud_sway_h, view_hport[0] / 2 - 310  + hud_sway_v, 1, 1, 0, c_white, bossbar_alpha); //right
	draw_sprite_ext(spr_bossbarSideRight, 0, view_wport[0] / 2 + (bossbar_width * 5) + hud_sway_h, view_hport[0] / 2 - 310 + hud_sway_v, 1, 1, 0, c_white, bossbar_alpha); //left
	draw_text_transformed_color(view_wport[0] / 2 - (bossbar_width * 5) + hud_sway_h + 30, view_hport[0] / 2 - 270  + hud_sway_v, "value: " + string(round(bossbar_value)), 0.5, 0.5, 0, c_black, c_black, c_white, c_white, bossbar_alpha);
}

//gui start anim
draw_set_halign(fa_middle);
if(hudMove_text_tog){
	draw_sprite_ext(spr_whiteParticle, 0, 0, view_hport[0] / 4.5, view_wport[0] / 2, 2, 0, c_white, hudMove_text_alpha * 1.2);
	draw_text_transformed_color(view_wport[0] / 2 + hudMove_text_shake, view_hport[0] / 2 - 200, hudMove_text, 1, 1, 0, c_black, c_black, c_black, c_black, hudMove_text_alpha * 0.8);
}

draw_set_font(font_consolas);
draw_set_halign(fa_left);
draw_set_valign(fa_top);
draw_text_transformed_color(0 + random_range(0, 3), 0, gui_text_current, 1, 1, 0, c_white, c_white, c_white, c_white, hudMove_text_alpha / 2);

//pause screen
draw_set_font(font_plateia);
draw_set_valign(fa_middle);
draw_set_halign(fa_center);
draw_sprite_stretched_ext(spr_blackScreen, 0, view_wport[0] / 2, 0, 99999, 99999, c_white, pausedAlpha);
draw_text_transformed_color(view_wport[0] / 1.35 + random_range(-10, 10), view_hport[0] / 4, "PAUSED", 3, 3, 0, c_white, c_white, c_white, c_white, pausedAlpha);
draw_text_transformed_color(view_wport[0] / 1.35, view_hport[0] / 4, "PAUSED", 3, 3, 0, c_white, c_white, c_white, c_white, pausedAlpha * 2);

draw_text_transformed_color(view_wport[0] / 1.3 - 50 - 50 + (pausedAlpha * 100), view_hport[0] / 4 + 200, "[BACKSPACE]", 2, 2, 0, c_white, c_white, c_white, c_white, pausedAlpha * 2);
draw_text_transformed_color(view_wport[0] / 1.3 + 100 + 50 - (pausedAlpha * 100), view_hport[0] / 4 + 240, "BACK TO MENU", 1, 1, 0, c_white, c_white, c_white, c_white, pausedAlpha * 1.5);

draw_text_transformed_color(view_wport[0] / 1.3 - 50 - 50 + (pausedAlpha * 100), view_hport[0] / 4 + 300, "[ESCAPE]", 2, 2, 0, c_white, c_white, c_white, c_white, pausedAlpha * 2);
draw_text_transformed_color(view_wport[0] / 1.3 + 100 + 50 - (pausedAlpha * 100), view_hport[0] / 4 + 340, "RESUME", 1, 1, 0, c_white, c_white, c_white, c_white, pausedAlpha * 1.5);

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
draw_text_color(view_wport[0] - 10, 25, global.ver, c_white, c_white, c_white, c_white, 0.2);
#endregion
