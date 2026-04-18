if(!isSticked && !objPj.iFrames){
	hsp = 0;
	vsp = 0;
	sporeLanded = true;
	alarm[0] = irandom_range(600, 1800);
	
	stickedParent = other; 
	distParentX = x - stickedParent.x;
	distParentY = y - stickedParent.y -irandom_range(20, 40);
	depth = stickedParent.depth - 50;
	isSticked = true;
	
	srcDirectDmgToEntity(stickedParent, [false, false, true, false], [0, 0, irandom_range(1, 3), 0], "sndAcidBurn", 0, [], false, true);
	srcCorruptionGain(1, stickedParent);
}