/// @description Lights Source Creation

part_system_drawit(global.partSystem);

if(!surface_exists(lightSurface)){
	lightSurface = surface_create(display_get_width(), display_get_height());
}

surface_set_target(lightSurface);
draw_clear(c_black);
camera_apply(camera);

//gpu_set_blendmode(bm_subtract);

with(objLightTemplate){
	var flickerDir = sign(random_range(-1, 1));
	var flickerValue = random(flicker);
	var currentScale = scale + (flickerDir * flickerValue);
	var colorToApply = c_white;
	var intensitySecondLight = 0;
	if (colorToAdd != "") {
		switch (colorToAdd) {
			case "Green":
				colorToApply = c_green;
				intensitySecondLight = 0.5 - (1 - alphaLight)
				break;
		}
	}
	
	gpu_set_blendmode(bm_subtract);
	draw_sprite_ext(lightSprite, 0, x, y, currentScale, currentScale, 0, c_white, alphaLight - intensitySecondLight);

	if (colorToAdd != "") {
		gpu_set_blendmode(bm_add);
		draw_sprite_ext(lightSprite, 0, x, y, currentScale, currentScale, 0, colorToApply, intensitySecondLight);
		gpu_set_blendmode(bm_normal);
	}
}

gpu_set_blendmode(bm_normal);

surface_reset_target();
