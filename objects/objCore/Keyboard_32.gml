/// @description Baleks

with(objSolidTemplate){

	var distanceFromOrigin = point_distance(objPurplePlaceholder.x, objPurplePlaceholder.y, x, y);
	if(alarm[0] > 0){
		alarm[0] = min(distanceFromOrigin / 5, alarm[0]);
	}else{
		alarm[0] = distanceFromOrigin / 5;
	}
}