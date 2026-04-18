varying vec2 v_vTexcoord;
varying vec4 v_vColour;
varying vec2 v_vPosition;


void main()
{
    vec4 DifSample = texture2D( gm_BaseTexture, v_vTexcoord);
    gl_FragColor = vec4(DifSample.rgb, 1.0);
}

