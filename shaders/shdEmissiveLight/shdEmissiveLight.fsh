varying vec2 v_vTexcoord;
varying vec4 v_vColour;
varying vec2 v_vPosition;

uniform sampler2D normalMap;
uniform sampler2D depthMap;
uniform sampler2D shadowMap;

const int maxLight = 512;
#define SOFT_MULTIPLIER 5.0
#define PI 3.1415926538

uniform vec4 lightInfo; // x y intensity radius
uniform vec3 lightColor;
uniform float attenuationIntensity;
uniform float roomHeight;
uniform int nbLights;
uniform float lights[maxLight * 5];

// Speed of transition between normal lighting and depth sampling light
#define fadingTransitionSpeed 8.0
// Size of neighboring pixels to consider
#define samplingSize 5.0

float getAttenuation(vec2 posLight, float sampleSize, float depth, float range) {
	// sample map pixel
	float lightSample = 1.0 / roomHeight;
	float depthFactor = pow(min(1.0, max(1.0 - (depth - lightInfo.y) / range, 0.0)), fadingTransitionSpeed);
	
	// Log to achieve brighter light attenuation
	float attenuation = log(max(1.0-length(posLight) / range, 0.0) + 1.0) * attenuationIntensity;
	
	// Minimal distance to lighted pixel
	float minDist = sampleSize * 2.0;
	// Sample neighboring pixel to find closest lighted neighbor
	for(float i = -sampleSize; i <= sampleSize; i++) {
		for(float j = -sampleSize; j <= sampleSize; j++) {
			// uv at neighboring pixel
			vec2 uv = vec2(v_vTexcoord.x + i * lightSample, v_vTexcoord.y +j * lightSample);
			float localDepth = float(texture2D(depthMap, uv).r * roomHeight);
			// If is lighted and distance is lower, update minDist
			if(localDepth < lightInfo.y && (abs(i) + abs(j)) < minDist) minDist = abs(i) + abs(j);
		}
	}
	return mix(attenuation / max(minDist, 1.0), attenuation, depthFactor);
}

void main()
{
    vec3 normal = normalize(texture2D(normalMap, v_vTexcoord).rgb*-2.0+1.0);
	float depth = texture2D(depthMap, v_vTexcoord).r * roomHeight;
	float shadow = texture2D(shadowMap, v_vTexcoord).a;
	
	float intensity = lightInfo.z;
	float range = lightInfo.w;
	
	vec3 diffuse = vec3(0.0);
	
	for(int i = 0; i < nbLights; i++) {
			// Smooth attenuation
		vec2 lp = vec2(lights[i * 5], lights[i * 5 + 1]);
		vec3 lc = vec3(lights[i * 5 + 2], lights[i * 5 + 3], lights[i * 5 + 4]);
		
		vec2 posLight = vec2(v_vPosition) - lp;
		
		// Normal mapping
		vec3 lightDir = normalize(vec3(lp, intensity) - vec3(v_vPosition, 0.0)); 
		float d = max(dot(normal, lightDir), 0.0);
		diffuse = max(diffuse, d * lc * getAttenuation(posLight, samplingSize, depth, range)  * (1.0 - shadow * float(depth <= 0.01)));
		//diffuse += d * lc * attenuation * (1.0 - shadow * float(depth <= 0.01));
	}
	
	vec4 frag = texture2D(gm_BaseTexture, v_vTexcoord);
	
    gl_FragColor = vec4(diffuse, 1.0) * frag;
}

