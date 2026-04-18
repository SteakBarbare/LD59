/// @description Light Computation
shader_set(shdLight);
texture_set_stage(global.uLightNormalMap, surface_get_texture(global.normalMap));
texture_set_stage(global.uLightDepthMap, surface_get_texture(global.depthMap));
texture_set_stage(global.uLightDiffuseMap, surface_get_texture(global.diffuseMap));
shader_set_uniform_f(global.uLightInfo, x, y, intensity, radius);
shader_set_uniform_f(global.uLightHasShadow, isCastingShadows && radius > global.minLightShadow);
shader_set_uniform_f(global.uLightColor, colour_get_red(lightColor) / 255.0, colour_get_green(lightColor) / 255.0, colour_get_blue(lightColor) / 255.0);
shader_set_uniform_f(global.uLightAttenuationIntensity, attenuationIntensity);
shader_set_uniform_f(global.uLightRoomHeight, room_width, room_height);

if(isCastingShadows && radius > global.minLightShadow) {
	texture_set_stage(global.uLightShadowMap, surface_get_texture(srfcShadow));
}

gpu_set_blendmode(bm_add);
draw_rectangle(x - radius, y - radius, x - radius + radius * 2.0, y - radius + radius * 2.0, false);
gpu_set_blendmode(bm_normal);

shader_reset();