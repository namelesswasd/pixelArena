if(is_interact){
	inter_anim_alpha = lerp(inter_anim_alpha, 1, 0.15);
	inter_anim_y = lerp(inter_anim_y, 0, 0.15);
} else {
	inter_anim_alpha = lerp(inter_anim_alpha, 0, 0.15);
	inter_anim_y = lerp(inter_anim_y, 50, 0.15);
}