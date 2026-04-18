attribute vec3 in_Position;                  // (x,y,z)
attribute vec2 in_TextureCoord;                  // (x,y,z)

uniform vec4 lightPos;


varying float tDist;
varying float lDist;

uniform vec2 roomSize;

void main()
{
	vec2 lp = lightPos.xy;
	
	
	/// TODO : IMPROVE THIS WITH DEPTH MAP WHEN VERTEX TEXTURE SAMPLING WILL BE AVAIBLE 
	float minHeight = in_TextureCoord.x * roomSize.y;
	float maxHeight = in_TextureCoord.y * roomSize.y;
	vec2 pos = in_Position.xy;
	
	if(lp.y > minHeight && lp.y < maxHeight) {
		lp.y = maxHeight + 2.0;
	}
	
	vec2 lightDir = pos - lp;
	float dist = length(lightDir);
	
	if(in_Position.z > 1.0) {
		pos += normalize(lightDir) * lightPos.z * 10.0;
		lDist = 1.0;
		tDist = in_Position.z - 2.0;
	} else {
		lDist = dist /  (lightPos.z * 10.0);;
		tDist = mix(0.5, in_Position.z, lDist);
	}
    vec4 object_space_pos = vec4( pos.x, pos.y, in_Position.z, 1.0);
    gl_Position = gm_Matrices[MATRIX_WORLD_VIEW_PROJECTION] * object_space_pos;
}
