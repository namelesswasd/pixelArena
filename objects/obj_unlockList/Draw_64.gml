draw_set_valign(fa_top);

//draw list
var _size = ds_list_size(list);

for (var i = 0; i < _size; i++){
	//array data
	var _arr = list[| i];
	var _lvl = _arr[LPR.LVL];
	var _name = _arr[LPR.NAME];
	var _desc = _arr[LPR.DESCRIPTION];
	
	//pos to draw
	var _x = x + padding + width * i + itemW * i - menuSeek;
	var _y = y + padding;
	
	draw_set_font(font_plateia);
	draw_set_halign(fa_left);
	
	//color
	if(i != hoverID) { //unselected
		draw_rectangle_color(_x, _y, _x + width, _y + height, c_white, c_white, c_white, c_white, false);
		draw_rectangle_color(_x + border, _y + border, _x + width - border, _y + height - border, colorBoxUnsel, colorBoxUnsel, colorBoxUnsel, colorBoxUnsel, false);
		
		//draw lvl
		draw_set_halign(fa_center);
		draw_text_ext_transformed(_x + width / 2, _y, _lvl, 999, 999, 2, 2, 0);
		
		
		//separator
		draw_rectangle_color(_x + 20, _y + padding, _x + width - 20, _y + 7 + padding, c_white, c_white, c_white, c_white, false);
		
	} else { //selected
		draw_rectangle_color(_x, _y, _x + width, _y + height, c_white, c_white, c_white, c_white, false);
		draw_rectangle_color(_x + border, _y + border, _x + width - border, _y + height - border, colorBoxSel, colorBoxSel, colorBoxSel, colorBoxSel, false);
		
		draw_text_ext_transformed_color(50, 150, _name, 20, 9999, 2, 2, 0, c_white, c_white, c_white, c_white, 1);
		draw_text_ext_transformed_color(50, 200, _desc, 20, 9999, 1, 1, 0, c_white, c_white, c_white, c_white, 0.7);
		
		//draw lvl
		draw_set_halign(fa_center);
		draw_text_ext_transformed(_x + width / 2, _y, _lvl, 999, 999, 2, 2, 0);
		
		
		//separator
		draw_rectangle_color(_x + 20, _y + padding, _x + width - 20, _y + 7 + padding, c_white, c_white, c_white, c_white, false);
		
		#region //image
		
		if(i == 0) draw_sprite_ext(spr_sword, 0, room_width - 450, 300, 5, 5, 310, c_white, 1);
		else draw_text_transformed_color(room_width - 300, 0, "?", 10, 10, 0, c_white, c_white, c_white, c_white, 1);
		
		#endregion
	}
	
	#region //image preview icon
	
	if(i == 0) draw_sprite_ext(spr_icon, 0, _x + width / 2, _y + padding * 2.5, 1.5, 1.5, 0, c_white, 1);
	else draw_text_transformed_color(_x + width / 2, _y + padding * 1.2, "?", 3, 3, 0, c_white, c_white, c_white, c_white, 1);
	
	#endregion
}
