if(isDangerous && object_get_name(other.object_index) != "objWormdeadChampion"){
	if(causticDamage >= 30){
		global.phyDamageDone = 0;
		global.magDamageDone = 0;
		global.fireDamageDone = 0;
		global.poiDamageDone = 0;
		
		global.poiDamageDone = ceil(round(0.015 * other.maxhp) * (round(0.015 * other.maxhp) / (round(0.015 * other.maxhp) + other.poisonDefense * 0.3)));
		other.hp -= global.poiDamageDone;
		
		instance_create_depth(other.x, other.y-50, -y-100, objDamageTaken);
		audio_play_sound(asset_get_index("sndAcidBurn" + string(ceil(random(3)))), 1, false);
		causticDamage = 0;
		global.poiDamageDone = 0;
	}else{
		causticDamage++;
	}
}