//
// Simple passthrough vertex shader
//
attribute vec3 in_Position;                  // (x,y,z)
//attribute vec3 in_Normal;                  // (x,y,z)     unused in this shader.
attribute vec4 in_Colour;                    // (r,g,b,a)
attribute vec2 in_TextureCoord;              // (u,v)

varying vec2 v_vTexcoord;
varying vec4 v_vColour;

uniform vec2 pivot;
uniform float distPivot;

void main()
{
	
    vec4 pos = vec4( in_Position.x, in_Position.y, in_Position.z, 1.0);
	
	vec2 rem = mod(in_Colour.rb * 255., 2.);
	int cornerId = int(dot(vec2(1., 2.), rem));
	
	vec2 dirPiv = normalize(pivot);
	
	pos.xy += mix(vec2(0.0), dirPiv * distPivot, float(cornerId < 2)) * mix(-1.0, 1.0, float(cornerId == 1));
	
    gl_Position = gm_Matrices[MATRIX_WORLD_VIEW_PROJECTION] * pos;
    
    v_vTexcoord = in_TextureCoord;
	v_vColour = in_Colour;
}
