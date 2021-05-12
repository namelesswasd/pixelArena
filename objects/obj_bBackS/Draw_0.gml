draw_self();
draw_set_halign(fa_left);
draw_set_valign(fa_bottom);

draw_sprite_ext(spr_credit, 0, x + 27, y - 38, 0.5, 0.5, 0, c_black, 0.5);
draw_sprite_ext(spr_credit, 0, x + 25, y - 40, 0.5, 0.5, 0, c_white, 1);
draw_text_transformed_color(x + 57, y - 25, string(global.credits) + " /WIP", 1, 1, 0, c_black, c_black, c_black, c_black, 0.5);
draw_text_transformed_color(x + 55, y - 27, string(global.credits) + " /WIP", 1, 1, 0, c_yellow, c_orange, c_yellow, c_orange, 1);


draw_set_halign(fa_right);