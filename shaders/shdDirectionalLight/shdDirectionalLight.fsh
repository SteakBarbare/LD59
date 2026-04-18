varying vec2 v_vTexcoord;
varying vec4 v_vColour;
varying vec2 v_vPosition;

uniform sampler2D normalMap;
uniform sampler2D depthMap;
uniform sampler2D shadowMap;
uniform sampler2D diffuseMap;

uniform vec4 lightInfo; // x y intensity radius
uniform float dir;
uniform float fov;
uniform vec3 lightColor;
uniform float attenuationIntensity;
uniform float hasShadow;

uniform vec2 roomSize;

#define SOFT_MULTIPLIER 5.0
#define PI 3.1415926538

// Speed of transition between normal lighting and depth sampling light
#define fadingTransitionSpeed 8.0
// Size of neighboring pixels to consider
#define samplingSize 2.0

float getAttenuation(vec2 posLight, vec2 uvs, float sampleSize, float depth, float range) {
	// sample map pixel
	float lightSample = 1.0 / roomSize.y;
	float depthFactor = pow(min(1.0, max(1.0 - (depth - lightInfo.y) / range, 0.0)), fadingTransitionSpeed);
	
	// Log to achieve brighter light attenuation
	float attenuation = log(max(1.0-length(posLight) / range, 0.0) + 1.0) * attenuationIntensity;
	
	// Minimal distance to lighted pixel
	float minDist = sampleSize * 2.0;
	// Sample neighboring pixel to find closest lighted neighbor
	for(float i = -sampleSize; i <= sampleSize; i++) {
		for(float j = -sampleSize; j <= sampleSize; j++) {
			// uv at neighboring pixel
			float localDepth = float(texture2D(depthMap, uvs + vec2(i * lightSample, j * lightSample)).r * roomSize.y);
			// If is lighted and distance is lower, update minDist
			if(localDepth < lightInfo.y && (abs(i) + abs(j)) < minDist) minDist = abs(i) + abs(j);
		}
	}
	return mix(attenuation / (minDist + 1.0), attenuation, depthFactor);
}

void main()
{
	float radius = lightInfo.w;
	// Sample textures
	vec2 uvs = v_vPosition / roomSize;
	vec2 uvsShadow = (v_vPosition.xy + vec2(radius) - lightInfo.xy) * 0.5 / radius ;
    vec3 normal = normalize(texture2D(normalMap, uvs).rgb*-2.0+1.0);
	float shadow = 0.0;
	if(hasShadow > 0.5) {
		shadow = texture2D(shadowMap, uvsShadow).a;
	}
	float depth = texture2D(depthMap, uvs).r * roomSize.y;
	
	vec2 posLight = vec2(v_vPosition)-lightInfo.xy;
	float attenuation =  getAttenuation(posLight, uvs, samplingSize, depth, radius);
	
	// Normal mapping
	vec3 lightDir = normalize(lightInfo.xyz - vec3(v_vPosition.x, v_vPosition.y, 0)); 
	
	// Cutoff light that is not in direction
	float dirRad = radians(dir);
	float hfov = radians(fov) * 0.5;
	float rad = atan(-posLight.y, posLight.x);
	float adis = abs(mod(rad + 2.0 * PI, 2.0 * PI) - dirRad);
	adis = min(adis, 2.0 * PI - adis);
	float vis = clamp((1.0 - adis / hfov) * SOFT_MULTIPLIER, 0.0, 1.0); 
	
	float d = max(dot(normal, lightDir), 0.0);
	vec3 diffuse = d * lightColor * attenuation * vis * (1.0 - shadow * float(depth <= 0.01));
	
	vec4 frag = texture2D(diffuseMap, uvs);
	gl_FragColor = vec4(diffuse, 1.0) * frag;
}

