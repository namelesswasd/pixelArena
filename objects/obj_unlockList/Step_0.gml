//mouse input
var _mouseX = device_mouse_x_to_gui(0);
var _mouseY = device_mouse_y_to_gui(0);

//option saving
ini_open("settings.ini");	

//operate on list
var _size = ds_list_size(list);

for (var i = 0; i < _size; i++){
	
	//coords
	var _x1 = x + padding + width * i + itemW * i - menuSeek;
	var _y1 = y + padding;
	var _x2 = _x1 + width + padding;
	var _y2 = _y1 + 200;
	
	//get if hovering
	
	var _hover = point_in_rectangle(_mouseX, _mouseY, _x1, _y1, _x2, _y2);
	
	if (_hover){
		//hover var
		hoverID = i;
	}
}

if(menuSeek <= 0) {
	menuSeek = 0;
	obj_seekButtonL.image_alpha = 0.2;
} else {
	obj_seekButtonL.image_alpha = 1;	
}


show_debug_message(menuSeek);



