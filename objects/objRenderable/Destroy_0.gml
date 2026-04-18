var index = array_find_index(objRenderingCore.drawOrder, function(a) {
	return a == id;
});

if(index != -1) {
	array_delete(objRenderingCore.drawOrder, index, 1);
}
else {
	show_debug_message($"Can't delete myself from draw order {object_get_name(object_index)}");
}

var lightCount = array_length(linkedLights);

for(var i = 0; i < lightCount; i++)
{
	if(instance_exists(linkedLights[i]))
	{
		instance_destroy(linkedLights[i]);
	}
}