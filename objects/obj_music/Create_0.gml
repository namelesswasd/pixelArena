/*debug*/ show_debug_overlay(false);

show_debug_message("NAME " + string(environment_get_variable("USERNAME")));
global.user_name = environment_get_variable("USERNAME");
if(string_length(global.user_name) <= 5) global.user_name = ""; //the username will not be used if it has less than 5 chars

global.musicSnd = 0;

ini_open("settings.ini");
musicIntroVol = ini_read_real("Audio", "music_level", 1);
global.musicLevel = musicIntroVol;
global.sfxVol = ini_read_real("Audio", "sfx_level", 10);
global.bgFlash = ini_read_real("Gameplay", "bg_flash", 1);
//i'm so sorry
global.displayMode = ini_read_real("Video", "display_mode", 0);
ini_close();

randomize();
sndRand = round(random_range(0, 3));
sndRandPrev = sndRand;

bpm = 0;
bpmToMs = 0;
bpmTemp = 0;
temp = 0;
bpmFlashSide = 1;
bpmFlashAlpha = 1;

musicText = "";

is_playing = 0;
is_first = 0; 