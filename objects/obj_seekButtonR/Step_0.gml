if(mouse_check_button_pressed(mb_left) and position_meeting(mouse_x, mouse_y, obj_seekButtonR)){
	tog = 1;
	acc = 50;
}

if(tog == 1){
	obj_unlockList.menuSeek += acc;
	if(acc > 0){
		acc = acc - 2;
	} else tog = 0;
}