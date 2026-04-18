tempHView = window_get_height();
tempWView = window_get_width();

surfaceWview = camera_get_view_width(view_camera[0]);
surfaceHview = camera_get_view_height(view_camera[0]);

surfaceXview = camera_get_view_x(view_camera[0]);
surfaceYview = camera_get_view_y(view_camera[0]);

surfaceCenterX = 0;
surfaceCenterY = 0;

waterSurface = surface_create(surfaceWview, surfaceHview);

reflectingObjects = [];
reflectingObjects = [objEnemyTemplate, objPropsTemplate, objInteractibleTemplate, objLeaf];

// Shader

uniTime = shader_get_uniform(shdWaterReflection, "Time");
uniTexel = shader_get_uniform(shdWaterReflection, "Texel");