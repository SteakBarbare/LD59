/// @description Insert description here
// You can write your code in this editor

draw_set_halign(fa_center);
draw_set_valign(fa_middle);
draw_set_font(fntMenu);

draw_text_transformed(display_get_gui_width() / 2 - 400, display_get_gui_height() / 2 + 300, "Press Any Key to Start", textScale, textScale, 0);

draw_set_font(fntMainFont);
draw_set_halign(fa_left);
draw_set_valign(fa_top);