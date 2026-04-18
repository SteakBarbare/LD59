/// @description Particles Above Shadows

if(!isPostDraw) exit;

if(followedEntity != noone){
	x = followedEntity.x;
	y = followedEntity.y;
}

if(!isStream){
	if(burstCount > 0){
		part_particles_burst(partSys, x, y, partAsset);
		burstCount--;
	}else{
		alarm[0] = 1;
	}
}


