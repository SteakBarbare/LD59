/// @function								srcUseSurface(sid, w, h);
/// @param  {Id.Surface}		sid			Surface id
/// @param  {real}				w			Surface width
/// @param  {real}				h			Surface height
/// @description							Check if a surface exist and have a correct value before targeting it
function srcUseSurface(sid, w, h){
	if(!surface_exists(sid)) {
		sid = surface_create(w, h);
	} else if(surface_get_width(sid) != w || surface_get_height(sid) != h) {
		surface_free(sid);
		sid = surface_create(w, h);
	}
	surface_set_target(sid);
	return sid;
}