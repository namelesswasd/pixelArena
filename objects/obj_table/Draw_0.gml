draw_self();

//interact
if(place_meeting(x, y, obj_player)) is_interact = 1;
else is_interact = 0;

if(is_interact){
	draw_sprite_ext(spr_interactButton, 0, x, y - 100 + inter_anim_y, 0.5, 0.5, 0, c_white, inter_anim_alpha);
}

//objects
switch(x){
	case 2366:
		draw_sprite_ext(spr_sword, 0, x - 20, y - 45, 1, 1, -60, c_white, 1);
		scr_interact("pickup", obj_pSword, 1);
	break;
}