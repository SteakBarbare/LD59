/// @description Insert description here
// You can write your code in this editor

if(keyboard_check(vk_anykey)){
	srcSetTransition(true, rmIntro);
}

if(scaleIncrease){
	if(textScale < 1.01){
		textScale += 0.0001;
	}else{
		scaleIncrease = !scaleIncrease;
	}
}else{
	if(textScale > 0.99){
		textScale -= 0.0001;
	}else{
		scaleIncrease = !scaleIncrease;
	}
}