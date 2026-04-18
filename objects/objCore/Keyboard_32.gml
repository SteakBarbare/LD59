/// @description Baleks

with(objSolidTemplate){

	var distanceFromOrigin = point_distance(objPurplePlaceholder.x, objPurplePlaceholder.y, x, y);
	alarm[0] = distanceFromOrigin / 5;
}