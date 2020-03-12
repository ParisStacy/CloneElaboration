if (place_meeting(x,y,obj_player)) {
	owner = instance_place(x,y,obj_player);
}

if (owner != noone) {
x = lerp(x,owner.x - .5, .5);
y = lerp(y,owner.y - 15, .5);
}