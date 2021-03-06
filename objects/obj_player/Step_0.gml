//FREEZE THIS FRAME?
if (freezeNextFrame) {
	freezeImpact(300,x,y);
	freezeNextFrame = false;
}

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
	if (keyboard_check_pressed(vk_down) && can_fastfall) {
		yDir = 8;
		fastFall = true;
		audio_play_sound(death,1,0);
		can_fastfall = false;
	}
}
if (playerNum == 1) {
	if (keyboard_check(ord("A"))) {
		xDir += moveSpeed / 60;
	}
	if (keyboard_check(ord("D"))) {
		xDir -= moveSpeed / 60;
	}
	if (keyboard_check_pressed(ord("S")) && can_fastfall) {
		yDir = 8;
		fastFall = true;
		audio_play_sound(death,1,0);
		can_fastfall = false;
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
					if (!fastFall) {
						yDir = verticalVelocity;
					} else {
						fastFall = false;
						yDir = verticalVelocity * 1.3;
					}
					impactCollision.destroyed = true;
					impactCollision.image_speed = 1;
					impactCollision.mask_index = -1;
					audio_play_sound(bounce,1,false);
					break;
				}
				//PLAYER COLLISION
				if (impactCollision.object_index == obj_player) {
					//JUMP
					if (!fastFall) {
						yDir = verticalVelocity * 1.3;
					} else {
						fastFall = false;
						yDir = verticalVelocity * 1.5;
					}
					//JUICE
					audio_play_sound(hit,1,false);
					audio_play_sound(hit2,1,false);
					freezeNextFrame = true;
					
					var deathExplosion = instance_create_layer(x,y + 10,"cosmetic_layer",obj_impact);
					deathExplosion.depth = 10;
					deathExplosion.image_xscale = 1.5;
					deathExplosion.image_yscale = 1.5;
					
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
		x = random_range(32, 500 - 32);
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

//OFFSCREEN INDICATOR
if (y < 0) {
indicator.x = x;
indicator.y = 10;
} else {
indicator.x = 1000;
indicator.y = 1000;
}

image_yscale = (alive) ? 1 : -1.5;

if (!can_fastfall) {
fastfall_cooldown--;
	if (fastfall_cooldown < 0) {
		can_fastfall = true;
		fastfall_cooldown = 30;
	}
}