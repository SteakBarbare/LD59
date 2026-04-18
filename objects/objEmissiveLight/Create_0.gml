/// @description Insert description here
// You can write your code in this editor

event_inherited();


lights = [];



var surface = surface_create(sprite_get_width(emissiveSprite), sprite_get_height(emissiveSprite));
surface_set_target(surface);
draw_sprite(emissiveSprite, 0, 0, 0);

for(var i = 0; i < sprite_get_height(emissiveSprite); i++) {
	for( var j = 0; j < sprite_get_width(emissiveSprite); j++) {
		var color = surface_getpixel(surface, j, i);
		if(irandom(100) < 60 || color_get_red(color) == 0 && color_get_green(color) == 0 && color_get_blue(color) == 0 ) continue;
		array_push(lights, x + j, y + i, color_get_red(color) / 255.0, 
			color_get_green(color) / 255.0, 
			color_get_blue(color) / 255.0);
	}
}


surface_reset_target();