randomNumb = random(100);

if(randomNumb > 65){
	if(leavesNumb <= 3000){
		var newEmber = instance_create_depth((camera_get_view_x(view_camera[0]) + random_range(0, window_get_width())), (camera_get_view_y(view_camera[0]) + random_range(0, window_get_height())), -y, objEmber);
		if(instance_exists(objPj) && random(100) <= objPj.corruption){
			newEmber.isCorrupted = true;
		}
	}
}
if(instance_exists(objEmber)){
	leavesNumb = instance_number(objEmber);
}else{
	leavesNumb = 0;
}