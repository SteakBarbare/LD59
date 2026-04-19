defaultMoveSpeed = 8; 
moveSpeed = defaultMoveSpeed;

playerState = "idle";

isStagger = false;
isSlow = false;
stagTime = 1

deathScreenAlpha = 0
isHoveringButton = false;

isControlsInverted = false;

inputPrevent = 0;

srcCreateLight(x, y, 3, 0.01, self);

midSpriteWidth = sprite_get_width(sprite_index) * 0.5;
midSpriteHeight = sprite_get_height(sprite_index) * 0.5;
