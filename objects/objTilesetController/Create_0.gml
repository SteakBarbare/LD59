/// @description Map Tilesets & Normals

// Make sure to fill these fields in the object creation
// If a tileset doesn't have a normal map, put noone in the corresponding array
tilesetArrayIds = [];
tilesetNormalArrayIndex = [];

var layers = layer_get_all();
// Get tileset name of each tile layer, and get their normals
for (var i = array_length(layers) - 1; i >= 0; i--) {
	var elements = layer_get_all_elements(layers[i]);
	// If there is no element, it can't be a layer tileset
	if(array_length(elements) <= 0) continue;
	if(layer_get_element_type(elements[0]) == layerelementtype_tilemap) {
		var tilemap = layer_tilemap_get_id(layers[i]);
		var name = tileset_get_name(tilemap_get_tileset(tilemap));
		// If it's a corrupted tileset, it's the same normal as basic tileset at the moment
		if(string_pos("Corrupted", name)) {
			name = string_replace(name, "Corrupted", "");
		}
		var asset = asset_get_index(name + "Normal");
		
		array_push(tilesetArrayIds, tilemap);
		array_push(tilesetNormalArrayIndex, asset);
		layer_set_visible(layers[i], false);
	}
}