/// @function									srcWeightedRandom(choicesArray, randomChances)
/// @param  {array}			choicesArray		Array containing the different values without the weight
/// @param  {array}			randomChances		Array containing the weighted random values to choose from
/// @param  {bool}			isValueReturned		[OPT] Boolean used to check if the value (true by default) or the index will be returned
/// @description								Returns a single index choosen randomly with weighted chances
/// @returns				{(string|real)}

function srcWeightedRandom(choicesArray, randomChances, isValueReturned = true){
	var choiceIndex, weightIndex, pickedIndex, pickedValue;
	var tempChoiceArray = [];
	var weightedArray = [];
	
	for(choiceIndex = 0; choiceIndex < array_length(choicesArray); choiceIndex++){
		for(weightIndex = 0; weightIndex < randomChances[choiceIndex]; weightIndex++){
			array_push(weightedArray, choicesArray[choiceIndex]);
		}
	}
	
	if (array_length(weightedArray) <= 0) {
		return -1	
	}
	
	pickedIndex = irandom(array_length(weightedArray) - 1);
	pickedValue = weightedArray[pickedIndex];
	
	if(isValueReturned){
		return pickedValue;
	}else{
		pickedIndex = srcIndexOf(choicesArray, pickedValue);
		return pickedIndex;
	}
}