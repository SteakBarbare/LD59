/// @function					srcRectangleInScreen(x, y, tolerance)
/// @param  {real}	left		xleft of the point to check in screen
/// @param  {real}	bottom		ybottom of the point to check in screen
/// @param  {real}	right		xright of the point to check in screen
/// @param  {real}	top			ytop of the point to check in screenn
/// @param  {real}	cx			current screen camera x
/// @param  {real}  cy			current screen camera y
/// @param  {real}  cw			current screen camera width
/// @param  {real}  ch			current screen camera height
/// @description				Check if the rectangle in on the screen
function srcRectangleInScreen(left, bottom, right, top, cx = global.cameraX, cy = global.cameraY, cw = global.cameraWidth, ch = global.cameraHeight){
	return rectangle_in_rectangle(left, bottom, right, top, cx, cy, cx + cw, cy + ch);
}