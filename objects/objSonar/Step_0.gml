event_inherited();

if (!instance_exists(objPlayer)) return;

if (isCarried) {
	x = objPlayer.x;
	y = objPlayer.y;
}

if (emitSignal) {
	if (!instance_exists(objLibouloule) || !instance_exists(objCore)) return;
	objLibouloule.detectSignal = true;
	emittedX = x;
	emittedY = y;
	emitSignal = false;
	with(objCore) event_user(0);
}

