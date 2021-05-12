image_alpha = lerp(image_alpha, 1, 0.05);

if(image_alpha >= 0.9){
	switch(room){
		case room0: room_goto(roomDeath); break;
		case roomTutorial: room_goto(roomInit); break;
		case roomMenu: room_goto(roomInit); break;
	}
}