/// @function						srcNewDirectionalLight(xPos, yPos, depthValue, baseRadius, radius, rValue, gValue, bValue, deathAffected, isFollowingObj, objFollowed);
/// @param  {real}  xPos			X position to create the light on
/// @param  {real}  yPos			Y position to create the light on
/// @param  {real}  depthValue		Initial depth of the light
/// @param  {real}  dir				Angular direction 0 -> 360 of light
/// @param  {real}  fov				Angular opening 0 -> 360 of light
/// @param  {real}  targetRadius	Radius of the light
/// @param  {real}  radius			Initial radius of the light, will change to match the target value
/// @param  {Color} targetColor		Color of the light
/// @param  {Color} color			initial color of the light, will change to match the target value
/// @param  {bool}	deathAffected	If true, the light will fade on player death / some trigger
/// @param  {Id.Instance}	objFollowed		If different than noone, the light will follow the specified instance
/// @description					Create a new light source, that will be sent to the shader and create a colored cone, then return the newly created instance
function srcNewDirectionalLight(xPos, yPos, depthValue, dir, fov, targetRadius, radius, targetColor, color = targetColor, deathAffected = false, objFollowed = noone){
	
	// Light Creation
	var newLight = instance_create_depth(xPos, yPos, depthValue, objDirectionalLight, {
		dir: dir,
		fov : fov,
		targetRadius : targetRadius,
		radius : radius
	});
	
	// RGB Values
	newLight.lightColor = color;
	newLight.targetColor = targetColor;
	
	// Persistent Light
	newLight.influencedByPlayerDeath = deathAffected;
	
	// Entity Follow
	newLight.followedEntity = objFollowed;
	return newLight;
}