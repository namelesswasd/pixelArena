if(comboTemp != global.combo){
	if(global.comboCurrent < global.combo) global.comboCurrent = global.combo;
	comboScaleTog = 1;
	comboCool = 0;
	comboAlpha = 1;
	comboAlphaTog = 0;
} else if(comboTemp == global.combo and comboAlphaTog == 0 and global.combo > 0) {
	comboCool++;
	if(comboCool >= 100) comboAlphaTog = 1;
}

