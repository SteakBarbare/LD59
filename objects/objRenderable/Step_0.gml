depth = -bbox_bottom;

if(depth != previousDepth) {
	previousDepth = depth;
	objRenderingCore.drawOrderUpdate++;
}