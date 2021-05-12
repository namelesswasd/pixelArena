/// @param type
/// @param object
/// @param slot

var _type = argument0;
var _obj = argument1;
var _slot = argument2;

if(keyboard_check_pressed(ord("E"))){
	switch(_type){
		case "pickup":
			switch(_slot){
				case 1:
					obj_player.inv1 = _obj;
				break;
				case 2:
					obj_player.inv2 = _obj;
				break;
				case 3:
					obj_player.inv3 = _obj;
				break;
			}
		break;
	}
}