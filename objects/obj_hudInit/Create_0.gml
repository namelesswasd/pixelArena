pa_bg_add = 0;
pa_bg_alpha = 0;

pa_attempt_text = "initializing attempt ver." + string(global.attempt) + ".........";
pa_attempt_text_current = "";
pa_attempt_text_len = string_length(pa_attempt_text);
pa_attempt_text_time = 0;

interval = 0;
fpsreal = 0;
cps = 0;
cpsFinal = 0;
rot = random_range(0, 360);