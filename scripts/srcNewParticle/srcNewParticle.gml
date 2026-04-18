/// @function											srcNewParticle()
/// @param			{asset}			partAsset			Asset of the particle to spawn
/// @param			{real}			xPos				X Position of the particle spawner
/// @param			{real}			yPos				Y Position of the particle spawner
/// @param			{bool}			isStream			Set true if you want a stream and false for a burst
/// @param			{real}			burstCount			Number of burst to do before destroying the systems
/// @param			{Id.Instance}	followedEntity		[OPT] Entity to follow, set by default to noone
/// @param			{bool}			isPostDraw			[OPT] Should be drawn above or below the ambient shadow
/// @description										Create a new particle system that will spawn a stream or burst of a given particle
function srcNewParticle(partAsset, xPos, yPos, isStream, burstCount, followedEntity = noone, isPostDraw = false){
	var newPartSystem = instance_create_depth(xPos, yPos, -y, objParticlesEmitter, {
		isStream: isStream,
		burstCount: burstCount,
		isPostDraw: isPostDraw
	});
	
	newPartSystem.x = xPos;
	newPartSystem.y = yPos;
	newPartSystem.followedEntity = followedEntity;
	newPartSystem.partAsset = partAsset;
}