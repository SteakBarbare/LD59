if(objPj.corruption <= 80) {
	randomNumb = random(100);

	if(randomNumb > 65){
		if(leavesNumb <= 1000){
			instance_create_depth((cameraViewX + random_range(0, windowWidth)), (cameraViewY + random_range(-400, windowHeight)), -y, objLeaf);
		}
	}
	if(instance_exists(objLeaf)){
		leavesNumb = instance_number(objLeaf);
	}else{
		leavesNumb = 0;
	}
}