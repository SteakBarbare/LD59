/// @function							srcNewShadowCaster(X, Y, w, h, Depth)
/// @param  {real}	X					X pos of the top left corner
/// @param  {real}	Y					Y pos of the top left corner
/// @param  {real}	w					width between left and right corner
/// @param  {real}	h					height between top and bottom
/// @param  {real}	Depth				Depth of the caster
/// @param  {Id.Instance}	p			parent of the object if need to follow it
/// @param  {real}	offX				Offset x from the parent
/// @param  {real}	offY				Offset y from the parent
/// @description						Create a shadow caster
function srcNewShadowCaster(X, Y, w, h, Depth, p = noone, offX = 0, offY = 0) {
	return instance_create_depth(X, Y, Depth, objShadowCaster, {
		image_xscale : w / sprite_get_width(sprPlaceholderShadowCaster),
		image_yscale : h / sprite_get_height(sprPlaceholderShadowCaster),
		parent: p,
		offsetX : offX,
		offsetY : offY
	});
}