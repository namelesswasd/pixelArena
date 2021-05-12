if(hp_last != hp){
	global.dmgEffect = 1;	
}

if(ch_toggle == 0){
	switch(holding){
		case "3": //sword
			instance_create_layer(mouse_x, mouse_y, "crosshair", obj_ch_sword);
		break;
		
		case "4": //pistol
			instance_create_layer(mouse_x, mouse_y, "crosshair", obj_ch_pistol);
		break;
		
		case "5": //smg
			instance_create_layer(mouse_x, mouse_y, "crosshair", obj_ch_smg);
		break;
		
		case "-4": //empty
			instance_create_layer(mouse_x, mouse_y, "crosshair", obj_ch_empty);
		break;
	}
}
