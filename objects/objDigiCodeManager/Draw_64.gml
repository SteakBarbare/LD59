/// @description Insert description here
// You can write your code in this editor

var guiX = display_get_gui_width();
var guiY = display_get_gui_height();

draw_set_font(fntMainFontBold);
draw_set_halign(fa_left)
draw_set_valign(fa_middle)
draw_text(guiX * 0.1, guiY - 150, "Password:");
draw_set_font(fntTerminal);
draw_text(guiX * 0.1, guiY - 100, "1st Word: " + foundWords[0] + " 2nd Word: " + foundWords[1] + " 3rd Word: " + foundWords[2]);

draw_set_font(fntMainFont);