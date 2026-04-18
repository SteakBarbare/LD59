event_inherited()
initialPointX = 0;
initialPointY = 0;

ballColor = c_white;

floatingSpeed = 10;
targetingPlayer = false;
isPicked = false;
isVampire = false;

target = objPj;
isTargetingOther = false;


if(isVampire){
	floatingSpeed = 7;
	// Variable not used anymore, could still be useful in the future
	ballColor = c_red;
}