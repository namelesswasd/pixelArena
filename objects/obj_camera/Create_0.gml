

//cutscene
cutsceneEndAlpha = 1;

//zoom
zoomBack = 0;
zoom = 1;

//game speed
global.game_speed = 1;

//angle
image_angle = 30;

//player death
deathToggle = 0;

//gui start animation
switch(room){
	case room0:
		hudMove = 300;
		
		//tutorial
		hudMove_hp = 0;
		hudMove_ammo = 0;
		hudMove_wave = 0;
	break;
	case roomTutorial:
		hudMove = 0;
		
		//tutorial
		hudMove_hp = 300;
		hudMove_ammo = 300;
		hudMove_wave = 300;
	break;
}

hudMove_text = "INITIALIZING HEALTH POINT MODULE.";
hudMove_text_tog = 0;
hudMove_text_alpha = 0;
hudMove_text_shake = random_range(-5, 5);
hudMove_hp_tog = 0;
hudMove_hp_alpha = 0;
hudMove_ammo_tog = 0;
hudMove_ammo_alpha = 0;
hudMove_wave_tog = 0;
hudMove_wave_alpha = 0;
hudMove_init_tog = 0;
hudMove_init_complete = 0;
hudMove_init_timer = 0;

gui_text = "// initializing game user interface\nhud.initialize(\"pixel_arena\", v1.atestat, 1.3)\n\n----HUD INITIALIZING---\nWELCOME USER !$!(*@%&!@*%&)\nLAST LOGIN: 14/06/42\nLAST LOGIN ATTEMPT: 01/01/96\nPLEASE UPDATE THE APPLICATION, FILES MAY BE CORRUPT!\n\nLOADING ASSETS:\n== spr_healthBar : ---------------------------- | DONE \n== spr_icon : ---------------------------- | DONE \n== spr_blackScreen : ---------------------------- | DONE \n== spr_dmgScreen : ---------------------------- | DONE \n== spr_introScreen : ---------------------------- | DONE \n== spr_dmc : ---------------------------- | DONE \n\nLOADING TEXT:\n== HUD_HEALTH : ---------------------------- | DONE \n== HUD_SEPARATOR : ---------------------------- | DONE \n== HUD_WEAPON_BACK : ---------------------------- | DONE \n== HUD_WEAPON_AMMO : ---------------------------- | DONE \n== HUD_WAVE_TEXT : ---------------------------- | DONE \n\n----INITIAZATION COMPLETE----\n\n\nGOOD LUCK!\n";
gui_text_current = ""
gui_text_length = string_length(gui_text);
gui_text_time = 0;

animInvAlpha = 0;

speed_tog = 0;

//dmg eff
global.dmgEffect = 0;
switch(global.dmgInt){
	case 0:
		dmgEffectAlpha = 0.1;
	break;
	case 1:
		dmgEffectAlpha = 0.2;
	break;
	case 2:
		dmgEffectAlpha = 0.3;
	break;
	case 3:
		dmgEffectAlpha = 0.5;
	break;
}


//camera

camera = camera_create();

var vm = matrix_build_lookat(x, y, -10, x, y, 0, 0, 1, 0);
pm = matrix_build_projection_ortho(854, 480, 1, 10000);

camera_set_view_mat(camera, vm);
camera_set_proj_mat(camera, pm);

view_camera[0] = camera;

follow = obj_player;
followWelcomeDelay = 0;
xTo = x;
yTo = y;

//hud sway
hud_sway_h = 0;
hud_sway_v = 0;
s_int = 0;

//pause function
is_paused = 0;
pausedAlpha = 0;

//input secret
secret_tog = 0;

//wave animation
wave_tog = 0;
wave_scale = 1;
wave_flash_scale_w = 0;
wave_alpha = 0;
wave_text_add_x = 0;
wave_text_add_y = 0;
wave_nr_add_x = 0;
wave_nr_add_y = 0;

//bossbar animation
bossbar_tog = 0;
bossbar_alpha = 0;
bossbar_width = 1;

bossbar_value = 100;

bossbar_health_anim = 0;

//eq
eq_tog = 0;

//misc
hp_draw = obj_player.hp;

animInv = 900;
invToggle = 0;
invTimer = 0;

selection = 0;
selectionGUI = 0;

holdingGUI = "Nothing";

interval = 0;
fpsreal = 0;

lazerShake = 0;

bulletShake = 0;

dir = 0;

speed = 0;

intensity = 10;

