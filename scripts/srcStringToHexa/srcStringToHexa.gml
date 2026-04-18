// Les actifs du script ont changé pour v2.3.0 Voir
// https://help.yoyogames.com/hc/en-us/articles/360005277377 pour plus d’informations
function srcStringToHexa()
{
	var str, i, byte0, byte1, r, g, b;
	str = string_upper(argument[0]);
	i = string_length(str);
	
	while(string_char_at(str, i) != "$")
	{
		byte0 = string_byte_at(str, i);
		byte1 = string_byte_at(str, i-1);
		
		
		if(byte0 < $3A)
		{
			byte0 = byte0 - $30;
		}
		else byte0 = byte0 - $37;
		
		if(byte1 < $3A)
		{
			byte1 = byte1 - $30;
		}
		else byte1 = byte1 - $37;
		
		if(i == string_length(str))
		{
			b = byte1 * 16 + byte0
		}
		else if(i == string_length(str) - 2)
		{
			g = byte1 * 16 + byte0
		}
		else if(i == string_length(str) - 4)
		{
			r = byte1 * 16 + byte0
		}
		i-=2;
	}
	
	return make_color_rgb(r, g, b);

}