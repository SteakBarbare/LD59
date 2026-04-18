if(!isSticked){
	hsp = 0;
	vsp = 0;
	sporeLanded = true;
	alarm[0] = irandom_range(600, 1800);
	
	stickedParent = other;
	distParentX = x - stickedParent.x;
	distParentY = y - stickedParent.y;
	isSticked = true;
}
