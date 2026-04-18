/// @function										srcStringExplode(del, str)
/// @param  {string}		del						Delimiter
/// @param  {string}		str						String to explode
/// @description									Explode a string into an array of string
function srcStringExplode(del, str)
{
    var arr;
	str = str + del;
    var len = string_length(del);
    var ind = 0;
    repeat (string_count(del, str)) {
        var pos = string_pos(del, str) - 1;
        arr[ind] = string_copy(str, 1, pos);
        str = string_delete(str, 1, pos + len);
        ind++;
    }
    return arr;
}