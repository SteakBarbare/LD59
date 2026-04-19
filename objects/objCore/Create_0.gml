/// @description Light Variables

global.partSystem = part_system_create();
global.particouilleSys = part_system_create();
application_surface_draw_enable(false);

camera = view_get_camera(view_camera[0]);
cameraSonar = view_get_camera(view_camera[1]);
cameraSonarWidth = camera_get_view_width(cameraSonar);
cameraSonarHeight = camera_get_view_height(cameraSonar);
camSonarX = objSonar.x - display_get_width();
camSonarY = objSonar.y - display_get_height();
cameraWidth = camera_get_view_width(camera);
cameraHeight = camera_get_view_height(camera);
secondCameraOn = false;

camX = objPlayer.x - cameraWidth / 2;
camY = objPlayer.y - cameraHeight / 2;

lightSurface = surface_create(display_get_width(), display_get_height());

shadowAlpha = 1;

if (!instance_exists(objGrid)) {
	instance_create_depth(x, y, depth, objGrid);
}

window_set_fullscreen(true);
