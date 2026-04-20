randomise();

firstWords = ["Behold", "Witness", "Fear", "Embrace", "Worship", "Smell", "Lick", "Touch", "Summon", "Taste"];
middleWords = ["Cheesy", "Homeless", "Crusty", "Soggy", "Spooky", "Funky", "Sketchy", "Slimy", "Buzzcut", "Bald"];
lastWords = ["Toe", "Squid", "Bat", "Goblin", "Nugget", "Pickle", "Potato", "Gremlin", "Zob", "Random"];

digit1 = string_lower(firstWords[irandom(9)]);
digit2 = string_lower(middleWords[irandom(9)]);
digit3 = string_lower(lastWords[irandom(9)]);

foundWords = ["?", "?", "?"];

alarm[0] = 10;