if(isDangerous && !other.poisonDrinker){
	if(causticPjDamage >= 30){
		global.phyDamageDone = 0;
		global.magDamageDone = 0;
		global.fireDamageDone = 0;
		global.poiDamageDone = 0;
		
		global.poiDamageDone = round(round(0.03 * other.maxhp) * (round(0.03 * other.maxhp) / (round(0.03 * other.maxhp) + other.poisonDefense * 0.3)));
		other.hp -= global.poiDamageDone;
		
		instance_create_depth(other.x, other.y-50, -y-100, objDamageTaken);
		audio_play_sound(asset_get_index("sndAcidBurn" + string(ceil(random(3)))), 1, false);
		causticPjDamage = 0;
		global.poiDamageDone = 0;
	}else{
		causticPjDamage++;
	}
}