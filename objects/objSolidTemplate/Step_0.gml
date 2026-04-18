/// @description Insert description here
// You can write your code in this editor

depth = -y;

if(outlineIncreasing){
	outlineAlpha += 0.01;
	if(outlineAlpha >= 1){
		outlineIncreasing = false;
	}
}else{
	outlineAlpha -= 0.01;
	if(outlineAlpha <= 0){
		outlineIncreasing = true;
	}
}