/// @description Normal Map Path

shader_set_uniform_f(global.uRotateAngle, image_angle);
shader_set_uniform_f(global.uRotateHasNormal, hasNormal);
draw_sprite_ext(normalMapSprite, image_index, x, y, image_xscale, image_yscale, image_angle, c_white, 1);