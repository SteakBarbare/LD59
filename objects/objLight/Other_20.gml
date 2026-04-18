/// @description Shadow computation
if(isCastingShadows && radius > global.minLightShadow) {
	shader_set(shdShadow);
	srfcShadow = srcUseSurface(srfcShadow, targetRadius * 2.0, targetRadius * 2.0);
	draw_clear_alpha(c_black, 0.0);
	// take alpha of the two textures
	gpu_set_blendmode_ext_sepalpha(bm_zero,bm_one,bm_one,bm_one);
	shader_set_uniform_f(global.uShadowLightInfo, x, y, radius);
	shader_set_uniform_f(global.uShadowRoomSize, room_width, room_height);
	var mtx = matrix_build(-(x - targetRadius), -(y - targetRadius), 0, 0, 0, 0, 1.0, 1.0, 1.0);
	matrix_set(matrix_world, mtx);
	vertex_submit(global.shadowBuffer, pr_trianglelist, -1);
	matrix_set(matrix_world, matrix_build_identity());
	surface_reset_target();	
	gpu_set_blendmode(bm_normal);
	shader_reset();
}



