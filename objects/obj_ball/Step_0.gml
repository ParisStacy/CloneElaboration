if (place_meeting(x,y,obj_player)) {
	owner = instance_place(x,y,obj_player);
}

if (owner != noone) {
instance_destroy(aura);
x = lerp(x,owner.x - .5, .5);
y = lerp(y,owner.y - 15, .5);

ownedTimer--;
if (ownedTimer < 0) {
	
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