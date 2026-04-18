/// @description Light Computation
shader_set(shdEmissiveLight);
gpu_set_blendmode(bm_add);
texture_set_stage(global.uEmissiveLightNormalMap, surface_get_texture(global.normalMap));
texture_set_stage(global.uEmissiveLightDepthMap, surface_get_texture(global.depthMap));

if(isCastingShadows) {
	texture_set_stage(global.uEmissiveLightShadowMap, surface_get_texture(global.shadowMap));
} else {
	texture_set_stage(global.uEmissiveLightShadowMap, surface_get_texture(global.emptyShadowMap));
}

shader_set_uniform_i(global.uEmissiveLightNbLights, array_length(lights) / 5);
shader_set_uniform_f_array(global.uEmissiveLightLights, lights);
	
shader_set_uniform_f(global.uEmissiveLightInfo, x, y, intensity, radius);
shader_set_uniform_f(global.uEmissiveLightColor, colour_get_red(color) / 255.0, colour_get_green(color) / 255.0, colour_get_blue(color) / 255.0);
shader_set_uniform_f(global.uEmissiveLightAttenuationIntensity, attenuationIntensity);
	
shader_set_uniform_f(global.uEmissiveLightRoomHeight, room_height);
	
draw_surface(global.diffuseMap, 0, 0);
gpu_set_blendmode(bm_normal);