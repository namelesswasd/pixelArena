//draw bg

//draw list
var _size = ds_list_size(list);

for (var i = 0; i < _size; i++){
	//array data
	var _arr = list[| i];
	var _name = _arr[PR.NAME];
	var _sel = _arr[PR.SELECTED];
	var _vals = _arr[PR.VALUES];
	var _desc = _arr[PR.DESC];
	
	//pos to draw
	var _x = x + padding;
	var _y = y + padding + itemH * i;
	
	//spacing
	_spacing = 0;
	if(i == 0) var _spacing = 20;
	if(i == 6) var _spacing = 20;
	if(i == 8) var _spacing = 10;
	if(i == 10) var _spacing = 20;
	if(i == 12) var _spacing = 20;
	
	draw_set_font(font_plateia);
	draw_set_halign(fa_right);
	//color
	if(i != hoverID) {
		draw_set_color(c_white);
		draw_rectangle_color(_x - 30, _y - 30, _x - 17 + _spacing, _y + 5, c_white, c_white, c_white, c_white, false);	
	} else {
		draw_rectangle_color(_x - 30, _y - 30, _x + width - padding, _y + 5, c_white, c_gray, c_white, c_white, false);
		draw_set_color(c_black);
		draw_text_ext_color(room_width - padding, room_height - padding * 2, _desc, 20, 1000, c_gray, c_white, c_gray, c_white, 1)
	}
	
	//draw name
	draw_set_halign(fa_left);
	draw_text(_x + _spacing, _y, _name);
	
	//draw value
	if (_sel > -1){
		var _val = _vals[_sel];
		
		draw_set_halign(fa_right);
		draw_text(x + width - padding, _y, _val);
		draw_set_halign(fa_left);
	}
	
	//reset color
	draw_set_color(c_white);
}
