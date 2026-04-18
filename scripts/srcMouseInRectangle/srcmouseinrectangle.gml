/// @function					srcMouseInRectangle(pointX, pointY, width, height)
/// @param  {int}	pointX		left coord of the rectangle to check on
/// @param  {int}	pointY		top coord of the rectangle to check on
/// @param  {int}	width		width of the rectangle
/// @param  {int}	height		height of the rectangle
/// @description				Check if the mouse in on the given rectangle
function srcMouseInRectangle(pointX, pointY, width, height){
	return point_in_rectangle(device_mouse_x_to_gui(0), device_mouse_y_to_gui(0), pointX, pointY, pointX + width, pointY + height)
}