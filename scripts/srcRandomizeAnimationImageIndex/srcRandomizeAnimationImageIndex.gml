/// @function								srcRandomizeAnimationImageIndex(unit)
/// @param  {Id.Instance}		obj			object
/// @description							Randomize image index of current animation on object
function srcRandomizeAnimationImageIndex(obj) {
	obj.image_index = irandom_range(0, obj.image_number - 1);
}