/// @description Insert description here
// You can write your code in this editor

global.partSystem = part_system_create();
application_surface_draw_enable(false);

camera = view_get_camera(view_camera[0]);
cameraWidth = camera_get_view_width(camera);
cameraHeight = camera_get_view_height(camera);

lightSurface = surface_create(window_get_width(), window_get_height());