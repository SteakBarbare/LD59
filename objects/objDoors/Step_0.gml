if (distance_to_object(objPlayer) < 200) {
	image_speed = 1;
	if (image_index >= image_number - 1) {
		image_index = image_number - 1;
	}
} else if (image_index > 0) {
	image_speed = -1;
} else {
	image_speed = 0;	
}
