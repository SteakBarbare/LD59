varying vec2 v_vTexcoord;
varying vec4 v_vColour;
uniform float angle;//Angle in degrees
uniform float hasNormal;

#define NormalMapBaseColor vec3(0.5, 0.5, 1.0)

void main()
{
	//Angle in radians
    float A = radians(angle);
    mat3 anglemat = mat3(cos(A),-sin(A),0.0,sin(A),cos(A),0.0,0.0,0.0,1.0);
	
    vec4 Col = v_vColour * texture2D( gm_BaseTexture, v_vTexcoord );
	
    gl_FragColor = vec4(mix(NormalMapBaseColor, normalize(Col.rgb*2.0-1.0) * anglemat * 0.5 + 0.5, hasNormal), ceil(Col.a));
}

