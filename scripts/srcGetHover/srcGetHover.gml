/// @function							srcGetHover(isCustomOrigin, customOrigin);
/// @param  {bool}		isCustomOrigin	[OPT]Should the origin be taken from cutomOrigins or the x/y position
/// @param  {Array}		customOrigin	[OPT]Array containing the x and y custom origin positions
/// @param  {bool}		isGUI			[OPT] Check the values from the mouse or the mouse to GUI coordinates
/// @param  {bool}		unlimitedHeight	[OPT] If true, the height checked for the bottom of the collision box will be 1080
/// @description						Return true if the pointer is inside the element or false otherwise
function srcGetHover(isCustomOrigin = false, customOrigin = [x, y], isGUI = true, unlimitedHeight = false){
	var mouseX, mouseY;
	
	var unlimitedHeightValue = 0;
	if(unlimitedHeight) unlimitedHeightValue = 1080;
	
	if(isGUI){
		mouseX = device_mouse_x_to_gui(0);
		mouseY = device_mouse_y_to_gui(0);
	}else{
		mouseX = mouse_x;
		mouseY = mouse_y;
	}
	
	if(isCustomOrigin){
		return point_in_rectangle(mouseX, mouseY, customOrigin[0], customOrigin[1], customOrigin[0] + width, customOrigin[1] + height + unlimitedHeightValue);
	}else{
		return point_in_rectangle(mouseX, mouseY, x, y, x + width, y + height + unlimitedHeightValue);
	}
}