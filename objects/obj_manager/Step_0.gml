spawnTimer--;
if (spawnTimer <= 0) {
	instance_create_layer(random_range(32,600 - 32), random_range(50,260),"platform_layer",obj_platform);
	spawnTimer = 5;
}