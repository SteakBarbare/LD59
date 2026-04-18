// Check if the surface exists, create one if false, clear the existing if true
if(!surface_exists(waterSurface)){
	surfaceWview = camera_get_view_width(view_camera[0]);
	surfaceHview = camera_get_view_height(view_camera[0]);
	
	waterSurface = surface_create(surfaceWview, surfaceHview);
}else{
	surface_set_target(waterSurface);
	draw_clear_alpha(0, 0);
	surface_reset_target();
}