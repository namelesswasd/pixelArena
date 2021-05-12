hud_sway_h = obj_camera.hud_sway_h;
hud_sway_v = obj_camera.hud_sway_v;

if(global.combo > 0) comboTog = 1;
else comboTog = 0;

if      (global.combo < 10)                          comboRank = 0;
else if (global.combo >= 10 and global.combo < 20)   comboRank = 1;
else if (global.combo >= 20 and global.combo < 30)   comboRank = 2;
else if (global.combo >= 30 and global.combo < 40)   comboRank = 3;
else if (global.combo >= 40 and global.combo < 50)   comboRank = 4;
else if (global.combo >= 50 and global.combo < 60)   comboRank = 5;
else if (global.combo >= 60 and global.combo < 70)   comboRank = 6;
else if (global.combo >= 70)                         comboRank = 7;


comboTemp = global.combo;

shake = comboRank / 5;

comboShakeV = random_range(shake, -shake);
comboShakeH = random_range(shake, -shake);

if(comboScaleTog){
	comboScale = lerp(comboScale, 2, 0.9);
	if(comboScale > 1.9) comboScaleTog = 0;
} else {
	comboScale = lerp(comboScale, 1, 0.2);	
}

if(comboAlphaTog){
	if(!obj_camera.is_paused) comboAlpha -= 0.01;
	if(comboAlpha <= 0) {
		global.combo = 0;
		comboAlphaTog = 0;
	}
}