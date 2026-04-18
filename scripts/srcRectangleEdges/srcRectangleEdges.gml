/// @description srcRectangleEdges(vertexBuffer, x1, y1, x2, y2)
/// @param {Id.VertexBuffer} vertexBuffer Buffer to send the edges
/// @param {real} x1 x of p1 of the edges 
/// @param {real} y1 y of p1 of the edges 
/// @param {real} x2 x of p2 of the edges 
/// @param {real} y2 y of p2 of the edges 
/// @description send edges for a rectangular shape to the GPU
function srcRectangleEdges(vertexBuffer, x1, y1, x2, y2) {
	var minHeight, maxHeight;
	// Min and max height to prevent light from computing shadow inside the bbox
	/// TODO : When the next runtime will be release, replace with a vertex shader texture sampling.
	minHeight = bbox_top / room_height;
	maxHeight = bbox_bottom / room_height;
	
	// First triangle
	vertex_position_3d(vertexBuffer, x1, y1, 0);
	vertex_texcoord(vertexBuffer, minHeight, maxHeight);
	vertex_position_3d(vertexBuffer, x1, y1, 2);
	vertex_texcoord(vertexBuffer, minHeight, maxHeight);
	vertex_position_3d(vertexBuffer, x2, y2, 1);
	vertex_texcoord(vertexBuffer, minHeight, maxHeight);
	
	// Second triangle
	vertex_position_3d(vertexBuffer, x1, y1, 2);
	vertex_texcoord(vertexBuffer, minHeight, maxHeight);
	vertex_position_3d(vertexBuffer, x2, y2, 1);
	vertex_texcoord(vertexBuffer, minHeight, maxHeight);
	vertex_position_3d(vertexBuffer, x2, y2, 3);
	vertex_texcoord(vertexBuffer, minHeight, maxHeight);
}