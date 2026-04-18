/// @function					srcPointInScreen(x, y, tolerance)
/// @param  {real}	X			x of the point to check in screen
/// @param  {real}	Y			y of the point to check in screen
/// @param  {real}	tolerance	maximum distance to screen
/// @param  {real}	cx			current screen camera x
/// @param  {real}  cy			current screen camera y
/// @param  {real}  cw			current screen camera width
/// @param  {real}  ch			current screen camera height
/// @description				Check if the point in on the screen
function srcPointInScreen(X, Y, tolerance, cx = global.cameraX, cy = global.cameraY, cw = global.cameraWidth, ch = global.cameraHeight){
	return point_in_rectangle(X, Y, cx - tolerance, 
		cy - tolerance, 
		cx + cw + tolerance, 
		cy + ch + tolerance)
}