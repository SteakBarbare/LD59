//
// Simple passthrough fragment shader
//
varying vec2 v_vTexcoord;
varying vec4 v_vColour;

uniform float Time;
uniform vec2 Texel;

const float xSpeed = 0.01;
const float xFreq = 30.0;
const float xSize = 1.1;

void main()
{
	
	// X waves
	float xWave = sin(Time*xSpeed + v_vTexcoord.y * xFreq) * (xSize * Texel.x) * v_vTexcoord.y;
	vec4 tex = texture2D( gm_BaseTexture, v_vTexcoord + vec2(xWave, 0.0));
	
    gl_FragColor = v_vColour * tex;
}
