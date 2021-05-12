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
if(_type == LIST_TYPE.GAMEPLAY) var _list = instance_create_layer(_x, _y, "Instances", obj_list);


//set values
with(_list){
	width = _width;
	height = _height;
	type = _type;
	
	//populate list
	if(_type == LIST_TYPE.GAMEPLAY){
		ds_list_add(list, ["GAMEPLAY", -1, [], ""]);
		ds_list_add(list, ["DAMAGE TAKEN INTENSITY", global.dmgInt, ["LOW", "MEDIUM", "HIGH", "HUGE"], "HOW MUCH THE SCREEN FLASHES WHEN TAKING DAMAGE."])
		ds_list_add(list, ["SKIP MENU CUTSCENE", global.skipMenuCut, ["OFF", "ON"], "SKIP THE BEGINNING CUTSCENE WHEN LAUNCHING A ENDLESS RUN."]);
		ds_list_add(list, ["CAMERA SHAKE", global.camShake, ["OFF", "ON"], "CAMERA SHAKES WHEN SHOOTING, BEAMS ARE STRIKING ETC."]);
		ds_list_add(list, ["HUD SWAY", global.hud_sway_intensity, ["OFF", "LOW", "MEDIUM", "HIGH"], "HOW MUCH THE HUD MOVES WHEN MOVING."]);
		ds_list_add(list, ["STATS", global.statsHud, ["OFF", "FPS"], "FPS COUNTER."]);
			
		ds_list_add(list, ["AUDIO", -1, [], ""]);
		ds_list_add(list, ["MUSIC VOLUME", global.musicLevel, ["0%", "10%", "20%", "30%", "40%", "50%", "60%", "70%", "80%", "90%", "100%"], "CONTROL THE VOLUME OF THE MUSIC."]);
		ds_list_add(list, ["BACKGROUND FLASH", global.bgFlash, ["OFF", "ON"], "SCREEN FLASHES BASED ON THE SONG THAT IS PLAYED."]);
		ds_list_add(list, ["SFX VOLUME", global.sfxLevel, ["0%", "10%", "20%", "30%", "40%", "50%", "60%", "70%", "80%", "90%", "100%"], "CONTROL THE VOLUME OF THE SOUND EFFECTS."]);
		
		ds_list_add(list, ["VIDEO", -1, [], ""]);
		ds_list_add(list, ["DISPLAY MODE", global.displayMode, ["WINDOWED", "FULLSCREEN"], "CHANGES HOW THE GAME IS DISPLAYED ON SCREEN."]);
		
		ds_list_add(list, ["BACK", -1, [], ""]);
	}
}

return _list;