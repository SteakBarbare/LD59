varying vec2 v_vTexcoord;
varying vec4 v_vColour;
varying vec2 v_vPosition;

#define LN 500//Number of lights

uniform sampler2D spec;//specular map
uniform sampler2D norm;//normal map
uniform sampler2D depthMap;
uniform sampler2D shadowMap;

uniform float lights[LN*3];//x,y,range
uniform float lcolor[LN*3];//r,g,b
uniform float lightIntensity;
uniform vec3 ambiance;//r,g,b
uniform int numEnabled;
uniform float attenuationIntensity;
uniform float roomHeight;

const float behindFadingPower = 12.0;
const float fadingTransitionSpeed = 8.0;

void main()
{
    vec3 normal = normalize(texture2D( norm, v_vTexcoord ).rgb*-2.0+1.0);
	vec4 DifSample = texture2D( gm_BaseTexture, v_vTexcoord);
	float depth = texture2D(depthMap, v_vTexcoord).r * roomHeight;
	float shadow = texture2D(shadowMap, v_vTexcoord).a * float(depth == 0.0);
	float lid = texture2D(shadowMap, v_vTexcoord).r * float(numEnabled);
	
    vec3 result = ambiance * DifSample.rgb;
	for(int i = 0; i < numEnabled; i++)
	{
		vec3 lightPos = vec3(lights[i*3], lights[i*3+1], lightIntensity);
		float range = lights[i*3+2];
		// Smooth attenuation
		float attenuationDefault = max(1.0-length(vec2(v_vPosition)-lightPos.xy)/range,0.0);
		float attenuationBehind = pow(attenuationDefault, behindFadingPower);
		float depthFactor = pow(min(1.0, max(1.0 - (depth - lightPos.y) / range, 0.0)), fadingTransitionSpeed);
		float attenuation = log(mix(attenuationBehind, attenuationDefault, depthFactor) + 1.0) * attenuationIntensity;
		
		// Prevent too bright values
		//if(attenuation > 1.0) 
		//{
		//	attenuation = 1.0;
		//}
		
		// Normal mapping
		vec3 lightColor = vec3(lcolor[i*3], lcolor[i*3+1], lcolor[i*3+2]);
		vec3 lightDir = normalize(lightPos - vec3(v_vPosition.x, v_vPosition.y, 0)); 
		float d = max(dot(normal, lightDir), 0.0);
		vec3 diffuse = d * lightColor * DifSample.rgb * attenuation;
		result += diffuse;
	}
    gl_FragColor = vec4(result, DifSample.a) * v_vColour;
}

