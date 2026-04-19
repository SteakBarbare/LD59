/// @description Lights Source Creation

part_system_drawit(global.partSystem);

if(!surface_exists(lightSurface)){
	lightSurface = surface_create(display_get_width(), display_get_height());
}

surface_set_target(lightSurface);
draw_clear(c_white);
camera_apply(cameraSonar);
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
	
	//gpu_set_blendmode(bm_subtract);
	if (!sonarLight) {
		gpu_set_blendmode(bm_subtract);
		draw_sprite_ext(lightSprite, 0, x, y, currentScale, currentScale, 0, c_white, alphaLight - intensitySecondLight);
	} else {
		gpu_set_blendmode(bm_subtract); 
		//draw_sprite_ext(lightSprite, 0, objCore.camX + 350, objCore.camY + 250, 3, 3, 0, c_white, alphaLight);
		draw_sprite_ext(lightSprite, 0, objCore.camX, objCore.camY, 1, 1, 0, c_white, 1);
	}

	if (colorToAdd != "") {
		gpu_set_blendmode(bm_add);
		draw_sprite_ext(lightSprite, 0, x, y, currentScale, currentScale, 0, colorToApply, intensitySecondLight);
		gpu_set_blendmode(bm_normal);
	}
}

gpu_set_blendmode(bm_normal);

// Handling Sonar Effect on Solid Template
with(objSolidTemplate){
	if(setOutline) {
		shader_set(shdOutline);
		shader_set_uniform_f(uPixelW, texelW);
		shader_set_uniform_f(uPixelH, texelH);
		shader_set_uniform_f(echoAlpha, outlineAlpha);
		shader_set_uniform_f(outlineColor, outlineColorR, outlineColorG, outlineColorB, 1);
	
		draw_self();
		shader_reset();
	}
}

surface_reset_target();
