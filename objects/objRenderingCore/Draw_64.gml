/// @description Display draw mod
if(isDebugOn) {
	var str = "";
	switch(drawOption) {
		case DrawOptionId.DEFAULT:
			str = "Default";
			break;
		case DrawOptionId.LIGHT:
			str = "Light Only";
			break;
		case DrawOptionId.NORMAL:
			str = "Normal Only";
			break;
		case DrawOptionId.DEPTH:
			str = "Depth Only";
			break;
		default:
			str = "Unknown draw mod";
	}
	draw_text_color(50, display_get_gui_height() - 130, $"Lights : {nbLight}" , c_red, c_red, c_red, c_red, 1.0);
	draw_text_color(50, display_get_gui_height() - 100, "Draw mod : " + str, c_blue, c_blue, c_blue, c_blue, 1.0);
	draw_text_color(50, display_get_gui_height() - 70, $"CPU Rendering time : {endTime} ms", c_green, c_green, c_green, c_green, 1.0);
	draw_text_color(50, display_get_gui_height() - 40, $"FPS : {fps}", c_white, c_white, c_white, c_white, 1.0);
}
