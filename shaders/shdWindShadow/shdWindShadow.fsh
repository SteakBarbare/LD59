//
// Simple passthrough fragment shader
//
varying vec2 v_vTexcoord;
varying vec4 v_vColour;
varying vec2 v_vPosition;


uniform float time;
uniform float sy;

uniform float treshold;
uniform float maxOffset;

uniform vec2 uvMin;
uniform vec2 uvMax;

uniform vec3 sizeD;//width,height,radius

void main()
{
  float deltaHeight = (1.0 - (v_vPosition.y - sy)/sizeD.y);
    
    if(deltaHeight < treshold)
    {
        deltaHeight = deltaHeight * (deltaHeight/2.0 / treshold);
    }
    
    float add = deltaHeight * (cos(time) + 1.0) * maxOffset;
    vec2 coord = v_vTexcoord - vec2(add/sizeD.y, add/sizeD.y/10.0);
    
    gl_FragColor = v_vColour * texture2D(gm_BaseTexture, coord) * vec4(0.0, 0.0, 0.0, 1.0);
    if(coord.x < uvMin.x || coord.x > uvMax.x)
    {
        gl_FragColor.a = 0.0;
    }
    if(coord.y < uvMin.y || coord.y > uvMax.y)
    {
        gl_FragColor.a = 0.0;
    }
}



  
