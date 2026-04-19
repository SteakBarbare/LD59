event_inherited();

if (!instance_exists(objPlayer)) return;

if (isCarried) {
	x = objPlayer.x;
	y = objPlayer.y;
	timeUsed = 0;
}

if (emitSignal) {
	if (!instance_exists(objCore)) return;
	
	if(instance_exists(objLibouloule)){
		objLibouloule.detectSignal = true;
	}
	emittedX = x;
	emittedY = y;
	emitSignal = false;
	with(objCore) event_user(0);
}

