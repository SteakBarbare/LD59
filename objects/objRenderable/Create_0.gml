culled = false;
hasNormal = 1.0;
if(asset_get_index(sprite_get_name(sprite_index) + "Normal") != -1)
{
	// Uncoment to see which sprite have a normal
	//show_debug_message("Load :: " + sprite_get_name(sprite_index) + "Normal" + " Value = " + string(asset_get_index(sprite_get_name(sprite_index) + "Normal")))
	normalMapSprite = asset_get_index(sprite_get_name(sprite_index) + "Normal");
}
else 
{
	// Uncoment to see which sprite have an empty normal
	//show_debug_message("Object :: " + object_get_name(object_index) + " Have no normal");
	hasNormal = 0.0;
	normalMapSprite = sprite_index;
	if(!sprite_exists(normalMapSprite)) normalMapSprite = sprEmpty;
}

visible = false;

//ds_priority_add(objRenderingCore.drawOrder, self, depth);
array_push(objRenderingCore.drawOrder, id);

linkedLights = array_create(0);

previousDepth = depth;