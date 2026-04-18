//
// Simple passthrough fragment shader
//
uniform vec4 uOutlineColor;

varying vec2 v_vTexcoord;
varying vec4 v_vColour;

uniform float pixel1Height;
uniform float pixel1Width;
uniform float echo_alpha;

void main(){
	
	vec2 offsetx;
	offsetx.x = pixel1Width;
	
	vec2 offsety;
	offsety.y = pixel1Height;
	
	// Get the alpha of the currently drawn pixel 
	float alpha = texture2D(gm_BaseTexture, v_vTexcoord).a;
	
	vec4 pixelColAdd = uOutlineColor * float(alpha < 1.0 && 
		(texture2D(gm_BaseTexture, v_vTexcoord + offsetx).a >= 0.9 ||
		texture2D(gm_BaseTexture, v_vTexcoord - offsetx).a >= 0.9 || 
		texture2D(gm_BaseTexture, v_vTexcoord + offsety).a >= 0.9 ||
		texture2D(gm_BaseTexture, v_vTexcoord - offsety).a >= 0.9));
	
	if(pixelColAdd.a > 0.0){
		pixelColAdd.a = min(pixelColAdd.a, echo_alpha);
	}
	
	gl_FragColor = pixelColAdd;
}
