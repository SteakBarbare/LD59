/// @description Change view for light debug
if(isDebugOn){
	drawOption--;
	if(drawOption < 0) 
		drawOption = DrawOptionId.LAST - 1;
}
