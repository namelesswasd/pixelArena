/// @argument x
/// @argument y
/// @argument width
/// @argument height
/// @argument LIST_TYPE

//args
var _x = argument[0];
var _y = argument[1];
var _width = argument[2];
var _height = argument[3];
var _type = argument[4];

//create list
if(_type == LVL_TYPE.MAIN) var _list = instance_create_layer(_x, _y, "Instances", obj_unlockList);


//set values
with(_list){
	width = _width;
	height = _height;
	type = _type;
	
	//populate list
	if (_type == LVL_TYPE.MAIN){
		ds_list_add(list, ["1", "SWORD", "The first weapon in the game.\nModern and reliable."]);
		ds_list_add(list, ["2", "?", "???"]);
		ds_list_add(list, ["3", "?", "???"]);
		ds_list_add(list, ["4", "?", "???"]);
		ds_list_add(list, ["5", "?", "???"]);
		ds_list_add(list, ["6", "?", "???"]);
		ds_list_add(list, ["7", "?", "???"]);
		ds_list_add(list, ["8", "?", "???"]);
		ds_list_add(list, ["9", "?", "???"]);
		ds_list_add(list, ["10", "?", "???"]);
	}
}

return _list;