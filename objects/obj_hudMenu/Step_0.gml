rot = rot + 0.3;

if(global.profileMenuToggle){
	menuSelect = 1;	
}

//cutscene
if(obj_bPlayEndless.cutsceneMenu == 1){
	if(global.skipMenuCut == 1) room_goto(room0);
	if(obj_bPlayEndless.cutsceneMenu == 1){
		instance_create_layer(room_width / 2, room_height / 2, "Instances", obj_blackScreen);
		obj_bPlayEndless.cutsceneMenu = 2;
	}
		part_particles_create(global.partSystem, random_range(0, room_width), room_height, global.partMenuLines, 1);
		playerMoveCut = lerp(playerMoveCut, 290, 0.05);
		logoMove = lerp(logoMove, -300, 0.05);
		hudMove = lerp(hudMove, -2000, 0.05);
		playerZoomCut = lerp(playerZoomCut, 1.2, 0.05);
		playerShakeCut = lerp(playerShakeCut, 1.3, 0.05);
} else {
	part_particles_create(global.partSystem, random_range(room_width / 3, room_width), room_height, global.partMenuLines, 1);
	if(optionsToggle > 0){
		hudMove = lerp(hudMove, -1300, 0.05);
		logoMove = lerp(logoMove, -500, 0.05);
		if(hudMove >= -1290 and optionsToggle == 1) optionsToggle = 2;
		if(optionsToggle == 2) {
			create_list(30, 100, 700, 200, LIST_TYPE.GAMEPLAY);
			optionsToggle = 3;
		}
	} else {
		if(menuSelect == 0){
			hudMove = lerp(hudMove, 300, 0.05);
			
			global.alphaMenuToggle = lerp(global.alphaMenuToggle, 1, 0.05);
		} else if(menuSelect == 1){
			hudMove = lerp(hudMove, 2100, 0.05);
			global.alphaMenuToggle = lerp(global.alphaMenuToggle, 0, 0.05);
		}
		playerMove = lerp(playerMove, 300, 0.05);
		logoMove = lerp(logoMove, 300, 0.05);
	}
}

if(keyboard_check_pressed(ord("T"))){
	room_goto(roomTutorial);	
}

//logo
part_particles_create(global.partSystem, -125 + logoMove * 1.1, random_range(100, 200), global.partMenuLogo, 1);
part_particles_create(global.partSystem, -195 + logoMove * 1.1, random_range(210, 300), global.partMenuLogo, 1);

#region //metering

interval++;
if(interval >= 60){
	interval = 0;
	
	//fps
	fpsreal = floor(fps_real);

}
#endregion