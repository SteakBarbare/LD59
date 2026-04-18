/// @description Light Computation
shader_set(shdDirectionalLight);
texture_set_stage(global.uDirLightNormalMap, surface_get_texture(global.normalMap));
texture_set_stage(global.uDirLightDepthMap, surface_get_texture(global.depthMap));
texture_set_stage(global.uDirLightDiffuseMap, surface_get_texture(global.diffuseMap));
shader_set_uniform_f(global.uDirLightInfo, x, y, intensity, radius);
shader_set_uniform_f(global.uDirLightHasShadow, isCastingShadows && radius > 50);
shader_set_uniform_f(global.uDirLightColor, colour_get_red(lightColor) / 255.0, colour_get_green(lightColor) / 255.0, colour_get_blue(lightColor) / 255.0);
shader_set_uniform_f(global.uDirLightAttenuationIntensity, attenuationIntensity);
shader_set_uniform_f(global.uDirLightRoomHeight, room_width, room_height);


shader_set_uniform_f(global.uDirLightDir, dir);
shader_set_uniform_f(global.uDirLightFov, fov);
	
if(isCastingShadows && radius > 50) {
	texture_set_stage(global.uDirLightShadowMap, surface_get_texture(srfcShadow));
}

gpu_set_blendmode(bm_add);
draw_rectangle(x - radius, y - radius, x - radius + radius * 2.0, y - radius + radius * 2.0, false);
gpu_set_blendmode(bm_normal);

shader_reset();