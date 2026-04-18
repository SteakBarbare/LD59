varying vec2 v_vTexcoord;

// Depth of the object, will be used to determine if light is behind or in front.
uniform float depthBuffer;
uniform float roomHeight;

void main()
{
	// Depth is stored inside red buffer, green and blue can be use later to store other data.
	// Alpha is the sprite alpha to cutoff empty space of the sprite
	// it is required to be at least a little solid to avoid depth problem with little alpha
    gl_FragColor = vec4(depthBuffer / roomHeight, 0.0, 0.0, float(texture2D( gm_BaseTexture, v_vTexcoord ).a > 0.5));
}
