if (owner = noone) {
	if (place_meeting(x,y,obj_player)) {
		if (owner != instance_place(x,y,obj_player)) {
		ownedTimer = 9;
		totalTimeHeld = 0;
		}
		owner = instance_place(x,y,obj_player);
		score_indicator.active = false;
	}
}

if (owner != noone) {
	
	score_indicator.active = true;
	
	aura.x = 1000;
	aura.y = 1000;
	x = lerp(x,owner.x - .5, .5);
	y = lerp(y,owner.y - 25, .5);

	if (owner.alive = false) {
		owner = noone;
		floatEaseT = 1;
	}

	ownedTimer -= 1/60;
	if (round(ownedTimer) <= 0) {
		owner.playerScore++;
		ownedTimer = 9;
		audio_play_sound(score_sound,1,0);
		shineTimer = 0;
	}
	
	totalTimeHeld += 1/60;
	
} else {
	aura.x = x;
	aura.y = y;
	if (floatEaseT != 0) {
		floatEaseT -= .005;
		y -= EaseOutQuint(floatEaseT, 0, 1, 1) * 1.3;
	}
}

//Shine
shineTimer --;
if (shineTimer < 0) {
	if (image_index >= image_number - 1) {
		shineTimer = random_range(1,3) * 60;
		image_index = 0;
	}
} else {
	image_index = 0;
}
