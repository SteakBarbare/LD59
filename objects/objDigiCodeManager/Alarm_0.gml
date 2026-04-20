/// @description Insert description here
// You can write your code in this editor


var allSpawns = array_create(0);
var selectedSpawns = array_create(0);
var randomSpawn, currentSpawn;

with (objPaperSpawn) {
    array_push(allSpawns, id);
}

for(currentSpawn = 0; currentSpawn < 3; currentSpawn++){
	randomSpawn = irandom_range(0, array_length(allSpawns) - 1);
	
	array_push(selectedSpawns, allSpawns[randomSpawn]);
	array_delete(allSpawns, randomSpawn, 1);
}


selectedSpawns[0].digitIndex = 1;
selectedSpawns[1].digitIndex = 2;
selectedSpawns[2].digitIndex = 3;


for (currentSpawn = 0; currentSpawn < array_length(allSpawns); currentSpawn++) {
    allSpawns[currentSpawn].isActive = false;
    instance_destroy(allSpawns[currentSpawn]);
}
