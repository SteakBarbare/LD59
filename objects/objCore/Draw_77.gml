/// @description Shadow Background
draw_surface(application_surface, 0, 0);

draw_set_alpha(shadowAlpha);
draw_surface_stretched(lightSurface, 0, 0, display_get_width(), display_get_height());
draw_set_alpha(1);
