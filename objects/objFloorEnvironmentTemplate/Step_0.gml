/// @description Insert description here
// You can write your code in this editor

depth = y;

if(depth != previousDepth) {
	previousDepth = depth;
	objRenderingCore.drawOrderUpdate++;
}