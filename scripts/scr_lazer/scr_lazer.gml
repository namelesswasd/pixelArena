/// @param x
/// @param y
/// @param color

var _x = argument0;
var _y = argument1;
var _color = argument2;

direction = point_direction(_x, _y, mouse_x, mouse_y);

var max_length = 800;
var solid_obj = obj_arena;

for(var i = 0; i < max_length; i++){
	var lx = x + lengthdir_x(i, direction);
	var ly = y + lengthdir_y(i, direction);
	
	if(collision_point(lx, ly, solid_obj, false, true)) break;
}

height = sin(random(0.5));
if(_color == "red"){
	draw_set_color(c_maroon);
	draw_line_width(x, y, x + lengthdir_x(i, direction), y + lengthdir_y(i, direction), (height * 9) + 0.1);
	draw_set_color(c_red);
	draw_line_width(x, y, x + lengthdir_x(i, direction), y + lengthdir_y(i, direction), (height * 5) + 0.1);
	draw_line(_x, _y, lx, ly);
	draw_set_color(c_white);
} else if (_color == "blue"){
	draw_set_color(c_teal);
	draw_line_width(x, y, x + lengthdir_x(i, direction), y + lengthdir_y(i, direction), (height * 9) + 0.1);
	draw_set_color(c_blue);
	draw_line_width(x, y, x + lengthdir_x(i, direction), y + lengthdir_y(i, direction), (height * 5) + 0.1);
	draw_line(_x, _y, lx, ly);
	draw_set_color(c_white);
}
