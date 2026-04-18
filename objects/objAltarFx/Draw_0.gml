/// @description Insert description here
// You can write your code in this editor

// First particle emitted
if(!particleWormhole){
	particleWormhole = true;
	
	repeat(30) {
		var randomDirection = random(360);
		var partLen = 150;
		
		// The x and y where the particle will spawn
		var spawnX = x + lengthdir_x(partLen, randomDirection); 
		var spawnY = y + lengthdir_y(partLen, randomDirection);
		
		// The direction from the particle spawn to the "center point" or the mouse in this case
		var partDir = point_direction(spawnX, spawnY, x, y); 
	
		part_type_color2(global.wormholePart, fxColourExt, fxColourInt);
		part_type_direction(global.wormholePart, partDir,partDir, 0, 0);
		part_particles_create(global.particlesSys, spawnX, spawnY, global.wormholePart, 1);
	}
}

if(!particlesExplosion){
	objCameraShake.pjHit = shakeIntensity;
	shakeIntensity += 0.02;

	zoomModifier -= 0.001
	camera_set_view_size(view_camera[0], round(camWidthBase*zoomModifier), round(camHeightBase*zoomModifier));
	camera_set_view_border(view_camera[0], round(camBorderX*zoomModifier), round(camBorderY*zoomModifier));
}