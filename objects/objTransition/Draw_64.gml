/// @description Black Screen

var baseAlpha = draw_get_alpha();
draw_set_alpha(currentAlpha);

draw_rectangle_color(0, 0, room_width, room_height, c_black, c_black, c_black, c_black, false);

draw_set_alpha(baseAlpha);
