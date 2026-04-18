// Check if the surface exists, create one if false, clear the existing if true
if(!surface_exists(waterSurface)){
	surfaceWview = camera_get_view_width(view_camera[0]);
	surfaceHview = camera_get_view_height(view_camera[0]);
	
	waterSurface = surface_create(surfaceWview, surfaceHview);
}else{
	surface_set_target(waterSurface);
	draw_clear_alpha(0, 0);
	surface_reset_target();
}

if(distance_to_point(objPj.x, y) <= 640){
	if(objPj.corruption > 50){
		var currentTilemap = layer_tilemap_get_id("RiviereCorrupted");
	}else{
		var currentTilemap = layer_tilemap_get_id("Riviere");
	}
	reflectingObjects = [objEnemyTemplate, objPropsTemplate, objInteractibleTemplate, objLeaf, objEldritchProps];

	if( (surfaceWview != camera_get_view_width(view_camera[0])) || (surfaceHview != camera_get_view_height(view_camera[0])) ){
		surface_free(waterSurface);
		surfaceWview = camera_get_view_width(view_camera[0]);
		surfaceHview = camera_get_view_height(view_camera[0]);
		waterSurface = surface_create(surfaceWview, surfaceHview);
	}

	surface_set_target(waterSurface);

	surfaceXview = camera_get_view_x(view_camera[0]);
	surfaceYview = camera_get_view_y(view_camera[0]);
	
	draw_tilemap(currentTilemap, -surfaceXview, -surfaceYview);
	

	//Draw reflected player sprite
	//Get player y offset for reflection

	//Set blendmode
	gpu_set_blendmode_ext(bm_dest_alpha, bm_inv_src_alpha);
		
	var yOffset = (objPj.sprite_height + ((62 - objPj.sprite_height)/2) - objPj.sprite_yoffset)*2;

	//Draw reflection
	srcSpineDraw("", objPj.dir, objPj.armor[0], objPj.armor[1], objPj.armor[2], objPj.armor[4], objPj.weaponSets[objPj.currentSet, 0], objPj.weaponSets[objPj.currentSet, 1], objPj.hairStyle, objPj.beardStyle, objPj.isFemale);
	srcSpineColor(objPj.colorHair, objPj.colorBeard, 1);
	draw_skeleton(sprPjSpine, objPj.currentAnimation, "default", objPj.currentFrame, objPj.x - objWaterReflection.surfaceXview, (objPj.y+yOffset+2) - objWaterReflection.surfaceYview, objPj.image_xscale, -objPj.image_yscale, 0, -1, 0.6);
		
	
	//Reset blendmode
	gpu_set_blendmode(bm_normal);


	// Draw reflected enemies and environnement sprites
	for(var i = 0; i < array_length(reflectingObjects); i++){
		with(reflectingObjects[i])
		{
			if(object_index != objInvisibleWall){
				if(!variable_instance_exists(self, "isShown") || isShown){
					//Set blendmode
					gpu_set_blendmode_ext(bm_dest_alpha, bm_inv_src_alpha);
			
					var yOffset = (sprite_height - sprite_yoffset)*2;
					if(i == 0)
					{
						yOffset = sprite_height/2 + 4;
					}
					draw_sprite_ext(sprite_index, image_index, x - objWaterReflection.surfaceXview, (y+yOffset) - objWaterReflection.surfaceYview, image_xscale, -image_yscale, 0, -1, 0.4);
		
					//Reset blendmode
					gpu_set_blendmode(bm_normal);
				}
			}
		}
	}
	

	// Shader

	shader_set(shdWaterReflection);
	
	shader_set_uniform_f(uniTime, current_time);
	var tex = surface_get_texture(waterSurface);
	shader_set_uniform_f(uniTexel, texture_get_texel_width(tex), texture_get_texel_height(tex));

	//Reset blendmode
	gpu_set_blendmode(bm_normal);


	surface_reset_target();

	draw_surface(waterSurface, surfaceXview, surfaceYview);

	shader_reset();
}