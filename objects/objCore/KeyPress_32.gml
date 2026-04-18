/// @description Baleks

srcNewParticle(partSonarBurst, objPurplePlaceholder.x, objPurplePlaceholder.y, false, 1, noone, true);
srcCreateLight(x, y, 1, 0.01, noone, sprLightHaloSmouf, 1, true);

with(objSolidTemplate){

	var distanceFromOrigin = point_distance(objPurplePlaceholder.x, objPurplePlaceholder.y, x, y);
	if(alarm[0] > 0){
		alarm[0] = min(distanceFromOrigin / 5, alarm[0]);
	}else{
		alarm[0] = distanceFromOrigin / 5;
	}
}