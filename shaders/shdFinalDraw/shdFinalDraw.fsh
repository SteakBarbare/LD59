//
// Simple passthrough fragment shader
//
varying vec2 v_vTexcoord;
varying vec4 v_vColour;

uniform sampler2D lightMap;
uniform sampler2D lightPos;
uniform vec3 ambiance;

void main()
{
	vec4 sample = texture2D(gm_BaseTexture, v_vTexcoord);
	vec4 lightSample = texture2D(lightMap, v_vTexcoord);
	vec3 color = ambiance * sample.rgb + lightSample.rgb;
    gl_FragColor = v_vColour * vec4(color, 1.0);
}
