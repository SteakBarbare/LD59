event_inherited();

smearTimer--;

if(smearTimer <= 0 && random(100) > 97){
	smearTimer = smearTime;
	
	var newRubbish = instance_create_depth(x, y, y, objWoodRubbish);
	newRubbish.smearTimer = 999;
	newRubbish.smearTime = 999;
	
	instance_create_depth(x + irandom_range(-5, 5), y + irandom_range(-5, 5), y, objWoodPlank);

}