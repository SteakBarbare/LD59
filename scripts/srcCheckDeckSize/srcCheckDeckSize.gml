/// @function								srcCheckDeckSize(deckToCheck)
/// @param  {array}		deckToCheck			2D Array containing the cards
/// @description							Takes a deck and returns the number of cards in it
function srcCheckDeckSize(deckToCheck){
	var deckIndex;
	var deckSize = 0;
	
	for(deckIndex = 0; deckIndex < array_length(deckToCheck); deckIndex++){
		deckSize += deckToCheck[deckIndex][1];
	}
	
	return deckSize;
}