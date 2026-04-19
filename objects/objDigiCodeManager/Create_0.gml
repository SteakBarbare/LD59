var firstWords = ["Behold", "Witness", "Fear", "Embrace", "Worship", "Smell", "Lick", "Touch", "Summon", "Taste"];
var middleWords = ["Cheesy", "Homeless", "Crusty", "Soggy", "Spooky", "Funky", "Sketchy", "Slimy", "Buzzcut", "Bald"];
var lastWords = ["Toe", "Squid", "Bat", "Goblin", "Nugget", "Pickle", "Potato", "Gremlin", "Zob", "Random"];

digit1 = firstWords[irandom(9)];
digit2 = middleWords[irandom(9)];
digit3 = lastWords[irandom(9)];

var allSpawns = array_create(0);
with (objPaperSpawn) {
    array_push(allSpawns, id);
}

for (var i = array_length(allSpawns) - 1; i > 0; i--) {
    var randomIndex = irandom(i);
    var temp = allSpawns[i];
    allSpawns[i] = allSpawns[randomIndex];
    allSpawns[randomIndex] = temp;
}

allSpawns[0].digitIndex = 1;
allSpawns[1].digitIndex = 2;
allSpawns[2].digitIndex = 3;

for (var i = 3; i < array_length(allSpawns); i++) {
    allSpawns[i].isActive = false;
}
