if(image_index >= 8){
	instance_destroy();
}

if(instance_exists(parentId)){
	depth = -parentId.y-50;
}

depth = -y-50;