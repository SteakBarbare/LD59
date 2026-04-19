/// @description Insert description here
// You can write your code in this editor
if(setOutline) {
	shader_set(shdOutline);
	shader_set_uniform_f(uPixelW, texelW);
	shader_set_uniform_f(uPixelH, texelH);
	shader_set_uniform_f(echoAlpha, outlineAlpha);
	shader_set_uniform_f(outlineColor, outlineColorR, outlineColorG, outlineColorB, 1);
	
	//draw_self();
	//if (sprite_index == sprTank) {
	//	show_debug_message($"X : {max(x, x + objCore.camX / 2)}")
	//	show_debug_message($"Y : {max(y, y + objCore.camY / 2)}")
	//	show_debug_message($"camera X : {objCore.camX}")
	//	show_debug_message($"camera Y : {objCore.camY}")
	//}
	//draw_sprite_ext(sprite_index, image_index, 
	//	(max(0, x, x + objCore.camX / 2)),
	//	(max(0, y, y + objCore.camY / 2)),
	//	0.5, 0.5, 0, c_white, 1);
	if (sprite_index == sprTank) {
		show_debug_message($"X vanilla : {x}")
		show_debug_message($"Y vanilla : {y}")
		show_debug_message($"X : {x - (objCore.camX / 2 + objCore.cameraWidth / 2)}")
		show_debug_message($"Y : {y + (objCore.camY / 2 + objCore.cameraHeight / 2)}")
		show_debug_message($"camera X : {objCore.camX / 2}")
		show_debug_message($"camera Y : {objCore.camY / 2}")
		show_debug_message($"display_get_width : {display_get_width() / 2}")
		show_debug_message($"display_get_height : {display_get_height() / 2}")
		show_debug_message($"objCore.cameraWidth : {objCore.cameraWidth / 2}")
		show_debug_message($"objCore.cameraHeight : {objCore.cameraHeight / 2}")
	}
	draw_sprite_ext(sprite_index, image_index, 
		x + (abs(objCore.camX / 2)),
		y + (objCore.camY),
		0.5, 0.5, 0, c_white, 1);
	shader_reset();
}
