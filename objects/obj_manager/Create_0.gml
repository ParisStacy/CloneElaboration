for (i = 0; i <= 100; i++){
	instance_create_layer(random_range(32,300 - 32), random_range(50,260),"platform_layer",obj_platform);
}

spawnTimer = random_range(0,2) * 30;
depth = 99;
