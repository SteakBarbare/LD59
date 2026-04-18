/// @function										srcCreateLight()
/// @param  {ream}				xPos				X position of the light
/// @param  {real}				yPos				Y position of the light
/// @param  {real}				scale				Scale of the light halo sprite
/// @param  {real}				flicker				Flickering in pixel(it will vary between -x to x)
/// @param  {Id.Instance}		followedEntity		Should the light follow an instance ?
/// @param  {Asset.GMSprite}	lightSprite			Used to change the sprite of the light halo
/// @param  {real}				alphaLight			Alpha of the light halo (from 0 -> 1)
/// @param  {bool}				isDisappearing		Used to istantly make the light fade away
/// @description									Create a new light
function srcCreateLight(xPos, yPos, scale, flicker, followedEntity = noone, lightSprite = sprLightHaloSmouf, alphaLight = 1, isDisappearing = false){
	var newLight = instance_create_depth(xPos, yPos, -yPos, objLightTemplate, {
		scale: scale,
		flicker: flicker,
		alphaLight: alphaLight
	})
	
	newLight.followedEntity = followedEntity;
	newLight.lightSprite = lightSprite;
	newLight.isDisappearing = isDisappearing;
}