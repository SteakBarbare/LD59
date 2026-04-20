if (distance_to_object(objPlayer) < 200) {
	var guiX = display_get_gui_width();
	var guiY = display_get_gui_height();
	draw_set_font(fntMainFont)
	draw_set_alpha(1);
	draw_text(guiX * 0.5 - 24, guiY * 0.5 - 96, $"Enter code : {inputTextByPlayer}")
	draw_text(guiX * 0.5 - 24, guiY * 0.5 - 72, $"Press Enter to validate")
}
