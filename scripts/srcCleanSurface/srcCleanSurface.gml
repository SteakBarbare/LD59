/// @function								srcCleanSurface(sid);
/// @param  {Id.Surface}		sid			Surface id
/// @description							Check if a surface exist before freeing it
function srcCleanSurface(sid){
	if(surface_exists(sid)) 
		surface_free(sid);
}