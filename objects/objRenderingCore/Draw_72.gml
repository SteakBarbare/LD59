/// @description Render pass
beginTime = current_time;

global.cameraX = camera_get_view_x(view_camera[0]);
global.cameraY = camera_get_view_y(view_camera[0]);
global.cameraWidth = camera_get_view_width(view_camera[0]);
global.cameraHeight = camera_get_view_height(view_camera[0]);
global.guiWidth = display_get_gui_width();
global.guiHeight = display_get_gui_height();

#region Set ambiance
draw_set_alpha(1);
draw_set_color(c_white);
#endregion

#region Compute instance order

if(drawOrderUpdate > 0) {
	var length = array_length(drawOrder);
	// insertion sort is really slow on worst case, so we fallback to normal sort when there's a lot of updates
	if(drawOrderUpdate < log2(length)) {
		for(var i = 0; i < length; ++i) {
			var tempVal = drawOrder[i];
			var tempValId = i;
			while(tempValId > 0 && drawOrder[tempValId - 1].depth < tempVal.depth) {
				drawOrder[tempValId] = drawOrder[tempValId - 1];
				tempValId--;
			}
			drawOrder[tempValId] = tempVal;
		}
	} else {
		// Sort instance order by depth
		array_sort(drawOrder, function(a, b) {
			return b.depth - a.depth;
		});
	}
	drawOrderUpdate = 0;
}


#endregion

#region Draw diffuse on surface and shadows
global.diffuseMap = srcUseSurface(global.diffuseMap, room_width, room_height);
drawTilesets(DrawEventId.DIFFUSE);

// Draw each object inside diffuse buffer
for(var i = 0; i < array_length(drawOrder); i++) {
	with(drawOrder[i]) {
		culled = !srcRectangleInScreen(x - sprite_xoffset - 200, y - sprite_yoffset - 200, x - sprite_xoffset + sprite_width + 200, y - sprite_yoffset + sprite_height + 200);
		if(culled) {
			continue;
		}
		event_user(DrawEventId.DIFFUSE);
	}
}
surface_reset_target();
#endregion

#region Draw "z" value on surface
global.depthMap = srcUseSurface(global.depthMap, room_width, room_height);
shader_set(shdDepth);
shader_set_uniform_f(uRoomHeight, room_height);

shader_set_uniform_f(global.uDepth, 0);
draw_rectangle_color(0, 0, room_width, room_height, c_black, c_black, c_black, c_black, false);

// Draw each object inside depth buffer.
for(var i = 0; i < array_length(drawOrder); i++) {
	with(drawOrder[i]) {
		if(!useDepthBuffer || culled) continue;
		shader_set_uniform_f(global.uDepth, bbox_bottom);
		event_user(DrawEventId.DEPTH);
	}
}

surface_reset_target();
#endregion

#region Draw normal on surface
global.normalMap = srcUseSurface(global.normalMap, room_width, room_height);

shader_set(shdRotate);

with(objTilesetController) {
	event_user(DrawEventId.NORMAL);
}

// Draw inside normal buffer.
for(var i = 0; i < array_length(drawOrder); i++) {
	with(drawOrder[i]) {
		if(culled) {
			continue;
		}
		event_user(DrawEventId.NORMAL);
	}
}

surface_reset_target();
#endregion

#region Draw Light on surface
global.lightMap = srcUseSurface(global.lightMap, room_width, room_height);
draw_clear_alpha(c_black, 0.0);

nbLight = 0;
with(objLight) {
	if(!srcPointInScreen(x, y, radius)) {
		continue;
	}
	// Compute the shadow texture for current light
	event_user(LightEventId.SHADOW);
	// Compute and draw the new light, blended with function inside the event.
	event_user(LightEventId.LIGHT);
	other.nbLight++;
}
shader_reset();
surface_reset_target();
#endregion

#region Render game
// Clear previous frame
var color = c_black;
draw_rectangle_color(0, 0, room_width, room_height, color, color, color, color, false);
switch(other.drawOption) {
	case DrawOptionId.DEFAULT:
		shader_set(shdFinalDraw);
		shader_set_uniform_f(uAmbiance, global.AMBIANCE_R / 255.0, global.AMBIANCE_G / 255.0, global.AMBIANCE_B/255.0);
		texture_set_stage(uLightMap, surface_get_texture(global.lightMap));
		draw_surface(global.diffuseMap, 0, 0);
		shader_reset();
		break;
	case DrawOptionId.LIGHT:
		shader_set(shdDefault);
		draw_surface(global.lightMap, 0, 0);
		shader_reset();
		break;
	case DrawOptionId.DEPTH:
		shader_set(shdDefault);
		draw_surface(global.depthMap, 0, 0);
		shader_reset();
		break;	
	case DrawOptionId.NORMAL:
		shader_set(shdDefault);
		draw_surface(global.normalMap, 0, 0);
		shader_reset();
		break;	
}
#endregion

endTime = current_time - beginTime;

#region Render light occluders
if(showShadowCaster) {
	with(objRenderable) {
		if(useDepthBuffer) {
			draw_set_alpha(0.25);
			if(useBbox) {
				draw_rectangle_color(bbox_left, bbox_top, bbox_right, bbox_bottom, c_red, c_red, c_red, c_red, false);
			}
			else {
				draw_rectangle_color(minX, minY, maxX, maxY, c_red, c_red, c_red, c_red, false);
			}
			draw_set_alpha(1.0);
		}
	}
}
#endregion
