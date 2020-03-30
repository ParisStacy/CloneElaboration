spawnTimer--;
if (spawnTimer <= 0) {
	instance_create_layer(random_range(32,600 - 32), random_range(50,230),"platform_layer",obj_platform);
	spawnTimer = 5;
	if (obj_ball.totalTimeHeld > 9) {
	spawnTimer = 10;
	}
	if (obj_ball.totalTimeHeld > 18) {
	spawnTimer = 15;
	}
}

if (keyboard_check_pressed(ord("M"))) {
	if (volume = 1) volume = 0;
	else volume = 1;
}

audio_master_gain(volume);