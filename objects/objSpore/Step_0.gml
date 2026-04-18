depth = -bbox_bottom;

linkedLight.x = x;
linkedLight.y = y;

// Move the spore and decrease its speed over time
if(!sporeLanded){
	
	x += hsp;
	y += vsp;
	
	hsp *= dispersion;
	if(dispersion > 0.95){
		dispersion -= 0.02;
	}
	vsp = (vsp * 0.95) + 0.01;
}else if(isSticked && instance_exists(stickedParent)){
	depth = -stickedParent.depth - 1;
	x = stickedParent.x + distParentX;
	if(stickedParent == objPj){
		y = stickedParent.y-20 + distParentY;
	}else{
		y = stickedParent.y + distParentY;
	}
}

// Check if the spore landed
if(y >= travelDistanceMax && !sporeLanded){
	hsp = 0;
	vsp = 0;
	sporeLanded = true;
	alarm[0] = irandom_range(200, 400);
}

// Reduce the spore alpha until it disappears
if(isDisappearing){
	if(sporeLanded){
		image_alpha -= 0.01;
		image_xscale -= 0.01;
		image_yscale -= 0.01;
	}else{
		image_alpha -= 0.08;
		image_xscale -= 0.08;
		image_yscale -= 0.08;
	}
	if(image_alpha <= 0){
		instance_destroy();
	}
}

if(sporeLanded){
	image_speed = 0;
}