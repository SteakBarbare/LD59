/// @function								srcGetNumberItemsInventory();
/// @param  {string}       itemName			Selected buttons
/// @description							Get the number of an itemName present in the player inventory
function srcGetNumberItemsInventory (itemName = "") {
	if (itemName == "" || !instance_exists(objPlayer)) {
		return 0;
	}

	for (var item = 0; item < array_length(objPlayer.inventory); item++) {
		if (objPlayer.inventory[item][0] == itemName) {
			return objPlayer.inventory[item][1];	
		}
	}
	
	return 0;
}