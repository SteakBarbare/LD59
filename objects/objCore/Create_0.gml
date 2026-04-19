/// @description Light Variables

global.partSystem = part_system_create();
global.particouilleSys = part_system_create();
application_surface_draw_enable(false);

camera = view_get_camera(view_camera[0]);
cameraWidth = camera_get_view_width(camera);
cameraHeight = camera_get_view_height(camera);

camX = objPlayer.x - cameraWidth / 2;
camY = objPlayer.y - cameraHeight / 2;

lightSurface = surface_create(display_get_width(), display_get_height());

shadowAlpha = 1;

if (!instance_exists(objGrid)) {
	instance_create_depth(x, y, depth, objGrid);	
}

window_set_fullscreen(true);
