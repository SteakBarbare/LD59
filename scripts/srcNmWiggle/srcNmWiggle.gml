/// @description srcNmWiggle(light id,range,radius,time)
/// @param light id
/// @param range
/// @param radius
/// @param time
function srcNmWiggle(argument0, argument1, argument2, argument3) {
	var i,r,R,t;
	i = argument0;
	r = argument1;
	R = argument2;
	t = argument3;
	NMlights[i*3+2] = r+dcos(t)*R;


}
