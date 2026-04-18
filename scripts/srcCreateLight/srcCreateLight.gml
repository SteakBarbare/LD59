/// @function										srcCreateLight()
/// @param  {ream}				xPos				X position of the light
/// @param  {real}				yPos				Y position of the light
/// @param  {real}				scale				Scale of the light halo sprite
/// @param  {real}				flicker				Flickering in pixel(it will vary between -x to x)
/// @param  {Id.Instance}		followedEntity		Should the light follow an instance ?
/// @param  {Asset.GMSprite}	lightSprite			Used to change the sprite of the light halo
/// @description									Create a new light
function srcCreateLight(xPos, yPos, scale, flicker, followedEntity = noone, lightSprite = sprLightHaloSmouf){
	instance_create_depth(xPos, yPos, -yPos, objLightTemplate, {
		scale: scale,
		flicker: flicker,
		followedEntity: followedEntity,
		lightSprite: lightSprite
	})
}