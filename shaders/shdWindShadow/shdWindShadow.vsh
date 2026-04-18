//
// Simple passthrough vertex shader
//
attribute vec3 in_Position;                  // (x,y,z)          // (x,y,z)     unused in this shader.
attribute vec4 in_Colour;                    // (r,g,b,a)
attribute vec2 in_TextureCoord;              // (u,v)

varying vec2 v_vTexcoord;
varying vec4 v_vColour;
varying vec2 v_vPosition;

uniform vec4 size;
uniform vec3 origin;
uniform vec2 offset;

uniform vec2 speed;
uniform float minimal;

uniform vec2 cam;

void main()
{
	vec4 object_space_pos;
	if((in_Position.y - origin.y)/size.y <= 0.9)
	{
		float ratio = pow(1.75, abs((origin.x - offset.x)/cam.x) * 10.0) / 10.0;
		float sx = ((origin.x + size.x*0.5) - offset.x) * speed.x * ratio; 
		object_space_pos = vec4(in_Position.x + sx + minimal, in_Position.y - minimal, in_Position.z, 1.0);
	}
	else
	{
		object_space_pos = vec4(in_Position.x, in_Position.y, in_Position.z, 1.0);
	}
    gl_Position = gm_Matrices[MATRIX_WORLD_VIEW_PROJECTION] * object_space_pos;
    
    v_vColour = in_Colour;
    v_vTexcoord = in_TextureCoord;
	v_vPosition = object_space_pos.xy;
}
