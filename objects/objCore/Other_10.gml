/// @description Baleks
srcNewParticle(partSonarBurst, objSonar.x, objSonar.y, false, 1, noone, true);

with(objSolidTemplate){
	var distanceFromOrigin = point_distance(objSonar.x, objSonar.y, x, y);
	if(alarm[0] > 0){
		alarm[0] = min(distanceFromOrigin / 5, alarm[0]);
	}else{
		alarm[0] = distanceFromOrigin / 5;
	}
}
