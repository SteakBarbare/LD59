/// @function					function srcMouseInRectangleMiddle(middleX, middleY, width, height)
/// @param  {int}	middleX		center coord of the rectangle to check on
/// @param  {int}	middleY		center coord of the rectangle to check on
/// @param  {int}	width		width of the rectangle
/// @param  {int}	height		height of the rectangle
/// @description				Check if the mouse in on the given rectangle (rectangle givent by his middle point)
function srcMouseInRectangleMiddle(middleX, middleY, width, height){
	return point_in_rectangle(device_mouse_x_to_gui(0), device_mouse_y_to_gui(0), middleX - width/2, middleY - height/2, middleX + width/2, middleY + height/2)
}