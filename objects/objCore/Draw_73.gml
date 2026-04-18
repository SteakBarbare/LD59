/// @description Lights Source Creation

part_system_drawit(global.partSystem);

if(!surface_exists(lightSurface)){
	tempCamera = view_get_camera(view_camera[0]);
	tempCameraWidth = camera_get_view_width(tempCamera);
	tempCameraHeight = camera_get_view_height(tempCamera);
	
	lightSurface = surface_create(window_get_width(), window_get_height());
}

surface_set_target(lightSurface);
draw_clear(c_black);
camera_apply(camera);

gpu_set_blendmode(bm_subtract);

with(objLightTemplate){
	var flickerDir = sign(random_range(-1, 1));
	var flickerValue = random(flicker);
	draw_sprite_ext(lightSprite, 0, x, y, scale + (flickerDir * flickerValue), scale + (flickerDir * flickerValue), 0, c_white, alphaLight);	
}

gpu_set_blendmode(bm_normal);

surface_reset_target();