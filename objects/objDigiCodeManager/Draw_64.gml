/// @description Insert description here
// You can write your code in this editor

draw_set_font(fntMainFontBold);
draw_text(100, display_get_gui_height() - 150, "Password:");
draw_set_font(fntTerminal);
draw_text(100, display_get_gui_height() - 100, "1st Word: " + foundWords[0] + " 2nd Word: " + foundWords[1] + " 3rd Word: " + foundWords[2]);

draw_set_font(fntMainFont);