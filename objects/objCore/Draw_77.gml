/// @description Insert description here
// You can write your code in this editor

draw_surface(application_surface, 0, 0);

draw_set_alpha(shadowAlpha);
draw_surface_stretched(lightSurface, 0, 0, window_get_width(), window_get_height());
draw_set_alpha(1);