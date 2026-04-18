/// @description Insert description here
// You can write your code in this editor
if(setOutline){
	shader_set(shdOutline);
	shader_set_uniform_f(uPixelW, texelW);
	shader_set_uniform_f(uPixelH, texelH);
	shader_set_uniform_f(echoAlpha, outlineAlpha);
	shader_set_uniform_f(outlineColor, 1, 1, 1, 1);
	
	//draw_self();
	draw_sprite(sprite_index, image_index, x - objCore.camX, y - objCore.camY);
	shader_reset();
}
