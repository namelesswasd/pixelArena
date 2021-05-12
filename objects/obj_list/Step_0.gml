//mouse input
var _mouseX = device_mouse_x_to_gui(0);
var _mouseY = device_mouse_y_to_gui(0);
var _mousePress = mouse_check_button_pressed(mb_left);

//option saving
ini_open("settings.ini");	

//operate on list
var _size = ds_list_size(list);

for (var i = 0; i < _size; i++){
	//array data
	var _arr = list[| i];
	var _name = _arr[PR.NAME];
	var _sel = _arr[PR.SELECTED];
	var _vals = _arr[PR.VALUES];
	
	//coords
	var _x1 = x + padding;
	var _y1 = y + padding + itemH * i;
	var _x2 = x + width;
	var _y2 = _y1 + itemH;
	
	//get if hovering
	
	var _hover = point_in_rectangle(_mouseX, _mouseY, _x1, _y1 - itemH, _x2, _y2 - itemH);
	
	if (_hover){
		//hover var
		hoverID = i;
		
		//select
		if(_sel == -1 and _mousePress){
			switch (_name){
				case "BACK":
					instance_destroy();
				break;
			}
		}
		
		//change value
		if(_sel > -1){
			var _wheel = mouse_check_button_pressed(mb_right) - mouse_check_button_pressed(mb_left);
			
			//input
			if(_wheel != 0){
				_sel += _wheel;
				
				//clamp
				_sel = clamp(_sel, 0, array_length_1d(_vals) - 1);
				
				//apply to list
				_arr[@ PR.SELECTED] = _sel;
				
				
				//apply to gameplay options
				if(type == LIST_TYPE.GAMEPLAY){
					switch (_name){
						//camera shake
						case "CAMERA SHAKE":
							global.camShake = _vals[_sel];
								switch(global.camShake){
									case "OFF":
										global.camShake = 0;
									break;
									case "ON":
										global.camShake = 1;
									break;
								}
							ini_write_real("Gameplay", "camera_shake", global.camShake);
						break;
						
						//fps stats
						case "STATS":
							global.statsHud = _vals[_sel];
								switch(global.statsHud){
										case "OFF":
											global.statsHud = 0;
										break;
										case "FPS":
											global.statsHud = 1;
										break;
									}
								ini_write_real("Gameplay", "stats_hud", global.statsHud);
						break;
						
						//skip menu cutscene
						case "SKIP MENU CUTSCENE":
							global.skipMenuCut = _vals[_sel];
							switch(global.skipMenuCut){
									case "OFF":
										global.skipMenuCut = 0;
									break;
									case "ON":
										global.skipMenuCut = 1;
									break;
								}
							ini_write_real("Gameplay", "skip_menu_cutscene", global.skipMenuCut);
						break;
						
						//damage intensity
						case "DAMAGE TAKEN INTENSITY":
							global.dmgInt = _vals[_sel];
							switch(global.dmgInt){
								case "LOW":
									global.dmgInt = 0;
								break;
								case "MEDIUM":
									global.dmgInt = 1;
								break;
								case "HIGH":
									global.dmgInt = 2;
								break;
								case "HUGE":
									global.dmgInt = 3;
								break;
							}
							ini_write_real("Gameplay", "dmg_intensity", global.dmgInt);
						break;
						
						//hud sway
						case "HUD SWAY":
							global.hud_sway_intensity = _vals[_sel];
							switch(global.hud_sway_intensity){
								case "OFF":
									global.hud_sway_intensity = 0;
								break;
								case "LOW":
									global.hud_sway_intensity = 1;
								break;
								case "MEDIUM":
									global.hud_sway_intensity = 2;
								break;
								case "HIGH":
									global.hud_sway_intensity = 3;
								break;
							}
							ini_write_real("Gameplay", "hud_sway", global.hud_sway_intensity);
						break;
						
						//AUDIO
						
						//music vol
						case "MUSIC VOLUME":
							global.musicLevel = _vals[_sel];
							switch(global.musicLevel){
								case "0%":
									global.musicLevel = 0;
								break;
								case "10%":
									global.musicLevel = 1;
								break;
								case "20%":
									global.musicLevel = 2;
								break;
								case "30%":
									global.musicLevel = 3;
								break;
								case "40%":
									global.musicLevel = 4;
								break;
								case "50%":
									global.musicLevel = 5;
								break;
								case "60%":
									global.musicLevel = 6;
								break;
								case "70%":
									global.musicLevel = 7;
								break;
								case "80%":
									global.musicLevel = 8;
								break;
								case "90%":
									global.musicLevel = 9;
								break;
								case "100%":
									global.musicLevel = 10;
								break;
							}
								ini_write_real("Audio", "music_level", global.musicLevel);
							break;
							
						//bg flash
						case "BACKGROUND FLASH":
							global.bgFlash = _vals[_sel];
							switch(global.bgFlash){
								case "OFF":
									global.bgFlash = 0;
								break;
								case "ON":
									global.bgFlash = 1;
								break;
							}
								ini_write_real("Audio", "bg_flash", global.bgFlash);
						break;
						
						//sfx vol
						case "SFX VOLUME":
							global.sfxLevel = _vals[_sel];
							switch(global.sfxLevel){
								case "0%":
									global.sfxLevel = 0;
								break;
								case "10%":
									global.sfxLevel = 1;
								break;
								case "20%":
									global.sfxLevel = 2;
								break;
								case "30%":
									global.sfxLevel = 3;
								break;
								case "40%":
									global.sfxLevel = 4;
								break;
								case "50%":
									global.sfxLevel = 5;
								break;
								case "60%":
									global.sfxLevel = 6;
								break;
								case "70%":
									global.sfxLevel = 7;
								break;
								case "80%":
									global.sfxLevel = 8;
								break;
								case "90%":
									global.sfxLevel = 9;
								break;
								case "100%":
									global.sfxLevel = 10;
								break;
							}
								ini_write_real("Audio", "sfx_level", global.sfxLevel);
						break;
						
						//VIDEO
						
						case "DISPLAY MODE":
							global.displayMode = _vals[_sel];
							switch(global.displayMode){
								case "WINDOWED":
									global.displayMode = 0;
								break;
								
								case "FULLSCREEN":
									global.displayMode = 1;
								break;
							}
						break;
					}
				}
			}
		}
	}
}

//audio
audio_sound_gain(global.musicSnd, global.musicLevel / 10, 100); //music
global.sfxVol = global.sfxLevel;
ini_close();


