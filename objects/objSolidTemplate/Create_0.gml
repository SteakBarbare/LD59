/// @description Insert description here
// You can write your code in this editor

uPixelW = shader_get_uniform(shdOutline, "pixel1Width");
uPixelH = shader_get_uniform(shdOutline, "pixel1Height");
texelW = texture_get_texel_width(sprite_get_texture(sprite_index, 0));
texelH = texture_get_texel_height(sprite_get_texture(sprite_index, 0));
outlineColor = shader_get_uniform(shdOutline, "uOutlineColor");
echoAlpha = shader_get_uniform(shdOutline, "echo_alpha");

setOutline = false;
outlineAlpha = 0;
outlineIncreasing = true;
