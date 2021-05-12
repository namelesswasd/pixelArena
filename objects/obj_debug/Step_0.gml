/*
show_debug_message("\n\n\n\n\n\n\n");

//cursor scale // with (obj_ch1) show_debug_message(image_xscale);

with (obj_playerRightHand) show_debug_message("obj_playerRightHand: " + string(image_angle));
with (obj_playerLeftHand) show_debug_message("obj_playerLeftHand: " + string(image_angle));

with (obj_camera) {
	show_debug_message("invToggle: " + string(invToggle));
	show_debug_message("animInv: " + string(animInv));
	show_debug_message("invTimer: " + string(invTimer));
	show_debug_message("selection: " + string(selection));
}

with (obj_player) {
	show_debug_message("holding: " + string(holding));	
	show_debug_message("stance: " + string(stance));	
	show_debug_message(string(global.isReloading));
	show_debug_message("dash: " + string(dash) + " | dashsp: " + string(dashsp));
	show_debug_message("image index: " + string(image_index))
}
/*
with (obj_particleSpawner){
	show_debug_message("instance count: " + string(instance_count));
}



with (obj_pSword){
	show_debug_message("sword angle: " + string(image_angle));	
}

with (obj_enemyLazer){
	show_debug_message("--LAZER--");
	show_debug_message("width: " + string(image_xscale));
	show_debug_message("height: " + string(image_yscale));
}

with (obj_camera){
	//show_debug_message("interval: " + string(interval));
	show_debug_message("speed camera: " + string(speed));
	show_debug_message("zoom: " + string(zoom));
}

