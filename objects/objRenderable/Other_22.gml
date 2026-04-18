/// @description Edge for shadow
if(useBbox) {
	srcRectangleEdges(global.shadowBuffer, 
		bbox_left, 
		bbox_top, 
		bbox_right, 
		bbox_bottom);
	
	srcRectangleEdges(global.shadowBuffer, 
		bbox_right, 
		bbox_top, 
		bbox_left, 
		bbox_bottom);
} else {
	srcRectangleEdges(global.shadowBuffer, 
		bbox_left + minX, 
		bbox_top + minY, 
		bbox_left + maxX, 
		bbox_top + maxY);
	
	srcRectangleEdges(global.shadowBuffer, 
		bbox_left + maxX, 
		bbox_top + minY, 
		bbox_left + minX, 
		bbox_top + maxY);
}
