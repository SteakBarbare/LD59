defaultMoveSpeed = 8; 
moveSpeed = defaultMoveSpeed;

playerState = "idle";

isStagger = false;
isSlow = false;
stagTime = 1

canUseSonar = true;

deathScreenAlpha = 0
isHoveringButton = false;

isControlsInverted = false;

inputPrevent = 0;

srcCreateLight(x, y, 3, 0.01, self);

midSpriteWidth = sprite_get_width(sprite_index) * 0.5;
midSpriteHeight = sprite_get_height(sprite_index) * 0.5;

isPaused = false;

cameraX = 0;
cameraY = 0;

gameIsWin = false;

deathAnimationOver = false;

image_xscale = 0.3;
image_yscale = 0.3;
skeleton_animation_set("Idle");

mask_index = sprPlayerCollision;