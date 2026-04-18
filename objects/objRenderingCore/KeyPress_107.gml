/// @description Change view for light debug
if(isDebugOn) {
	drawOption++;
	if(drawOption >= DrawOptionId.LAST) 
		drawOption = DrawOptionId.DEFAULT;
}
