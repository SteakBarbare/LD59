if (!isActive) exit;

var collidingPlayer = instance_place(x, y, objPlayer);

if(collidingPlayer != noone) collidingPlayer.moveSpeed *= 0.5;