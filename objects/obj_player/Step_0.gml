//APPLY MOTION + GRAVITY
x -= xDir;

//SPRITE CHANGE
if (yDir <= 0) {
image_index = 1;
} else {
image_index = 0;
}
if (xDir <= 0) {
image_xscale = 1;
} else {
image_xscale = -1;
}

//CONTROLS
if (playerNum == 0) {
	if (keyboard_check(vk_left)) {
		xDir += moveSpeed / 60;
	}
	if (keyboard_check(vk_right)) {
		xDir -= moveSpeed / 60;
	}
}
if (playerNum == 1) {
	if (keyboard_check(ord("A"))) {
		xDir += moveSpeed / 60;
	}
	if (keyboard_check(ord("D"))) {
		xDir -= moveSpeed / 60;
	}
}
xDir *= .9;

if(keyboard_check(ord("R"))) room_restart();


yDir -= gravityValue;

//COLLISION

var new_Y;

if (yDir > 0 && alive) {
	for (var i = 0; i < (yDir); i++) {
	 	new_Y = y + i;
		var impactCollision = instance_place(x,new_Y,obj_impactable)
		if (impactCollision != noone) {
			if (!place_meeting(x,y,impactCollision)) {
				//PLATFORM COLLISION
				if (impactCollision.object_index == obj_platform) {
					yDir = verticalVelocity;
					impactCollision.destroyed = true;
					impactCollision.image_speed = 1;
					impactCollision.mask_index = -1;
					audio_play_sound(bounce,1,false);
					break;
				}
				//PLAYER COLLISION
				if (impactCollision.object_index == obj_player) {
					//ADD SCORE AND JUMP
					yDir = verticalVelocity * 1.3;
					playerScore++;
					//JUICE
					audio_play_sound(hit,1,false);
					freezeImpact(300,x,y);
					audio_play_sound(hit2,1,false);
					//ENEMY PLAYER BEHAVIOR
					impactCollision.yDir = 20;
					impactCollision.alive = false;
					impactCollision.image_yscale = -1;
					break;
				}
			}
		}
	}
} else {
new_Y = y + yDir;
}
y = new_Y;

//DEATH EVENTS
if (y > room_height - 10 && y > room_height && !deathEvents) {
		audio_play_sound(death,1,false);
		audio_play_sound(hit2,1,false);
		var deathExplosion = instance_create_layer(x,y,"cosmetic_layer",obj_impact);
		deathExplosion.depth = 10;
		deathExplosion.image_xscale = 2;
		deathExplosion.image_yscale = 2;
		playerScore--;
		deathEvents = true;
}
//RESPAWN
if (y > room_height + 50) alive = false;
if (alive == false) {
	if (!deathEvents) instance_create_layer(x,y,"cosmetic_layer",obj_impact);
	if (timer > respawnTime) {
		timer = 0;
		deathEvents = false;
		y = 300;
		x = random_range(32, 200 - 32);
		yDir = -8;
		xDir = choose(-10, 10);
		alive = true;
		audio_play_sound(jump,1,false);
		image_yscale = 1;
	}
	timer++;
}

//WALL COLLISION
if (x < 10 || x > room_width - 10) {
	xDir *= -2;
}

//SCORING
if (playerScore < 0) playerScore = 0;