global.AMBIANCE_R = color_get_red(sunAmbiance);
global.AMBIANCE_G = color_get_green(sunAmbiance);
global.AMBIANCE_B = color_get_blue(sunAmbiance);
global.playerLightColors[0] = 255;
global.playerLightColors[1] = 198;
global.playerLightColors[2] = 147;

lightSize = 3;
maxLight = 400;

nbLight = 0;

// Variables
global.NMAttenuationIntensity = 3.333;
global.minLightShadow = 50;
global.cameraX = 0;
global.cameraY = 0;
global.cameraWidth = 0;
global.cameraHeight = 0;
var width = room_width;
var height = room_height;
global.diffuseMap = surface_create(width, height);
global.normalMap = surface_create(width, height);
global.depthMap = surface_create(width, height);
global.lightMap = surface_create(width, height);
global.dt = delta_time / 1000000;

#region Uniform shdLight
// Textures
global.uLightNormalMap = shader_get_sampler_index(shdLight, "normalMap");
global.uLightDepthMap = shader_get_sampler_index(shdLight, "depthMap");
global.uLightShadowMap = shader_get_sampler_index(shdLight, "shadowMap");
global.uLightDiffuseMap = shader_get_sampler_index(shdLight, "diffuseMap");
// Light Info
global.uLightInfo = shader_get_uniform(shdLight, "lightInfo");
global.uLightColor = shader_get_uniform(shdLight, "lightColor");
global.uLightAttenuationIntensity = shader_get_uniform(shdLight, "attenuationIntensity");
global.uLightHasShadow = shader_get_uniform(shdLight, "hasShadow");

// Other
global.uLightRoomHeight = shader_get_uniform(shdLight, "roomSize");
#endregion

#region Uniform shdDirectionalLight
// Textures
global.uDirLightNormalMap = shader_get_sampler_index(shdDirectionalLight, "normalMap");
global.uDirLightDepthMap = shader_get_sampler_index(shdDirectionalLight, "depthMap");
global.uDirLightShadowMap = shader_get_sampler_index(shdDirectionalLight, "shadowMap");
global.uDirLightDiffuseMap = shader_get_sampler_index(shdDirectionalLight, "diffuseMap");
// Light Info
global.uDirLightInfo = shader_get_uniform(shdDirectionalLight, "lightInfo");
global.uDirLightColor = shader_get_uniform(shdDirectionalLight, "lightColor");
global.uDirLightAttenuationIntensity = shader_get_uniform(shdDirectionalLight, "attenuationIntensity");
global.uDirLightHasShadow = shader_get_uniform(shdDirectionalLight, "hasShadow");
global.uDirLightDir = shader_get_uniform(shdDirectionalLight, "dir");
global.uDirLightFov = shader_get_uniform(shdDirectionalLight, "fov");

// Other
global.uDirLightRoomHeight = shader_get_uniform(shdDirectionalLight, "roomSize");
#endregion

#region Uniform shdEmissiveLight
// Textures
global.uEmissiveLightNormalMap = shader_get_sampler_index(shdEmissiveLight, "normalMap");
global.uEmissiveLightDepthMap = shader_get_sampler_index(shdEmissiveLight, "depthMap");
global.uEmissiveLightShadowMap = shader_get_sampler_index(shdEmissiveLight, "shadowMap");
// Light Info
global.uEmissiveLightInfo = shader_get_uniform(shdEmissiveLight, "lightInfo");
global.uEmissiveLightColor = shader_get_uniform(shdEmissiveLight, "lightColor");
global.uEmissiveLightAttenuationIntensity = shader_get_uniform(shdEmissiveLight, "attenuationIntensity");

// Other
global.uEmissiveLightRoomHeight = shader_get_uniform(shdEmissiveLight, "roomHeight");
global.uEmissiveLightNbLights = shader_get_uniform(shdEmissiveLight, "nbLights");
global.uEmissiveLightLights = shader_get_uniform(shdEmissiveLight, "lights");
#endregion

#region Uniform shdRotate
global.uRotateAngle = shader_get_uniform(shdRotate, "angle");
global.uRotateHasNormal = shader_get_uniform(shdRotate, "hasNormal");
#endregion

#region Uniform shdFinalDraw
uLightMap = shader_get_sampler_index(shdFinalDraw, "lightMap");
uAmbiance = shader_get_uniform(shdFinalDraw, "ambiance");
#endregion

#region Uniform shdDepth
global.uDepth = shader_get_uniform(shdDepth, "depthBuffer");
uRoomHeight = shader_get_uniform(shdDepth, "roomHeight");
#endregion

#region Uniform shdShadow
global.uShadowLightInfo = shader_get_uniform(shdShadow, "lightPos");
global.uShadowRoomSize = shader_get_uniform(shdShadow, "roomSize");
#endregion

alphaDeath = 1;

shadowsIntensity = shadowsIntensityBase;

beginTime = 0;
/*warhammer*/endTime = 0;

enum DrawOptionId {
	DEFAULT,
	LIGHT,
	DEPTH,
	NORMAL,
	LAST
}

enum LightEventId {
	SHADOW = 10,
	LIGHT = 11
}

enum DrawEventId {
	DIFFUSE = 10,
	NORMAL = 11,
	EDGE = 12,
	DEPTH = 13
}

if(!instance_exists(objTilesetController)) {
	instance_create_depth(-50, 100, -25, objTilesetController);
}

function drawTilesets(drawEvent){
	with(objTilesetController) {
		event_user(drawEvent);
	}
}

vertex_format_begin();
vertex_format_add_position_3d();
vertex_format_add_texcoord();
global.shadowFormat = vertex_format_end();
global.shadowBuffer = vertex_create_buffer();

//drawOrder = ds_priority_create();
drawOrder = array_create(0);
drawOrderUpdate = 0;