scale = 1.8;
arrow_sway = 0;
arrow_toggle = 1;

global.tutorialPlayed = 1;
ini_open("settings.ini");
ini_write_real("Tutorial", "tut_played", global.tutorialPlayed);
ini_close();