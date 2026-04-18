event_inherited()
hsp = random_range(-2, 2);
vsp = random_range(-5, -10);

dispersion = 1.18;
travelDistanceMax = y - (vsp * 8);
sporeLanded = false;
isDisappearing = false;

stickedParent = 0;
distParentX = 0;
distParentY = 0;
isSticked = false;

image_index = irandom(20);
array_push(linkedLights, srcNewPointLight(x, y, depth, 20, 60, #076410, #033208, -10, 10, true, id));
