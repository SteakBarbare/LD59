/// @description Shadow Background
draw_surface(application_surface, 0, 0);

draw_set_alpha(shadowAlpha);
draw_surface_stretched(lightSurface, 0, 0, cameraWidth, cameraHeight);
draw_set_alpha(1);

//var _pos = application_get_position();
//show_debug_message($"_pos : {_pos}")
