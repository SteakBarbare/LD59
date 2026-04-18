/// @description Normal

for(var currentTileset = 0; currentTileset < array_length(tilesetNormalArrayIndex); currentTileset++){
	var baseTileset = tilemap_get_tileset(tilesetArrayIds[currentTileset]);
	if(tilesetNormalArrayIndex[currentTileset] == -1){
		shader_set(shdDefaultNormal);
	} else {
		tilemap_tileset(tilesetArrayIds[currentTileset], tilesetNormalArrayIndex[currentTileset]);
	}

	draw_tilemap(tilesetArrayIds[currentTileset], 0, 0);
	tilemap_tileset(tilesetArrayIds[currentTileset], baseTileset);

	if(tilesetNormalArrayIndex[currentTileset] == -1) {
		shader_reset();
	}
}

