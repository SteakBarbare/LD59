depth = -bbox_bottom;

if(setOutline){
	if(outlineIncreasing){
		outlineAlpha += 0.01;
		if(outlineAlpha >= 1){
			outlineIncreasing = false;
		}
	}else{
		outlineAlpha -= 0.01;
		if(outlineAlpha <= 0){
			outlineAlpha = 0;
			setOutline = false;
			
		}
	}
}